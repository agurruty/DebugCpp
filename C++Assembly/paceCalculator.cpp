#include "paceCalculator.h"
#include <iomanip>
#include <sstream>
#include <algorithm>

int timeToSeconds(const std::string& time) {
    int hours = 0, minutes = 0, seconds = 0;
    std::stringstream ss(time);
    std::string segment;

    int colonCount = std::count(time.begin(), time.end(), ':');

    if (colonCount == 2) {
        std::getline(ss, segment, ':');
        hours = std::stoi(segment);
    }

    std::getline(ss, segment, ':');
    minutes = std::stoi(segment);
    std::getline(ss, segment);
    seconds = std::stoi(segment);

    return hours * 3600 + minutes * 60 + seconds;
}

double calculateSpeed(double distanceInKm, const std::string& time) {
    int totalSeconds = timeToSeconds(time);
    double distanceInMeters = distanceInKm * 1000.0;
    return distanceInMeters / totalSeconds * 3.6;
}

std::string calculatePace(double distanceInKm, const std::string& time) {
    int totalSeconds = timeToSeconds(time);
    int secondsPerKm = totalSeconds / distanceInKm;
    int paceMinutes = secondsPerKm / 60;
    int paceSeconds = secondsPerKm % 60;

    std::stringstream ss;
    ss << paceMinutes << ":" << std::setw(2) << std::setfill('0') << paceSeconds;
    return ss.str();
}

bool isValidTimeFormat(const std::string& time) {
    int colonCount = std::count(time.begin(), time.end(), ':');

    if (colonCount != 1 && colonCount != 2) {
        return false;
    }

    std::stringstream ss(time);
    std::string segment;
    int numSegments = 0;

    while (std::getline(ss, segment, ':')) {
        numSegments++;
        for (char c : segment) {
            if (!isdigit(c)) {
                return false;
            }
        }
    }

    return (colonCount == 2 && numSegments == 3) || (colonCount == 1 && numSegments == 2);
}
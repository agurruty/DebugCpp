#include <iostream>
#include "paceCalculator.h"
#include <limits>

void clearInputStream() {
    std::cin.clear();
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}

int main() {
    std::string time;
    double distance;

    while (true) {
        std::cout << "How long was your run? (in km) ";
        if (std::cin >> distance && distance > 0) {
            break;
        } else {
            std::cout << "Invalid input. Please enter a positive number for distance." << std::endl;
            clearInputStream();
        }
    }

    while (true) {
        std::cout << "What was your time? (in hh:mm:ss or mm:ss format) ";
        std::cin >> time;

        if (isValidTimeFormat(time)) {
            break;
        } else {
            std::cout << "Invalid time format. Please enter time in hh:mm:ss or mm:ss format." << std::endl;
        }
    }

    double speed = calculateSpeed(distance, time);
    std::string pace = calculatePace(distance, time);
    std::cout << "Your pace was " << pace << " min/km, and your average speed was " << speed << " km/h." << std::endl;
    return 0;
}

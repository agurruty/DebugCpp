#ifndef TIME_UTILS_H
#define TIME_UTILS_H
#include <string>

int timeToSeconds(const std::string& time);

double calculateSpeed(double distanceInKm, const std::string& time);

std::string calculatePace(double distanceInKm, const std::string& time);

bool isValidTimeFormat(const std::string& time);

#endif
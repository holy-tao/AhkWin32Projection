#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the algorithm used to round numbers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.roundingalgorithm
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class RoundingAlgorithm extends Win32Enum{

    /**
     * **Do not use.**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Round towards negative infinity. (Return the largest integer, increment, or significant digit which does not exceed the input.)
     * @type {Integer (Int32)}
     */
    static RoundDown => 1

    /**
     * Round towards infinity. (Return the smallest integer, increment, or significant digit which is not less than the input.)
     * @type {Integer (Int32)}
     */
    static RoundUp => 2

    /**
     * Round towards zero. This is the equivalent of **RoundDown** if the input is positive, or **RoundUp** if the input is negative.
     * @type {Integer (Int32)}
     */
    static RoundTowardsZero => 3

    /**
     * Round away from zero. This is the equivalent of **RoundUp** if the input is positive, or **RoundDown** if the input is negative.
     * @type {Integer (Int32)}
     */
    static RoundAwayFromZero => 4

    /**
     * Round to the integer, increment, or significant digit that is closest to the input. If the input is exactly halfway between the possible outputs, this is the equivalent of **RoundDown**.
     * @type {Integer (Int32)}
     */
    static RoundHalfDown => 5

    /**
     * Round to the integer, increment, or significant digit that is closest to the input. If the input is exactly halfway between the possible outputs, this is the equivalent of **RoundUp**.
     * @type {Integer (Int32)}
     */
    static RoundHalfUp => 6

    /**
     * Round to the integer, increment, or significant digit that is closest to the input. If the input is exactly halfway between the possible outputs, this is the equivalent of **RoundTowardsZero**.
     * @type {Integer (Int32)}
     */
    static RoundHalfTowardsZero => 7

    /**
     * Round to the integer, increment, or significant digit that is closest to the input. If the input is exactly halfway between the possible outputs, this is the equivalent of **RoundAwayFromZero**.
     * @type {Integer (Int32)}
     */
    static RoundHalfAwayFromZero => 8

    /**
     * Round to the integer, increment, or significant digit that is closest to the input. If the input is exactly halfway between the possible outputs, round to the nearest even output.
     * @type {Integer (Int32)}
     */
    static RoundHalfToEven => 9

    /**
     * Round to the integer, increment, or significant digit that is closest to the input. If the input is exactly halfway between the possible outputs, round to the nearest odd output.
     * @type {Integer (Int32)}
     */
    static RoundHalfToOdd => 10
}

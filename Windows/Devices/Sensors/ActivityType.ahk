#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies activity types of a sensor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitytype
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivityType extends Win32Enum{

    /**
     * The sensor indicates an unknown activity.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The sensor indicates it is active but in an idle state. It is not with the user and remaining still such as resting on a table.
     * @type {Integer (Int32)}
     */
    static Idle => 1

    /**
     * The sensor indicates that it's not moving.
     * @type {Integer (Int32)}
     */
    static Stationary => 2

    /**
     * The sensor indicates that it making minor movements while the user is stationary.
     * @type {Integer (Int32)}
     */
    static Fidgeting => 3

    /**
     * The sensor indicates the user is walking. The user travels at a moderate pace with one foot on the ground at all times.
     * @type {Integer (Int32)}
     */
    static Walking => 4

    /**
     * The sensor indicates the user is traveling at a faster rate than walking and both feet are off the ground between steps.
     * @type {Integer (Int32)}
     */
    static Running => 5

    /**
     * The sensor indicates the user is traveling in a motor vehicle on the ground.
     * @type {Integer (Int32)}
     */
    static InVehicle => 6

    /**
     * The sensor indicates the user is riding a bicycle on the ground.
     * @type {Integer (Int32)}
     */
    static Biking => 7
}

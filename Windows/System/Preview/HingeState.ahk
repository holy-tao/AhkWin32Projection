#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the hinge state of a hinged device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.preview.hingestate
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class HingeState extends Win32Enum{

    /**
     * The hinge state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The device is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 1

    /**
     * The device is opened more than 180 degrees.
     * @type {Integer (Int32)}
     */
    static Concave => 2

    /**
     * The device is opened 180 degrees.
     * @type {Integer (Int32)}
     */
    static Flat => 3

    /**
     * The device is opened less than 180 degrees.
     * @type {Integer (Int32)}
     */
    static Convex => 4

    /**
     * The device is fully opened.
     * @type {Integer (Int32)}
     */
    static Full => 5
}

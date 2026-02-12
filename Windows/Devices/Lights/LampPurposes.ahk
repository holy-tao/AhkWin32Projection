#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Purpose/s of a lamp.
 * @remarks
 * It is likely this list will expand in the future, so avoid placing error checks that validate a Purpose is within the current bounds.  Preferred approach is to compare against the subset of Purposes the application supports.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamppurposes
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class LampPurposes extends Win32BitflagEnum{

    /**
     * No Purposes defined for this lamp.
     * @type {Integer (UInt32)}
     */
    static Undefined => 0

    /**
     * Control Lamp (for example, button/key/slider)
     * @type {Integer (UInt32)}
     */
    static Control => 1

    /**
     * Accent Lamp that doesn't interact with the user (for example, case fan LED, illuminated side panels on a keyboard).
     * @type {Integer (UInt32)}
     */
    static Accent => 2

    /**
     * Device branding (for example, manufacturer logo).
     * @type {Integer (UInt32)}
     */
    static Branding => 4

    /**
     * Status lamp (for example, unread email, CPU temperature).
     * @type {Integer (UInt32)}
     */
    static Status => 8

    /**
     * Illuminates an object that is outside of the LampArray (for example, stage spotlight, car headlights, camera flash).
     * @type {Integer (UInt32)}
     */
    static Illumination => 16

    /**
     * A lamp the user directly looks at (for example, within an artwork or costume).
     * @type {Integer (UInt32)}
     */
    static Presentation => 32
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the access status an app is allowed for a particular type of frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourceaccessstatus
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionFrameSourceAccessStatus extends Win32Enum{

    /**
     * Access status is not specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The app is allowed to access the type of perception frame source it requested.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * The app is not allowed to access the type of perception frame source it requested because the user denied the app access to camera devices.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * The app is not allowed to access the type of perception frame source it requested because system access to camera devices is denied. This usually occurs when the user denies all apps access to camera devices in the system privacy settings.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}

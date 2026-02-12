#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a phone call direction.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecalldirection
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallDirection extends Win32Enum{

    /**
     * Specifies that the direction is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Specifies a received (incoming) call.
     * @type {Integer (Int32)}
     */
    static Incoming => 1

    /**
     * Specifies a dialed (outgoing) call.
     * @type {Integer (Int32)}
     */
    static Outgoing => 2
}

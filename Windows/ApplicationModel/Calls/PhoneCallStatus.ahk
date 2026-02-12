#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of a phone call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallstatus
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallStatus extends Win32Enum{

    /**
     * Specifies that the connection is lost.
     * @type {Integer (Int32)}
     */
    static Lost => 0

    /**
     * Specifies that the call is being received (incoming).
     * @type {Integer (Int32)}
     */
    static Incoming => 1

    /**
     * Specifies that the call is being dialed (outgoing).
     * @type {Integer (Int32)}
     */
    static Dialing => 2

    /**
     * Specifies that the call is in the talking state.
     * @type {Integer (Int32)}
     */
    static Talking => 3

    /**
     * Specifies that the call is in the held state.
     * @type {Integer (Int32)}
     */
    static Held => 4

    /**
     * Specifies that the call is ended.
     * @type {Integer (Int32)}
     */
    static Ended => 5
}

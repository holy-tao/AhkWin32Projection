#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of a VoIP call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecallstate
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipPhoneCallState extends Win32Enum{

    /**
     * The call has ended.
     * @type {Integer (Int32)}
     */
    static Ended => 0

    /**
     * The call is on hold.
     * @type {Integer (Int32)}
     */
    static Held => 1

    /**
     * The call is active.
     * @type {Integer (Int32)}
     */
    static Active => 2

    /**
     * The call is incoming but not yet active.
     * @type {Integer (Int32)}
     */
    static Incoming => 3

    /**
     * The call is outgoing but not yet active.
     * @type {Integer (Int32)}
     */
    static Outgoing => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason that an incoming call was rejected.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecallrejectreason
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipPhoneCallRejectReason extends Win32Enum{

    /**
     * The user pressed a button to ignore the call.
     * @type {Integer (Int32)}
     */
    static UserIgnored => 0

    /**
     * The incoming call timed out.
     * @type {Integer (Int32)}
     */
    static TimedOut => 1

    /**
     * Another incoming call was accepted.
     * @type {Integer (Int32)}
     */
    static OtherIncomingCall => 2

    /**
     * An emergency call is in progress.
     * @type {Integer (Int32)}
     */
    static EmergencyCallExists => 3

    /**
     * The call is in an invalid state.
     * @type {Integer (Int32)}
     */
    static InvalidCallState => 4
}

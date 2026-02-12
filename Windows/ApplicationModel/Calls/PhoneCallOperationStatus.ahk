#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the operation status (or result) of a hands-free (HF) phone call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecalloperationstatus
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallOperationStatus extends Win32Enum{

    /**
     * Specifies that the call succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * Specifies that some other failure occurred.
     * @type {Integer (Int32)}
     */
    static OtherFailure => 1

    /**
     * Specifies that the call timed out.
     * @type {Integer (Int32)}
     */
    static TimedOut => 2

    /**
     * Specifies a failure to call because the Bluetooth Hands-Free Profile (HFP) connection between phone and PC was lost.
     * @type {Integer (Int32)}
     */
    static ConnectionLost => 3

    /**
     * Specifies that an invlid call state occurred.
     * @type {Integer (Int32)}
     */
    static InvalidCallState => 4
}

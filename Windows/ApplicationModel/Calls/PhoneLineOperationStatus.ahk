#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the operation status of a phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelineoperationstatus
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineOperationStatus extends Win32Enum{

    /**
     * Specifies succeess.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * Specifies some other failure.
     * @type {Integer (Int32)}
     */
    static OtherFailure => 1

    /**
     * Specifies a timeout.
     * @type {Integer (Int32)}
     */
    static TimedOut => 2

    /**
     * Specifies a failure because the Bluetooth Hands-Free Profile (HFP) connection between phone and PC was lost.
     * @type {Integer (Int32)}
     */
    static ConnectionLost => 3

    /**
     * Specifies that an invlid call state occurred.
     * @type {Integer (Int32)}
     */
    static InvalidCallState => 4
}

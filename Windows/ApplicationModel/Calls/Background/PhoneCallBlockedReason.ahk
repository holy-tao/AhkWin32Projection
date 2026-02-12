#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the reason why a phone call was rejected.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallblockedreason
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneCallBlockedReason extends Win32Enum{

    /**
     * The call was rejected because it was in the blocking list.
     * @type {Integer (Int32)}
     */
    static InCallBlockingList => 0

    /**
     * The call was rejected because it was a private number and private numbers are blocked.
     * @type {Integer (Int32)}
     */
    static PrivateNumber => 1

    /**
     * The call was rejected because it was an unknown number and unknown numbers are blocked.
     * @type {Integer (Int32)}
     */
    static UnknownNumber => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of address used by the [PhoneCallHistoryEntryAddress](phonecallhistoryentryaddress.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryrawaddresskind
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryRawAddressKind extends Win32Enum{

    /**
     * The raw address is a phone number.
     * @type {Integer (Int32)}
     */
    static PhoneNumber => 0

    /**
     * The raw address is a custom string.
     * @type {Integer (Int32)}
     */
    static Custom => 1
}

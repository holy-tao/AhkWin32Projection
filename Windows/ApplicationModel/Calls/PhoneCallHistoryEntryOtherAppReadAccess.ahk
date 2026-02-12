#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The level of read access provided to other applications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryotherappreadaccess
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryOtherAppReadAccess extends Win32Enum{

    /**
     * Other applications have full read access to this [PhoneCallHistoryEntry](phonecallhistoryentry.md) object.
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * Other applications can only read system-level information.
     * @type {Integer (Int32)}
     */
    static SystemOnly => 1
}

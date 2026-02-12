#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of media associated with a call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentrymedia
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryMedia extends Win32Enum{

    /**
     * The call contains audio media.
     * @type {Integer (Int32)}
     */
    static Audio => 0

    /**
     * The call contains video media.
     * @type {Integer (Int32)}
     */
    static Video => 1
}

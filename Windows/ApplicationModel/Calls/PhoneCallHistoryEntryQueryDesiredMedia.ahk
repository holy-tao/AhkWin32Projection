#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * A filter used to retrieve call entries based on the contained media.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryquerydesiredmedia
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryQueryDesiredMedia extends Win32BitflagEnum{

    /**
     * No associated media.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Audio media.
     * @type {Integer (UInt32)}
     */
    static Audio => 1

    /**
     * Video media.
     * @type {Integer (UInt32)}
     */
    static Video => 2

    /**
     * All media types.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}

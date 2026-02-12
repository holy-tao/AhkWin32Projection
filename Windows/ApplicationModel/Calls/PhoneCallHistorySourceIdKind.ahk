#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of identifier that the [PhoneCallHistoryEntry.SourceId](phonecallhistoryentry_sourceid.md) refers to.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorysourceidkind
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistorySourceIdKind extends Win32Enum{

    /**
     * The identifier is for a cellular phone line.
     * @type {Integer (Int32)}
     */
    static CellularPhoneLineId => 0

    /**
     * The identifier is for a family package.
     * @type {Integer (Int32)}
     */
    static PackageFamilyName => 1
}

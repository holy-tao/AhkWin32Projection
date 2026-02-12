#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the return status of a call to the [SetHistoryItemAsContent](clipboard_sethistoryitemascontent_2038998314.md) method to set an item in the clipboard history as the current content for the clipboard.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sethistoryitemascontentstatus
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class SetHistoryItemAsContentStatus extends Win32Enum{

    /**
     * The request was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Access to the clipboard history is denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 1

    /**
     * The specified item was deleted.
     * @type {Integer (Int32)}
     */
    static ItemDeleted => 2
}

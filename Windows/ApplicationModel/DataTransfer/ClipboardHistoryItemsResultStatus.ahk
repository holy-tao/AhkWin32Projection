#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the return status of a call to the [GetHistoryItemsAsync](clipboard_gethistoryitemsasync_2128899999.md) method to get the list of items currently in the clipboard history.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitemsresultstatus
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ClipboardHistoryItemsResultStatus extends Win32Enum{

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
     * Clipboard history is disabled for the current user.
     * @type {Integer (Int32)}
     */
    static ClipboardHistoryDisabled => 2
}

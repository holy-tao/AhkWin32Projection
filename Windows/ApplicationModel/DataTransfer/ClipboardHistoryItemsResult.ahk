#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClipboardHistoryItemsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for using the [GetHistoryItemsAsync](clipboard_gethistoryitemsasync_2128899999.md) method to get the list of items currently in the clipboard history.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitemsresult
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ClipboardHistoryItemsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClipboardHistoryItemsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClipboardHistoryItemsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the return status of the call to the [GetHistoryItemsAsync](clipboard_gethistoryitemsasync_2128899999.md) method to get the list of items currently in the clipboard history.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitemsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the list of items in the clipboard history.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitemsresult.items
     * @type {IVectorView<ClipboardHistoryItem>} 
     */
    Items {
        get => this.get_Items()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IClipboardHistoryItemsResult")) {
            if ((queryResult := this.QueryInterface(IClipboardHistoryItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardHistoryItemsResult := IClipboardHistoryItemsResult(outPtr)
        }

        return this.__IClipboardHistoryItemsResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<ClipboardHistoryItem>} 
     */
    get_Items() {
        if (!this.HasProp("__IClipboardHistoryItemsResult")) {
            if ((queryResult := this.QueryInterface(IClipboardHistoryItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardHistoryItemsResult := IClipboardHistoryItemsResult(outPtr)
        }

        return this.__IClipboardHistoryItemsResult.get_Items()
    }

;@endregion Instance Methods
}

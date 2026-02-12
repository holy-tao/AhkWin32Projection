#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClipboardHistoryItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an item in the clipboard history.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitem
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ClipboardHistoryItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClipboardHistoryItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClipboardHistoryItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the current item in the clipboard history.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitem.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the date and time the current item was added to the clipboard history.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitem.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the data for the current item in the clipboard history.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardhistoryitem.content
     * @type {DataPackageView} 
     */
    Content {
        get => this.get_Content()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IClipboardHistoryItem")) {
            if ((queryResult := this.QueryInterface(IClipboardHistoryItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardHistoryItem := IClipboardHistoryItem(outPtr)
        }

        return this.__IClipboardHistoryItem.get_Id()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IClipboardHistoryItem")) {
            if ((queryResult := this.QueryInterface(IClipboardHistoryItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardHistoryItem := IClipboardHistoryItem(outPtr)
        }

        return this.__IClipboardHistoryItem.get_Timestamp()
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Content() {
        if (!this.HasProp("__IClipboardHistoryItem")) {
            if ((queryResult := this.QueryInterface(IClipboardHistoryItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardHistoryItem := IClipboardHistoryItem(outPtr)
        }

        return this.__IClipboardHistoryItem.get_Content()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClipboardContentOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies options for using the [SetContentWithOptions](clipboard_setcontentwithoptions_595822094.md) method to set content in the clipboard.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardcontentoptions
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ClipboardContentOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClipboardContentOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClipboardContentOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the new content being added to the clipboard can be synced to other devices.
     * @remarks
     * The default value of this property is true.
     * 
     * Clipboard roaming must be enabled for this property to have an effect.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardcontentoptions.isroamable
     * @type {Boolean} 
     */
    IsRoamable {
        get => this.get_IsRoamable()
        set => this.put_IsRoamable(value)
    }

    /**
     * Gets or sets a value that indicates whether the new content being added to the clipboard is allowed in the clipboard history.
     * @remarks
     * The default value of this property is true.
     * 
     * Clipboard history must be enabled for this property to have an effect.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardcontentoptions.isallowedinhistory
     * @type {Boolean} 
     */
    IsAllowedInHistory {
        get => this.get_IsAllowedInHistory()
        set => this.put_IsAllowedInHistory(value)
    }

    /**
     * Gets the list of data formats that can be synced to other devices for the content being added to the clipboard.
     * @remarks
     * If this property is an empty list, then all data formats are eligible for syncing.
     * 
     * This property is ignored if the clipboard data is not synced to other devices.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardcontentoptions.roamingformats
     * @type {IVector<HSTRING>} 
     */
    RoamingFormats {
        get => this.get_RoamingFormats()
    }

    /**
     * Gets the list of data formats supported in the clipboard history for the content being added to the clipboard.
     * @remarks
     * If this property is an empty list, then all data formats are eligible for clipboard history.
     * 
     * This property is ignored if the clipboard data does not get added to clipboard history.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboardcontentoptions.historyformats
     * @type {IVector<HSTRING>} 
     */
    HistoryFormats {
        get => this.get_HistoryFormats()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [ClipboardContentOptions](clipboardcontentoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.ClipboardContentOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRoamable() {
        if (!this.HasProp("__IClipboardContentOptions")) {
            if ((queryResult := this.QueryInterface(IClipboardContentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardContentOptions := IClipboardContentOptions(outPtr)
        }

        return this.__IClipboardContentOptions.get_IsRoamable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRoamable(value) {
        if (!this.HasProp("__IClipboardContentOptions")) {
            if ((queryResult := this.QueryInterface(IClipboardContentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardContentOptions := IClipboardContentOptions(outPtr)
        }

        return this.__IClipboardContentOptions.put_IsRoamable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAllowedInHistory() {
        if (!this.HasProp("__IClipboardContentOptions")) {
            if ((queryResult := this.QueryInterface(IClipboardContentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardContentOptions := IClipboardContentOptions(outPtr)
        }

        return this.__IClipboardContentOptions.get_IsAllowedInHistory()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAllowedInHistory(value) {
        if (!this.HasProp("__IClipboardContentOptions")) {
            if ((queryResult := this.QueryInterface(IClipboardContentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardContentOptions := IClipboardContentOptions(outPtr)
        }

        return this.__IClipboardContentOptions.put_IsAllowedInHistory(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RoamingFormats() {
        if (!this.HasProp("__IClipboardContentOptions")) {
            if ((queryResult := this.QueryInterface(IClipboardContentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardContentOptions := IClipboardContentOptions(outPtr)
        }

        return this.__IClipboardContentOptions.get_RoamingFormats()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_HistoryFormats() {
        if (!this.HasProp("__IClipboardContentOptions")) {
            if ((queryResult := this.QueryInterface(IClipboardContentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClipboardContentOptions := IClipboardContentOptions(outPtr)
        }

        return this.__IClipboardContentOptions.get_HistoryFormats()
    }

;@endregion Instance Methods
}

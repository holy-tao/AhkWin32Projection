#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderQuotaUI.ahk
#Include ..\..\..\Guid.ahk

/**
 * The container for the quota UI section of the storage provider flyout. This specifies the total amount of storage in the cloud files account and how much is used.
 * @remarks
 * This section will be collapsed unless the [StorageProviderQuotaUIQuotaUsedLabel](storageproviderquotaui_quotausedlabel.md) is non-empty. This ensures enough context is given to the quota bar, whose percentage is defined by the fraction [StorageProviderQuotaUIQuotaUsedInBytes](storageproviderquotaui_quotausedinbytes.md) over [StorageProviderQuotaUIQuotaTotalInBytes](storageproviderquotaui_quotatotalinbytes.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderquotaui
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderQuotaUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderQuotaUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderQuotaUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The total amount of storage available in the current cloud files account.
     * @remarks
     * This property is advisory. Windows determines if or how it uses these values.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderquotaui.quotatotalinbytes
     * @type {Integer} 
     */
    QuotaTotalInBytes {
        get => this.get_QuotaTotalInBytes()
        set => this.put_QuotaTotalInBytes(value)
    }

    /**
     * The amount of storage used in the current cloud files account.
     * @remarks
     * Note that even if this value is **0**, what appears to be a non-zero value will be seen on the quota bar. This prevents the quota bar from appearing as a separator. Otherwise, the quota bar value is evaluated by dividing this value by [StorageProviderQuotaUIQuotaTotalInBytes](storageproviderquotaui_quotatotalinbytes.md).
     * 
     * This property is advisory. Windows determines if or how it uses these values.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderquotaui.quotausedinbytes
     * @type {Integer} 
     */
    QuotaUsedInBytes {
        get => this.get_QuotaUsedInBytes()
        set => this.put_QuotaUsedInBytes(value)
    }

    /**
     * This string is intended to provide explicit context on the quota bar value, such as 5.0 GB of 10.0 GB.
     * @remarks
     * Windows may use a default string if this property is not present.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderquotaui.quotausedlabel
     * @type {HSTRING} 
     */
    QuotaUsedLabel {
        get => this.get_QuotaUsedLabel()
        set => this.put_QuotaUsedLabel(value)
    }

    /**
     * The color of the quota bar in the storage provider flyout.
     * @remarks
     * It is expected that the provider will handle theme changes, including high contrast theme changes, appropriately for this value.
     * 
     * If no color is provided, the System accent color defined in Settings [UIColorType](../windows.ui.viewmanagement/uicolortype.md) will be used.
     * 
     * This property is advisory. Windows determines if or how it uses these values.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderquotaui.quotausedcolor
     * @type {IReference<Color>} 
     */
    QuotaUsedColor {
        get => this.get_QuotaUsedColor()
        set => this.put_QuotaUsedColor(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * [StorageProviderQuotaUI](storageproviderquotaui.md) default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderQuotaUI")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuotaTotalInBytes() {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.get_QuotaTotalInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_QuotaTotalInBytes(value) {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.put_QuotaTotalInBytes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuotaUsedInBytes() {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.get_QuotaUsedInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_QuotaUsedInBytes(value) {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.put_QuotaUsedInBytes(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QuotaUsedLabel() {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.get_QuotaUsedLabel()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_QuotaUsedLabel(value) {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.put_QuotaUsedLabel(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_QuotaUsedColor() {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.get_QuotaUsedColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_QuotaUsedColor(value) {
        if (!this.HasProp("__IStorageProviderQuotaUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQuotaUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQuotaUI := IStorageProviderQuotaUI(outPtr)
        }

        return this.__IStorageProviderQuotaUI.put_QuotaUsedColor(value)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a property bag of information regarding an update that was previously completed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identity of the provider that processed the update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the unique ID associated with an update (in order to identify it).
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.updateid
     * @type {HSTRING} 
     */
    UpdateId {
        get => this.get_UpdateId()
    }

    /**
     * Gets the timestamp at which the update was completed.
     * @remarks
     * The time is stored in the local time of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the title of the update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets description metadata that gives more detailed information about an update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets a URL that links to detailed information regarding the update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.moreinfourl
     * @type {Uri} 
     */
    MoreInfoUrl {
        get => this.get_MoreInfoUrl()
    }

    /**
     * Gets a value indicating the categoric classification of an update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.category
     * @type {HSTRING} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets the operation associated with the update item.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateitem.operation
     * @type {HSTRING} 
     */
    Operation {
        get => this.get_Operation()
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
    get_ProviderId() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_ProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateId() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_UpdateId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_Description()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_MoreInfoUrl() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_MoreInfoUrl()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Category() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_Category()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Operation() {
        if (!this.HasProp("__IWindowsUpdateItem")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateItem := IWindowsUpdateItem(outPtr)
        }

        return this.__IWindowsUpdateItem.get_Operation()
    }

;@endregion Instance Methods
}

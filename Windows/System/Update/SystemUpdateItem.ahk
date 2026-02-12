#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemUpdateItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the update bundle's properties and status.
 * @remarks
 * Supports Windows 10 IoT Core 2019 Only
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemUpdateItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemUpdateItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * State of the current update item.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Title of the update item.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Describes the contents of the SystemUpdateItem.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * A unique identifer which identifies this update item.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * The revision number of the update bundle.  Starts at 1 and increases if revisions are made to the original update bundle.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.revision
     * @type {Integer} 
     */
    Revision {
        get => this.get_Revision()
    }

    /**
     * Download progress percentage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.downloadprogress
     * @type {Float} 
     */
    DownloadProgress {
        get => this.get_DownloadProgress()
    }

    /**
     * Install progress percentage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.installprogress
     * @type {Float} 
     */
    InstallProgress {
        get => this.get_InstallProgress()
    }

    /**
     * Extended error information, if available.
     * @remarks
     * If an error occurs, the extended error can be retrieved through this property even if an exception is not thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitem.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
    get_State() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Revision() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_Revision()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgress() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_DownloadProgress()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InstallProgress() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_InstallProgress()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ISystemUpdateItem")) {
            if ((queryResult := this.QueryInterface(ISystemUpdateItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemUpdateItem := ISystemUpdateItem(outPtr)
        }

        return this.__ISystemUpdateItem.get_ExtendedError()
    }

;@endregion Instance Methods
}

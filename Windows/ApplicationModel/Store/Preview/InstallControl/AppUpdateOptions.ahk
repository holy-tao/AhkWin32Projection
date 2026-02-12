#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppUpdateOptions.ahk
#Include .\IAppUpdateOptions2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides options you can use in several method overloads of the [AppInstallManager](appinstallmanager.md) class for searching for app updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appupdateoptions
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppUpdateOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppUpdateOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppUpdateOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the catalog ID of the app to be queried for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appupdateoptions.catalogid
     * @type {HSTRING} 
     */
    CatalogId {
        get => this.get_CatalogId()
        set => this.put_CatalogId(value)
    }

    /**
     * Gets or sets a value that specifies whether to allow a forced restart of the app that is being queried for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appupdateoptions.allowforcedapprestart
     * @type {Boolean} 
     */
    AllowForcedAppRestart {
        get => this.get_AllowForcedAppRestart()
        set => this.put_AllowForcedAppRestart(value)
    }

    /**
     * Gets or sets a value that indicates whether the updates should be automatically downloaded and installed if they are found.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appupdateoptions.automaticallydownloadandinstallupdateiffound
     * @type {Boolean} 
     */
    AutomaticallyDownloadAndInstallUpdateIfFound {
        get => this.get_AutomaticallyDownloadAndInstallUpdateIfFound()
        set => this.put_AutomaticallyDownloadAndInstallUpdateIfFound(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [AppUpdateOptions](appupdateoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.InstallControl.AppUpdateOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CatalogId() {
        if (!this.HasProp("__IAppUpdateOptions")) {
            if ((queryResult := this.QueryInterface(IAppUpdateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUpdateOptions := IAppUpdateOptions(outPtr)
        }

        return this.__IAppUpdateOptions.get_CatalogId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CatalogId(value) {
        if (!this.HasProp("__IAppUpdateOptions")) {
            if ((queryResult := this.QueryInterface(IAppUpdateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUpdateOptions := IAppUpdateOptions(outPtr)
        }

        return this.__IAppUpdateOptions.put_CatalogId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowForcedAppRestart() {
        if (!this.HasProp("__IAppUpdateOptions")) {
            if ((queryResult := this.QueryInterface(IAppUpdateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUpdateOptions := IAppUpdateOptions(outPtr)
        }

        return this.__IAppUpdateOptions.get_AllowForcedAppRestart()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowForcedAppRestart(value) {
        if (!this.HasProp("__IAppUpdateOptions")) {
            if ((queryResult := this.QueryInterface(IAppUpdateOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUpdateOptions := IAppUpdateOptions(outPtr)
        }

        return this.__IAppUpdateOptions.put_AllowForcedAppRestart(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticallyDownloadAndInstallUpdateIfFound() {
        if (!this.HasProp("__IAppUpdateOptions2")) {
            if ((queryResult := this.QueryInterface(IAppUpdateOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUpdateOptions2 := IAppUpdateOptions2(outPtr)
        }

        return this.__IAppUpdateOptions2.get_AutomaticallyDownloadAndInstallUpdateIfFound()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutomaticallyDownloadAndInstallUpdateIfFound(value) {
        if (!this.HasProp("__IAppUpdateOptions2")) {
            if ((queryResult := this.QueryInterface(IAppUpdateOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUpdateOptions2 := IAppUpdateOptions2(outPtr)
        }

        return this.__IAppUpdateOptions2.put_AutomaticallyDownloadAndInstallUpdateIfFound(value)
    }

;@endregion Instance Methods
}

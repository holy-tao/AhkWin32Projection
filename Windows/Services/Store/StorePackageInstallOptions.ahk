#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePackageInstallOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents options that can be specified when using the [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_435433203.md) method to download and install downloadable content (DLC) packages for the current app.
 * @remarks
 * > [!NOTE]
 * > DLC packages are not available to all developer accounts.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageinstalloptions
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePackageInstallOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePackageInstallOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePackageInstallOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the OS can force the app to restart after installing the downloadable content (DLC) packages for the current app by using the  [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_435433203.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageinstalloptions.allowforcedapprestart
     * @type {Boolean} 
     */
    AllowForcedAppRestart {
        get => this.get_AllowForcedAppRestart()
        set => this.put_AllowForcedAppRestart(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [StorePackageInstallOptions](storepackageinstalloptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StorePackageInstallOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowForcedAppRestart() {
        if (!this.HasProp("__IStorePackageInstallOptions")) {
            if ((queryResult := this.QueryInterface(IStorePackageInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageInstallOptions := IStorePackageInstallOptions(outPtr)
        }

        return this.__IStorePackageInstallOptions.get_AllowForcedAppRestart()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowForcedAppRestart(value) {
        if (!this.HasProp("__IStorePackageInstallOptions")) {
            if ((queryResult := this.QueryInterface(IStorePackageInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageInstallOptions := IStorePackageInstallOptions(outPtr)
        }

        return this.__IStorePackageInstallOptions.put_AllowForcedAppRestart(value)
    }

;@endregion Instance Methods
}

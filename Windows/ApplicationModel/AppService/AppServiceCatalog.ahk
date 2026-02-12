#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceCatalogStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enumerate the available app service providers on the device. App service providers enable app-to-app communication by providing services that other Universal Windows app can consume.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicecatalog
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceCatalog extends IInspectable {
;@region Static Methods
    /**
     * Returns the list of app service providers that match a specific app service name on the device.
     * @param {HSTRING} appServiceName The name of the app service to find.
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicecatalog.findappserviceprovidersasync
     */
    static FindAppServiceProvidersAsync(appServiceName) {
        if (!AppServiceCatalog.HasProp("__IAppServiceCatalogStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppService.AppServiceCatalog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppServiceCatalogStatics.IID)
            AppServiceCatalog.__IAppServiceCatalogStatics := IAppServiceCatalogStatics(factoryPtr)
        }

        return AppServiceCatalog.__IAppServiceCatalogStatics.FindAppServiceProvidersAsync(appServiceName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

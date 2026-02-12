#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\AppInfo.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class IAppServiceCatalogStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppServiceCatalogStatics
     * @type {Guid}
     */
    static IID => Guid("{ef0d2507-d132-4c85-8395-3c31d5a1e941}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAppServiceProvidersAsync"]

    /**
     * 
     * @param {HSTRING} appServiceName 
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     */
    FindAppServiceProvidersAsync(appServiceName) {
        if(appServiceName is String) {
            pin := HSTRING.Create(appServiceName)
            appServiceName := pin.Value
        }
        appServiceName := appServiceName is Win32Handle ? NumGet(appServiceName, "ptr") : appServiceName

        result := ComCall(6, this, "ptr", appServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInfo), operation)
    }
}

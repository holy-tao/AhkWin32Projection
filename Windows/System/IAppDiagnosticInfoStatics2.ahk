#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppDiagnosticInfoWatcher.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\AppDiagnosticInfo.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppDiagnosticInfoStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDiagnosticInfoStatics2
     * @type {Guid}
     */
    static IID => Guid("{05b24b86-1000-4c90-bb9f-7235071c50fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWatcher", "RequestAccessAsync", "RequestInfoForPackageAsync", "RequestInfoForAppAsync", "RequestInfoForAppUserModelId"]

    /**
     * 
     * @returns {AppDiagnosticInfoWatcher} 
     */
    CreateWatcher() {
        result := ComCall(6, this, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppDiagnosticInfoWatcher(watcher)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     */
    RequestInfoForPackageAsync(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(8, this, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, AppDiagnosticInfo), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     */
    RequestInfoForAppAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, AppDiagnosticInfo), operation)
    }

    /**
     * 
     * @param {HSTRING} appUserModelId 
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     */
    RequestInfoForAppUserModelId(appUserModelId) {
        if(appUserModelId is String) {
            pin := HSTRING.Create(appUserModelId)
            appUserModelId := pin.Value
        }
        appUserModelId := appUserModelId is Win32Handle ? NumGet(appUserModelId, "ptr") : appUserModelId

        result := ComCall(10, this, "ptr", appUserModelId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, AppDiagnosticInfo), operation)
    }
}

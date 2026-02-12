#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorePackageUpdateStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreQueueItemStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreQueueItemStatus
     * @type {Guid}
     */
    static IID => Guid("{9bd6796f-9cc3-4ec3-b2ef-7be433b30174}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageInstallState", "get_PackageInstallExtendedState", "get_UpdateStatus", "get_ExtendedError"]

    /**
     * @type {Integer} 
     */
    PackageInstallState {
        get => this.get_PackageInstallState()
    }

    /**
     * @type {Integer} 
     */
    PackageInstallExtendedState {
        get => this.get_PackageInstallExtendedState()
    }

    /**
     * @type {StorePackageUpdateStatus} 
     */
    UpdateStatus {
        get => this.get_UpdateStatus()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PackageInstallState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PackageInstallExtendedState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {StorePackageUpdateStatus} 
     */
    get_UpdateStatus() {
        value := StorePackageUpdateStatus()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

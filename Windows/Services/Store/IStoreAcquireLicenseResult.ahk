#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorePackageLicense.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreAcquireLicenseResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreAcquireLicenseResult
     * @type {Guid}
     */
    static IID => Guid("{fbd7946d-f040-4cb3-9a39-29bcecdbe22d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StorePackageLicense", "get_ExtendedError"]

    /**
     * @type {StorePackageLicense} 
     */
    StorePackageLicense {
        get => this.get_StorePackageLicense()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {StorePackageLicense} 
     */
    get_StorePackageLicense() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorePackageLicense(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\ApplicationModel\Package.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePackageLicense extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePackageLicense
     * @type {Guid}
     */
    static IID => Guid("{0c465714-14e1-4973-bd14-f77724271e99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_LicenseLost", "remove_LicenseLost", "get_Package", "get_IsValid", "ReleaseLicense"]

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * @type {Boolean} 
     */
    IsValid {
        get => this.get_IsValid()
    }

    /**
     * 
     * @param {TypedEventHandler<StorePackageLicense, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LicenseLost(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LicenseLost(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsValid() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseLicense() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

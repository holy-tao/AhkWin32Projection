#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreLicense extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreLicense
     * @type {Guid}
     */
    static IID => Guid("{26dc9579-4c4f-4f30-bc89-649f60e36055}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SkuStoreId", "get_IsActive", "get_ExpirationDate", "get_ExtendedJsonData", "get_InAppOfferToken"]

    /**
     * @type {HSTRING} 
     */
    SkuStoreId {
        get => this.get_SkuStoreId()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * @type {HSTRING} 
     */
    InAppOfferToken {
        get => this.get_InAppOfferToken()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SkuStoreId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InAppOfferToken() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

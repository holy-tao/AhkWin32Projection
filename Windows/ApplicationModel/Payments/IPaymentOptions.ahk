#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentOptions
     * @type {Guid}
     */
    static IID => Guid("{aaa30854-1f2b-4365-8251-01b58915a5bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestPayerEmail", "put_RequestPayerEmail", "get_RequestPayerName", "put_RequestPayerName", "get_RequestPayerPhoneNumber", "put_RequestPayerPhoneNumber", "get_RequestShipping", "put_RequestShipping", "get_ShippingType", "put_ShippingType"]

    /**
     * @type {Integer} 
     */
    RequestPayerEmail {
        get => this.get_RequestPayerEmail()
        set => this.put_RequestPayerEmail(value)
    }

    /**
     * @type {Integer} 
     */
    RequestPayerName {
        get => this.get_RequestPayerName()
        set => this.put_RequestPayerName(value)
    }

    /**
     * @type {Integer} 
     */
    RequestPayerPhoneNumber {
        get => this.get_RequestPayerPhoneNumber()
        set => this.put_RequestPayerPhoneNumber(value)
    }

    /**
     * @type {Boolean} 
     */
    RequestShipping {
        get => this.get_RequestShipping()
        set => this.put_RequestShipping(value)
    }

    /**
     * @type {Integer} 
     */
    ShippingType {
        get => this.get_ShippingType()
        set => this.put_ShippingType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestPayerEmail() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestPayerEmail(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestPayerName() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestPayerName(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestPayerPhoneNumber() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestPayerPhoneNumber(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequestShipping() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequestShipping(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShippingType() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ShippingType(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

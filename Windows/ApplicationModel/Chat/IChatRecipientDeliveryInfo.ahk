#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatRecipientDeliveryInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatRecipientDeliveryInfo
     * @type {Guid}
     */
    static IID => Guid("{ffc7b2a2-283c-4c0a-8a0e-8c33bdbf0545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransportAddress", "put_TransportAddress", "get_DeliveryTime", "put_DeliveryTime", "get_ReadTime", "put_ReadTime", "get_TransportErrorCodeCategory", "get_TransportInterpretedErrorCode", "get_TransportErrorCode", "get_IsErrorPermanent", "get_Status"]

    /**
     * @type {HSTRING} 
     */
    TransportAddress {
        get => this.get_TransportAddress()
        set => this.put_TransportAddress(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    DeliveryTime {
        get => this.get_DeliveryTime()
        set => this.put_DeliveryTime(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ReadTime {
        get => this.get_ReadTime()
        set => this.put_ReadTime(value)
    }

    /**
     * @type {Integer} 
     */
    TransportErrorCodeCategory {
        get => this.get_TransportErrorCodeCategory()
    }

    /**
     * @type {Integer} 
     */
    TransportInterpretedErrorCode {
        get => this.get_TransportInterpretedErrorCode()
    }

    /**
     * @type {Integer} 
     */
    TransportErrorCode {
        get => this.get_TransportErrorCode()
    }

    /**
     * @type {Boolean} 
     */
    IsErrorPermanent {
        get => this.get_IsErrorPermanent()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportAddress() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TransportAddress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_DeliveryTime() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), result_)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_DeliveryTime(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ReadTime() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), result_)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ReadTime(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportErrorCodeCategory() {
        result := ComCall(12, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportInterpretedErrorCode() {
        result := ComCall(13, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportErrorCode() {
        result := ComCall(14, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsErrorPermanent() {
        result := ComCall(15, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(16, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

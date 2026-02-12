#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentItem.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PaymentShippingOption.ahk
#Include .\PaymentDetailsModifier.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentDetails
     * @type {Guid}
     */
    static IID => Guid("{53bb2d7d-e0eb-4053-8eae-ce7c48e02945}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Total", "put_Total", "get_DisplayItems", "put_DisplayItems", "get_ShippingOptions", "put_ShippingOptions", "get_Modifiers", "put_Modifiers"]

    /**
     * @type {PaymentItem} 
     */
    Total {
        get => this.get_Total()
        set => this.put_Total(value)
    }

    /**
     * @type {IVectorView<PaymentItem>} 
     */
    DisplayItems {
        get => this.get_DisplayItems()
        set => this.put_DisplayItems(value)
    }

    /**
     * @type {IVectorView<PaymentShippingOption>} 
     */
    ShippingOptions {
        get => this.get_ShippingOptions()
        set => this.put_ShippingOptions(value)
    }

    /**
     * @type {IVectorView<PaymentDetailsModifier>} 
     */
    Modifiers {
        get => this.get_Modifiers()
        set => this.put_Modifiers(value)
    }

    /**
     * 
     * @returns {PaymentItem} 
     */
    get_Total() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentItem(value)
    }

    /**
     * 
     * @param {PaymentItem} value 
     * @returns {HRESULT} 
     */
    put_Total(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<PaymentItem>} 
     */
    get_DisplayItems() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PaymentItem, value)
    }

    /**
     * 
     * @param {IVectorView<PaymentItem>} value 
     * @returns {HRESULT} 
     */
    put_DisplayItems(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<PaymentShippingOption>} 
     */
    get_ShippingOptions() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PaymentShippingOption, value)
    }

    /**
     * 
     * @param {IVectorView<PaymentShippingOption>} value 
     * @returns {HRESULT} 
     */
    put_ShippingOptions(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<PaymentDetailsModifier>} 
     */
    get_Modifiers() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PaymentDetailsModifier, value)
    }

    /**
     * 
     * @param {IVectorView<PaymentDetailsModifier>} value 
     * @returns {HRESULT} 
     */
    put_Modifiers(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PaymentItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentDetailsModifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentDetailsModifier
     * @type {Guid}
     */
    static IID => Guid("{be1c7d65-4323-41d7-b305-dfcb765f69de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_JsonData", "get_SupportedMethodIds", "get_Total", "get_AdditionalDisplayItems"]

    /**
     * @type {HSTRING} 
     */
    JsonData {
        get => this.get_JsonData()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SupportedMethodIds {
        get => this.get_SupportedMethodIds()
    }

    /**
     * @type {PaymentItem} 
     */
    Total {
        get => this.get_Total()
    }

    /**
     * @type {IVectorView<PaymentItem>} 
     */
    AdditionalDisplayItems {
        get => this.get_AdditionalDisplayItems()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JsonData() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedMethodIds() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {PaymentItem} 
     */
    get_Total() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentItem(value)
    }

    /**
     * 
     * @returns {IVectorView<PaymentItem>} 
     */
    get_AdditionalDisplayItems() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PaymentItem, value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentToken extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentToken
     * @type {Guid}
     */
    static IID => Guid("{bbcac013-ccd0-41f2-b2a1-0a2e4b5dce25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaymentMethodId", "get_JsonDetails"]

    /**
     * @type {HSTRING} 
     */
    PaymentMethodId {
        get => this.get_PaymentMethodId()
    }

    /**
     * @type {HSTRING} 
     */
    JsonDetails {
        get => this.get_JsonDetails()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PaymentMethodId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JsonDetails() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

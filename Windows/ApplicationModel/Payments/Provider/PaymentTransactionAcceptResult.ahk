#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentTransactionAcceptResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains the status of a payment transaction after attempting to accept it.
 * @remarks
 * An object of this class type is created and retrieved through the [PaymentTransaction.AcceptAsync](paymenttransaction_acceptasync_1179121155.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransactionacceptresult
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class PaymentTransactionAcceptResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentTransactionAcceptResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentTransactionAcceptResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of a payment transaction accept operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransactionacceptresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPaymentTransactionAcceptResult")) {
            if ((queryResult := this.QueryInterface(IPaymentTransactionAcceptResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransactionAcceptResult := IPaymentTransactionAcceptResult(outPtr)
        }

        return this.__IPaymentTransactionAcceptResult.get_Status()
    }

;@endregion Instance Methods
}

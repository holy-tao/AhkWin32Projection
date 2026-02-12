#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration indicating what was changed in the payment request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangekind
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequestChangeKind extends Win32Enum{

    /**
     * The shipping option was changed.
     * @type {Integer (Int32)}
     */
    static ShippingOption => 0

    /**
     * The shipping address was changed.
     * @type {Integer (Int32)}
     */
    static ShippingAddress => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration that describes whether or not the transaction completed successfully.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestcompletionstatus
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequestCompletionStatus extends Win32Enum{

    /**
     * Payment was successfully processed by the merchant.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * Payment failed by the merchant.
     * @type {Integer (Int32)}
     */
    static Failed => 1

    /**
     * Unknown status provided by the merchant.
     * @type {Integer (Int32)}
     */
    static Unknown => 2
}

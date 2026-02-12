#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration that describes whether the user successfully accepted the payment request. See [PaymentRequestSubmitResult](paymentrequestsubmitresult.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequeststatus
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequestStatus extends Win32Enum{

    /**
     * The payment request succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The payment request failed.
     * @type {Integer (Int32)}
     */
    static Failed => 1

    /**
     * The user cancelled the payment request
     * @type {Integer (Int32)}
     */
    static Canceled => 2
}

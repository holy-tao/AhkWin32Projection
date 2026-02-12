#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumeration represents the result of querying whether a payment can be made.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcanmakepaymentresultstatus
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentCanMakePaymentResultStatus extends Win32Enum{

    /**
     * There's an unknown reason.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Yes, a payment can be made.
     * @type {Integer (Int32)}
     */
    static Yes => 1

    /**
     * No.
     * @type {Integer (Int32)}
     */
    static No => 2

    /**
     * The payment is not allowed.
     * @type {Integer (Int32)}
     */
    static NotAllowed => 3

    /**
     * The user is not signed in.
     * @type {Integer (Int32)}
     */
    static UserNotSignedIn => 4

    /**
     * The specified payment method is not supported.
     * @type {Integer (Int32)}
     */
    static SpecifiedPaymentMethodIdsNotSupported => 5

    /**
     * There is no qualifying card on file.
     * @type {Integer (Int32)}
     */
    static NoQualifyingCardOnFile => 6
}

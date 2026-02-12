#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration that indicates whether the option is required or optional.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptionpresence
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentOptionPresence extends Win32Enum{

    /**
     * Property is not needed or used by the merchant.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Property is not needed by the merchant, but they will accept it if provided. For example, a merchant could optionally send you a receipt to your email address.
     * @type {Integer (Int32)}
     */
    static Optional => 1

    /**
     * The merchant can't (or is unwilling to) process the transaction without this information.
     * @type {Integer (Int32)}
     */
    static Required => 2
}

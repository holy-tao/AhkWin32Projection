#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration that describes the shipping type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingtype
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentShippingType extends Win32Enum{

    /**
     * Shipping.
     * @type {Integer (Int32)}
     */
    static Shipping => 0

    /**
     * Delivery.
     * @type {Integer (Int32)}
     */
    static Delivery => 1

    /**
     * Pickup.
     * @type {Integer (Int32)}
     */
    static Pickup => 2
}

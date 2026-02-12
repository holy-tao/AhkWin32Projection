#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the product type for an in-app product.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.producttype
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ProductType extends Win32Enum{

    /**
     * The product type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A durable product.
     * @type {Integer (Int32)}
     */
    static Durable => 1

    /**
     * A consumable product.
     * @type {Integer (Int32)}
     */
    static Consumable => 2
}

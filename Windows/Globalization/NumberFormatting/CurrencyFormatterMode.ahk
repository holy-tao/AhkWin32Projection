#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the use of symbols or codes when currency is formatted.
  * 
  * This enumeration is used by the [Mode](currencyformatter_mode.md) property of [CurrencyFormatter](currencyformatter.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.currencyformattermode
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class CurrencyFormatterMode extends Win32Enum{

    /**
     * Default behavior. Currencies are formatted with the appropriate currency symbol (for example, $15).
     * @type {Integer (Int32)}
     */
    static UseSymbol => 0

    /**
     * Currencies are formatted with the [Currency](currencyformatter_currency.md) code provided to the [CurrencyFormatter](currencyformatter.md) object (for example, 15 USD).
     * @type {Integer (Int32)}
     */
    static UseCurrencyCode => 1
}

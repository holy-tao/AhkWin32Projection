#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\PSTR.ahk

/**
 * Contains information that defines the format of a currency string. The GetCurrencyFormat function uses this information to customize a currency string for a specified locale.
 * @remarks
 * 
  * > [!NOTE]
  * > The winnls.h header defines CURRENCYFMT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnls/ns-winnls-currencyfmta
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset ANSI
 */
class CURRENCYFMTA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Number of fractional digits. This number is equivalent to <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-icurrdigits">LOCALE_ICURRDIGITS</a>.
     * @type {Integer}
     */
    NumDigits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Value indicating if leading zeros should be used in decimal fields. This value is equivalent to <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-ilzero">LOCALE_ILZERO</a>.
     * @type {Integer}
     */
    LeadingZero {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of digits in each group of numbers to the left of the decimal separator specified by <b>lpDecimalSep</b>. The most significant grouping digit indicates the number of digits in the least significant group immediately to the left of the decimal separator. Each subsequent grouping digit indicates the next significant group of digits to the left of the previous group. If the last value supplied is not 0, the remaining groups repeat the last group. Typical examples of settings for this member are: 0 to group digits as in 123456789.00; 3 to group digits as in 123,456,789.00; and 32 to group digits as in 12,34,56,789.00.
     * 
     * <div class="alert"><b>Note</b>   You can use settings other than the typical settings, but they will not show up in the regional and language settings portion of the Control Panel. Such settings are extremely uncommon and might have unexpected results.</div>
     * <div> </div>
     * @type {Integer}
     */
    Grouping {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a null-terminated decimal separator string.
     * @type {PSTR}
     */
    lpDecimalSep{
        get {
            if(!this.HasProp("__lpDecimalSep"))
                this.__lpDecimalSep := PSTR(this.ptr + 16)
            return this.__lpDecimalSep
        }
    }

    /**
     * Pointer to a null-terminated thousand separator string.
     * @type {PSTR}
     */
    lpThousandSep{
        get {
            if(!this.HasProp("__lpThousandSep"))
                this.__lpThousandSep := PSTR(this.ptr + 24)
            return this.__lpThousandSep
        }
    }

    /**
     * Negative currency mode. This mode is equivalent to <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-ineg-constants">LOCALE_INEGCURR</a>.
     * @type {Integer}
     */
    NegativeOrder {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Positive currency mode. This mode is equivalent to <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-icurrency">LOCALE_ICURRENCY</a>.
     * @type {Integer}
     */
    PositiveOrder {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Pointer to a null-terminated currency symbol string.
     * @type {PSTR}
     */
    lpCurrencySymbol{
        get {
            if(!this.HasProp("__lpCurrencySymbol"))
                this.__lpCurrencySymbol := PSTR(this.ptr + 40)
            return this.__lpCurrencySymbol
        }
    }
}

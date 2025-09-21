#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information that defines the format of a number string. The GetNumberFormat function uses this information to customize a number string for a specified locale. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The winnls.h header defines NUMBERFMT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-numberfmta
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset ANSI
 */
class NUMBERFMTA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Number of fractional digits. This value is equivalent to the locale information specified by the value <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-idigits">LOCALE_IDIGITS</a>.
     * @type {Integer}
     */
    NumDigits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value indicating if leading zeros should be used in decimal fields. This value is equivalent to the locale information specified by the value <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-ilzero">LOCALE_ILZERO</a>.
     * @type {Integer}
     */
    LeadingZero {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of digits in each group of numbers to the left of the decimal separator specified by <b>lpDecimalSep</b>. Values in the range 0 through 9 and 32 are valid. The most significant grouping digit indicates the number of digits in the least significant group immediately to the left of the decimal separator. Each subsequent grouping digit indicates the next significant group of digits to the left of the previous group. If the last value supplied is not 0, the remaining groups repeat the last group. Typical examples of settings for this member are: 0 to group digits as in 123456789.00; 3 to group digits as in 123,456,789.00; and 32 to group digits as in 12,34,56,789.00.
     * 
     * <div class="alert"><b>Note</b>   You can use settings other than the typical settings, but they will not show up in the regional and language options portion of the Control Panel. Such settings are extremely uncommon and might have unexpected results.</div>
     * <div> </div>
     * @type {Integer}
     */
    Grouping {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a null-terminated decimal separator string.
     * @type {Pointer<Byte>}
     */
    lpDecimalSep {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated thousand separator string.
     * @type {Pointer<Byte>}
     */
    lpThousandSep {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Negative number mode. This mode is equivalent to the locale information specified by the value <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-ineg-constants">LOCALE_INEGNUMBER</a>.
     * @type {Integer}
     */
    NegativeOrder {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

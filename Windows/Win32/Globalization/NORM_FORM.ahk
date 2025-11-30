#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the supported normalization forms.
 * @remarks
 * 
 * For more information about the normalization forms, see <a href="https://docs.microsoft.com/windows/desktop/Intl/using-unicode-normalization-to-represent-strings">Using Unicode Normalization to Represent Strings</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnls/ne-winnls-norm_form
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class NORM_FORM extends Win32Enum{

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static NormalizationOther => 0

    /**
     * Unicode normalization form C, canonical composition. Transforms each decomposed grouping, consisting of a base character plus combining characters, to the canonical precomposed equivalent. For example, A + ¨ becomes Ä.
     * @type {Integer (Int32)}
     */
    static NormalizationC => 1

    /**
     * Unicode normalization form D, canonical decomposition. Transforms each precomposed character to its canonical decomposed equivalent. For example, Ä becomes A + ¨.
     * @type {Integer (Int32)}
     */
    static NormalizationD => 2

    /**
     * Unicode normalization form KC, compatibility composition. Transforms each base plus combining characters to the canonical precomposed equivalent and all compatibility characters to their equivalents. For example, the ligature ﬁ becomes f + i; similarly, A + ¨ + ﬁ + n becomes Ä + f + i + n.
     * @type {Integer (Int32)}
     */
    static NormalizationKC => 5

    /**
     * Unicode normalization form KD, compatibility decomposition. Transforms each precomposed character to its canonical decomposed equivalent and all compatibility characters to their equivalents. For example, Ä + ﬁ + n becomes A + ¨ + f + i + n.
     * @type {Integer (Int32)}
     */
    static NormalizationKD => 6
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * The StringDigitSubstitute enumeration specifies how to substitute digits in a string according to a user's locale or language.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-stringdigitsubstitute
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringDigitSubstitute{

    /**
     * Specifies a user-defined substitution scheme.
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteUser => 0

    /**
     * Specifies to disable substitutions.
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteNone => 1

    /**
     * Specifies substitution digits that correspond with the official national language of the user's locale.
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteNational => 2

    /**
     * Specifies substitution digits that correspond with the user's native script or language, which may be different from the official national language of the user's locale.
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteTraditional => 3
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to apply number substitution on digits and related punctuation.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_number_substitution_method
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_NUMBER_SUBSTITUTION_METHOD extends Win32Enum {

    /**
     * Specifies that the substitution method should be determined based on the LOCALE_IDIGITSUBSTITUTION value of the specified text culture.
     * Native name: DWRITE_NUMBER_SUBSTITUTION_METHOD_FROM_CULTURE
     * @type {Integer (Int32)}
     */
    static FROM_CULTURE => 0

    /**
     * If the culture is Arabic or Persian, specifies that the number shapes depend on the context. Either traditional or nominal number shapes are used, depending on the nearest preceding strong character or (if there is none) the reading direction of the paragraph.
     * Native name: DWRITE_NUMBER_SUBSTITUTION_METHOD_CONTEXTUAL
     * @type {Integer (Int32)}
     */
    static CONTEXTUAL => 1

    /**
     * Specifies that code points 0x30-0x39 are always rendered as nominal numeral shapes (ones of the European number), that is, no substitution is performed.
     * Native name: DWRITE_NUMBER_SUBSTITUTION_METHOD_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * Specifies that numbers are rendered using the national number shapes as specified by the LOCALE_SNATIVEDIGITS value of the specified text culture.
     * Native name: DWRITE_NUMBER_SUBSTITUTION_METHOD_NATIONAL
     * @type {Integer (Int32)}
     */
    static NATIONAL => 3

    /**
     * Specifies that numbers are rendered using the traditional shapes for the specified culture. For most cultures, this is the same as NativeNational. However, NativeNational results in Latin numbers for some Arabic cultures, whereasDWRITE_NUMBER_SUBSTITUTION_METHOD_TRADITIONAL results in arabic numbers for all Arabic cultures.
     * Native name: DWRITE_NUMBER_SUBSTITUTION_METHOD_TRADITIONAL
     * @type {Integer (Int32)}
     */
    static TRADITIONAL => 4
}

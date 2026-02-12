#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnicodeCharactersStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way for apps to get information about Unicode characters, per the [Unicode Standard Annex #44](https://www.unicode.org/reports/tr44/#White_Space).
 * @remarks
 * Use [GetCodepointFromSurrogatePair](unicodecharacters_getcodepointfromsurrogatepair_1886831018.md) to prepare Unicode characters before you pass them to any of the other methods of this class, in order to properly process supplementary characters. See [Surrogates and Supplementary Characters](/windows/desktop/Intl/surrogates-and-supplementary-characters) for a discussion of supplementary Unicode characters.
 * 
 * The normal procedure for processing the code points in a stream is to:
 * 
 * 1. Use [IsHighSurrogate](unicodecharacters_ishighsurrogate_1444937275.md) to determine if a code point is a high surrogate.
 * 1. If it is not, pass it to the desired method of UnicodeCharacters.
 * 1. Else the code point is a high surrogate:1. Use [IsLowSurrogate](unicodecharacters_islowsurrogate_645121110.md) to check the next code point in the stream to determine if it is a low surrogate.
 * 1. If it is not, you have an invalid sequence of code points.
 * 1. Else the second code point is a low surrogate. Pass the high and low pair to [GetCodepointFromSurrogatePair](unicodecharacters_getcodepointfromsurrogatepair_1886831018.md) to obtain the supplementary Unicode character that can be passed on to the desired method.
 * 
 * The methods in this class throw an invalid argument exception if the input is not a valid codepoint.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class UnicodeCharacters extends IInspectable {
;@region Static Methods
    /**
     * Returns the supplementary Unicode character for the specified high and low surrogate pair.
     * @param {Integer} highSurrogate The high surrogate value. This must be in the proper range: 0xD800 &lt;= *highSurrogate* &lt;= 0xDBFF.
     * @param {Integer} lowSurrogate The low surrogate value. This must be in the proper range: 0xDC00 &lt;= *lowSurrogate* &lt;= 0xDFFF.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.getcodepointfromsurrogatepair
     */
    static GetCodepointFromSurrogatePair(highSurrogate, lowSurrogate) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.GetCodepointFromSurrogatePair(highSurrogate, lowSurrogate)
    }

    /**
     * Returns the high and low surrogate pair values for the specified supplementary Unicode character.
     * @remarks
     * See [Surrogates and Supplementary Characters](/windows/desktop/Intl/surrogates-and-supplementary-characters) for a discussion of supplementary Unicode characters.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @param {Pointer<Char>} highSurrogate The high surrogate value returned.
     * @param {Pointer<Char>} lowSurrogate The low surrogate value returned.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.getsurrogatepairfromcodepoint
     */
    static GetSurrogatePairFromCodepoint(codepoint, highSurrogate, lowSurrogate) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.GetSurrogatePairFromCodepoint(codepoint, highSurrogate, lowSurrogate)
    }

    /**
     * Determines if a specified Unicode character is a high surrogate.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.ishighsurrogate
     */
    static IsHighSurrogate(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsHighSurrogate(codepoint)
    }

    /**
     * Determines if a specified Unicode character is a low surrogate.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.islowsurrogate
     */
    static IsLowSurrogate(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsLowSurrogate(codepoint)
    }

    /**
     * Determines if a specified Unicode character is a supplementary character.
     * @remarks
     * This method determines if *codepoint* is a supplementary character (greater than 0xFFFF).
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.issupplementary
     */
    static IsSupplementary(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsSupplementary(codepoint)
    }

    /**
     * Determines if a specified codepoint is a non-character.
     * @remarks
     * This method determines if *codepoint* is a one of the invalid Unicode code points (U+FFD0 through U+FFEF, U+xxFFFE, or U+xxFFFF).
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isnoncharacter
     */
    static IsNoncharacter(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsNoncharacter(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered whitespace.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.iswhitespace
     */
    static IsWhitespace(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsWhitespace(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered alphabetic.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isalphabetic
     */
    static IsAlphabetic(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsAlphabetic(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered cased (uppercase, lowercase or titlecase).
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.iscased
     */
    static IsCased(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsCased(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered an upper case character.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isuppercase
     */
    static IsUppercase(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsUppercase(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered a lower case character.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.islowercase
     */
    static IsLowercase(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsLowercase(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered the start character of an identifier in programming.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isidstart
     */
    static IsIdStart(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsIdStart(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered a continuation character of an identifier in programming.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isidcontinue
     */
    static IsIdContinue(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsIdContinue(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered the beginning of a grapheme.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isgraphemebase
     */
    static IsGraphemeBase(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsGraphemeBase(codepoint)
    }

    /**
     * Determines if a specified Unicode character can be considered to continue a previous grapheme.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.isgraphemeextend
     */
    static IsGraphemeExtend(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.IsGraphemeExtend(codepoint)
    }

    /**
     * Returns the [UnicodeNumericType](unicodenumerictype.md) of the specified Unicode character.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.getnumerictype
     */
    static GetNumericType(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.GetNumericType(codepoint)
    }

    /**
     * Returns the [UnicodeGeneralCategory](unicodegeneralcategory.md) of the specified Unicode character.
     * @param {Integer} codepoint A Unicode character. This must be in the proper range: 0 &lt;= *codepoint* &lt;= 0x10FFFF.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodecharacters.getgeneralcategory
     */
    static GetGeneralCategory(codepoint) {
        if (!UnicodeCharacters.HasProp("__IUnicodeCharactersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.UnicodeCharacters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnicodeCharactersStatics.IID)
            UnicodeCharacters.__IUnicodeCharactersStatics := IUnicodeCharactersStatics(factoryPtr)
        }

        return UnicodeCharacters.__IUnicodeCharactersStatics.GetGeneralCategory(codepoint)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

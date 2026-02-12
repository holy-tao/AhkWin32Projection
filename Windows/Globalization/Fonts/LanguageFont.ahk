#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILanguageFont.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data related to a particular font recommendation for a given language.
 * @remarks
 * A LanguageFont object provides data giving a font recommendation for a particular language and for particular usage cases. LanguageFont objects are obtained from a [LanguageFontGroup](languagefontgroup.md) object, which is constructed for a particular language or script. Each [LanguageFontGroup](languagefontgroup.md) object provides different LanguageFont objects for different usage cases.
 * 
 * Depending on the usage case, font weight/style/stretch attributes provided in the LanguageFont may or may not be significant: for some usage cases, a "regular" font (regular weight, normal style, normal stretch) may always be returned. Applications may want to apply other weight/style/stretch formatting in those cases. See the remarks on the different usage cases for [LanguageFontGroup](languagefontgroup.md).
 * 
 * The [ScaleFactor](languagefont_scalefactor.md) property provides a multiplier that can be applied to a nominal font size. See the [ScaleFactor](languagefont_scalefactor.md) property topic for additional information.
 * 
 * The fonts referenced by a LanguageFont are always fonts that ship as part of Windows. There is no way for an end user or developer to customize these values. It is safe to assume that the font will be present on every Windows 8 system.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefont
 * @namespace Windows.Globalization.Fonts
 * @version WindowsRuntime 1.4
 */
class LanguageFont extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILanguageFont

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILanguageFont.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the family name of the font.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefont.fontfamily
     * @type {HSTRING} 
     */
    FontFamily {
        get => this.get_FontFamily()
    }

    /**
     * Gets the weight of the font ([FontWeight](../windows.ui.text/fontweight.md)).
     * 
     * The weight of the font is the lightness or heaviness of the strokes.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefont.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
    }

    /**
     * Gets the [FontStretch](../windows.ui.text/fontstretch.md) property of the font.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefont.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
    }

    /**
     * Gets the [FontStyle](../windows.ui.text/fontstyle.md) property of the font.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefont.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
    }

    /**
     * Gets a recommended font size scaling factor for the font.
     * 
     * The factor can be used to adjust relative sizes when two or more fonts are used for different runs within the same text element.
     * @remarks
     * The ScaleFactor property provides a multiplier that can be applied to a nominal font size. Scale factors are intended to be used within a single [LanguageFontGroup](languagefontgroup.md) usage case so that text in different languages and scripts (that is, using different recommended fonts) will appear at complementary sizes. Scale factors within a single [LanguageFontGroup](languagefontgroup.md) usage case may be compared, but it is not appropriate to compare scale factors between different [LanguageFontGroup](languagefontgroup.md) usage cases.
     * 
     * For example, suppose a user interface heading element is nominally set at 36 pt. Suppose further that instances of that element are displayed side-by-side in Korean and English. An application can construct [LanguageFontGroup](languagefontgroup.md) objects for Korean and for English, and then obtain the [UIHeadingFont](languagefontgroup_uiheadingfont.md) [LanguageFont ](languagefont.md) for each language. The [LanguageFont](languagefont.md) for English might have a scale factor of 1.0, while the [LanguageFont](languagefont.md) for Korean might have a scale factor of 0.96. If the English text is set at 36 pt and the Korean text is set at 34.56 pt (= 36 × 0.96), then the two text elements will appear better side-by-side than if both had been displayed at 36 pt.
     * 
     * For most [LanguageFontGroup](languagefontgroup.md) usage cases, the scale factor is chosen to make the size and weight of the different fonts more compatible with one another. For the [FixedWidthTextFont](languagefontgroup_fixedwidthtextfont.md) usage case, however, the scale factor is chosen to make the widths of characters in different fixed-width fonts more compatible with one another.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefont.scalefactor
     * @type {Float} 
     */
    ScaleFactor {
        get => this.get_ScaleFactor()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FontFamily() {
        if (!this.HasProp("__ILanguageFont")) {
            if ((queryResult := this.QueryInterface(ILanguageFont.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFont := ILanguageFont(outPtr)
        }

        return this.__ILanguageFont.get_FontFamily()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__ILanguageFont")) {
            if ((queryResult := this.QueryInterface(ILanguageFont.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFont := ILanguageFont(outPtr)
        }

        return this.__ILanguageFont.get_FontWeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        if (!this.HasProp("__ILanguageFont")) {
            if ((queryResult := this.QueryInterface(ILanguageFont.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFont := ILanguageFont(outPtr)
        }

        return this.__ILanguageFont.get_FontStretch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__ILanguageFont")) {
            if ((queryResult := this.QueryInterface(ILanguageFont.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFont := ILanguageFont(outPtr)
        }

        return this.__ILanguageFont.get_FontStyle()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleFactor() {
        if (!this.HasProp("__ILanguageFont")) {
            if ((queryResult := this.QueryInterface(ILanguageFont.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFont := ILanguageFont(outPtr)
        }

        return this.__ILanguageFont.get_ScaleFactor()
    }

;@endregion Instance Methods
}

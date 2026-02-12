#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILanguageFontGroup.ahk
#Include .\ILanguageFontGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supplies a set of font recommendations for a given language or script for various usage cases.
 * @remarks
 * A LanguageFontGroup provides a set of font recommendations for a particular language or script. The different fonts recommended by a given LanguageFontGroup, exposed as separate LanguageFontGroup properties, correspond to different usage cases.
 * 
 * Each LanguageFontGroup property returns a [LanguageFont](languagefont.md) object, which provides the details for that particular font recommendation. Those details include a font family as well as font weight, style and stretch attributes.
 * 
 * The weight/style/stretch attributes are significant for some usage cases but not others. For instance, the font recommendations for the various UI usage categories may use fonts from the same font family but differ in weight (for example, Segoe UI Semilight for [UITextFont](languagefontgroup_uitextfont.md), but Segoe UI Regular for [UICaptionFont](languagefontgroup_uicaptionfont.md)). But for some usage cases, the weight/style/stretch attributes might always indicate a "regular" font (regular weight, normal style, normal stretch). In those cases, apps might want to apply other weight/style/stretch formatting as may be appropriate for the app scenario. See the remarks for each LanguageFontGroup property for additional information.
 * 
 * For some languages and scripts, the LanguageFontGroup may not provide a font recommendation for every usage case. For instance, fixed-width fonts are not provided in Windows for every script. See the remarks for each LanguageFontGroup property for additional information.
 * 
 * > [!NOTE]
 * > If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * 
 * **Beginning in :** The LanguageFontGroup class returns font group data to match the target operating system for which an app was developed. Therefore, if you update your Windows 8 app to Windows 8.1, the fonts used in your app may change, and you may need to make adjustments to your UI layout.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup
 * @namespace Windows.Globalization.Fonts
 * @version WindowsRuntime 1.4
 */
class LanguageFontGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILanguageFontGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILanguageFontGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [LanguageFontGroup](languagefontgroup.md) object for a given language or script.
     * @remarks
     * The *languageTag* parameter can be any valid [BCP-47](https://tools.ietf.org/html/bcp47) language tag, such as "en", "de-CH", or "zh-Hans". The only limitations are that the language tag must include an explicit script subtag or be for a language for which the script is implicitly known. (For instance, "en" is assumed to imply Latin script.) Moreover, the script must be one that Windows supports.
     * 
     * The *languageTag* parameter can also be a valid ISO 15924 script identifier, such as "Latn", "Cyrl", or "Deva". The only limitation is that the script must be one that Windows supports.
     * 
     * > [!NOTE]
     * > If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @param {HSTRING} languageTag A [BCP-47](https://tools.ietf.org/html/bcp47) language tag, or an [ISO 15924](https://www.unicode.org/iso15924/) script identifier.
     * @returns {LanguageFontGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.#ctor
     */
    static CreateLanguageFontGroup(languageTag) {
        if (!LanguageFontGroup.HasProp("__ILanguageFontGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Fonts.LanguageFontGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILanguageFontGroupFactory.IID)
            LanguageFontGroup.__ILanguageFontGroupFactory := ILanguageFontGroupFactory(factoryPtr)
        }

        return LanguageFontGroup.__ILanguageFontGroupFactory.CreateLanguageFontGroup(languageTag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a font that is recommended for typical UI body text.
     * @remarks
     * The UITextFont property provides a font recommendation for typical UI body text.
     * 
     * The font recommended for this usage case may be differentiated from other UI usage cases in font weight, style or stretch values. Those attributes are significant aspects of the font recommendation being provided.
     * 
     * A UITextFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.uitextfont
     * @type {LanguageFont} 
     */
    UITextFont {
        get => this.get_UITextFont()
    }

    /**
     * Gets a font that is recommended for special UI elements, such as headings, that are displayed at sizes somewhat larger than typical UI body text.
     * @remarks
     * The UIHeadingFont property provides a font recommendation for special UI elements, such as headings, that are displayed at sizes somewhat larger than typical UI body text.
     * 
     * The font recommended for this usage case may be differentiated from other UI usage cases in font weight, style or stretch values. Those attributes are significant aspects of the font recommendation being provided.
     * 
     * A UIHeadingFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.uiheadingfont
     * @type {LanguageFont} 
     */
    UIHeadingFont {
        get => this.get_UIHeadingFont()
    }

    /**
     * Gets a font that is recommended for special UI elements set at sizes much larger than typical UI body text.
     * @remarks
     * The UITitleFont property provides a font recommendation for special UI elements set at sizes much larger than typical UI body text—typically 36 pt. or above.
     * 
     * The font recommended for this usage case may be differentiated from other UI usage cases in font weight, style or stretch values. Those attributes are significant aspects of the font recommendation being provided.
     * 
     * A UITitleFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.uititlefont
     * @type {LanguageFont} 
     */
    UITitleFont {
        get => this.get_UITitleFont()
    }

    /**
     * Gets a font that is recommended for special UI elements, such as captions, that are displayed at sizes smaller than typical UI body text.
     * @remarks
     * The UICaptionFont property provides a font recommendation for special UI elements, such as captions, that are displayed at sizes smaller than typical UI body text.
     * 
     * The font recommended for this usage case may be differentiated from other UI usage cases in font weight, style or stretch values. Those attributes are significant aspects of the font recommendation being provided.
     * 
     * A UICaptionFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.uicaptionfont
     * @type {LanguageFont} 
     */
    UICaptionFont {
        get => this.get_UICaptionFont()
    }

    /**
     * Gets a font that is recommended for special UI elements, such as headings in notifications or other app messages, that are displayed at UI  body text size or only slightly larger yet need to be differentiated from UI body text.
     * @remarks
     * The UINotificationHeadingFont property provides a font recommendation for special UI elements, such as headings in notifications or other app messages, that are displayed at UI body text size or only slightly larger yet need to be differentiated from UI body text.
     * 
     * The font recommended for this usage case may be differentiated from other UI usage cases in font weight, style or stretch values. Those attributes are significant aspects of the font recommendation being provided.
     * 
     * A UINotificationHeadingFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.uinotificationheadingfont
     * @type {LanguageFont} 
     */
    UINotificationHeadingFont {
        get => this.get_UINotificationHeadingFont()
    }

    /**
     * Gets a font that is recommended for typical document body text following traditional style conventions.
     * @remarks
     * The TraditionalDocumentFont property provides a font recommendation for typical document body text following traditional styling conventions. These fonts can also be used in headings or other document elements.
     * 
     * The font recommended for this usage case will always be a "regular" font (regular weight, normal style, normal stretch). Apps might want to apply other weight/style/stretch formatting, as may be appropriate for the app scenario.
     * 
     * A TraditionalDocumentFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.traditionaldocumentfont
     * @type {LanguageFont} 
     */
    TraditionalDocumentFont {
        get => this.get_TraditionalDocumentFont()
    }

    /**
     * Gets a font that is recommended for typical document body text following modern style conventions.
     * @remarks
     * The ModernDocumentFont property provides a font recommendation for typical document body text following modern style conventions. These fonts can also be used in headings or other document elements.
     * 
     * The font recommended for this usage case will always be a "regular" font (regular weight, normal style, normal stretch). Apps might want to apply other weight/style/stretch formatting, as may be appropriate for the app scenario.
     * 
     * A ModernDocumentFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.moderndocumentfont
     * @type {LanguageFont} 
     */
    ModernDocumentFont {
        get => this.get_ModernDocumentFont()
    }

    /**
     * Gets a font that is recommended for use in document headings.
     * @remarks
     * The DocumentHeadingFont property provides a font recommendation for document text elements such as headings. These fonts could also be used in body text, but use for long runs of body text is not generally recommended. The recommended font may be a display face that is significantly different from the [ModernDocumentFont](languagefontgroup_moderndocumentfont.md) and [TraditionalDocumentFont](languagefontgroup_traditionaldocumentfont.md) recommendations.
     * 
     * The font recommended for this usage case will always be a "regular" font (regular weight, normal style, normal stretch). Apps might want to apply other weight/style/stretch formatting, as may be appropriate for the app scenario.
     * 
     * A DocumentHeadingFont recommendation is available for every supported language or script.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.documentheadingfont
     * @type {LanguageFont} 
     */
    DocumentHeadingFont {
        get => this.get_DocumentHeadingFont()
    }

    /**
     * Gets a font that is recommended for displaying fixed-width characters.
     * @remarks
     * The FixedWidthTextFont property provides a font recommendation for displaying fixed-width characters.
     * 
     * The font recommended for this usage case will always be a "regular" font (regular weight, normal style, normal stretch). Apps might want to apply other weight/style/stretch formatting, as may be appropriate for the app scenario.
     * 
     * A FixedWidthTextFont recommendation is available for certain languages and scripts only.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.fixedwidthtextfont
     * @type {LanguageFont} 
     */
    FixedWidthTextFont {
        get => this.get_FixedWidthTextFont()
    }

    /**
     * Gets a font that is recommended as an additional option for use in documents beyond the recommendations provided by [DocumentHeadingFont](languagefontgroup_documentheadingfont.md), [ModernDocumentFont](languagefontgroup_moderndocumentfont.md) and [TraditionalDocumentFont](languagefontgroup_traditionaldocumentfont.md).
     * @remarks
     * The DocumentAlternate1Font property provides a font recommendation as an additional option for use in documents beyond the recommendations provided by [DocumentHeadingFont](languagefontgroup_documentheadingfont.md), [ModernDocumentFont](languagefontgroup_moderndocumentfont.md) and [TraditionalDocumentFont](languagefontgroup_traditionaldocumentfont.md). These fonts could be used in body text or other text elements. The app scenario for which this is most likely to be useful is in populating a font-picker list in an authoring tool with a set of fonts designed for a particular language or script.
     * 
     * The font recommended for this usage case will always be a "regular" font (regular weight, normal style, normal stretch). Apps might want to apply other weight/style/stretch formatting, as may be appropriate for the app scenario.
     * 
     * A DocumentAlternate1Font recommendation is available for certain languages and scripts only.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.documentalternate1font
     * @type {LanguageFont} 
     */
    DocumentAlternate1Font {
        get => this.get_DocumentAlternate1Font()
    }

    /**
     * Gets a font that is recommended as an additional option for use in documents beyond the recommendations provided by [DocumentHeadingFont](languagefontgroup_documentheadingfont.md), [ModernDocumentFont](languagefontgroup_moderndocumentfont.md) and [TraditionalDocumentFont](languagefontgroup_traditionaldocumentfont.md).
     * @remarks
     * The DocumentAlternate2Font property provides a font recommendation as an additional option for use in documents beyond the recommendations provided by [DocumentHeadingFont](languagefontgroup_documentheadingfont.md), [ModernDocumentFont](languagefontgroup_moderndocumentfont.md) and [TraditionalDocumentFont](languagefontgroup_traditionaldocumentfont.md). These fonts could be used in body text or other text elements. The app scenario for which this is most likely to be useful is in populating a font-picker list in an authoring tool with a set of fonts designed for a particular language or script.
     * 
     * The font recommended for this usage case will always be a "regular" font (regular weight, normal style, normal stretch). Apps might want to apply other weight/style/stretch formatting, as may be appropriate for the app scenario.
     * 
     * A DocumentAlternate2Font recommendation is available for certain languages and scripts only.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.fonts.languagefontgroup.documentalternate2font
     * @type {LanguageFont} 
     */
    DocumentAlternate2Font {
        get => this.get_DocumentAlternate2Font()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UITextFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_UITextFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UIHeadingFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_UIHeadingFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UITitleFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_UITitleFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UICaptionFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_UICaptionFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UINotificationHeadingFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_UINotificationHeadingFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_TraditionalDocumentFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_TraditionalDocumentFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_ModernDocumentFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_ModernDocumentFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_DocumentHeadingFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_DocumentHeadingFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_FixedWidthTextFont() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_FixedWidthTextFont()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_DocumentAlternate1Font() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_DocumentAlternate1Font()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_DocumentAlternate2Font() {
        if (!this.HasProp("__ILanguageFontGroup")) {
            if ((queryResult := this.QueryInterface(ILanguageFontGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageFontGroup := ILanguageFontGroup(outPtr)
        }

        return this.__ILanguageFontGroup.get_DocumentAlternate2Font()
    }

;@endregion Instance Methods
}

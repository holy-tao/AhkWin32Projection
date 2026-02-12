#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILanguage.ahk
#Include .\ILanguageExtensionSubtags.ahk
#Include .\ILanguage2.ahk
#Include .\ILanguage3.ahk
#Include .\ILanguageStatics.ahk
#Include .\ILanguageFactory.ahk
#Include .\ILanguageStatics3.ahk
#Include .\ILanguageStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * A class that provides information related to [BCP-47](https://tools.ietf.org/html/bcp47) language tags such as the language name and the script.
 * @remarks
 * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * 
 * Initialize this class with a [BCP-47](https://tools.ietf.org/html/bcp47) language tag. For example, to work with the best current user-preferred language, pass in the top value from [Windows.System.UserProfile.GlobalizationPreferences](../windows.system.userprofile/globalizationpreferences.md):
 * 
 * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.language
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class Language extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILanguage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILanguage.IID

    /**
     * Gets the [BCP-47](https://tools.ietf.org/html/bcp47) language tag for the currently enabled keyboard layout or Input Method Editor (IME).
     * @remarks
     * This property returns a value for the currently active input method on the thread with keyboard input focus. Calling this on a background thread may not return the expected results.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.currentinputmethodlanguagetag
     * @type {HSTRING} 
     */
    static CurrentInputMethodLanguageTag {
        get => Language.get_CurrentInputMethodLanguageTag()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Determines whether a [BCP-47](https://tools.ietf.org/html/bcp47) language tag is well-formed.
     * @param {HSTRING} languageTag A [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.iswellformed
     */
    static IsWellFormed(languageTag) {
        if (!Language.HasProp("__ILanguageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Language")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILanguageStatics.IID)
            Language.__ILanguageStatics := ILanguageStatics(factoryPtr)
        }

        return Language.__ILanguageStatics.IsWellFormed(languageTag)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CurrentInputMethodLanguageTag() {
        if (!Language.HasProp("__ILanguageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Language")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILanguageStatics.IID)
            Language.__ILanguageStatics := ILanguageStatics(factoryPtr)
        }

        return Language.__ILanguageStatics.get_CurrentInputMethodLanguageTag()
    }

    /**
     * Creates a [Language](language.md) object.
     * @param {HSTRING} languageTag A [BCP-47](https://tools.ietf.org/html/bcp47) language tag. See Remarks for [Language](language.md).
     * @returns {Language} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.#ctor
     */
    static CreateLanguage(languageTag) {
        if (!Language.HasProp("__ILanguageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Language")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILanguageFactory.IID)
            Language.__ILanguageFactory := ILanguageFactory(factoryPtr)
        }

        return Language.__ILanguageFactory.CreateLanguage(languageTag)
    }

    /**
     * Retrieves a set of [Multilingual User Interface (MUI)](/windows/win32/intl/multilingual-user-interface) tags derived from one or more BCP-47 language tags.
     * @param {IIterable<HSTRING>} languageTags One or more BCP-47 language tags.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.getmuicompatiblelanguagelistfromlanguagetags
     */
    static GetMuiCompatibleLanguageListFromLanguageTags(languageTags) {
        if (!Language.HasProp("__ILanguageStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Language")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILanguageStatics3.IID)
            Language.__ILanguageStatics3 := ILanguageStatics3(factoryPtr)
        }

        return Language.__ILanguageStatics3.GetMuiCompatibleLanguageListFromLanguageTags(languageTags)
    }

    /**
     * Tries to set the normalized [BCP-47](https://tools.ietf.org/html/bcp47) language tag of this language.
     * @remarks
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @param {HSTRING} languageTag The normalized [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.trysetinputmethodlanguagetag
     */
    static TrySetInputMethodLanguageTag(languageTag) {
        if (!Language.HasProp("__ILanguageStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Language")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILanguageStatics2.IID)
            Language.__ILanguageStatics2 := ILanguageStatics2(factoryPtr)
        }

        return Language.__ILanguageStatics2.TrySetInputMethodLanguageTag(languageTag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the normalized [BCP-47](https://tools.ietf.org/html/bcp47) language tag for this language.
     * @remarks
     * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the calendar used by Calendar objects.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.languagetag
     * @type {HSTRING} 
     */
    LanguageTag {
        get => this.get_LanguageTag()
    }

    /**
     * Gets a localized string that is suitable for display to the user for identifying the language.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the name of the language in the language itself.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.nativename
     * @type {HSTRING} 
     */
    NativeName {
        get => this.get_NativeName()
    }

    /**
     * Gets the four-letter ISO 15924 script code of the language.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.script
     * @type {HSTRING} 
     */
    Script {
        get => this.get_Script()
    }

    /**
     * Gets the content layout direction (for text and UI elements) most appropriate for a language.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.layoutdirection
     * @type {Integer} 
     */
    LayoutDirection {
        get => this.get_LayoutDirection()
    }

    /**
     * Gets the three-letter abbreviation for a BCP-47 language tag. For example, "en-US" is converted to "eng".
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.abbreviatedname
     * @type {HSTRING} 
     */
    AbbreviatedName {
        get => this.get_AbbreviatedName()
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
    get_LanguageTag() {
        if (!this.HasProp("__ILanguage")) {
            if ((queryResult := this.QueryInterface(ILanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguage := ILanguage(outPtr)
        }

        return this.__ILanguage.get_LanguageTag()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__ILanguage")) {
            if ((queryResult := this.QueryInterface(ILanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguage := ILanguage(outPtr)
        }

        return this.__ILanguage.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NativeName() {
        if (!this.HasProp("__ILanguage")) {
            if ((queryResult := this.QueryInterface(ILanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguage := ILanguage(outPtr)
        }

        return this.__ILanguage.get_NativeName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Script() {
        if (!this.HasProp("__ILanguage")) {
            if ((queryResult := this.QueryInterface(ILanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguage := ILanguage(outPtr)
        }

        return this.__ILanguage.get_Script()
    }

    /**
     * Retrieves a vector of extension subtags in the current language for the given extension identified by singleton.
     * @remarks
     * If *singleton* does not exist for the current language, the returned vector is empty.
     * 
     * If *singleton* is a known system (such as "u", the Unicode extension), the returned subtags may be combined into logical units. For example, "de-DE-u-attr-co-phonebk" returns a vector with two items: "attr" and "co-phonebk". If *singleton* is unknown, each subtag is returned in a separate item.
     * @param {HSTRING} singleton A single-character subtag for the [LanguageTag](language_languagetag.md) of the current language. See [BCP-47 language tags, Extensions and the Extensions Registry](https://tools.ietf.org/html/bcp47#section-3.7).
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.language.getextensionsubtags
     */
    GetExtensionSubtags(singleton) {
        if (!this.HasProp("__ILanguageExtensionSubtags")) {
            if ((queryResult := this.QueryInterface(ILanguageExtensionSubtags.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguageExtensionSubtags := ILanguageExtensionSubtags(outPtr)
        }

        return this.__ILanguageExtensionSubtags.GetExtensionSubtags(singleton)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LayoutDirection() {
        if (!this.HasProp("__ILanguage2")) {
            if ((queryResult := this.QueryInterface(ILanguage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguage2 := ILanguage2(outPtr)
        }

        return this.__ILanguage2.get_LayoutDirection()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AbbreviatedName() {
        if (!this.HasProp("__ILanguage3")) {
            if ((queryResult := this.QueryInterface(ILanguage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanguage3 := ILanguage3(outPtr)
        }

        return this.__ILanguage3.get_AbbreviatedName()
    }

;@endregion Instance Methods
}

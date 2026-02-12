#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationLanguagesStatics2.ahk
#Include .\IApplicationLanguagesStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Specifies the language-related preferences that the app can use and maintain.
 * @remarks
 * The languages referenced in this class are represented by [BCP-47 language tags](https://tools.ietf.org/html/bcp47). Each of these is a language identifier and not a locale name, although the two structurally can be the same. As a language tag, "en-US" means American English (or the dialect of English spoken in the United States). It makes no claims about the actual location of the speakers (though many of them do reside in the US) and no other claims about conventions that are used in the US such as the measurement system or currency.
 * 
 * Example:
 * 
 * ```javascript
 * Windows.Globalization.ApplicationLanguages.PrimaryLanguageOverride = "en-US"
 * ```
 * 
 * > [!NOTE]
 * > If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * 
 * Language tags support the Unicode extensions "ca-" and "nu-". (See [Unicode Key/Type Definitions](https://www.unicode.org/reports/tr35/#Key_Type_Definitions).) Note that these extensions can affect the numeral system or calendar used by globalization objects.
 * 
 * UWP apps can be deployed using resource packages. When language resource packages are used, the packages that are installed and registered for a given user are determined by the languages in the user's language profile. As a result, not all of the languages included in the app bundle that was submitted to the Microsoft Store will necessarily be available for use at runtime. The [PrimaryLanguageOverride](applicationlanguages_primarylanguageoverride.md) property should only be set to languages that are available for the user.
 * 
 * The languages available for the app to use as an ApplicationLanguages object at runtime are limited to those languages included in the main app package manifest and the languages corresponding to language resource packages that are applicable for the user (determined by matching languages in the user's preferences), and that are installed and registered for the user. The [ApplicationLanguages.ManifestLanguages](applicationlanguages_manifestlanguages.md) property reflects language resource packages that are available for the user, and returns an appropriate set of languages that can be used for setting the [PrimaryLanguageOverride](applicationlanguages_primarylanguageoverride.md) property.
 * 
 * The [ApplicationLanguages.Languages](applicationlanguages_languages.md) property will return a very similar list to the [ManifestLanguages](applicationlanguages_manifestlanguages.md) property. It may differ in including regional language variations not listed in any package manifest; for example, "en-CA" (English (Canada)) can be returned by the [Languages](applicationlanguages_languages.md) property if the user has "en-CA" in their profile and the app supports any regional variety of English. Such user-derived regional language variations can be preferable for setting the [PrimaryLanguageOverride](applicationlanguages_primarylanguageoverride.md) property since the app will then provide globalization behaviors more appropriate for the user.
 * 
 * If a language is in the main app package but is not a match for any language in the user's preference, it is returned by the [ManifestLanguages](applicationlanguages_manifestlanguages.md) property but not the [Languages](applicationlanguages_languages.md) property. These can also be used for setting the [PrimaryLanguageOverride](applicationlanguages_primarylanguageoverride.md) property. However, since these languages are not reflected in the user's preferences, the user might not understand those languages. Such settings should be used only when chosen directly by the user.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.applicationlanguages
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ApplicationLanguages extends IInspectable {
;@region Static Properties
    /**
     * Gets or sets an override for the app's preferred language, expressed as a [BCP-47](https://tools.ietf.org/html/bcp47) language tag. This setting is persisted.
     * @remarks
     * Apps normally run with language settings determined by the system by comparing the languages supported by the app with the language preferences of the user. The settings for that system behavior can be obtained using the [ApplicationLanguages.Languages](applicationlanguages_languages.md) property. The PrimaryLanguageOverride property is used to override that behavior by setting a specific language as the first language in the Languages list.
     * 
     * The PrimaryLanguageOverride setting is persisted between sessions. It should not be set each time the app is loaded. It should only be set based on user input presented in settings UI. The property can be read at any time. If the property has never been set, it returns an empty string.
     * 
     * When you set the PrimaryLanguageOverride, this is immediately reflected in the [ApplicationLanguages.Languages](applicationlanguages_languages.md) property. However, this change may not take effect immediately on resources loaded in the app UI. To make sure the app responds to such changes, you can listen to the [QualifierValues](../windows.applicationmodel.resources.core/resourcecontext_qualifiervalues.md) property on a default resource context and take whatever actions may be needed to reload resources. Those requirements may vary depending on the UI framework used by the app, and it may be necessary to restart the app.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.applicationlanguages.primarylanguageoverride
     * @type {HSTRING} 
     */
    static PrimaryLanguageOverride {
        get => ApplicationLanguages.get_PrimaryLanguageOverride()
        set => ApplicationLanguages.put_PrimaryLanguageOverride(value)
    }

    /**
     * Gets a ranked list of current runtime language values preferred by the user.
     * @remarks
     * At runtime, the list of languages for which your app has declared support (the app manifest language list) is compared with the list of languages for which the user has declared a preference (the user profile language list). The app runtime language list is set to this intersection (if the intersection is not empty), or to just the app's default language (if the intersection is empty). For more detail, see the [App runtime language list](/windows/uwp/design/globalizing/manage-language-and-region#app-runtime-language-list) section in [Understand user profile languages and app manifest languages](/windows/uwp/design/globalizing/manage-language-and-region).
     * 
     * > [!NOTE]
     * > This property returns the same values as the language list exposed by [Windows.ApplicationModel.Resources.Core.ResourceManager.DefaultContext.Languages](../windows.applicationmodel.resources.core/resourcecontext_languages.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.applicationlanguages.languages
     * @type {IVectorView<HSTRING>} 
     */
    static Languages {
        get => ApplicationLanguages.get_Languages()
    }

    /**
     * Gets the app's declared list of supported languages.
     * @remarks
     * UWP apps can be deployed using resource packages. When language resource packages are used, the packages that are installed and registered for a given user are determined by the languages in the user's language profile. The set of languages returned by the ManifestLanguages property is limited to the languages currently available on the system for the user. Languages included in the main app package manifest will always be returned; languages from resource packages will be returned only if the language is applicable for the user (that is, is in the user's preferences) and the resource package has been installed and registered for the user at the time the property is accessed.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.applicationlanguages.manifestlanguages
     * @type {IVectorView<HSTRING>} 
     */
    static ManifestLanguages {
        get => ApplicationLanguages.get_ManifestLanguages()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the language preferences of the specified user. This API is part of support for multi-user apps (MUA).
     * @param {User} user_ The user to retrieve preferences for.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.applicationlanguages.getlanguagesforuser
     */
    static GetLanguagesForUser(user_) {
        if (!ApplicationLanguages.HasProp("__IApplicationLanguagesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ApplicationLanguages")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationLanguagesStatics2.IID)
            ApplicationLanguages.__IApplicationLanguagesStatics2 := IApplicationLanguagesStatics2(factoryPtr)
        }

        return ApplicationLanguages.__IApplicationLanguagesStatics2.GetLanguagesForUser(user_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PrimaryLanguageOverride() {
        if (!ApplicationLanguages.HasProp("__IApplicationLanguagesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ApplicationLanguages")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationLanguagesStatics.IID)
            ApplicationLanguages.__IApplicationLanguagesStatics := IApplicationLanguagesStatics(factoryPtr)
        }

        return ApplicationLanguages.__IApplicationLanguagesStatics.get_PrimaryLanguageOverride()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    static put_PrimaryLanguageOverride(value) {
        if (!ApplicationLanguages.HasProp("__IApplicationLanguagesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ApplicationLanguages")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationLanguagesStatics.IID)
            ApplicationLanguages.__IApplicationLanguagesStatics := IApplicationLanguagesStatics(factoryPtr)
        }

        return ApplicationLanguages.__IApplicationLanguagesStatics.put_PrimaryLanguageOverride(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_Languages() {
        if (!ApplicationLanguages.HasProp("__IApplicationLanguagesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ApplicationLanguages")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationLanguagesStatics.IID)
            ApplicationLanguages.__IApplicationLanguagesStatics := IApplicationLanguagesStatics(factoryPtr)
        }

        return ApplicationLanguages.__IApplicationLanguagesStatics.get_Languages()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_ManifestLanguages() {
        if (!ApplicationLanguages.HasProp("__IApplicationLanguagesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ApplicationLanguages")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationLanguagesStatics.IID)
            ApplicationLanguages.__IApplicationLanguagesStatics := IApplicationLanguagesStatics(factoryPtr)
        }

        return ApplicationLanguages.__IApplicationLanguagesStatics.get_ManifestLanguages()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

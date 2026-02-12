#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INumeralSystemTranslator.ahk
#Include .\INumeralSystemTranslatorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Translates digits of the Latin numerical system into digits of another numerical system.
 * @remarks
 * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.numeralsystemtranslator
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class NumeralSystemTranslator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INumeralSystemTranslator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INumeralSystemTranslator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [NumeralSystemTranslator](numeralsystemtranslator.md) object initialized by a language list.
     * @remarks
     * This constructor creates an object initialized to use the default numeral system of the first language in *languages* which is known to the system. If none are known, it uses the current runtime language preferred by the user.
     * 
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @param {IIterable<HSTRING>} languages A list of [BCP-47](https://tools.ietf.org/html/bcp47) language tags, in priority order, representing the choice of languages. They must all be well-formed according to [Windows.Globalization.Language.isWellFormed](../windows.globalization/language_iswellformed_1733554260.md).
     * @returns {NumeralSystemTranslator} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.numeralsystemtranslator.#ctor
     */
    static Create(languages) {
        if (!NumeralSystemTranslator.HasProp("__INumeralSystemTranslatorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.NumeralSystemTranslator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemTranslatorFactory.IID)
            NumeralSystemTranslator.__INumeralSystemTranslatorFactory := INumeralSystemTranslatorFactory(factoryPtr)
        }

        return NumeralSystemTranslator.__INumeralSystemTranslatorFactory.Create(languages)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [BCP-47](https://tools.ietf.org/html/bcp47) language tag(s) used to initialize this [NumeralSystemTranslator](numeralsystemtranslator.md) object.
     * @remarks
     * If your app passes language tags used in this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.numeralsystemtranslator.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets the language used to determine the numeral system when this object was initialized.
     * @remarks
     * If your app passes language tags from this class to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.numeralsystemtranslator.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Gets or sets the numeral system that Latin digits will be converted to on calls to [TranslateNumerals](numeralsystemtranslator_translatenumerals_1419744509.md).
     * @remarks
     * > [!NOTE]
     * > For Arabic numeral systems ("Arab" and "ArabExt" or any numeral systems which use a combination of those characters):+ A period (.) immediately before a Latin digit is converted to the Arabic Decimal Separator (u+66b).
     * + A comma (,) immediately before a Latin digit is converted to Arabic Thousand Separator (u+66c).
     * + A percent (%) adjacent to a Latin digit is converted to Arabic Per Cent Symbol (u+66a).
     * + A permille (u+2030) adjacent to a Latin digit is converted to Arabic Per Mille Symbol (u+609).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.numeralsystemtranslator.numeralsystem
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [NumeralSystemTranslator](numeralsystemtranslator.md) object initialized by the list of current runtime language values preferred by the user.
     * @remarks
     * This default constructor is equivalent to the use of [NumeralSystemTranslator](numeralsystemtranslator_numeralsystemtranslator_1181929246.md) ([Windows.Globalization.ApplicationLanguages.languages](../windows.globalization/applicationlanguages_languages.md)).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.NumeralSystemTranslator")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        if (!this.HasProp("__INumeralSystemTranslator")) {
            if ((queryResult := this.QueryInterface(INumeralSystemTranslator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumeralSystemTranslator := INumeralSystemTranslator(outPtr)
        }

        return this.__INumeralSystemTranslator.get_Languages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        if (!this.HasProp("__INumeralSystemTranslator")) {
            if ((queryResult := this.QueryInterface(INumeralSystemTranslator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumeralSystemTranslator := INumeralSystemTranslator(outPtr)
        }

        return this.__INumeralSystemTranslator.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumeralSystem() {
        if (!this.HasProp("__INumeralSystemTranslator")) {
            if ((queryResult := this.QueryInterface(INumeralSystemTranslator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumeralSystemTranslator := INumeralSystemTranslator(outPtr)
        }

        return this.__INumeralSystemTranslator.get_NumeralSystem()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NumeralSystem(value) {
        if (!this.HasProp("__INumeralSystemTranslator")) {
            if ((queryResult := this.QueryInterface(INumeralSystemTranslator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumeralSystemTranslator := INumeralSystemTranslator(outPtr)
        }

        return this.__INumeralSystemTranslator.put_NumeralSystem(value)
    }

    /**
     * Converts a string of characters containing Latin digits to a string containing the corresponding digits of [NumeralSystem](numeralsystemtranslator_numeralsystem.md).
     * @remarks
     * Characters in *value* that are not Latin digits are not converted, but pass through unchanged. If *value* is **null** (representing an empty string) the result is **null**. If [NumeralSystem](numeralsystemtranslator_numeralsystem.md) is "Latn", *value* is passed through unchanged.
     * 
     * > [!NOTE]
     * > For Arabic numeral systems ("Arab" and "ArabExt" or any numeral systems which use a combination of those characters):+ A period (.) immediately before a Latin digit is converted to the Arabic Decimal Separator (u+66b).
     * + A comma (,) immediately before a Latin digit is converted to Arabic Thousand Separator (u+66c).
     * + A percent (%) adjacent to a Latin digit is converted to Arabic Per Cent Symbol (u+66a).
     * + A permille (u+2030) adjacent to a Latin digit is converted to Arabic Per Mille Symbol (u+609).
     * @param {HSTRING} value A string of characters containing Latin digits to be converted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.numeralsystemtranslator.translatenumerals
     */
    TranslateNumerals(value) {
        if (!this.HasProp("__INumeralSystemTranslator")) {
            if ((queryResult := this.QueryInterface(INumeralSystemTranslator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumeralSystemTranslator := INumeralSystemTranslator(outPtr)
        }

        return this.__INumeralSystemTranslator.TranslateNumerals(value)
    }

;@endregion Instance Methods
}

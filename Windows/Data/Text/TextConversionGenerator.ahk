#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextConversionGenerator.ahk
#Include .\ITextConversionGeneratorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Converts input phonetic characters into a collection of corresponding ideographic characters (Chinese characters).
  * 
  * Input of Japanese and Chinese Pinyin is supported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.textconversiongenerator
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class TextConversionGenerator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextConversionGenerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextConversionGenerator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [TextConversionGenerator](textconversiongenerator.md) object based on a specific [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @param {HSTRING} languageTag The [BCP-47](https://tools.ietf.org/html/bcp47) language tag of the language in which the words are to be projected. Japanese ("ja") and Simplified Chinese ("zh-Hans") are supported.
     * @returns {TextConversionGenerator} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textconversiongenerator.#ctor
     */
    static Create(languageTag) {
        if (!TextConversionGenerator.HasProp("__ITextConversionGeneratorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.TextConversionGenerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConversionGeneratorFactory.IID)
            TextConversionGenerator.__ITextConversionGeneratorFactory := ITextConversionGeneratorFactory(factoryPtr)
        }

        return TextConversionGenerator.__ITextConversionGeneratorFactory.Create(languageTag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language tag of the successfully created [TextConversionGenerator](textconversiongenerator.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textconversiongenerator.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Determines if the language tag specified is available for conversions, but is not installed on the user's device.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textconversiongenerator.languageavailablebutnotinstalled
     * @type {Boolean} 
     */
    LanguageAvailableButNotInstalled {
        get => this.get_LanguageAvailableButNotInstalled()
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
    get_ResolvedLanguage() {
        if (!this.HasProp("__ITextConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextConversionGenerator := ITextConversionGenerator(outPtr)
        }

        return this.__ITextConversionGenerator.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LanguageAvailableButNotInstalled() {
        if (!this.HasProp("__ITextConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextConversionGenerator := ITextConversionGenerator(outPtr)
        }

        return this.__ITextConversionGenerator.get_LanguageAvailableButNotInstalled()
    }

    /**
     * Asynchronously gets a list of candidate words, up to a maximum count, based on the provided phonetic characters.
     * @param {HSTRING} input_ The phonetic characters of the words to be returned.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textconversiongenerator.getcandidatesasync
     */
    GetCandidatesAsync(input_) {
        if (!this.HasProp("__ITextConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextConversionGenerator := ITextConversionGenerator(outPtr)
        }

        return this.__ITextConversionGenerator.GetCandidatesAsync(input_)
    }

    /**
     * Asynchronously gets a list of candidate words based on the provided phonetic characters.
     * @param {HSTRING} input_ The phonetic characters of the words to be returned.
     * @param {Integer} maxCandidates 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textconversiongenerator.getcandidatesasync
     */
    GetCandidatesWithMaxCountAsync(input_, maxCandidates) {
        if (!this.HasProp("__ITextConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextConversionGenerator := ITextConversionGenerator(outPtr)
        }

        return this.__ITextConversionGenerator.GetCandidatesWithMaxCountAsync(input_, maxCandidates)
    }

;@endregion Instance Methods
}

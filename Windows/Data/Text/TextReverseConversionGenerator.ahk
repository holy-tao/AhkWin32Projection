#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextReverseConversionGenerator.ahk
#Include .\ITextReverseConversionGenerator2.ahk
#Include .\ITextReverseConversionGeneratorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Reverse-converts a Japanese string which is mix of phonetic and ideographic characters, to a string of phonetic characters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.textreverseconversiongenerator
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class TextReverseConversionGenerator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextReverseConversionGenerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextReverseConversionGenerator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [TextReverseConversionGenerator](textreverseconversiongenerator.md) object based on a specific [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @param {HSTRING} languageTag The [BCP-47](https://tools.ietf.org/html/bcp47) language tag of the language in which the words are to be reverse-converted. Only Japanese ("ja") is supported.
     * @returns {TextReverseConversionGenerator} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textreverseconversiongenerator.#ctor
     */
    static Create(languageTag) {
        if (!TextReverseConversionGenerator.HasProp("__ITextReverseConversionGeneratorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.TextReverseConversionGenerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextReverseConversionGeneratorFactory.IID)
            TextReverseConversionGenerator.__ITextReverseConversionGeneratorFactory := ITextReverseConversionGeneratorFactory(factoryPtr)
        }

        return TextReverseConversionGenerator.__ITextReverseConversionGeneratorFactory.Create(languageTag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language tag of the successfully created [TextReverseConversionGenerator](textreverseconversiongenerator.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textreverseconversiongenerator.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Determines if the language tag specified is available for reverse conversions, but is not installed on the user's device.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textreverseconversiongenerator.languageavailablebutnotinstalled
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
        if (!this.HasProp("__ITextReverseConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextReverseConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextReverseConversionGenerator := ITextReverseConversionGenerator(outPtr)
        }

        return this.__ITextReverseConversionGenerator.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LanguageAvailableButNotInstalled() {
        if (!this.HasProp("__ITextReverseConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextReverseConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextReverseConversionGenerator := ITextReverseConversionGenerator(outPtr)
        }

        return this.__ITextReverseConversionGenerator.get_LanguageAvailableButNotInstalled()
    }

    /**
     * Asynchronously reverse-converts a string which contains ideographic characters to a phonetic expression.
     * @param {HSTRING} input_ The string containing ideographic characters to be reverse-converted.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textreverseconversiongenerator.convertbackasync
     */
    ConvertBackAsync(input_) {
        if (!this.HasProp("__ITextReverseConversionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextReverseConversionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextReverseConversionGenerator := ITextReverseConversionGenerator(outPtr)
        }

        return this.__ITextReverseConversionGenerator.ConvertBackAsync(input_)
    }

    /**
     * Returns a set of phonemes representing the given input string. This method is primarily intended for use in sorting data in the Japanese language. Phonetic reading is important for Japanese data handling, especially to sort names in proper phonetic order rather than in character code point order.
     * 
     * Proper names in Japanese that sound the same when pronounced can be spelled in different ways in Kanji. The point of sorting by phonemes is to sort all of the different Kanji spellings of a given proper name to be next to each other in a sorted list, rather than sorting them by character code point and having the various spellings not sorting next to each other.
     * @remarks
     * Each [TextPhoneme](textphoneme.md) in the result list has the following properties.
     * 
     * + The [DisplayText](textphoneme_displaytext.md) always matches a segment of the input string.
     * + For Japanese input, the [ReadingText](textphoneme_readingtext.md) is the Hiragana-based reading of the display text.
     * + If the system cannot generate a reading, then it reports the [ReadingText](textphoneme_readingtext.md) as being the same as the [DisplayText](textphoneme_displaytext.md).
     * @param {HSTRING} input_ A string containing words in Japanese.
     * @returns {IAsyncOperation<IVectorView<TextPhoneme>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textreverseconversiongenerator.getphonemesasync
     */
    GetPhonemesAsync(input_) {
        if (!this.HasProp("__ITextReverseConversionGenerator2")) {
            if ((queryResult := this.QueryInterface(ITextReverseConversionGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextReverseConversionGenerator2 := ITextReverseConversionGenerator2(outPtr)
        }

        return this.__ITextReverseConversionGenerator2.GetPhonemesAsync(input_)
    }

;@endregion Instance Methods
}

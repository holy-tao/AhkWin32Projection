#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextPredictionGenerator.ahk
#Include .\ITextPredictionGenerator2.ahk
#Include .\ITextPredictionGeneratorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Predicts Japanese words based on a phonetic characters prefix.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class TextPredictionGenerator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextPredictionGenerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextPredictionGenerator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [TextPredictionGenerator](textpredictiongenerator.md) object based on a specific [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @param {HSTRING} languageTag The [BCP-47](https://tools.ietf.org/html/bcp47) language tag of the language in which the words are to be projected. Only Japanese ("ja") is supported.
     * @returns {TextPredictionGenerator} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.#ctor
     */
    static Create(languageTag) {
        if (!TextPredictionGenerator.HasProp("__ITextPredictionGeneratorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.TextPredictionGenerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextPredictionGeneratorFactory.IID)
            TextPredictionGenerator.__ITextPredictionGeneratorFactory := ITextPredictionGeneratorFactory(factoryPtr)
        }

        return TextPredictionGenerator.__ITextPredictionGeneratorFactory.Create(languageTag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language tag of the successfully created [TextPredictionGenerator](textpredictiongenerator.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Determines if the language tag specified is available for generating predictions, but is not installed on the user's device.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.languageavailablebutnotinstalled
     * @type {Boolean} 
     */
    LanguageAvailableButNotInstalled {
        get => this.get_LanguageAvailableButNotInstalled()
    }

    /**
     * Gets or sets the input scope for text prediction.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.inputscope
     * @type {Integer} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
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
        if (!this.HasProp("__ITextPredictionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator := ITextPredictionGenerator(outPtr)
        }

        return this.__ITextPredictionGenerator.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LanguageAvailableButNotInstalled() {
        if (!this.HasProp("__ITextPredictionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator := ITextPredictionGenerator(outPtr)
        }

        return this.__ITextPredictionGenerator.get_LanguageAvailableButNotInstalled()
    }

    /**
     * Asynchronously retrieves a list of candidate words, up to a maximum count, based on the provided phonetic characters prefix.
     * @param {HSTRING} input_ The beginning phonetic characters of the words to be returned.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.getcandidatesasync
     */
    GetCandidatesAsync(input_) {
        if (!this.HasProp("__ITextPredictionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator := ITextPredictionGenerator(outPtr)
        }

        return this.__ITextPredictionGenerator.GetCandidatesAsync(input_)
    }

    /**
     * Asynchronously retrieves a list of candidate words based on the provided phonetic characters prefix.
     * @param {HSTRING} input_ The beginning phonetic characters of the words to be returned.
     * @param {Integer} maxCandidates 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.getcandidatesasync
     */
    GetCandidatesWithMaxCountAsync(input_, maxCandidates) {
        if (!this.HasProp("__ITextPredictionGenerator")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator := ITextPredictionGenerator(outPtr)
        }

        return this.__ITextPredictionGenerator.GetCandidatesWithMaxCountAsync(input_, maxCandidates)
    }

    /**
     * Asynchronously retrieves a list of candidate words based on the provided phonetic characters prefix.
     * @param {HSTRING} input_ The beginning phonetic characters of the words to be returned.
     * @param {Integer} maxCandidates 
     * @param {Integer} predictionOptions 
     * @param {IIterable<HSTRING>} previousStrings 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.getcandidatesasync
     */
    GetCandidatesWithParametersAsync(input_, maxCandidates, predictionOptions, previousStrings) {
        if (!this.HasProp("__ITextPredictionGenerator2")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator2 := ITextPredictionGenerator2(outPtr)
        }

        return this.__ITextPredictionGenerator2.GetCandidatesWithParametersAsync(input_, maxCandidates, predictionOptions, previousStrings)
    }

    /**
     * Asynchronously retrieves a collection of strings containing next-word-prediction candidates.
     * @param {Integer} maxCandidates The maximum number of candidates to return.
     * @param {IIterable<HSTRING>} previousStrings A collection of previously input words (to assist text prediction).
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictiongenerator.getnextwordcandidatesasync
     */
    GetNextWordCandidatesAsync(maxCandidates, previousStrings) {
        if (!this.HasProp("__ITextPredictionGenerator2")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator2 := ITextPredictionGenerator2(outPtr)
        }

        return this.__ITextPredictionGenerator2.GetNextWordCandidatesAsync(maxCandidates, previousStrings)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputScope() {
        if (!this.HasProp("__ITextPredictionGenerator2")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator2 := ITextPredictionGenerator2(outPtr)
        }

        return this.__ITextPredictionGenerator2.get_InputScope()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        if (!this.HasProp("__ITextPredictionGenerator2")) {
            if ((queryResult := this.QueryInterface(ITextPredictionGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPredictionGenerator2 := ITextPredictionGenerator2(outPtr)
        }

        return this.__ITextPredictionGenerator2.put_InputScope(value)
    }

;@endregion Instance Methods
}

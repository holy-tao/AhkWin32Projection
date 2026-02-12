#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISelectableWordsSegmenter.ahk
#Include .\ISelectableWordsSegmenterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A segmenter class that is able to segment provided text into units appropriate for selecting text by words.
  * 
  * The language supplied when this object is constructed is matched against the languages with word breakers on the system, and the best word segmentation rules available are used. The language need not be one of the app's supported languages. If there are no supported language rules available specifically for that language, the language-neutral rules are used (an implementation of [Unicode Standard Annex #29 Unicode Text Segmentation](https://www.unicode.org/reports/tr29/)), and the [ResolvedLanguage](selectablewordssegmenter_resolvedlanguage.md) property is set to "und" (undetermined language).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordssegmenter
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class SelectableWordsSegmenter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectableWordsSegmenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectableWordsSegmenter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [SelectableWordsSegmenter](selectablewordssegmenter.md) object. See the introduction in [SelectableWordsSegmenter](selectablewordssegmenter.md) for a description of how the language supplied to this constructor is used.
     * @param {HSTRING} language_ A [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @returns {SelectableWordsSegmenter} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordssegmenter.#ctor
     */
    static CreateWithLanguage(language_) {
        if (!SelectableWordsSegmenter.HasProp("__ISelectableWordsSegmenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.SelectableWordsSegmenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISelectableWordsSegmenterFactory.IID)
            SelectableWordsSegmenter.__ISelectableWordsSegmenterFactory := ISelectableWordsSegmenterFactory(factoryPtr)
        }

        return SelectableWordsSegmenter.__ISelectableWordsSegmenterFactory.CreateWithLanguage(language_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language of the rules used by this [SelectableWordsSegmenter](selectablewordssegmenter.md) object.
     * 
     * "und" (undetermined) is returned if we are using language-neutral rules.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordssegmenter.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
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
        if (!this.HasProp("__ISelectableWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(ISelectableWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectableWordsSegmenter := ISelectableWordsSegmenter(outPtr)
        }

        return this.__ISelectableWordsSegmenter.get_ResolvedLanguage()
    }

    /**
     * Determines and returns the selectable word or word stem which contains or follows a specified index into the provided text.
     * @remarks
     * Note that some languages do not use spaces (such as Japanese or Chinese) and some languages may return multiple word stems for compound words (such as German).
     * @param {HSTRING} text Provided text in which a word or word stem is to be selected.
     * @param {Integer} startIndex A zero-based index into *text*. It must be less than the length of *text*.
     * @returns {SelectableWordSegment} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordssegmenter.gettokenat
     */
    GetTokenAt(text, startIndex) {
        if (!this.HasProp("__ISelectableWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(ISelectableWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectableWordsSegmenter := ISelectableWordsSegmenter(outPtr)
        }

        return this.__ISelectableWordsSegmenter.GetTokenAt(text, startIndex)
    }

    /**
     * Determines and returns all of the selectable words or word stems in the provided text.
     * @remarks
     * Note that some languages do not use spaces (such as Japanese or Chinese) and some languages may return multiple word stems for compound words (such as German).
     * @param {HSTRING} text Provided text containing words or word stems to be selected.
     * @returns {IVectorView<SelectableWordSegment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordssegmenter.gettokens
     */
    GetTokens(text) {
        if (!this.HasProp("__ISelectableWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(ISelectableWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectableWordsSegmenter := ISelectableWordsSegmenter(outPtr)
        }

        return this.__ISelectableWordsSegmenter.GetTokens(text)
    }

    /**
     * Calls the provided handler with two iterators that iterate through the selectable words prior to and following a given index into the provided text.
     * @remarks
     * The iterators in [SelectableWordSegmentsTokenizingHandler](selectablewordsegmentstokenizinghandler.md) are lazy and evaluate small chunks of text at a time.
     * 
     * The handler is called at most once per call to Tokenize. The handler is not called if there are no selectable words in *text*.
     * @param {HSTRING} text Provided text containing words to be selected.
     * @param {Integer} startIndex A zero-based index into *text*. It must be less than the length of *text*.
     * @param {SelectableWordSegmentsTokenizingHandler} handler The function that receives the iterators.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordssegmenter.tokenize
     */
    Tokenize(text, startIndex, handler) {
        if (!this.HasProp("__ISelectableWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(ISelectableWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectableWordsSegmenter := ISelectableWordsSegmenter(outPtr)
        }

        return this.__ISelectableWordsSegmenter.Tokenize(text, startIndex, handler)
    }

;@endregion Instance Methods
}

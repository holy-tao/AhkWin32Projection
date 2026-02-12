#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWordsSegmenter.ahk
#Include .\IWordsSegmenterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A segmenter class that is able to segment provided text into words or word stems (depending on the particular language).
 * @remarks
 * For languages that do not use spaces between words (such as Japanese, Chinese, Korean, and Thai), use of a segmenter is the only way to obtain individual words for textual processing scenarios such as keyword search.
 * 
 * The language supplied when this object is constructed is matched against the languages with word breakers on the system, and the best word segmentation rules available are used. The language need not be one of the app's supported languages. If there are no supported language rules available specifically for that language, the language-neutral rules are used (an implementation of [Unicode Standard Annex #29 Unicode Text Segmentation](https://www.unicode.org/reports/tr29/)), and the [ResolvedLanguage](selectablewordssegmenter_resolvedlanguage.md) property is set to "und" (undetermined language).
 * 
 * For keyword search scenarios, it is always recommended to request a segmenter in the language of the text contents. 
 * 
 * For spellchecking scenarios, some language segmenters (such as German) may return multiple word stem segments for a single compound word. In contrast, the spellchecking APIs may expect the words to be kept together as a single word. For such languages, you may choose to force language-neutral segmenting rules by explicitly requesting the "und" (undetermined language) segmenter.  However, doing so will greatly reduce the breaking quality of non-spaced languages. Therefore, it is recommended that you use the [Language.Script](/uwp/api/windows.globalization.language.script) API to determine if the content language uses one of the following non-spaced scripts:
 * 
 * 
 * | Script | Language |
 * |--------|----------|
 * |Bopo|Bopomofo|
 * |Brah|Brahmi|
 * |Egyp|Egyptian Hieroglyphs|
 * |Goth|Gothic|
 * |Hang|Hangul|
 * |Hang|Hiragana|
 * |Hang|Old Hangul|
 * |Hani|Han|
 * |Ital|Old Italic|
 * |Java|Javanese|
 * |Kana|Katakana|
 * |Khar|Kharoshthi|
 * |Khmr|Khmer|
 * |Laoo|Lao|
 * |Lisu|Lisu|
 * |Mymr|Myanmar|
 * |Talu|New Tai Lue|
 * |Thai|Thai|
 * |Tibt|Tibetan|
 * |Xsux|Cuneiform|
 * |Yiii|Yi|        
 * 
 * If none of these scripts are found, then it should be safe to use "und" for spellchecking scenario segmentation.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordssegmenter
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class WordsSegmenter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWordsSegmenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWordsSegmenter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [WordsSegmenter](wordssegmenter.md) object. See the introduction in [WordsSegmenter](wordssegmenter.md) for a description of how the language supplied to this constructor is used.
     * @param {HSTRING} language_ A [BCP-47](https://tools.ietf.org/html/bcp47) language tag.
     * @returns {WordsSegmenter} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordssegmenter.#ctor
     */
    static CreateWithLanguage(language_) {
        if (!WordsSegmenter.HasProp("__IWordsSegmenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.WordsSegmenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWordsSegmenterFactory.IID)
            WordsSegmenter.__IWordsSegmenterFactory := IWordsSegmenterFactory(factoryPtr)
        }

        return WordsSegmenter.__IWordsSegmenterFactory.CreateWithLanguage(language_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language of the rules used by this [WordsSegmenter](wordssegmenter.md) object.
     * 
     * "und" (undetermined) is returned if we are using language-neutral rules.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordssegmenter.resolvedlanguage
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
        if (!this.HasProp("__IWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(IWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordsSegmenter := IWordsSegmenter(outPtr)
        }

        return this.__IWordsSegmenter.get_ResolvedLanguage()
    }

    /**
     * Determines and returns the word or word stem which contains or follows a specified index into the provided text.
     * @remarks
     * Note that some languages do not use spaces (such as Japanese or Chinese) and some languages may return multiple word stems for compound words (such as German).
     * @param {HSTRING} text Provided text from which the word or word stem is to be returned.
     * @param {Integer} startIndex A zero-based index into *text*. It must be less than the length of *text*.
     * @returns {WordSegment} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordssegmenter.gettokenat
     */
    GetTokenAt(text, startIndex) {
        if (!this.HasProp("__IWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(IWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordsSegmenter := IWordsSegmenter(outPtr)
        }

        return this.__IWordsSegmenter.GetTokenAt(text, startIndex)
    }

    /**
     * Determines and returns all of the words or word stems in the provided text.
     * @remarks
     * Note that some languages do not use spaces (such as Japanese or Chinese) and some languages may return multiple word stems for compound words (such as German).
     * @param {HSTRING} text Provided text containing words or word stems to be returned.
     * @returns {IVectorView<WordSegment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordssegmenter.gettokens
     */
    GetTokens(text) {
        if (!this.HasProp("__IWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(IWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordsSegmenter := IWordsSegmenter(outPtr)
        }

        return this.__IWordsSegmenter.GetTokens(text)
    }

    /**
     * Calls the provided handler with two iterators that iterate through the words prior to and following a given index into the provided text.
     * @remarks
     * The iterators in [WordSegmentsTokenizingHandler](wordsegmentstokenizinghandler.md) are lazy and evaluate small chunks of text at a time.
     * 
     * The handler is called at most once per call to Tokenize. The handler is not called if there are no selectable words in *text*.
     * @param {HSTRING} text Provided text containing words to be returned.
     * @param {Integer} startIndex A zero-based index into *text*. It must be less than the length of *text*.
     * @param {WordSegmentsTokenizingHandler} handler The function that receives the iterators.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordssegmenter.tokenize
     */
    Tokenize(text, startIndex, handler) {
        if (!this.HasProp("__IWordsSegmenter")) {
            if ((queryResult := this.QueryInterface(IWordsSegmenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordsSegmenter := IWordsSegmenter(outPtr)
        }

        return this.__IWordsSegmenter.Tokenize(text, startIndex, handler)
    }

;@endregion Instance Methods
}

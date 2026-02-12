#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJapanesePhoneticAnalyzerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Reads a Japanese string that is a combination of Kanji characters and Hiragana characters, and returns a collection of proper readings from the string with word breaks.
 * @remarks
 * Analyzing Japanese strings and generating readings and word breaks is not a straightforward task, as one Kanji character can be read in multiple ways depending on context. Japanese strings also don't have explicit word breaks such as whitespace. JapanesePhoneticAnalyzer breaks an input string into an [IVectorView](/previous-versions/br224594(v=vs.85)) of [JapanesePhoneme](japanesephoneme.md) objects.
 * 
 * Each [JapanesePhoneme](japanesephoneme.md) object represents a single Japanese word, and has properties for its display, its "reading" (the pronunciation of the display string, represented by a sequence of Hiragana characters), and whether or not it is the start of a phrase.
 * 
 * **Example**
 * 
 * When the method [JapanesePhoneticAnalyzer.GetWords(input)](japanesephoneticanalyzer_getwords_1967945274.md) analyzes the string "今日はいい天気です", it returns a vector of [JapanesePhoneme](japanesephoneme.md) with these properties:
 * 
 * | | 0 | 1 | 2 | 3 | 4 |
 * |---|---|---|---|---|---|
 * | [DisplayText](japanesephoneme_displaytext.md) | 今日 | は | いい | 天気 | です |
 * | [YomiText](japanesephoneme_yomitext.md) (reading) | きょう | は | いい | てんき | です |
 * | [IsPhraseStart](japanesephoneme_isphrasestart.md) | true | false | true | true | false |
 * 
 * You can also use the method overload [JapanesePhoneticAnalyzer.GetWords(input, monoRuby)](japanesephoneticanalyzer_getwords_1758641726.md) to specify the use of a word-breaking strategy called "Mono Ruby", which more aggressively attempts to break multi-Kanji words into multiple Kanji words. In the above example, using Mono Ruby, "天気" is further broken into "天" and "気". However, "今日" still remains unbroken due to the nature of the Japanese language.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneticanalyzer
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class JapanesePhoneticAnalyzer extends IInspectable {
;@region Static Methods
    /**
     * Reads a Japanese string that is a combination of Kanji characters and Hiragana characters, and returns a collection of proper readings from the string with word breaks. Optionally uses the "Mono Ruby" strategy in breaking multi-Kanji words into multiple Kanji words.
     * @param {HSTRING} input_ A Japanese string that is a combination of Kanji characters and Hiragana characters.
     * 
     * The maximum length of this string is 100 characters.
     * @returns {IVectorView<JapanesePhoneme>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneticanalyzer.getwords
     */
    static GetWords(input_) {
        if (!JapanesePhoneticAnalyzer.HasProp("__IJapanesePhoneticAnalyzerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.JapanesePhoneticAnalyzer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJapanesePhoneticAnalyzerStatics.IID)
            JapanesePhoneticAnalyzer.__IJapanesePhoneticAnalyzerStatics := IJapanesePhoneticAnalyzerStatics(factoryPtr)
        }

        return JapanesePhoneticAnalyzer.__IJapanesePhoneticAnalyzerStatics.GetWords(input_)
    }

    /**
     * Reads a Japanese string that is a combination of Kanji characters and Hiragana characters, and returns a collection of proper readings from the string with word breaks.
     * @param {HSTRING} input_ A Japanese string that is a combination of Kanji characters and Hiragana characters.
     * 
     * The maximum length of this string is 100 characters.
     * @param {Boolean} monoRuby 
     * @returns {IVectorView<JapanesePhoneme>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneticanalyzer.getwords
     */
    static GetWordsWithMonoRubyOption(input_, monoRuby) {
        if (!JapanesePhoneticAnalyzer.HasProp("__IJapanesePhoneticAnalyzerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.JapanesePhoneticAnalyzer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJapanesePhoneticAnalyzerStatics.IID)
            JapanesePhoneticAnalyzer.__IJapanesePhoneticAnalyzerStatics := IJapanesePhoneticAnalyzerStatics(factoryPtr)
        }

        return JapanesePhoneticAnalyzer.__IJapanesePhoneticAnalyzerStatics.GetWordsWithMonoRubyOption(input_, monoRuby)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

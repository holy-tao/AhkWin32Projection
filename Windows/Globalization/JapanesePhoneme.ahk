#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJapanesePhoneme.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a single Japanese word (a "reading") that has been extracted from a Japanese string by [JapanesePhoneticAnalyzer](japanesephoneticanalyzer.md).
 * @remarks
 * JapanesePhoneme objects are created by calls to [JapanesePhoneticAnalyzer.GetWords(String)](japanesephoneticanalyzer_getwords_1967945274.md) or [JapanesePhoneticAnalyzer.GetWords(String, Boolean)](japanesephoneticanalyzer_getwords_1758641726.md).
 * 
 * See the remarks for [JapanesePhoneticAnalyzer](japanesephoneticanalyzer.md) for a more complete discussion and example.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneme
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class JapanesePhoneme extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJapanesePhoneme

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJapanesePhoneme.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text to display for this Japanese word.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneme.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * Gets the "reading" (the pronunciation of [DisplayText](japanesephoneme_displaytext.md)) for this Japanese word.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneme.yomitext
     * @type {HSTRING} 
     */
    YomiText {
        get => this.get_YomiText()
    }

    /**
     * Gets a [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) that indicates if this Japanese word is the start of a phrase.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.japanesephoneme.isphrasestart
     * @type {Boolean} 
     */
    IsPhraseStart {
        get => this.get_IsPhraseStart()
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
    get_DisplayText() {
        if (!this.HasProp("__IJapanesePhoneme")) {
            if ((queryResult := this.QueryInterface(IJapanesePhoneme.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJapanesePhoneme := IJapanesePhoneme(outPtr)
        }

        return this.__IJapanesePhoneme.get_DisplayText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YomiText() {
        if (!this.HasProp("__IJapanesePhoneme")) {
            if ((queryResult := this.QueryInterface(IJapanesePhoneme.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJapanesePhoneme := IJapanesePhoneme(outPtr)
        }

        return this.__IJapanesePhoneme.get_YomiText()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPhraseStart() {
        if (!this.HasProp("__IJapanesePhoneme")) {
            if ((queryResult := this.QueryInterface(IJapanesePhoneme.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJapanesePhoneme := IJapanesePhoneme(outPtr)
        }

        return this.__IJapanesePhoneme.get_IsPhraseStart()
    }

;@endregion Instance Methods
}

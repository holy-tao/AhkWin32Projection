#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWordSegment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a word from your provided text.
  * 
  * Words in this class do not include trailing whitespace or punctuation. This class can also expose alternate forms of words, and normalized numbers, currencies, dates, and times.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordsegment
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class WordSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWordSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWordSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text of the word identified by this [WordSegment](wordsegment.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordsegment.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets the [TextSegment](textsegment.md) that identifies the source text's sub-string that is a word.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordsegment.sourcetextsegment
     * @type {TextSegment} 
     */
    SourceTextSegment {
        get => this.get_SourceTextSegment()
    }

    /**
     * Gets the alternate forms (if any) associated with the current word.
     * 
     * Alternate forms are loosely associated with the current word. An alternate form may encompass less text, more text, or the same text as the original word.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.wordsegment.alternateforms
     * @type {IVectorView<AlternateWordForm>} 
     */
    AlternateForms {
        get => this.get_AlternateForms()
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
    get_Text() {
        if (!this.HasProp("__IWordSegment")) {
            if ((queryResult := this.QueryInterface(IWordSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordSegment := IWordSegment(outPtr)
        }

        return this.__IWordSegment.get_Text()
    }

    /**
     * 
     * @returns {TextSegment} 
     */
    get_SourceTextSegment() {
        if (!this.HasProp("__IWordSegment")) {
            if ((queryResult := this.QueryInterface(IWordSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordSegment := IWordSegment(outPtr)
        }

        return this.__IWordSegment.get_SourceTextSegment()
    }

    /**
     * 
     * @returns {IVectorView<AlternateWordForm>} 
     */
    get_AlternateForms() {
        if (!this.HasProp("__IWordSegment")) {
            if ((queryResult := this.QueryInterface(IWordSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWordSegment := IWordSegment(outPtr)
        }

        return this.__IWordSegment.get_AlternateForms()
    }

;@endregion Instance Methods
}

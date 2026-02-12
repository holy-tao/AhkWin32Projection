#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISelectableWordSegment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a segment from your provided text that includes a word and any trailing whitespace and/or punctuation after this word.
 * @remarks
 * Your code does not instantiate this class directly. Instead, you use instances retrieved from a [SelectableWordsSegmenter](selectablewordssegmenter.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordsegment
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class SelectableWordSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISelectableWordSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISelectableWordSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text of the selected word identified by this [SelectableWordSegment](selectablewordsegment.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordsegment.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets the [TextSegment](textsegment.md) that identifies the source text's sub-string that is the selected word.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.selectablewordsegment.sourcetextsegment
     * @type {TextSegment} 
     */
    SourceTextSegment {
        get => this.get_SourceTextSegment()
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
        if (!this.HasProp("__ISelectableWordSegment")) {
            if ((queryResult := this.QueryInterface(ISelectableWordSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectableWordSegment := ISelectableWordSegment(outPtr)
        }

        return this.__ISelectableWordSegment.get_Text()
    }

    /**
     * 
     * @returns {TextSegment} 
     */
    get_SourceTextSegment() {
        if (!this.HasProp("__ISelectableWordSegment")) {
            if ((queryResult := this.QueryInterface(ISelectableWordSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISelectableWordSegment := ISelectableWordSegment(outPtr)
        }

        return this.__ISelectableWordSegment.get_SourceTextSegment()
    }

;@endregion Instance Methods
}

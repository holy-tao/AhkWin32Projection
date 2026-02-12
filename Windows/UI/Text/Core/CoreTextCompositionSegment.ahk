#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextCompositionSegment.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a segment in a composition string. See Remarks for an illustration.
 * @remarks
 * An object of this type can be obtained from the [CoreTextCompositionCompletedEventArgs.CompositionSegments](coretextcompositioncompletedeventargs_compositionsegments.md) property inside a handler for the [CoreTextEditContext.CompositionCompleted](coretexteditcontext_compositioncompleted.md) event handler.
 * 
 * The following illustration shows the different parts of a composition:
 * 
 * <img src="images/parts_of_a_composition.png" alt="An illustration of the different parts of a composition" />
 * The entire string is the composition. The sections marked by the gray brackets are segments, or composition segments. The words inside the blue boxes are converted strings (in this case, Kanji). And the words inside red boxes are pre-conversion strings (in this case, the Hiragana that generated the corresponding Kanji).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositionsegment
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextCompositionSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextCompositionSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextCompositionSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that represents the state of the user input after IME-processing but before final conversion.
     * @remarks
     * The original string is the text input by the user, for example a romanized string. The IME might process that string into Hiragana, for example, and the result is the pre-conversion string— also known as the reading string. After this, the user might convert part of the Hiragana into Kanji, and the result is the post-conversion string that you would see in the text input control when composition is completed. The pre-conversion string is sometimes phonetic, but not always. For example with some Chinese IMEs it can be the strokes used or, in math, the shortcut used to describe the desired notation. See [CoreTextCompositionSegment](coretextcompositionsegment.md) for an illustration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositionsegment.preconversionstring
     * @type {HSTRING} 
     */
    PreconversionString {
        get => this.get_PreconversionString()
    }

    /**
     * Gets an object that represents the range that defines this composition segment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositionsegment.range
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
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
    get_PreconversionString() {
        if (!this.HasProp("__ICoreTextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ICoreTextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextCompositionSegment := ICoreTextCompositionSegment(outPtr)
        }

        return this.__ICoreTextCompositionSegment.get_PreconversionString()
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Range() {
        if (!this.HasProp("__ICoreTextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ICoreTextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextCompositionSegment := ICoreTextCompositionSegment(outPtr)
        }

        return this.__ICoreTextCompositionSegment.get_Range()
    }

;@endregion Instance Methods
}

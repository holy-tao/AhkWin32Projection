#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextPhoneme.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of calling the [TextReverseConversionGenerator.GetPhonemesAsync](textreverseconversiongenerator_getphonemesasync_395544774.md) method, encapsulating both the original display text and the phonemes that match the original display text.
 * @remarks
 * Your code does not instantiate objects of this class. Rather, objects are instantiated and returned to you as the output of the [TextReverseConversionGenerator.GetPhonemesAsync](textreverseconversiongenerator_getphonemesasync_395544774.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.textphoneme
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class TextPhoneme extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextPhoneme

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextPhoneme.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display text for a Japanese phoneme.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textphoneme.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * Gets the phonetic reading of the [DisplayText](textphoneme_displaytext.md), with Japanese characters in Hiragana.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.textphoneme.readingtext
     * @type {HSTRING} 
     */
    ReadingText {
        get => this.get_ReadingText()
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
        if (!this.HasProp("__ITextPhoneme")) {
            if ((queryResult := this.QueryInterface(ITextPhoneme.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPhoneme := ITextPhoneme(outPtr)
        }

        return this.__ITextPhoneme.get_DisplayText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ReadingText() {
        if (!this.HasProp("__ITextPhoneme")) {
            if ((queryResult := this.QueryInterface(ITextPhoneme.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPhoneme := ITextPhoneme(outPtr)
        }

        return this.__ITextPhoneme.get_ReadingText()
    }

;@endregion Instance Methods
}

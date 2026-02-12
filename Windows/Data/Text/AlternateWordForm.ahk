#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAlternateWordForm.ahk
#Include ..\..\..\Guid.ahk

/**
 * Identifies an alternate form of the word represented by a [WordSegment](wordsegment.md) object. For example, this may contain a number in a normalized format.
 * @remarks
 * Your code does not create instances of this class. It retrieves them from a [WordSegment.AlternateForms](wordsegment_alternateforms.md) list.
 * 
 * The value of the [AlternateNormalizationFormat](alternatenormalizationformat.md) property indicates the normalization format used to format the [AlternateText](alternatewordform_alternatetext.md) property. It is one of the following possible normalization formats.
 * 
 * When *NormalizationFormat* property is **AlternateNormalizationFormat.Number**, "." is used to indicate the decimal separator, and a leading "-" indicates that the number is negative.
 * 
 * When *NormalizationFormat* is **AlternateNormalizationFormat.Currency**, "." is used to indicate the decimal separator, a leading "-" indicates that the number is negative, and the text following the last digit is the currency symbol.
 * 
 * When *NormalizationFormat* is **AlternateNormalizationFormat.Date**, the result is "YYYY-MM-DD", where "YYYY" is the Gregorian year (0-padded), "MM" is the numerical month (0-padded), and "DD" is the day (0-padded).
 * 
 * When *NormalizationFormat* is **AlternateNormalizationFormat.Time**, the result is "HH:MM:SS", where "HH" is the hour in 24-hour time (0-padded) (0-23), "MM" is the minute (0-padded), and "SS" is the seconds (0-padded).
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.alternatewordform
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class AlternateWordForm extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAlternateWordForm

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAlternateWordForm.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [TextSegment](textsegment.md) that identifies the source text's sub-string for which this [AlternateWordForm](alternatewordform.md) object is an alternate.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.alternatewordform.sourcetextsegment
     * @type {TextSegment} 
     */
    SourceTextSegment {
        get => this.get_SourceTextSegment()
    }

    /**
     * Gets the text of the alternate word form identified by this [AlternateWordForm](alternatewordform.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.alternatewordform.alternatetext
     * @type {HSTRING} 
     */
    AlternateText {
        get => this.get_AlternateText()
    }

    /**
     * Gets the normalization format for this current [AlternateWordForm](alternatewordform.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.alternatewordform.normalizationformat
     * @type {Integer} 
     */
    NormalizationFormat {
        get => this.get_NormalizationFormat()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TextSegment} 
     */
    get_SourceTextSegment() {
        if (!this.HasProp("__IAlternateWordForm")) {
            if ((queryResult := this.QueryInterface(IAlternateWordForm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAlternateWordForm := IAlternateWordForm(outPtr)
        }

        return this.__IAlternateWordForm.get_SourceTextSegment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlternateText() {
        if (!this.HasProp("__IAlternateWordForm")) {
            if ((queryResult := this.QueryInterface(IAlternateWordForm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAlternateWordForm := IAlternateWordForm(outPtr)
        }

        return this.__IAlternateWordForm.get_AlternateText()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NormalizationFormat() {
        if (!this.HasProp("__IAlternateWordForm")) {
            if ((queryResult := this.QueryInterface(IAlternateWordForm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAlternateWordForm := IAlternateWordForm(outPtr)
        }

        return this.__IAlternateWordForm.get_NormalizationFormat()
    }

;@endregion Instance Methods
}

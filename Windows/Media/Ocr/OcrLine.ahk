#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOcrLine.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single line of text recognized by the OCR engine and returned as part of the [OcrResult](ocrresult.md).
 * @remarks
 * When you call the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method of the [OcrEngine](ocrengine.md) class, the method returns an [OcrResult](ocrresult.md) object. The **OcrResult** contains a collection of **OcrLine** objects, which you access through the [Lines](ocrresult_lines.md) property of the **OcrResult**. Each **OcrLine** object contains a collection of [OcrWord](ocrword.md) objects, which you access through the [Words](ocrline_words.md) property of each **OcrLine**.
 * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrline
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class OcrLine extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOcrLine

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOcrLine.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of [OcrWord](ocrword.md) objects that represents the words detected in the current line of text by the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrline.words
     * @type {IVectorView<OcrWord>} 
     */
    Words {
        get => this.get_Words()
    }

    /**
     * Gets the text of the recognized line.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrline.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<OcrWord>} 
     */
    get_Words() {
        if (!this.HasProp("__IOcrLine")) {
            if ((queryResult := this.QueryInterface(IOcrLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrLine := IOcrLine(outPtr)
        }

        return this.__IOcrLine.get_Words()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IOcrLine")) {
            if ((queryResult := this.QueryInterface(IOcrLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrLine := IOcrLine(outPtr)
        }

        return this.__IOcrLine.get_Text()
    }

;@endregion Instance Methods
}

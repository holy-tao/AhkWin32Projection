#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOcrWord.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single word in a line of text recognized by the OCR engine and returned as part of the [OcrLine](ocrline.md).
 * @remarks
 * When you call the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method of the [OcrEngine](ocrengine.md) class, the method returns an [OcrResult](ocrresult.md) object. The **OcrResult** contains a collection of [OcrLine](ocrline.md) objects, which you access through the [Lines](ocrresult_lines.md) property of the **OcrResult**. Each **OcrLine** object contains a collection of **OcrWord** objects, which you access through the [Words](ocrline_words.md) property of each **OcrLine**.
 * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrword
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class OcrWord extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOcrWord

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOcrWord.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the position and size in pixels of the recognized word from the top left corner of image when the value of [TextAngle](ocrresult_textangle.md) property is 0 (zero).
     * @remarks
     * When the value of the [TextAngle](ocrresult_textangle.md) property is not null, the values of the Left and Top properties of BoundingBox are calculated from the rotated image.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrword.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * Gets the text of the recognized word.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrword.text
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
     * @returns {RECT} 
     */
    get_BoundingRect() {
        if (!this.HasProp("__IOcrWord")) {
            if ((queryResult := this.QueryInterface(IOcrWord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrWord := IOcrWord(outPtr)
        }

        return this.__IOcrWord.get_BoundingRect()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IOcrWord")) {
            if ((queryResult := this.QueryInterface(IOcrWord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrWord := IOcrWord(outPtr)
        }

        return this.__IOcrWord.get_Text()
    }

;@endregion Instance Methods
}

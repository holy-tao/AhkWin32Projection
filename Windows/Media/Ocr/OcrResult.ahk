#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOcrResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the results of Optical Character Recognition (OCR).
 * @remarks
 * When you call the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method of the [OcrEngine](ocrengine.md) class, the method returns an **OcrResult** object. The **OcrResult** contains a collection of [OcrLine](ocrline.md) objects, which you access through the [Lines](ocrresult_lines.md) property of the **OcrResult**. Each **OcrLine** object contains a collection of [OcrWord](ocrword.md) objects, which you access through the [Words](ocrline_words.md) property of each **OcrLine.**
 * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrresult
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class OcrResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOcrResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOcrResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of [OcrLine](ocrline.md) objects that represents the lines of text detected in the image by the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method.
     * @remarks
     * When you call the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method of the [OcrEngine](ocrengine.md) class, the method returns an [OcrResult](ocrresult.md) object. The **OcrResult** contains a collection of [OcrLine](ocrline.md) objects, which you access through the **Lines** property of the **OcrResult**. Each **OcrLine** object contains a collection of [OcrWord](ocrword.md) objects, which you access through the [Words](ocrline_words.md) property of each **OcrLine**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrresult.lines
     * @type {IVectorView<OcrLine>} 
     */
    Lines {
        get => this.get_Lines()
    }

    /**
     * Gets the clockwise rotation of the recognized text, in degrees, around the center of the image.
     * @remarks
     * Use the **TextAngle** property to overlay recognition results correctly on the original image. If the value of the **TextAngle** property is not null or 0 (zero), then to overlay the recognized text correctly on the original image, you either have to rotate the original image by the detected angle in a counter-clockwise direction, or rotate the recognized text by the detected angle in a clockwise direction.
     * 
     * <img src="images/OcrTextAngle.png" alt="Example of text angle in an image" />
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrresult.textangle
     * @type {IReference<Float>} 
     */
    TextAngle {
        get => this.get_TextAngle()
    }

    /**
     * Gets the recognized text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrresult.text
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
     * @returns {IVectorView<OcrLine>} 
     */
    get_Lines() {
        if (!this.HasProp("__IOcrResult")) {
            if ((queryResult := this.QueryInterface(IOcrResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrResult := IOcrResult(outPtr)
        }

        return this.__IOcrResult.get_Lines()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_TextAngle() {
        if (!this.HasProp("__IOcrResult")) {
            if ((queryResult := this.QueryInterface(IOcrResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrResult := IOcrResult(outPtr)
        }

        return this.__IOcrResult.get_TextAngle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IOcrResult")) {
            if ((queryResult := this.QueryInterface(IOcrResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrResult := IOcrResult(outPtr)
        }

        return this.__IOcrResult.get_Text()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOcrEngine.ahk
#Include .\IOcrEngineStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides optical character recognition (OCR) functionality.
 * @remarks
 * To use the OCR capabilities of the **OcrEngine** class in your app, call the [RecognizeAsync](ocrengine_recognizeasync_614325911.md) method. When you call the **RecognizeAsync** method of the **OcrEngine** class, the method returns an [OcrResult](ocrresult.md) object, which contains the recognized text and its size and position. The result is split into lines, and the lines are split into words.
 * 
 * 
 * + The [OcrResult](ocrresult.md) contains a collection of [OcrLine](ocrline.md) objects, which you access through the [Lines](ocrresult_lines.md) property of the **OcrResult**.
 * + Each [OcrLine](ocrline.md) object contains a collection of [OcrWord](ocrword.md) objects, which you access through the [Words](ocrline_words.md) property of each **OcrLine**.
 * + Each [OcrWord](ocrword.md) object specifies the text, size, and position information of the word in the image.
 * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class OcrEngine extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOcrEngine

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOcrEngine.IID

    /**
     * Gets the maximum image pixel dimensions supported by the OCR engine.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.maximagedimension
     * @type {Integer} 
     */
    static MaxImageDimension {
        get => OcrEngine.get_MaxImageDimension()
    }

    /**
     * Returns a collection of all available OCR languages on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.availablerecognizerlanguages
     * @type {IVectorView<Language>} 
     */
    static AvailableRecognizerLanguages {
        get => OcrEngine.get_AvailableRecognizerLanguages()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxImageDimension() {
        if (!OcrEngine.HasProp("__IOcrEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Ocr.OcrEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOcrEngineStatics.IID)
            OcrEngine.__IOcrEngineStatics := IOcrEngineStatics(factoryPtr)
        }

        return OcrEngine.__IOcrEngineStatics.get_MaxImageDimension()
    }

    /**
     * 
     * @returns {IVectorView<Language>} 
     */
    static get_AvailableRecognizerLanguages() {
        if (!OcrEngine.HasProp("__IOcrEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Ocr.OcrEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOcrEngineStatics.IID)
            OcrEngine.__IOcrEngineStatics := IOcrEngineStatics(factoryPtr)
        }

        return OcrEngine.__IOcrEngineStatics.get_AvailableRecognizerLanguages()
    }

    /**
     * Returns true if a specified language can be resolved to any of the available OCR languages. See [language matching](/previous-versions/windows/apps/jj673578(v=win.10)) for a further explanation of language resolving.
     * @param {Language} language_ The language being used for text recognition.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.islanguagesupported
     */
    static IsLanguageSupported(language_) {
        if (!OcrEngine.HasProp("__IOcrEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Ocr.OcrEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOcrEngineStatics.IID)
            OcrEngine.__IOcrEngineStatics := IOcrEngineStatics(factoryPtr)
        }

        return OcrEngine.__IOcrEngineStatics.IsLanguageSupported(language_)
    }

    /**
     * Creates a new instance of the [OcrEngine](ocrengine.md) class.
     * @param {Language} language_ The language being used for text recognition.
     * @returns {OcrEngine} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.trycreatefromlanguage
     */
    static TryCreateFromLanguage(language_) {
        if (!OcrEngine.HasProp("__IOcrEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Ocr.OcrEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOcrEngineStatics.IID)
            OcrEngine.__IOcrEngineStatics := IOcrEngineStatics(factoryPtr)
        }

        return OcrEngine.__IOcrEngineStatics.TryCreateFromLanguage(language_)
    }

    /**
     * Creates a new instance of the [OcrEngine](ocrengine.md) class.
     * @returns {OcrEngine} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.trycreatefromuserprofilelanguages
     */
    static TryCreateFromUserProfileLanguages() {
        if (!OcrEngine.HasProp("__IOcrEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Ocr.OcrEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOcrEngineStatics.IID)
            OcrEngine.__IOcrEngineStatics := IOcrEngineStatics(factoryPtr)
        }

        return OcrEngine.__IOcrEngineStatics.TryCreateFromUserProfileLanguages()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the language being used for text recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.recognizerlanguage
     * @type {Language} 
     */
    RecognizerLanguage {
        get => this.get_RecognizerLanguage()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scans the specified image for text in the language specified by the [RecognizerLanguage](ocrengine_recognizerlanguage.md) property.
     * @param {SoftwareBitmap} bitmap_ Represents an uncompressed bitmap.
     * @returns {IAsyncOperation<OcrResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.ocr.ocrengine.recognizeasync
     */
    RecognizeAsync(bitmap_) {
        if (!this.HasProp("__IOcrEngine")) {
            if ((queryResult := this.QueryInterface(IOcrEngine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrEngine := IOcrEngine(outPtr)
        }

        return this.__IOcrEngine.RecognizeAsync(bitmap_)
    }

    /**
     * 
     * @returns {Language} 
     */
    get_RecognizerLanguage() {
        if (!this.HasProp("__IOcrEngine")) {
            if ((queryResult := this.QueryInterface(IOcrEngine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOcrEngine := IOcrEngine(outPtr)
        }

        return this.__IOcrEngine.get_RecognizerLanguage()
    }

;@endregion Instance Methods
}

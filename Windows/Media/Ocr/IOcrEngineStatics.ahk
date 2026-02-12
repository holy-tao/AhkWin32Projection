#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Globalization\Language.ahk
#Include .\OcrEngine.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class IOcrEngineStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOcrEngineStatics
     * @type {Guid}
     */
    static IID => Guid("{5bffa85a-3384-3540-9940-699120d428a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxImageDimension", "get_AvailableRecognizerLanguages", "IsLanguageSupported", "TryCreateFromLanguage", "TryCreateFromUserProfileLanguages"]

    /**
     * @type {Integer} 
     */
    MaxImageDimension {
        get => this.get_MaxImageDimension()
    }

    /**
     * @type {IVectorView<Language>} 
     */
    AvailableRecognizerLanguages {
        get => this.get_AvailableRecognizerLanguages()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxImageDimension() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Language>} 
     */
    get_AvailableRecognizerLanguages() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Language, value)
    }

    /**
     * 
     * @param {Language} language_ 
     * @returns {Boolean} 
     */
    IsLanguageSupported(language_) {
        result := ComCall(8, this, "ptr", language_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Language} language_ 
     * @returns {OcrEngine} 
     */
    TryCreateFromLanguage(language_) {
        result := ComCall(9, this, "ptr", language_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OcrEngine(result_)
    }

    /**
     * 
     * @returns {OcrEngine} 
     */
    TryCreateFromUserProfileLanguages() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OcrEngine(result_)
    }
}

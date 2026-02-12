#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\OcrResult.ahk
#Include ..\..\Globalization\Language.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Ocr
 * @version WindowsRuntime 1.4
 */
class IOcrEngine extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOcrEngine
     * @type {Guid}
     */
    static IID => Guid("{5a14bc41-5b76-3140-b680-8825562683ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RecognizeAsync", "get_RecognizerLanguage"]

    /**
     * @type {Language} 
     */
    RecognizerLanguage {
        get => this.get_RecognizerLanguage()
    }

    /**
     * 
     * @param {SoftwareBitmap} bitmap_ 
     * @returns {IAsyncOperation<OcrResult>} 
     */
    RecognizeAsync(bitmap_) {
        result := ComCall(6, this, "ptr", bitmap_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OcrResult, result_)
    }

    /**
     * 
     * @returns {Language} 
     */
    get_RecognizerLanguage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Language(value)
    }
}

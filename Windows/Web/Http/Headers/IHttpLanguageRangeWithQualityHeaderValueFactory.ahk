#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpLanguageRangeWithQualityHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpLanguageRangeWithQualityHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpLanguageRangeWithQualityHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{7bb83970-780f-4c83-9fe4-dc3087f6bd55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromLanguageRange", "CreateFromLanguageRangeWithQuality"]

    /**
     * 
     * @param {HSTRING} languageRange 
     * @returns {HttpLanguageRangeWithQualityHeaderValue} 
     */
    CreateFromLanguageRange(languageRange) {
        if(languageRange is String) {
            pin := HSTRING.Create(languageRange)
            languageRange := pin.Value
        }
        languageRange := languageRange is Win32Handle ? NumGet(languageRange, "ptr") : languageRange

        result := ComCall(6, this, "ptr", languageRange, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpLanguageRangeWithQualityHeaderValue(value)
    }

    /**
     * 
     * @param {HSTRING} languageRange 
     * @param {Float} quality_ 
     * @returns {HttpLanguageRangeWithQualityHeaderValue} 
     */
    CreateFromLanguageRangeWithQuality(languageRange, quality_) {
        if(languageRange is String) {
            pin := HSTRING.Create(languageRange)
            languageRange := pin.Value
        }
        languageRange := languageRange is Win32Handle ? NumGet(languageRange, "ptr") : languageRange

        result := ComCall(7, this, "ptr", languageRange, "double", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpLanguageRangeWithQualityHeaderValue(value)
    }
}

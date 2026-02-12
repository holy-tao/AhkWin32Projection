#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpContentCodingWithQualityHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpContentCodingWithQualityHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContentCodingWithQualityHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{c45eee1a-c553-46fc-ade2-d75c1d53df7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromValue", "CreateFromValueWithQuality"]

    /**
     * 
     * @param {HSTRING} contentCoding 
     * @returns {HttpContentCodingWithQualityHeaderValue} 
     */
    CreateFromValue(contentCoding) {
        if(contentCoding is String) {
            pin := HSTRING.Create(contentCoding)
            contentCoding := pin.Value
        }
        contentCoding := contentCoding is Win32Handle ? NumGet(contentCoding, "ptr") : contentCoding

        result := ComCall(6, this, "ptr", contentCoding, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentCodingWithQualityHeaderValue(value)
    }

    /**
     * 
     * @param {HSTRING} contentCoding 
     * @param {Float} quality_ 
     * @returns {HttpContentCodingWithQualityHeaderValue} 
     */
    CreateFromValueWithQuality(contentCoding, quality_) {
        if(contentCoding is String) {
            pin := HSTRING.Create(contentCoding)
            contentCoding := pin.Value
        }
        contentCoding := contentCoding is Win32Handle ? NumGet(contentCoding, "ptr") : contentCoding

        result := ComCall(7, this, "ptr", contentCoding, "double", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentCodingWithQualityHeaderValue(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpMediaTypeWithQualityHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpMediaTypeWithQualityHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMediaTypeWithQualityHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{4c6d20f4-9457-44e6-a323-d122b958780b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromMediaType", "CreateFromMediaTypeWithQuality"]

    /**
     * 
     * @param {HSTRING} mediaType_ 
     * @returns {HttpMediaTypeWithQualityHeaderValue} 
     */
    CreateFromMediaType(mediaType_) {
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_

        result := ComCall(6, this, "ptr", mediaType_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMediaTypeWithQualityHeaderValue(value)
    }

    /**
     * 
     * @param {HSTRING} mediaType_ 
     * @param {Float} quality_ 
     * @returns {HttpMediaTypeWithQualityHeaderValue} 
     */
    CreateFromMediaTypeWithQuality(mediaType_, quality_) {
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_

        result := ComCall(7, this, "ptr", mediaType_, "double", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMediaTypeWithQualityHeaderValue(value)
    }
}

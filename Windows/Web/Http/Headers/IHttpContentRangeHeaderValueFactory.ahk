#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpContentRangeHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpContentRangeHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContentRangeHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{3f5bd691-a03c-4456-9a6f-ef27ecd03cae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromLength", "CreateFromRange", "CreateFromRangeWithLength"]

    /**
     * 
     * @param {Integer} length 
     * @returns {HttpContentRangeHeaderValue} 
     */
    CreateFromLength(length) {
        result := ComCall(6, this, "uint", length, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentRangeHeaderValue(value)
    }

    /**
     * 
     * @param {Integer} from 
     * @param {Integer} to 
     * @returns {HttpContentRangeHeaderValue} 
     */
    CreateFromRange(from, to) {
        result := ComCall(7, this, "uint", from, "uint", to, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentRangeHeaderValue(value)
    }

    /**
     * 
     * @param {Integer} from 
     * @param {Integer} to 
     * @param {Integer} length 
     * @returns {HttpContentRangeHeaderValue} 
     */
    CreateFromRangeWithLength(from, to, length) {
        result := ComCall(8, this, "uint", from, "uint", to, "uint", length, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentRangeHeaderValue(value)
    }
}

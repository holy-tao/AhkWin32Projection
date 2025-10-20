#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTimeRanges extends IDispatch{
    /**
     * The interface identifier for IHTMLTimeRanges
     * @type {Guid}
     */
    static IID => Guid("{30510705-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTimeRanges
     * @type {Guid}
     */
    static CLSID => Guid("{3051070b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Single>} startTime 
     * @returns {HRESULT} 
     */
    start(index, startTime) {
        result := ComCall(8, this, "int", index, "float*", startTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Single>} endTime 
     * @returns {HRESULT} 
     */
    end(index, endTime) {
        result := ComCall(9, this, "int", index, "float*", endTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

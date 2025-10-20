#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTimeRanges2 extends IDispatch{
    /**
     * The interface identifier for IHTMLTimeRanges2
     * @type {Guid}
     */
    static IID => Guid("{3051080b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Double>} startTime 
     * @returns {HRESULT} 
     */
    startDouble(index, startTime) {
        result := ComCall(7, this, "int", index, "double*", startTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Double>} endTime 
     * @returns {HRESULT} 
     */
    endDouble(index, endTime) {
        result := ComCall(8, this, "int", index, "double*", endTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTimeRanges2 extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["startDouble", "endDouble"]

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Float>} startTime 
     * @returns {HRESULT} 
     */
    startDouble(index, startTime) {
        startTimeMarshal := startTime is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, "int", index, startTimeMarshal, startTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Float>} endTime 
     * @returns {HRESULT} 
     */
    endDouble(index, endTime) {
        endTimeMarshal := endTime is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, "int", index, endTimeMarshal, endTime, "HRESULT")
        return result
    }
}

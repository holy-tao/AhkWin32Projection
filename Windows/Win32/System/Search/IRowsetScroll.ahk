#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetLocate.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetScroll extends IRowsetLocate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetScroll
     * @type {Guid}
     */
    static IID => Guid("{0c733a7e-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApproximatePosition", "GetRowsAtRatio"]

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer<Pointer>} pulPosition 
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    GetApproximatePosition(hReserved, cbBookmark, pBookmark, pulPosition, pcRows) {
        result := ComCall(12, this, "ptr", hReserved, "ptr", cbBookmark, "char*", pBookmark, "ptr*", pulPosition, "ptr*", pcRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved1 
     * @param {Pointer} hReserved2 
     * @param {Pointer} ulNumerator 
     * @param {Pointer} ulDenominator 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetRowsAtRatio(hReserved1, hReserved2, ulNumerator, ulDenominator, cRows, pcRowsObtained, prghRows) {
        result := ComCall(13, this, "ptr", hReserved1, "ptr", hReserved2, "ptr", ulNumerator, "ptr", ulDenominator, "ptr", cRows, "ptr*", pcRowsObtained, "ptr*", prghRows, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLElementCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTable2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTable2
     * @type {Guid}
     */
    static IID => Guid("{3050f4ad-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["firstPage", "lastPage", "get_cells", "moveRow"]

    /**
     * 
     * @returns {HRESULT} 
     */
    firstPage() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    lastPage() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_cells() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {Integer} indexFrom 
     * @param {Integer} indexTo 
     * @returns {IDispatch} 
     */
    moveRow(indexFrom, indexTo) {
        result := ComCall(10, this, "int", indexFrom, "int", indexTo, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }
}

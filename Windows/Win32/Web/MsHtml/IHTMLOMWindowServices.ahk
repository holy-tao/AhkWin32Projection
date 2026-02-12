#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLOMWindowServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLOMWindowServices
     * @type {Guid}
     */
    static IID => Guid("{3050f5fc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["moveTo", "moveBy", "resizeTo", "resizeBy"]

    /**
     * moveToCurrentRow Method (SQLServerResultSet)
     * @remarks
     * This moveToCurrentRow method is specified by the moveToCurrentRow method in the java.sql.ResultSet interface.  
     *   
     *  This method has no effect if the cursor is not on the insert row.
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/movetocurrentrow-method-sqlserverresultset
     */
    moveTo(x, y) {
        result := ComCall(3, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveBy(x, y) {
        result := ComCall(4, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeTo(x, y) {
        result := ComCall(5, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeBy(x, y) {
        result := ComCall(6, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

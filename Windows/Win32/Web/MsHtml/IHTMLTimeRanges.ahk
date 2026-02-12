#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTimeRanges extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "start", "end"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * start Method (SQLServerXAResource)
     * @remarks
     * This start method is specified by the start method in the javax.transaction.xa.XAResource interface.
     * @param {Integer} index 
     * @returns {Float} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/start-method-sqlserverxaresource
     */
    start(index) {
        result := ComCall(8, this, "int", index, "float*", &startTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return startTime
    }

    /**
     * end Method (SQLServerXAResource)
     * @remarks
     * This end method is specified by the end method in the javax.transaction.xa.XAResource interface.
     * @param {Integer} index 
     * @returns {Float} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/end-method-sqlserverxaresource
     */
    end(index) {
        result := ComCall(9, this, "int", index, "float*", &endTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return endTime
    }
}

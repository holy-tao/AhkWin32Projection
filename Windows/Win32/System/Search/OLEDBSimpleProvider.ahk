#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class OLEDBSimpleProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for OLEDBSimpleProvider
     * @type {Guid}
     */
    static IID => Guid("{e0e270c0-c0be-11d0-8fe4-00a0c90a6341}")

    /**
     * The class identifier for OLEDBSimpleProvider
     * @type {Guid}
     */
    static CLSID => Guid("{e0e270c0-c0be-11d0-8fe4-00a0c90a6341}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getRowCount", "getColumnCount", "getRWStatus", "getVariant", "setVariant", "getLocale", "deleteRows", "insertRows", "find", "addOLEDBSimpleProviderListener", "removeOLEDBSimpleProviderListener", "isAsync", "getEstimatedRows", "stopTransfer"]

    /**
     * 
     * @returns {Pointer} 
     */
    getRowCount() {
        result := ComCall(3, this, "ptr*", &pcRows := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcRows
    }

    /**
     * getColumnCount Method (SQLServerResultSetMetaData)
     * @remarks
     * This getColumnCount method is specified by the getColumnCount method in the java.sql.ResultSetMetaData interface.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getcolumncount-method-sqlserverresultsetmetadata
     */
    getColumnCount() {
        result := ComCall(4, this, "ptr*", &pcColumns := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcColumns
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} iColumn 
     * @returns {Integer} 
     */
    getRWStatus(iRow_, iColumn) {
        result := ComCall(5, this, "ptr", iRow_, "ptr", iColumn, "int*", &prwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prwStatus
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} iColumn 
     * @param {Integer} format 
     * @returns {VARIANT} 
     */
    getVariant(iRow_, iColumn, format) {
        pVar := VARIANT()
        result := ComCall(6, this, "ptr", iRow_, "ptr", iColumn, "int", format, "ptr", pVar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVar
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} iColumn 
     * @param {Integer} format 
     * @param {VARIANT} Var 
     * @returns {HRESULT} 
     */
    setVariant(iRow_, iColumn, format, Var) {
        result := ComCall(7, this, "ptr", iRow_, "ptr", iColumn, "int", format, "ptr", Var, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getLocale() {
        pbstrLocale := BSTR()
        result := ComCall(8, this, "ptr", pbstrLocale, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrLocale
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {Pointer} 
     */
    deleteRows(iRow_, cRows) {
        result := ComCall(9, this, "ptr", iRow_, "ptr", cRows, "ptr*", &pcRowsDeleted := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcRowsDeleted
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {Pointer} 
     */
    insertRows(iRow_, cRows) {
        result := ComCall(10, this, "ptr", iRow_, "ptr", cRows, "ptr*", &pcRowsInserted := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcRowsInserted
    }

    /**
     * findColumn Method (SQLServerResultSet)
     * @remarks
     * This findColumn method is specified by the findColumn method in the java.sql.ResultSet interface.  
     *   
     *  If there are multiple columns with the same name, the findColumn method returns the first case-sensitive match. If there is no case-sensitive match, this method returns the first case-insensitive match.
     * @param {Pointer} iRowStart 
     * @param {Pointer} iColumn 
     * @param {VARIANT} val_ 
     * @param {Integer} findFlags 
     * @param {Integer} compType 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/findcolumn-method-sqlserverresultset
     */
    find(iRowStart, iColumn, val_, findFlags, compType) {
        result := ComCall(11, this, "ptr", iRowStart, "ptr", iColumn, "ptr", val_, "int", findFlags, "int", compType, "ptr*", &piRowFound := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piRowFound
    }

    /**
     * 
     * @param {OLEDBSimpleProviderListener} pospIListener 
     * @returns {HRESULT} 
     */
    addOLEDBSimpleProviderListener(pospIListener) {
        result := ComCall(12, this, "ptr", pospIListener, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {OLEDBSimpleProviderListener} pospIListener 
     * @returns {HRESULT} 
     */
    removeOLEDBSimpleProviderListener(pospIListener) {
        result := ComCall(13, this, "ptr", pospIListener, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    isAsync() {
        result := ComCall(14, this, "int*", &pbAsynch := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbAsynch
    }

    /**
     * 
     * @returns {Pointer} 
     */
    getEstimatedRows() {
        result := ComCall(15, this, "ptr*", &piRows := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piRows
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopTransfer() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

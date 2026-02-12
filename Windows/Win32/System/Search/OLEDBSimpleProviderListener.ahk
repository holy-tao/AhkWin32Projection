#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class OLEDBSimpleProviderListener extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for OLEDBSimpleProviderListener
     * @type {Guid}
     */
    static IID => Guid("{e0e270c1-c0be-11d0-8fe4-00a0c90a6341}")

    /**
     * The class identifier for OLEDBSimpleProviderListener
     * @type {Guid}
     */
    static CLSID => Guid("{e0e270c1-c0be-11d0-8fe4-00a0c90a6341}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["aboutToChangeCell", "cellChanged", "aboutToDeleteRows", "deletedRows", "aboutToInsertRows", "insertedRows", "rowsAvailable", "transferComplete"]

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} iColumn 
     * @returns {HRESULT} 
     */
    aboutToChangeCell(iRow_, iColumn) {
        result := ComCall(3, this, "ptr", iRow_, "ptr", iColumn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} iColumn 
     * @returns {HRESULT} 
     */
    cellChanged(iRow_, iColumn) {
        result := ComCall(4, this, "ptr", iRow_, "ptr", iColumn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    aboutToDeleteRows(iRow_, cRows) {
        result := ComCall(5, this, "ptr", iRow_, "ptr", cRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    deletedRows(iRow_, cRows) {
        result := ComCall(6, this, "ptr", iRow_, "ptr", cRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    aboutToInsertRows(iRow_, cRows) {
        result := ComCall(7, this, "ptr", iRow_, "ptr", cRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    insertedRows(iRow_, cRows) {
        result := ComCall(8, this, "ptr", iRow_, "ptr", cRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} iRow_ 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    rowsAvailable(iRow_, cRows) {
        result := ComCall(9, this, "ptr", iRow_, "ptr", cRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} xfer 
     * @returns {HRESULT} 
     */
    transferComplete(xfer) {
        result := ComCall(10, this, "int", xfer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

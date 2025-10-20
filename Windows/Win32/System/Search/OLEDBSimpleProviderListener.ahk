#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class OLEDBSimpleProviderListener extends IUnknown{
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
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @returns {HRESULT} 
     */
    aboutToChangeCell(iRow, iColumn) {
        result := ComCall(3, this, "ptr", iRow, "ptr", iColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @returns {HRESULT} 
     */
    cellChanged(iRow, iColumn) {
        result := ComCall(4, this, "ptr", iRow, "ptr", iColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    aboutToDeleteRows(iRow, cRows) {
        result := ComCall(5, this, "ptr", iRow, "ptr", cRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    deletedRows(iRow, cRows) {
        result := ComCall(6, this, "ptr", iRow, "ptr", cRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    aboutToInsertRows(iRow, cRows) {
        result := ComCall(7, this, "ptr", iRow, "ptr", cRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    insertedRows(iRow, cRows) {
        result := ComCall(8, this, "ptr", iRow, "ptr", cRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    rowsAvailable(iRow, cRows) {
        result := ComCall(9, this, "ptr", iRow, "ptr", cRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xfer 
     * @returns {HRESULT} 
     */
    transferComplete(xfer) {
        result := ComCall(10, this, "int", xfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

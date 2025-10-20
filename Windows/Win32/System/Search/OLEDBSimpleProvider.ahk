#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    getRowCount(pcRows) {
        result := ComCall(3, this, "ptr*", pcRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcColumns 
     * @returns {HRESULT} 
     */
    getColumnCount(pcColumns) {
        result := ComCall(4, this, "ptr*", pcColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @param {Pointer<Integer>} prwStatus 
     * @returns {HRESULT} 
     */
    getRWStatus(iRow, iColumn, prwStatus) {
        result := ComCall(5, this, "ptr", iRow, "ptr", iColumn, "int*", prwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @param {Integer} format 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    getVariant(iRow, iColumn, format, pVar) {
        result := ComCall(6, this, "ptr", iRow, "ptr", iColumn, "int", format, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @param {Integer} format 
     * @param {VARIANT} Var 
     * @returns {HRESULT} 
     */
    setVariant(iRow, iColumn, format, Var) {
        result := ComCall(7, this, "ptr", iRow, "ptr", iColumn, "int", format, "ptr", Var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLocale 
     * @returns {HRESULT} 
     */
    getLocale(pbstrLocale) {
        result := ComCall(8, this, "ptr", pbstrLocale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsDeleted 
     * @returns {HRESULT} 
     */
    deleteRows(iRow, cRows, pcRowsDeleted) {
        result := ComCall(9, this, "ptr", iRow, "ptr", cRows, "ptr*", pcRowsDeleted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsInserted 
     * @returns {HRESULT} 
     */
    insertRows(iRow, cRows, pcRowsInserted) {
        result := ComCall(10, this, "ptr", iRow, "ptr", cRows, "ptr*", pcRowsInserted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iRowStart 
     * @param {Pointer} iColumn 
     * @param {VARIANT} val 
     * @param {Integer} findFlags 
     * @param {Integer} compType 
     * @param {Pointer<Pointer>} piRowFound 
     * @returns {HRESULT} 
     */
    find(iRowStart, iColumn, val, findFlags, compType, piRowFound) {
        result := ComCall(11, this, "ptr", iRowStart, "ptr", iColumn, "ptr", val, "int", findFlags, "int", compType, "ptr*", piRowFound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {OLEDBSimpleProviderListener} pospIListener 
     * @returns {HRESULT} 
     */
    addOLEDBSimpleProviderListener(pospIListener) {
        result := ComCall(12, this, "ptr", pospIListener, "HRESULT")
        return result
    }

    /**
     * 
     * @param {OLEDBSimpleProviderListener} pospIListener 
     * @returns {HRESULT} 
     */
    removeOLEDBSimpleProviderListener(pospIListener) {
        result := ComCall(13, this, "ptr", pospIListener, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAsynch 
     * @returns {HRESULT} 
     */
    isAsync(pbAsynch) {
        result := ComCall(14, this, "ptr", pbAsynch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} piRows 
     * @returns {HRESULT} 
     */
    getEstimatedRows(piRows) {
        result := ComCall(15, this, "ptr*", piRows, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopTransfer() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}

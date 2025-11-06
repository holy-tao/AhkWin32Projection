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
        result := ComCall(3, this, "ptr*", &pcRows := 0, "HRESULT")
        return pcRows
    }

    /**
     * 
     * @returns {Pointer} 
     */
    getColumnCount() {
        result := ComCall(4, this, "ptr*", &pcColumns := 0, "HRESULT")
        return pcColumns
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @returns {Integer} 
     */
    getRWStatus(iRow, iColumn) {
        result := ComCall(5, this, "ptr", iRow, "ptr", iColumn, "int*", &prwStatus := 0, "HRESULT")
        return prwStatus
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} iColumn 
     * @param {Integer} format 
     * @returns {VARIANT} 
     */
    getVariant(iRow, iColumn, format) {
        pVar := VARIANT()
        result := ComCall(6, this, "ptr", iRow, "ptr", iColumn, "int", format, "ptr", pVar, "HRESULT")
        return pVar
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
     * @returns {BSTR} 
     */
    getLocale() {
        pbstrLocale := BSTR()
        result := ComCall(8, this, "ptr", pbstrLocale, "HRESULT")
        return pbstrLocale
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {Pointer} 
     */
    deleteRows(iRow, cRows) {
        result := ComCall(9, this, "ptr", iRow, "ptr", cRows, "ptr*", &pcRowsDeleted := 0, "HRESULT")
        return pcRowsDeleted
    }

    /**
     * 
     * @param {Pointer} iRow 
     * @param {Pointer} cRows 
     * @returns {Pointer} 
     */
    insertRows(iRow, cRows) {
        result := ComCall(10, this, "ptr", iRow, "ptr", cRows, "ptr*", &pcRowsInserted := 0, "HRESULT")
        return pcRowsInserted
    }

    /**
     * 
     * @param {Pointer} iRowStart 
     * @param {Pointer} iColumn 
     * @param {VARIANT} val 
     * @param {Integer} findFlags 
     * @param {Integer} compType 
     * @returns {Pointer} 
     */
    find(iRowStart, iColumn, val, findFlags, compType) {
        result := ComCall(11, this, "ptr", iRowStart, "ptr", iColumn, "ptr", val, "int", findFlags, "int", compType, "ptr*", &piRowFound := 0, "HRESULT")
        return piRowFound
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
     * @returns {BOOL} 
     */
    isAsync() {
        result := ComCall(14, this, "int*", &pbAsynch := 0, "HRESULT")
        return pbAsynch
    }

    /**
     * 
     * @returns {Pointer} 
     */
    getEstimatedRows() {
        result := ComCall(15, this, "ptr*", &piRows := 0, "HRESULT")
        return piRows
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

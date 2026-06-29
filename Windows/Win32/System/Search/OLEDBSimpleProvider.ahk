#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OSPFIND.ahk" { OSPFIND }
#Import ".\OSPFORMAT.ahk" { OSPFORMAT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\OLEDBSimpleProviderListener.ahk" { OLEDBSimpleProviderListener }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\OSPRW.ahk" { OSPRW }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\OSPCOMP.ahk" { OSPCOMP }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct OLEDBSimpleProvider extends IUnknown {
    /**
     * The interface identifier for OLEDBSimpleProvider
     * @type {Guid}
     */
    static IID := Guid("{e0e270c0-c0be-11d0-8fe4-00a0c90a6341}")

    /**
     * The class identifier for OLEDBSimpleProvider
     * @type {Guid}
     */
    static CLSID := Guid("{e0e270c0-c0be-11d0-8fe4-00a0c90a6341}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for OLEDBSimpleProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        getRowCount                       : IntPtr
        getColumnCount                    : IntPtr
        getRWStatus                       : IntPtr
        getVariant                        : IntPtr
        setVariant                        : IntPtr
        getLocale                         : IntPtr
        deleteRows                        : IntPtr
        insertRows                        : IntPtr
        find                              : IntPtr
        addOLEDBSimpleProviderListener    : IntPtr
        removeOLEDBSimpleProviderListener : IntPtr
        isAsync                           : IntPtr
        getEstimatedRows                  : IntPtr
        stopTransfer                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := OLEDBSimpleProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Pointer} _iRow 
     * @param {Pointer} iColumn 
     * @returns {OSPRW} 
     */
    getRWStatus(_iRow, iColumn) {
        result := ComCall(5, this, "ptr", _iRow, "ptr", iColumn, "int*", &prwStatus := 0, "HRESULT")
        return prwStatus
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} iColumn 
     * @param {OSPFORMAT} format 
     * @returns {VARIANT} 
     */
    getVariant(_iRow, iColumn, format) {
        pVar := VARIANT()
        result := ComCall(6, this, "ptr", _iRow, "ptr", iColumn, OSPFORMAT, format, VARIANT.Ptr, pVar, "HRESULT")
        return pVar
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} iColumn 
     * @param {OSPFORMAT} format 
     * @param {VARIANT} Var 
     * @returns {HRESULT} 
     */
    setVariant(_iRow, iColumn, format, Var) {
        result := ComCall(7, this, "ptr", _iRow, "ptr", iColumn, OSPFORMAT, format, VARIANT, Var, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getLocale() {
        pbstrLocale := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrLocale, "HRESULT")
        return pbstrLocale
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {Pointer} 
     */
    deleteRows(_iRow, cRows) {
        result := ComCall(9, this, "ptr", _iRow, "ptr", cRows, "ptr*", &pcRowsDeleted := 0, "HRESULT")
        return pcRowsDeleted
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {Pointer} 
     */
    insertRows(_iRow, cRows) {
        result := ComCall(10, this, "ptr", _iRow, "ptr", cRows, "ptr*", &pcRowsInserted := 0, "HRESULT")
        return pcRowsInserted
    }

    /**
     * 
     * @param {Pointer} iRowStart 
     * @param {Pointer} iColumn 
     * @param {VARIANT} _val 
     * @param {OSPFIND} findFlags 
     * @param {OSPCOMP} compType 
     * @returns {Pointer} 
     */
    find(iRowStart, iColumn, _val, findFlags, compType) {
        result := ComCall(11, this, "ptr", iRowStart, "ptr", iColumn, VARIANT, _val, OSPFIND, findFlags, OSPCOMP, compType, "ptr*", &piRowFound := 0, "HRESULT")
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
        result := ComCall(14, this, BOOL.Ptr, &pbAsynch := 0, "HRESULT")
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

    Query(iid) {
        if (OLEDBSimpleProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getRowCount := CallbackCreate(GetMethod(implObj, "getRowCount"), flags, 2)
        this.vtbl.getColumnCount := CallbackCreate(GetMethod(implObj, "getColumnCount"), flags, 2)
        this.vtbl.getRWStatus := CallbackCreate(GetMethod(implObj, "getRWStatus"), flags, 4)
        this.vtbl.getVariant := CallbackCreate(GetMethod(implObj, "getVariant"), flags, 5)
        this.vtbl.setVariant := CallbackCreate(GetMethod(implObj, "setVariant"), flags, 5)
        this.vtbl.getLocale := CallbackCreate(GetMethod(implObj, "getLocale"), flags, 2)
        this.vtbl.deleteRows := CallbackCreate(GetMethod(implObj, "deleteRows"), flags, 4)
        this.vtbl.insertRows := CallbackCreate(GetMethod(implObj, "insertRows"), flags, 4)
        this.vtbl.find := CallbackCreate(GetMethod(implObj, "find"), flags, 7)
        this.vtbl.addOLEDBSimpleProviderListener := CallbackCreate(GetMethod(implObj, "addOLEDBSimpleProviderListener"), flags, 2)
        this.vtbl.removeOLEDBSimpleProviderListener := CallbackCreate(GetMethod(implObj, "removeOLEDBSimpleProviderListener"), flags, 2)
        this.vtbl.isAsync := CallbackCreate(GetMethod(implObj, "isAsync"), flags, 2)
        this.vtbl.getEstimatedRows := CallbackCreate(GetMethod(implObj, "getEstimatedRows"), flags, 2)
        this.vtbl.stopTransfer := CallbackCreate(GetMethod(implObj, "stopTransfer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getRowCount)
        CallbackFree(this.vtbl.getColumnCount)
        CallbackFree(this.vtbl.getRWStatus)
        CallbackFree(this.vtbl.getVariant)
        CallbackFree(this.vtbl.setVariant)
        CallbackFree(this.vtbl.getLocale)
        CallbackFree(this.vtbl.deleteRows)
        CallbackFree(this.vtbl.insertRows)
        CallbackFree(this.vtbl.find)
        CallbackFree(this.vtbl.addOLEDBSimpleProviderListener)
        CallbackFree(this.vtbl.removeOLEDBSimpleProviderListener)
        CallbackFree(this.vtbl.isAsync)
        CallbackFree(this.vtbl.getEstimatedRows)
        CallbackFree(this.vtbl.stopTransfer)
    }
}

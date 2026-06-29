#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OSPXFER.ahk" { OSPXFER }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct OLEDBSimpleProviderListener extends IUnknown {
    /**
     * The interface identifier for OLEDBSimpleProviderListener
     * @type {Guid}
     */
    static IID := Guid("{e0e270c1-c0be-11d0-8fe4-00a0c90a6341}")

    /**
     * The class identifier for OLEDBSimpleProviderListener
     * @type {Guid}
     */
    static CLSID := Guid("{e0e270c1-c0be-11d0-8fe4-00a0c90a6341}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for OLEDBSimpleProviderListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        aboutToChangeCell : IntPtr
        cellChanged       : IntPtr
        aboutToDeleteRows : IntPtr
        deletedRows       : IntPtr
        aboutToInsertRows : IntPtr
        insertedRows      : IntPtr
        rowsAvailable     : IntPtr
        transferComplete  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := OLEDBSimpleProviderListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} iColumn 
     * @returns {HRESULT} 
     */
    aboutToChangeCell(_iRow, iColumn) {
        result := ComCall(3, this, "ptr", _iRow, "ptr", iColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} iColumn 
     * @returns {HRESULT} 
     */
    cellChanged(_iRow, iColumn) {
        result := ComCall(4, this, "ptr", _iRow, "ptr", iColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    aboutToDeleteRows(_iRow, cRows) {
        result := ComCall(5, this, "ptr", _iRow, "ptr", cRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    deletedRows(_iRow, cRows) {
        result := ComCall(6, this, "ptr", _iRow, "ptr", cRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    aboutToInsertRows(_iRow, cRows) {
        result := ComCall(7, this, "ptr", _iRow, "ptr", cRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    insertedRows(_iRow, cRows) {
        result := ComCall(8, this, "ptr", _iRow, "ptr", cRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} _iRow 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    rowsAvailable(_iRow, cRows) {
        result := ComCall(9, this, "ptr", _iRow, "ptr", cRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {OSPXFER} xfer 
     * @returns {HRESULT} 
     */
    transferComplete(xfer) {
        result := ComCall(10, this, OSPXFER, xfer, "HRESULT")
        return result
    }

    Query(iid) {
        if (OLEDBSimpleProviderListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.aboutToChangeCell := CallbackCreate(GetMethod(implObj, "aboutToChangeCell"), flags, 3)
        this.vtbl.cellChanged := CallbackCreate(GetMethod(implObj, "cellChanged"), flags, 3)
        this.vtbl.aboutToDeleteRows := CallbackCreate(GetMethod(implObj, "aboutToDeleteRows"), flags, 3)
        this.vtbl.deletedRows := CallbackCreate(GetMethod(implObj, "deletedRows"), flags, 3)
        this.vtbl.aboutToInsertRows := CallbackCreate(GetMethod(implObj, "aboutToInsertRows"), flags, 3)
        this.vtbl.insertedRows := CallbackCreate(GetMethod(implObj, "insertedRows"), flags, 3)
        this.vtbl.rowsAvailable := CallbackCreate(GetMethod(implObj, "rowsAvailable"), flags, 3)
        this.vtbl.transferComplete := CallbackCreate(GetMethod(implObj, "transferComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.aboutToChangeCell)
        CallbackFree(this.vtbl.cellChanged)
        CallbackFree(this.vtbl.aboutToDeleteRows)
        CallbackFree(this.vtbl.deletedRows)
        CallbackFree(this.vtbl.aboutToInsertRows)
        CallbackFree(this.vtbl.insertedRows)
        CallbackFree(this.vtbl.rowsAvailable)
        CallbackFree(this.vtbl.transferComplete)
    }
}

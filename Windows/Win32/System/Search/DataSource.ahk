#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DataSourceListener.ahk" { DataSourceListener }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DataSource extends IUnknown {
    /**
     * The interface identifier for DataSource
     * @type {Guid}
     */
    static IID := Guid("{7c0ffab3-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The class identifier for DataSource
     * @type {Guid}
     */
    static CLSID := Guid("{7c0ffab3-cd84-11d0-949a-00a0c91110ed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DataSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        getDataMember            : IntPtr
        getDataMemberName        : IntPtr
        getDataMemberCount       : IntPtr
        addDataSourceListener    : IntPtr
        removeDataSourceListener : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DataSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    getDataMember(bstrDM, riid) {
        bstrDMMarshal := bstrDM is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, bstrDMMarshal, bstrDM, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {Pointer<Integer>} 
     */
    getDataMemberName(lIndex) {
        result := ComCall(4, this, "int", lIndex, "ptr*", &pbstrDM := 0, "HRESULT")
        return pbstrDM
    }

    /**
     * 
     * @returns {Integer} 
     */
    getDataMemberCount() {
        result := ComCall(5, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {DataSourceListener} pDSL 
     * @returns {HRESULT} 
     */
    addDataSourceListener(pDSL) {
        result := ComCall(6, this, "ptr", pDSL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DataSourceListener} pDSL 
     * @returns {HRESULT} 
     */
    removeDataSourceListener(pDSL) {
        result := ComCall(7, this, "ptr", pDSL, "HRESULT")
        return result
    }

    Query(iid) {
        if (DataSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getDataMember := CallbackCreate(GetMethod(implObj, "getDataMember"), flags, 4)
        this.vtbl.getDataMemberName := CallbackCreate(GetMethod(implObj, "getDataMemberName"), flags, 3)
        this.vtbl.getDataMemberCount := CallbackCreate(GetMethod(implObj, "getDataMemberCount"), flags, 2)
        this.vtbl.addDataSourceListener := CallbackCreate(GetMethod(implObj, "addDataSourceListener"), flags, 2)
        this.vtbl.removeDataSourceListener := CallbackCreate(GetMethod(implObj, "removeDataSourceListener"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getDataMember)
        CallbackFree(this.vtbl.getDataMemberName)
        CallbackFree(this.vtbl.getDataMemberCount)
        CallbackFree(this.vtbl.addDataSourceListener)
        CallbackFree(this.vtbl.removeDataSourceListener)
    }
}

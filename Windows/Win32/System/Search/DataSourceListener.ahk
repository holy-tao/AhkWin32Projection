#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DataSourceListener extends IUnknown {
    /**
     * The interface identifier for DataSourceListener
     * @type {Guid}
     */
    static IID := Guid("{7c0ffab2-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The class identifier for DataSourceListener
     * @type {Guid}
     */
    static CLSID := Guid("{7c0ffab2-cd84-11d0-949a-00a0c91110ed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DataSourceListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        dataMemberChanged : IntPtr
        dataMemberAdded   : IntPtr
        dataMemberRemoved : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DataSourceListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberChanged(bstrDM) {
        bstrDMMarshal := bstrDM is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, bstrDMMarshal, bstrDM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberAdded(bstrDM) {
        bstrDMMarshal := bstrDM is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, bstrDMMarshal, bstrDM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @returns {HRESULT} 
     */
    dataMemberRemoved(bstrDM) {
        bstrDMMarshal := bstrDM is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, bstrDMMarshal, bstrDM, "HRESULT")
        return result
    }

    Query(iid) {
        if (DataSourceListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.dataMemberChanged := CallbackCreate(GetMethod(implObj, "dataMemberChanged"), flags, 2)
        this.vtbl.dataMemberAdded := CallbackCreate(GetMethod(implObj, "dataMemberAdded"), flags, 2)
        this.vtbl.dataMemberRemoved := CallbackCreate(GetMethod(implObj, "dataMemberRemoved"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.dataMemberChanged)
        CallbackFree(this.vtbl.dataMemberAdded)
        CallbackFree(this.vtbl.dataMemberRemoved)
    }
}

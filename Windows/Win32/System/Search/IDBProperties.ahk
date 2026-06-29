#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBPROPINFOSET.ahk" { DBPROPINFOSET }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPROPIDSET.ahk" { DBPROPIDSET }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBProperties extends IUnknown {
    /**
     * The interface identifier for IDBProperties
     * @type {Guid}
     */
    static IID := Guid("{0c733a8a-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties   : IntPtr
        GetPropertyInfo : IntPtr
        SetProperties   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgPropertySets 
     * @returns {HRESULT} 
     */
    GetProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertySets, prgPropertySets) {
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : "ptr"
        prgPropertySetsMarshal := prgPropertySets is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", cPropertyIDSets, DBPROPIDSET.Ptr, rgPropertyIDSets, pcPropertySetsMarshal, pcPropertySets, prgPropertySetsMarshal, prgPropertySets, "HRESULT")
        return result
    }

    /**
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertyInfoSets 
     * @param {Pointer<Pointer<DBPROPINFOSET>>} prgPropertyInfoSets 
     * @param {Pointer<Pointer<Integer>>} ppDescBuffer 
     * @returns {HRESULT} If the function is successful, the return value is a pointer to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(cPropertyIDSets, rgPropertyIDSets, pcPropertyInfoSets, prgPropertyInfoSets, ppDescBuffer) {
        pcPropertyInfoSetsMarshal := pcPropertyInfoSets is VarRef ? "uint*" : "ptr"
        prgPropertyInfoSetsMarshal := prgPropertyInfoSets is VarRef ? "ptr*" : "ptr"
        ppDescBufferMarshal := ppDescBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cPropertyIDSets, DBPROPIDSET.Ptr, rgPropertyIDSets, pcPropertyInfoSetsMarshal, pcPropertyInfoSets, prgPropertyInfoSetsMarshal, prgPropertyInfoSets, ppDescBufferMarshal, ppDescBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    SetProperties(cPropertySets, rgPropertySets) {
        result := ComCall(5, this, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDBProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 5)
        this.vtbl.GetPropertyInfo := CallbackCreate(GetMethod(implObj, "GetPropertyInfo"), flags, 6)
        this.vtbl.SetProperties := CallbackCreate(GetMethod(implObj, "SetProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetPropertyInfo)
        CallbackFree(this.vtbl.SetProperties)
    }
}

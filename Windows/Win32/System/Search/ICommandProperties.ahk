#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPROPIDSET.ahk" { DBPROPIDSET }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommandProperties extends IUnknown {
    /**
     * The interface identifier for ICommandProperties
     * @type {Guid}
     */
    static IID := Guid("{0c733a79-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommandProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties : IntPtr
        SetProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommandProperties.Vtbl()
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
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    SetProperties(cPropertySets, rgPropertySets) {
        result := ComCall(4, this, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommandProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 5)
        this.vtbl.SetProperties := CallbackCreate(GetMethod(implObj, "SetProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.SetProperties)
    }
}

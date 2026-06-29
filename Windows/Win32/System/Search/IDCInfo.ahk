#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DCINFO.ahk" { DCINFO }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDCInfo extends IUnknown {
    /**
     * The interface identifier for IDCInfo
     * @type {Guid}
     */
    static IID := Guid("{0c733a9c-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInfo : IntPtr
        SetInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<Integer>} rgeInfoType 
     * @returns {Pointer<DCINFO>} 
     */
    GetInfo(cInfo, rgeInfoType) {
        rgeInfoTypeMarshal := rgeInfoType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cInfo, rgeInfoTypeMarshal, rgeInfoType, "ptr*", &prgInfo := 0, "HRESULT")
        return prgInfo
    }

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<DCINFO>} rgInfo 
     * @returns {HRESULT} 
     */
    SetInfo(cInfo, rgInfo) {
        result := ComCall(4, this, "uint", cInfo, DCINFO.Ptr, rgInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 4)
        this.vtbl.SetInfo := CallbackCreate(GetMethod(implObj, "SetInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInfo)
        CallbackFree(this.vtbl.SetInfo)
    }
}

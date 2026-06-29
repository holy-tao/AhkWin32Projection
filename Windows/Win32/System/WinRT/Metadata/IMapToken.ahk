#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMapToken extends IUnknown {
    /**
     * The interface identifier for IMapToken
     * @type {Guid}
     */
    static IID := Guid("{06a3ea8b-0225-11d1-bf72-00c04fc31e12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMapToken interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Map : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMapToken.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} tkImp 
     * @param {Integer} tkEmit 
     * @returns {HRESULT} 
     */
    Map(tkImp, tkEmit) {
        result := ComCall(3, this, "uint", tkImp, "uint", tkEmit, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMapToken.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Map := CallbackCreate(GetMethod(implObj, "Map"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Map)
    }
}

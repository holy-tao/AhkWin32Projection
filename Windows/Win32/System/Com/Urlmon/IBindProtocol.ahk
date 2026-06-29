#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\IBindCtx.ahk" { IBindCtx }
#Import "..\IBinding.ahk" { IBinding }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IBindProtocol extends IUnknown {
    /**
     * The interface identifier for IBindProtocol
     * @type {Guid}
     */
    static IID := Guid("{79eac9cd-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBindProtocol interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateBinding : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBindProtocol.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} szUrl 
     * @param {IBindCtx} pbc 
     * @returns {IBinding} 
     */
    CreateBinding(szUrl, pbc) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(3, this, "ptr", szUrl, "ptr", pbc, "ptr*", &ppb := 0, "HRESULT")
        return IBinding(ppb)
    }

    Query(iid) {
        if (IBindProtocol.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBinding := CallbackCreate(GetMethod(implObj, "CreateBinding"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBinding)
    }
}

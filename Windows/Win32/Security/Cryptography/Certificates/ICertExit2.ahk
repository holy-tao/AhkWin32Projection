#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICertExit.ahk" { ICertExit }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertManageModule.ahk" { ICertManageModule }

/**
 * Provide communications between the Certificate Services server and an exit module.
 * @see https://learn.microsoft.com/windows/win32/api/certexit/nn-certexit-icertexit2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertExit2 extends ICertExit {
    /**
     * The interface identifier for ICertExit2
     * @type {Guid}
     */
    static IID := Guid("{0abf484b-d049-464d-a7ed-552e7529b0ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertExit2 interfaces
    */
    struct Vtbl extends ICertExit.Vtbl {
        GetManageModule : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertExit2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the ICertManageModule interface associated with the ICertExit2 interface by calling GetManageModule and passing in the address of a pointer to an ICertManageModule.
     * @returns {ICertManageModule} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nn-certmod-icertmanagemodule">ICertManageModule</a> interface associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certexit/nn-certexit-icertexit2">ICertExit2</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit2-getmanagemodule
     */
    GetManageModule() {
        result := ComCall(10, this, "ptr*", &ppManageModule := 0, "HRESULT")
        return ICertManageModule(ppManageModule)
    }

    Query(iid) {
        if (ICertExit2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetManageModule := CallbackCreate(GetMethod(implObj, "GetManageModule"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetManageModule)
    }
}

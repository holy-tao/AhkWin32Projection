#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUri.ahk" { IUri }
#Import ".\ITargetFramePriv.ahk" { ITargetFramePriv }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITargetFramePriv2 extends ITargetFramePriv {
    /**
     * The interface identifier for ITargetFramePriv2
     * @type {Guid}
     */
    static IID := Guid("{b2c867e6-69d6-46f2-a611-ded9a4bd7fef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetFramePriv2 interfaces
    */
    struct Vtbl extends ITargetFramePriv.Vtbl {
        AggregatedNavigation2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetFramePriv2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pbc 
     * @param {IBindStatusCallback} pibsc 
     * @param {PWSTR} pszTargetName 
     * @param {IUri} pUri 
     * @param {PWSTR} pszLocation 
     * @returns {HRESULT} 
     */
    AggregatedNavigation2(grfHLNF, pbc, pibsc, pszTargetName, pUri, pszLocation) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszLocation := pszLocation is String ? StrPtr(pszLocation) : pszLocation

        result := ComCall(9, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pszTargetName, "ptr", pUri, "ptr", pszLocation, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITargetFramePriv2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AggregatedNavigation2 := CallbackCreate(GetMethod(implObj, "AggregatedNavigation2"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AggregatedNavigation2)
    }
}

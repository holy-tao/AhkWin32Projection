#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AUTHENTICATEINFO.ahk" { AUTHENTICATEINFO }
#Import ".\IAuthenticate.ahk" { IAuthenticate }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IAuthenticateEx extends IAuthenticate {
    /**
     * The interface identifier for IAuthenticateEx
     * @type {Guid}
     */
    static IID := Guid("{2ad1edaf-d83d-48b5-9adf-03dbe19f53bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAuthenticateEx interfaces
    */
    struct Vtbl extends IAuthenticate.Vtbl {
        AuthenticateEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAuthenticateEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<PWSTR>} pszPassword 
     * @param {Pointer<AUTHENTICATEINFO>} pauthinfo 
     * @returns {HRESULT} 
     */
    AuthenticateEx(phwnd, pszUsername, pszPassword, pauthinfo) {
        pszUsernameMarshal := pszUsername is VarRef ? "ptr*" : "ptr"
        pszPasswordMarshal := pszPassword is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, HWND.Ptr, phwnd, pszUsernameMarshal, pszUsername, pszPasswordMarshal, pszPassword, AUTHENTICATEINFO.Ptr, pauthinfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAuthenticateEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AuthenticateEx := CallbackCreate(GetMethod(implObj, "AuthenticateEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AuthenticateEx)
    }
}

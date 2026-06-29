#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method which is called when the picture that represents a user account is changed.
 * @remarks
 * Applications that want to notify users through this interface can add their class identifier (CLSID) strings as values under this key: 
 * 
 * <pre><b>HKEY_LOCAL_MACHINE</b>
 *    <b>SOFTWARE</b>
 *       <b>Microsoft</b>
 *          <b>Windows</b>
 *             <b>CurrentVersion</b>
 *                <b>UserPictureChange</b></pre>
 * 
 * 
 * The values under this key are enumerated to create this callback object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iuseraccountchangecallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IUserAccountChangeCallback extends IUnknown {
    /**
     * The interface identifier for IUserAccountChangeCallback
     * @type {Guid}
     */
    static IID := Guid("{a561e69a-b4b8-4113-91a5-64c6bcca3430}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserAccountChangeCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPictureChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserAccountChangeCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called to send notifications when the picture that represents a user account is changed.
     * @remarks
     * When the picture that represents a user account changes, the callback object notifies all applications that are registered under this registry subkey:
     * 
     * <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows</b>
     *             <b>CurrentVersion</b>
     *                <b>UserPictureChange</b></pre>
     * @param {PWSTR} pszUserName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a string that contains the user name. Set this parameter to <b>NULL</b> to specify the current user.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iuseraccountchangecallback-onpicturechange
     */
    OnPictureChange(pszUserName) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszUserName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUserAccountChangeCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPictureChange := CallbackCreate(GetMethod(implObj, "OnPictureChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPictureChange)
    }
}

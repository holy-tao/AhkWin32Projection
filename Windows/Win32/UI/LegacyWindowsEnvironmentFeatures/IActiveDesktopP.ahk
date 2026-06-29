#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that manage the Windows Desktop.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-iactivedesktopp
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct IActiveDesktopP extends IUnknown {
    /**
     * The interface identifier for IActiveDesktopP
     * @type {Guid}
     */
    static IID := Guid("{52502ee0-ec80-11d0-89ab-00c04fc2972d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveDesktopP interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSafeMode      : IntPtr
        EnsureUpdateHTML : IntPtr
        SetScheme        : IntPtr
        GetScheme        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveDesktopP.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets or updates the Microsoft Active Desktop to safe mode.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * One of the following flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-iactivedesktopp-setsafemode
     */
    SetSafeMode(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnsureUpdateHTML() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSchemeName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetScheme(pwszSchemeName, dwFlags) {
        pwszSchemeName := pwszSchemeName is String ? StrPtr(pwszSchemeName) : pwszSchemeName

        result := ComCall(5, this, "ptr", pwszSchemeName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSchemeName 
     * @param {Pointer<Integer>} pdwcchBuffer 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetScheme(pwszSchemeName, pdwcchBuffer, dwFlags) {
        pwszSchemeName := pwszSchemeName is String ? StrPtr(pwszSchemeName) : pwszSchemeName

        pdwcchBufferMarshal := pdwcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszSchemeName, pdwcchBufferMarshal, pdwcchBuffer, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveDesktopP.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSafeMode := CallbackCreate(GetMethod(implObj, "SetSafeMode"), flags, 2)
        this.vtbl.EnsureUpdateHTML := CallbackCreate(GetMethod(implObj, "EnsureUpdateHTML"), flags, 1)
        this.vtbl.SetScheme := CallbackCreate(GetMethod(implObj, "SetScheme"), flags, 3)
        this.vtbl.GetScheme := CallbackCreate(GetMethod(implObj, "GetScheme"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSafeMode)
        CallbackFree(this.vtbl.EnsureUpdateHTML)
        CallbackFree(this.vtbl.SetScheme)
        CallbackFree(this.vtbl.GetScheme)
    }
}

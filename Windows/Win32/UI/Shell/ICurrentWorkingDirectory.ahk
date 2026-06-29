#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable a client to retrieve or set an object's current working directory.
 * @remarks
 * Implement this interface if your object allows clients to retrieve or set the current working directory.
 * 
 * Use this interface to retrieve or set the working directory of the object that exports it.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-icurrentworkingdirectory
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICurrentWorkingDirectory extends IUnknown {
    /**
     * The interface identifier for ICurrentWorkingDirectory
     * @type {Guid}
     */
    static IID := Guid("{91956d21-9276-11d1-921a-006097df5bd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICurrentWorkingDirectory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDirectory : IntPtr
        SetDirectory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICurrentWorkingDirectory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current working directory.
     * @param {PWSTR} pwzPath Type: <b>PWSTR</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the current working directory's fully qualified path as a null-terminated Unicode string.
     * @param {Integer} cchSize Type: <b>DWORD</b>
     * 
     * The size of the buffer in Unicode characters, including the terminating <b>NULL</b> character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-icurrentworkingdirectory-getdirectory
     */
    GetDirectory(pwzPath, cchSize) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath

        result := ComCall(3, this, "ptr", pwzPath, "uint", cchSize, "HRESULT")
        return result
    }

    /**
     * Sets the current working directory.
     * @param {PWSTR} pwzPath Type: <b>PCWSTR</b>
     * 
     * A pointer to the fully qualified path of the new working directory, as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-icurrentworkingdirectory-setdirectory
     */
    SetDirectory(pwzPath) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath

        result := ComCall(4, this, "ptr", pwzPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICurrentWorkingDirectory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDirectory := CallbackCreate(GetMethod(implObj, "GetDirectory"), flags, 3)
        this.vtbl.SetDirectory := CallbackCreate(GetMethod(implObj, "SetDirectory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDirectory)
        CallbackFree(this.vtbl.SetDirectory)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods to set default icons associated with an object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idefaultextracticoninit
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDefaultExtractIconInit extends IUnknown {
    /**
     * The interface identifier for IDefaultExtractIconInit
     * @type {Guid}
     */
    static IID := Guid("{41ded17d-d6b3-4261-997d-88c60e4b1d58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDefaultExtractIconInit interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFlags        : IntPtr
        SetKey          : IntPtr
        SetNormalIcon   : IntPtr
        SetOpenIcon     : IntPtr
        SetShortcutIcon : IntPtr
        SetDefaultIcon  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDefaultExtractIconInit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets GIL_XXX flags.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * Specifies return flags to get icon location.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setflags
     */
    SetFlags(uFlags) {
        result := ComCall(3, this, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * Sets the registry key from which to load the &quot;DefaultIcon&quot; value.
     * @remarks
     * It is recommended that any call to <b>IDefaultExtractIconInit::SetKey</b> come before any calls to the SetXxxIcon methods.
     * @param {HKEY} _hkey Type: <b>HKEY</b>
     * 
     * A handle to the registry key.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setkey
     */
    SetKey(_hkey) {
        result := ComCall(4, this, HKEY, _hkey, "HRESULT")
        return result
    }

    /**
     * Sets the normal icon.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * A Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setnormalicon
     */
    SetNormalIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(5, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the icon that allows containers to specify an &quot;open&quot; look.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setopenicon
     */
    SetOpenIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(6, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the icon for a shortcut to the object.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setshortcuticon
     */
    SetShortcutIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the default icon.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * The Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setdefaulticon
     */
    SetDefaultIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(8, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDefaultExtractIconInit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFlags := CallbackCreate(GetMethod(implObj, "SetFlags"), flags, 2)
        this.vtbl.SetKey := CallbackCreate(GetMethod(implObj, "SetKey"), flags, 2)
        this.vtbl.SetNormalIcon := CallbackCreate(GetMethod(implObj, "SetNormalIcon"), flags, 3)
        this.vtbl.SetOpenIcon := CallbackCreate(GetMethod(implObj, "SetOpenIcon"), flags, 3)
        this.vtbl.SetShortcutIcon := CallbackCreate(GetMethod(implObj, "SetShortcutIcon"), flags, 3)
        this.vtbl.SetDefaultIcon := CallbackCreate(GetMethod(implObj, "SetDefaultIcon"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFlags)
        CallbackFree(this.vtbl.SetKey)
        CallbackFree(this.vtbl.SetNormalIcon)
        CallbackFree(this.vtbl.SetOpenIcon)
        CallbackFree(this.vtbl.SetShortcutIcon)
        CallbackFree(this.vtbl.SetDefaultIcon)
    }
}

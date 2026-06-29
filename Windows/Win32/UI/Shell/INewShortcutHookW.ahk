#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods to create a new Internet shortcut. (Unicode)
 * @remarks
 * You do not typically implement <b>INewShortcutHook</b>. It is implemented by the Shell for Internet shortcuts.
 * 
 * You use <b>INewShortcutHook</b> when creating a new Internet shortcut. The methods provided by this interface are supplied as a convenience.
 * 
 * <b>INewShortcutHook</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed methods are specific to <b>INewShortcutHook</b>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shlobj.h header defines INewShortcutHook as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-inewshortcuthookw
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 */
export default struct INewShortcutHookW extends IUnknown {
    /**
     * The interface identifier for INewShortcutHookW
     * @type {Guid}
     */
    static IID := Guid("{000214f7-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INewShortcutHookW interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetReferent  : IntPtr
        GetReferent  : IntPtr
        SetFolder    : IntPtr
        GetFolder    : IntPtr
        GetName      : IntPtr
        GetExtension : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INewShortcutHookW.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the referent of the shortcut object. (Unicode)
     * @remarks
     * For Internet shortcut objects, this method is the same as <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/dd565676(v=vs.85)">IUniformResourceLocator::SetURL</a>.
     * @param {PWSTR} pcszReferent TBD
     * @param {HWND} _hwnd TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthookw-setreferent
     */
    SetReferent(pcszReferent, _hwnd) {
        pcszReferent := pcszReferent is String ? StrPtr(pcszReferent) : pcszReferent

        result := ComCall(3, this, "ptr", pcszReferent, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Gets the referent of the shortcut object. (Unicode)
     * @remarks
     * For Internet shortcut objects, this method is the same as <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/dd565674(v=vs.85)">IUniformResourceLocator::GetURL</a>.
     * @param {PWSTR} pszReferent Type: <b>PTSTR</b>
     * 
     * A pointer to a string that receives the referent.
     * @param {Integer} cchReferent Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszReferent</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthookw-getreferent
     */
    GetReferent(pszReferent, cchReferent) {
        pszReferent := pszReferent is String ? StrPtr(pszReferent) : pszReferent

        result := ComCall(4, this, "ptr", pszReferent, "int", cchReferent, "HRESULT")
        return result
    }

    /**
     * Sets the folder name for the shortcut object. (Unicode)
     * @param {PWSTR} pcszFolder TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthookw-setfolder
     */
    SetFolder(pcszFolder) {
        pcszFolder := pcszFolder is String ? StrPtr(pcszFolder) : pcszFolder

        result := ComCall(5, this, "ptr", pcszFolder, "HRESULT")
        return result
    }

    /**
     * Gets the folder name for the shortcut object. (Unicode)
     * @param {PWSTR} pszFolder Type: <b>PTSTR</b>
     * 
     * The address of a character buffer that receives the folder name.
     * @param {Integer} cchFolder Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszFolder</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if no folder has been assigned, or a standard error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthookw-getfolder
     */
    GetFolder(pszFolder, cchFolder) {
        pszFolder := pszFolder is String ? StrPtr(pszFolder) : pszFolder

        result := ComCall(6, this, "ptr", pszFolder, "int", cchFolder, "HRESULT")
        return result
    }

    /**
     * Gets the file name of the shortcut object, without the extension. (Unicode)
     * @param {PWSTR} pszName Type: <b>PTSTR</b>
     * 
     * A pointer to a string that receives the name.
     * @param {Integer} cchName Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszName</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthookw-getname
     */
    GetName(pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "int", cchName, "HRESULT")
        return result
    }

    /**
     * Gets the file name extension for the shortcut object. (Unicode)
     * @param {PWSTR} pszExtension Type: <b>PTSTR</b>
     * 
     * Pointer to a string that receives the extension.
     * @param {Integer} cchExtension Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszExtension</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthookw-getextension
     */
    GetExtension(pszExtension, cchExtension) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(8, this, "ptr", pszExtension, "int", cchExtension, "HRESULT")
        return result
    }

    Query(iid) {
        if (INewShortcutHookW.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetReferent := CallbackCreate(GetMethod(implObj, "SetReferent"), flags, 3)
        this.vtbl.GetReferent := CallbackCreate(GetMethod(implObj, "GetReferent"), flags, 3)
        this.vtbl.SetFolder := CallbackCreate(GetMethod(implObj, "SetFolder"), flags, 2)
        this.vtbl.GetFolder := CallbackCreate(GetMethod(implObj, "GetFolder"), flags, 3)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 3)
        this.vtbl.GetExtension := CallbackCreate(GetMethod(implObj, "GetExtension"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetReferent)
        CallbackFree(this.vtbl.GetReferent)
        CallbackFree(this.vtbl.SetFolder)
        CallbackFree(this.vtbl.GetFolder)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetExtension)
    }
}

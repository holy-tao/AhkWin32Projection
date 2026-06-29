#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBrowserService2.ahk" { IBrowserService2 }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Deprecated. (IBrowserService3)
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice2">IBrowserService2</a> interfaces, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice3
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBrowserService3 extends IBrowserService2 {
    /**
     * The interface identifier for IBrowserService3
     * @type {Guid}
     */
    static IID := Guid("{27d7ce21-762d-48f3-86f3-40e2fd3749c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBrowserService3 interfaces
    */
    struct Vtbl extends IBrowserService2.Vtbl {
        _PositionViewWindow  : IntPtr
        IEParseDisplayNameEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBrowserService3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. Used in view size negotiations. This method is called by _UpdateViewRectSize after determining the available dimensions.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the view window.
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the available dimensions.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice3-_positionviewwindow
     */
    _PositionViewWindow(_hwnd, prc) {
        result := ComCall(95, this, HWND, _hwnd, RECT.Ptr, prc, "HRESULT")
        return result
    }

    /**
     * Deprecated. Parses a URL into a pointer to an item identifier list (PIDL). (IBrowserService3.IEParseDisplayNameEx)
     * @remarks
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-ieparsedisplayname">IEParseDisplayName</a>.
     * @param {Integer} uiCP Type: <b>UINT</b>
     * 
     * The code page (for example, CP_ACP, the system default code page).
     * @param {PWSTR} pwszPath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the URL to parse, as a Unicode string.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The following value, if desired.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * The PIDL created from the parsed URL.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice3-ieparsedisplaynameex
     */
    IEParseDisplayNameEx(uiCP, pwszPath, dwFlags) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(96, this, "uint", uiCP, "ptr", pwszPath, "uint", dwFlags, "ptr*", &ppidlOut := 0, "HRESULT")
        return ppidlOut
    }

    Query(iid) {
        if (IBrowserService3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl._PositionViewWindow := CallbackCreate(GetMethod(implObj, "_PositionViewWindow"), flags, 3)
        this.vtbl.IEParseDisplayNameEx := CallbackCreate(GetMethod(implObj, "IEParseDisplayNameEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl._PositionViewWindow)
        CallbackFree(this.vtbl.IEParseDisplayNameEx)
    }
}

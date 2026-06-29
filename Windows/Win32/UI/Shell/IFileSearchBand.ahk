#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileSearchBand extends IDispatch {
    /**
     * The interface identifier for IFileSearchBand
     * @type {Guid}
     */
    static IID := Guid("{2d91eea1-9932-11d2-be86-00a0c9a83da1}")

    /**
     * The class identifier for FileSearchBand
     * @type {Guid}
     */
    static CLSID := Guid("{c4ee31f3-4768-11d2-be5c-00a0c9a83da1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSearchBand interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SetFocus            : IntPtr
        SetSearchParameters : IntPtr
        get_SearchID        : IntPtr
        get_Scope           : IntPtr
        get_QueryFile       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSearchBand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    SearchID {
        get => this.get_SearchID()
    }

    /**
     * @type {VARIANT} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * @type {VARIANT} 
     */
    QueryFile {
        get => this.get_QueryFile()
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @remarks
     * This function sends a [WM_KILLFOCUS](/windows/desktop/inputdev/wm-killfocus) message to the window that loses the keyboard focus and a [WM_SETFOCUS](/windows/desktop/inputdev/wm-setfocus) message to the window that receives the keyboard focus. It also activates either the window that receives the focus or the parent of the window that receives the focus.
     * 
     * If a window is active but does not have the focus, any key pressed produces the [WM_SYSCHAR](/windows/desktop/menurc/wm-syschar), [WM_SYSKEYDOWN](/windows/desktop/inputdev/wm-syskeydown), or [WM_SYSKEYUP](/windows/desktop/inputdev/wm-syskeyup) message. If the VK_MENU key is also pressed, bit 30 of the *lParam* parameter of the message is set. Otherwise, the messages produced do not have this bit set.
     * 
     * By using the [AttachThreadInput function](nf-winuser-attachthreadinput.md), a thread can attach its input processing to another thread. This allows a thread to call SetFocus to set the keyboard focus to a window attached to another thread's message queue.
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearchID 
     * @param {VARIANT_BOOL} bNavToResults 
     * @param {Pointer<VARIANT>} pvarScope 
     * @param {Pointer<VARIANT>} pvarQueryFile 
     * @returns {HRESULT} 
     */
    SetSearchParameters(pbstrSearchID, bNavToResults, pvarScope, pvarQueryFile) {
        result := ComCall(8, this, BSTR.Ptr, pbstrSearchID, VARIANT_BOOL, bNavToResults, VARIANT.Ptr, pvarScope, VARIANT.Ptr, pvarQueryFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SearchID() {
        pbstrSearchID := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrSearchID, "HRESULT")
        return pbstrSearchID
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Scope() {
        pvarScope := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pvarScope, "HRESULT")
        return pvarScope
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_QueryFile() {
        pvarFile := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, pvarFile, "HRESULT")
        return pvarFile
    }

    Query(iid) {
        if (IFileSearchBand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFocus := CallbackCreate(GetMethod(implObj, "SetFocus"), flags, 1)
        this.vtbl.SetSearchParameters := CallbackCreate(GetMethod(implObj, "SetSearchParameters"), flags, 5)
        this.vtbl.get_SearchID := CallbackCreate(GetMethod(implObj, "get_SearchID"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
        this.vtbl.get_QueryFile := CallbackCreate(GetMethod(implObj, "get_QueryFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFocus)
        CallbackFree(this.vtbl.SetSearchParameters)
        CallbackFree(this.vtbl.get_SearchID)
        CallbackFree(this.vtbl.get_Scope)
        CallbackFree(this.vtbl.get_QueryFile)
    }
}

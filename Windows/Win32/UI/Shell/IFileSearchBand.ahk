#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSearchBand extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSearchBand
     * @type {Guid}
     */
    static IID => Guid("{2d91eea1-9932-11d2-be86-00a0c9a83da1}")

    /**
     * The class identifier for FileSearchBand
     * @type {Guid}
     */
    static CLSID => Guid("{c4ee31f3-4768-11d2-be5c-00a0c9a83da1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFocus", "SetSearchParameters", "get_SearchID", "get_Scope", "get_QueryFile"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(8, this, "ptr", pbstrSearchID, "short", bNavToResults, "ptr", pvarScope, "ptr", pvarQueryFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SearchID() {
        pbstrSearchID := BSTR()
        result := ComCall(9, this, "ptr", pbstrSearchID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSearchID
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Scope() {
        pvarScope := VARIANT()
        result := ComCall(10, this, "ptr", pvarScope, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarScope
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_QueryFile() {
        pvarFile := VARIANT()
        result := ComCall(11, this, "ptr", pvarFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarFile
    }
}

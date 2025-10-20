#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentProvider.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNode extends IDebugDocumentProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationNode
     * @type {Guid}
     */
    static IID => Guid("{51973c34-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumChildren", "GetParent", "SetDocumentProvider", "Close", "Attach", "Detach"]

    /**
     * 
     * @param {Pointer<IEnumDebugApplicationNodes>} pperddp 
     * @returns {HRESULT} 
     */
    EnumChildren(pperddp) {
        result := ComCall(6, this, "ptr*", pperddp, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<IDebugApplicationNode>} pprddp 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(pprddp) {
        result := ComCall(7, this, "ptr*", pprddp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentProvider} pddp 
     * @returns {HRESULT} 
     */
    SetDocumentProvider(pddp) {
        result := ComCall(8, this, "ptr", pddp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} pdanParent 
     * @returns {HRESULT} 
     */
    Attach(pdanParent) {
        result := ComCall(10, this, "ptr", pdanParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}

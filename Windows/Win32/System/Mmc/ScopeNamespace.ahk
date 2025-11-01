#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ScopeNamespace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ScopeNamespace
     * @type {Guid}
     */
    static IID => Guid("{ebbb48dc-1a3b-4d86-b786-c21b28389012}")

    /**
     * The class identifier for ScopeNamespace
     * @type {Guid}
     */
    static CLSID => Guid("{ebbb48dc-1a3b-4d86-b786-c21b28389012}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParent", "GetChild", "GetNext", "GetRoot", "Expand"]

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Node} Node 
     * @param {Pointer<Node>} Parent 
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
    GetParent(Node, Parent) {
        result := ComCall(7, this, "ptr", Node, "ptr*", Parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Node} Node 
     * @param {Pointer<Node>} Child 
     * @returns {HRESULT} 
     */
    GetChild(Node, Child) {
        result := ComCall(8, this, "ptr", Node, "ptr*", Child, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Node} Node 
     * @param {Pointer<Node>} Next 
     * @returns {HRESULT} 
     */
    GetNext(Node, Next) {
        result := ComCall(9, this, "ptr", Node, "ptr*", Next, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Node>} Root 
     * @returns {HRESULT} 
     */
    GetRoot(Root) {
        result := ComCall(10, this, "ptr*", Root, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Node} Node 
     * @returns {HRESULT} 
     */
    Expand(Node) {
        result := ComCall(11, this, "ptr", Node, "HRESULT")
        return result
    }
}

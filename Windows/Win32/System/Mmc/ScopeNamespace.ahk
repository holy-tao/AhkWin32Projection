#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\Node.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class ScopeNamespace extends IDispatch {

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
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @param {Node} _Node 
     * @returns {Node} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getparent
     */
    GetParent(_Node) {
        result := ComCall(7, this, "ptr", _Node, "ptr*", &Parent := 0, "HRESULT")
        return Node(Parent)
    }

    /**
     * 
     * @param {Node} _Node 
     * @returns {Node} 
     */
    GetChild(_Node) {
        result := ComCall(8, this, "ptr", _Node, "ptr*", &Child := 0, "HRESULT")
        return Node(Child)
    }

    /**
     * 
     * @param {Node} _Node 
     * @returns {Node} 
     */
    GetNext(_Node) {
        result := ComCall(9, this, "ptr", _Node, "ptr*", &Next := 0, "HRESULT")
        return Node(Next)
    }

    /**
     * 
     * @returns {Node} 
     */
    GetRoot() {
        result := ComCall(10, this, "ptr*", &Root := 0, "HRESULT")
        return Node(Root)
    }

    /**
     * 
     * @param {Node} _Node 
     * @returns {HRESULT} 
     */
    Expand(_Node) {
        result := ComCall(11, this, "ptr", _Node, "HRESULT")
        return result
    }
}

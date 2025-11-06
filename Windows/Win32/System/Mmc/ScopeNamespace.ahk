#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Node.ahk
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
     * @returns {Node} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(Node) {
        result := ComCall(7, this, "ptr", Node, "ptr*", &Parent := 0, "HRESULT")
        return Node(Parent)
    }

    /**
     * 
     * @param {Node} Node 
     * @returns {Node} 
     */
    GetChild(Node) {
        result := ComCall(8, this, "ptr", Node, "ptr*", &Child := 0, "HRESULT")
        return Node(Child)
    }

    /**
     * 
     * @param {Node} Node 
     * @returns {Node} 
     */
    GetNext(Node) {
        result := ComCall(9, this, "ptr", Node, "ptr*", &Next := 0, "HRESULT")
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
     * @param {Node} Node 
     * @returns {HRESULT} 
     */
    Expand(Node) {
        result := ComCall(11, this, "ptr", Node, "HRESULT")
        return result
    }
}

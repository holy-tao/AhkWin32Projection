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
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @param {Node} Node_ 
     * @returns {Node} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getparent
     */
    GetParent(Node_) {
        result := ComCall(7, this, "ptr", Node_, "ptr*", &Parent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Node(Parent)
    }

    /**
     * GetChildren Method (ADO)
     * @remarks
     * The provider determines what columns exist in the returned **Recordset**. For example, a document source provider always returns a resource **Recordset**.
     * @param {Node} Node_ 
     * @returns {Node} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getchildren-method-ado
     */
    GetChild(Node_) {
        result := ComCall(8, this, "ptr", Node_, "ptr*", &Child := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Node(Child)
    }

    /**
     * Retrieves a handle to the first control in a group of controls that precedes (or follows) the specified control in a dialog box.
     * @remarks
     * The <b>GetNextDlgGroupItem</b> function searches controls in the order (or reverse order) they were created in the dialog box template. The first control in the group must have the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dlgbox-programming-considerations">WS_GROUP</a> style; all other controls in the group must have been consecutively created and must not have the <b>WS_GROUP</b> style. 
     * 
     * When searching for the previous control, the function returns the first control it locates that is visible and not disabled. If the control specified by <i>hCtl</i> has the <b>WS_GROUP</b> style, the function temporarily reverses the search to locate the first control having the <b>WS_GROUP</b> style, then resumes the search in the original direction, returning the first control it locates that is visible and not disabled, or returning <i>hCtl</i> if no such control is found. 
     * 
     * When searching for the next control, the function returns the first control it locates that is visible, not disabled, and does not have the <b>WS_GROUP</b> style. If it encounters a control having the <b>WS_GROUP</b> style, the function reverses the search, locates the first control having the <b>WS_GROUP</b> style, and returns this control if it is visible and not disabled. Otherwise, the function resumes the search in the original direction and returns the first control it locates that is visible and not disabled, or returns <i>hCtl</i> if no such control is found. 
     * 
     * If the search for the next control in the group encounters a window with the <b>WS_EX_CONTROLPARENT</b> style, the system recursively searches the window's children.
     * @param {Node} Node_ 
     * @returns {Node} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getnextdlggroupitem
     */
    GetNext(Node_) {
        result := ComCall(9, this, "ptr", Node_, "ptr*", &Next := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Node(Next)
    }

    /**
     * GetRoot (Database Engine)
     * @remarks
     * Used to determine the root node in a hierarchy tree.
     * @returns {Node} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/data-types/getroot-database-engine
     */
    GetRoot() {
        result := ComCall(10, this, "ptr*", &Root := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Node(Root)
    }

    /**
     * Hides all descendant nodes, controls, or content of the UI Automation element.
     * @param {Node} Node_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcoreapi/nf-uiautomationcoreapi-expandcollapsepattern_collapse
     */
    Expand(Node_) {
        result := ComCall(11, this, "ptr", Node_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

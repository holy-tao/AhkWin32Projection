#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\TreeViewNode.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeView
     * @type {Guid}
     */
    static IID => Guid("{9353cc5c-dd6e-453c-aedd-0c3ac993978b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RootNodes", "get_SelectionMode", "put_SelectionMode", "get_SelectedNodes", "Expand", "Collapse", "SelectAll", "add_ItemInvoked", "remove_ItemInvoked", "add_Expanding", "remove_Expanding", "add_Collapsed", "remove_Collapsed"]

    /**
     * @type {IVector<TreeViewNode>} 
     */
    RootNodes {
        get => this.get_RootNodes()
    }

    /**
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * @type {IVector<TreeViewNode>} 
     */
    SelectedNodes {
        get => this.get_SelectedNodes()
    }

    /**
     * 
     * @returns {IVector<TreeViewNode>} 
     */
    get_RootNodes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(TreeViewNode, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<TreeViewNode>} 
     */
    get_SelectedNodes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(TreeViewNode, value)
    }

    /**
     * Hides all descendant nodes, controls, or content of the UI Automation element.
     * @param {TreeViewNode} value 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcoreapi/nf-uiautomationcoreapi-expandcollapsepattern_collapse
     */
    Expand(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TreeViewNode} value 
     * @returns {HRESULT} 
     */
    Collapse(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewItemInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemInvoked(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemInvoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewExpandingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Expanding(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Expanding(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewCollapsedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Collapsed(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Collapsed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

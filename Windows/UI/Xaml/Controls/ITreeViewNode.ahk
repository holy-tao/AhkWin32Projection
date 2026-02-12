#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TreeViewNode.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewNode
     * @type {Guid}
     */
    static IID => Guid("{c04c8ed3-9af2-4e75-a329-7497a110e7a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_Content", "get_Parent", "get_IsExpanded", "put_IsExpanded", "get_HasChildren", "get_Depth", "get_HasUnrealizedChildren", "put_HasUnrealizedChildren", "get_Children"]

    /**
     * @type {IInspectable} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {TreeViewNode} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Boolean} 
     */
    IsExpanded {
        get => this.get_IsExpanded()
        set => this.put_IsExpanded(value)
    }

    /**
     * @type {Boolean} 
     */
    HasChildren {
        get => this.get_HasChildren()
    }

    /**
     * @type {Integer} 
     */
    Depth {
        get => this.get_Depth()
    }

    /**
     * @type {Boolean} 
     */
    HasUnrealizedChildren {
        get => this.get_HasUnrealizedChildren()
        set => this.put_HasUnrealizedChildren(value)
    }

    /**
     * @type {IVector<TreeViewNode>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TreeViewNode} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TreeViewNode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExpanded() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExpanded(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasChildren() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Depth() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUnrealizedChildren() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HasUnrealizedChildren(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<TreeViewNode>} 
     */
    get_Children() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(TreeViewNode, value)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Node.ahk" { Node }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct ScopeNamespace extends IDispatch {
    /**
     * The interface identifier for ScopeNamespace
     * @type {Guid}
     */
    static IID := Guid("{ebbb48dc-1a3b-4d86-b786-c21b28389012}")

    /**
     * The class identifier for ScopeNamespace
     * @type {Guid}
     */
    static CLSID := Guid("{ebbb48dc-1a3b-4d86-b786-c21b28389012}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ScopeNamespace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetParent : IntPtr
        GetChild  : IntPtr
        GetNext   : IntPtr
        GetRoot   : IntPtr
        Expand    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ScopeNamespace.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (ScopeNamespace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParent := CallbackCreate(GetMethod(implObj, "GetParent"), flags, 3)
        this.vtbl.GetChild := CallbackCreate(GetMethod(implObj, "GetChild"), flags, 3)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 3)
        this.vtbl.GetRoot := CallbackCreate(GetMethod(implObj, "GetRoot"), flags, 2)
        this.vtbl.Expand := CallbackCreate(GetMethod(implObj, "Expand"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParent)
        CallbackFree(this.vtbl.GetChild)
        CallbackFree(this.vtbl.GetNext)
        CallbackFree(this.vtbl.GetRoot)
        CallbackFree(this.vtbl.Expand)
    }
}

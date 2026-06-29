#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugDocumentProvider.ahk" { IDebugDocumentProvider }
#Import ".\IEnumDebugApplicationNodes.ahk" { IEnumDebugApplicationNodes }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationNode extends IDebugDocumentProvider {
    /**
     * The interface identifier for IDebugApplicationNode
     * @type {Guid}
     */
    static IID := Guid("{51973c34-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationNode interfaces
    */
    struct Vtbl extends IDebugDocumentProvider.Vtbl {
        EnumChildren        : IntPtr
        GetParent           : IntPtr
        SetDocumentProvider : IntPtr
        Close               : IntPtr
        Attach              : IntPtr
        Detach              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationNode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IEnumDebugApplicationNodes} 
     */
    EnumChildren() {
        result := ComCall(6, this, "ptr*", &pperddp := 0, "HRESULT")
        return IEnumDebugApplicationNodes(pperddp)
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {IDebugApplicationNode} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(7, this, "ptr*", &pprddp := 0, "HRESULT")
        return IDebugApplicationNode(pprddp)
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

    Query(iid) {
        if (IDebugApplicationNode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumChildren := CallbackCreate(GetMethod(implObj, "EnumChildren"), flags, 2)
        this.vtbl.GetParent := CallbackCreate(GetMethod(implObj, "GetParent"), flags, 2)
        this.vtbl.SetDocumentProvider := CallbackCreate(GetMethod(implObj, "SetDocumentProvider"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.Attach := CallbackCreate(GetMethod(implObj, "Attach"), flags, 2)
        this.vtbl.Detach := CallbackCreate(GetMethod(implObj, "Detach"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumChildren)
        CallbackFree(this.vtbl.GetParent)
        CallbackFree(this.vtbl.SetDocumentProvider)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.Attach)
        CallbackFree(this.vtbl.Detach)
    }
}

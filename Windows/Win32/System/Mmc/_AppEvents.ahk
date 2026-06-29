#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\_Application.ahk" { _Application }
#Import ".\MenuItem.ahk" { MenuItem }
#Import ".\View.ahk" { View }
#Import ".\Nodes.ahk" { Nodes }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SnapIn.ahk" { SnapIn }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\Node.ahk" { Node }
#Import ".\Document.ahk" { Document }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct _AppEvents extends IDispatch {
    /**
     * The interface identifier for _AppEvents
     * @type {Guid}
     */
    static IID := Guid("{de46cbdd-53f5-4635-af54-4fe71e923d3f}")

    /**
     * The class identifier for _AppEvents
     * @type {Guid}
     */
    static CLSID := Guid("{de46cbdd-53f5-4635-af54-4fe71e923d3f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _AppEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnQuit                 : IntPtr
        OnDocumentOpen         : IntPtr
        OnDocumentClose        : IntPtr
        OnSnapInAdded          : IntPtr
        OnSnapInRemoved        : IntPtr
        OnNewView              : IntPtr
        OnViewClose            : IntPtr
        OnViewChange           : IntPtr
        OnSelectionChange      : IntPtr
        OnContextMenuExecuted  : IntPtr
        OnToolbarButtonClicked : IntPtr
        OnListUpdated          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _AppEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {_Application} _Application 
     * @returns {HRESULT} 
     */
    OnQuit(_Application) {
        result := ComCall(7, this, "ptr", _Application, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @param {BOOL} New 
     * @returns {HRESULT} 
     */
    OnDocumentOpen(_Document, New) {
        result := ComCall(8, this, "ptr", _Document, BOOL, New, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @returns {HRESULT} 
     */
    OnDocumentClose(_Document) {
        result := ComCall(9, this, "ptr", _Document, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @param {SnapIn} _SnapIn 
     * @returns {HRESULT} 
     */
    OnSnapInAdded(_Document, _SnapIn) {
        result := ComCall(10, this, "ptr", _Document, "ptr", _SnapIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @param {SnapIn} _SnapIn 
     * @returns {HRESULT} 
     */
    OnSnapInRemoved(_Document, _SnapIn) {
        result := ComCall(11, this, "ptr", _Document, "ptr", _SnapIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @returns {HRESULT} 
     */
    OnNewView(_View) {
        result := ComCall(12, this, "ptr", _View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @returns {HRESULT} 
     */
    OnViewClose(_View) {
        result := ComCall(13, this, "ptr", _View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @param {Node} NewOwnerNode 
     * @returns {HRESULT} 
     */
    OnViewChange(_View, NewOwnerNode) {
        result := ComCall(14, this, "ptr", _View, "ptr", NewOwnerNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @param {Nodes} NewNodes 
     * @returns {HRESULT} 
     */
    OnSelectionChange(_View, NewNodes) {
        result := ComCall(15, this, "ptr", _View, "ptr", NewNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MenuItem} _MenuItem 
     * @returns {HRESULT} 
     */
    OnContextMenuExecuted(_MenuItem) {
        result := ComCall(16, this, "ptr", _MenuItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnToolbarButtonClicked() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @returns {HRESULT} 
     */
    OnListUpdated(_View) {
        result := ComCall(18, this, "ptr", _View, "HRESULT")
        return result
    }

    Query(iid) {
        if (_AppEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnQuit := CallbackCreate(GetMethod(implObj, "OnQuit"), flags, 2)
        this.vtbl.OnDocumentOpen := CallbackCreate(GetMethod(implObj, "OnDocumentOpen"), flags, 3)
        this.vtbl.OnDocumentClose := CallbackCreate(GetMethod(implObj, "OnDocumentClose"), flags, 2)
        this.vtbl.OnSnapInAdded := CallbackCreate(GetMethod(implObj, "OnSnapInAdded"), flags, 3)
        this.vtbl.OnSnapInRemoved := CallbackCreate(GetMethod(implObj, "OnSnapInRemoved"), flags, 3)
        this.vtbl.OnNewView := CallbackCreate(GetMethod(implObj, "OnNewView"), flags, 2)
        this.vtbl.OnViewClose := CallbackCreate(GetMethod(implObj, "OnViewClose"), flags, 2)
        this.vtbl.OnViewChange := CallbackCreate(GetMethod(implObj, "OnViewChange"), flags, 3)
        this.vtbl.OnSelectionChange := CallbackCreate(GetMethod(implObj, "OnSelectionChange"), flags, 3)
        this.vtbl.OnContextMenuExecuted := CallbackCreate(GetMethod(implObj, "OnContextMenuExecuted"), flags, 2)
        this.vtbl.OnToolbarButtonClicked := CallbackCreate(GetMethod(implObj, "OnToolbarButtonClicked"), flags, 1)
        this.vtbl.OnListUpdated := CallbackCreate(GetMethod(implObj, "OnListUpdated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnQuit)
        CallbackFree(this.vtbl.OnDocumentOpen)
        CallbackFree(this.vtbl.OnDocumentClose)
        CallbackFree(this.vtbl.OnSnapInAdded)
        CallbackFree(this.vtbl.OnSnapInRemoved)
        CallbackFree(this.vtbl.OnNewView)
        CallbackFree(this.vtbl.OnViewClose)
        CallbackFree(this.vtbl.OnViewChange)
        CallbackFree(this.vtbl.OnSelectionChange)
        CallbackFree(this.vtbl.OnContextMenuExecuted)
        CallbackFree(this.vtbl.OnToolbarButtonClicked)
        CallbackFree(this.vtbl.OnListUpdated)
    }
}

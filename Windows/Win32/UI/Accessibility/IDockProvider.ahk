#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DockPosition.ahk" { DockPosition }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to an element in a docking container.
 * @remarks
 * <b>IDockProvider</b> does not expose any properties of the docking 
 *         container or any properties of controls that might be docked adjacent to the current 
 *         control in the docking container.
 *         
 * 
 * Controls are docked relative to each other based on their current z-order; 
 *         the higher their z-order placement, the farther they are placed from the specified edge of the docking container.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-idockprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IDockProvider extends IUnknown {
    /**
     * The interface identifier for IDockProvider
     * @type {Guid}
     */
    static IID := Guid("{159bc72c-4ad3-485e-9637-d7052edf0146}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDockProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDockPosition  : IntPtr
        get_DockPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDockProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {DockPosition} 
     */
    DockPosition {
        get => this.get_DockPosition()
    }

    /**
     * Sets the docking position of this element.
     * @remarks
     * A docking container is a control that allows the arrangement of child elements, both horizontally and vertically, relative to the boundaries of the docking container and other elements within the container.
     * @param {DockPosition} _dockPosition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-dockposition">DockPosition</a></b>
     * 
     * The new docking position.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idockprovider-setdockposition
     */
    SetDockPosition(_dockPosition) {
        result := ComCall(3, this, DockPosition, _dockPosition, "HRESULT")
        return result
    }

    /**
     * Indicates the current docking position of this element.
     * @remarks
     * A docking container is a control that allows the arrangement of child elements, both horizontally and vertically, relative to the boundaries of the docking container and other elements in the container.
     * @returns {DockPosition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idockprovider-get_dockposition
     */
    get_DockPosition() {
        result := ComCall(4, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IDockProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDockPosition := CallbackCreate(GetMethod(implObj, "SetDockPosition"), flags, 2)
        this.vtbl.get_DockPosition := CallbackCreate(GetMethod(implObj, "get_DockPosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDockPosition)
        CallbackFree(this.vtbl.get_DockPosition)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DockPosition.ahk" { DockPosition }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that enables child elements to be arranged horizontally and vertically, relative to each other.
 * @remarks
 * Microsoft UI Automation client applications use this interface to access the dock properties of UI Automation elements that function as controls within a docking container. A docking container is a control that allows the arrangement of child elements, both horizontally and vertically, relative to the boundaries of the docking container and other elements within the container. Controls are docked relative to each other based on their current z-order; the higher their z-order placement the farther they are placed from the specified edge of the docking container.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationdockpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationDockPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationDockPattern
     * @type {Guid}
     */
    static IID := Guid("{fde5ef97-1464-48f6-90bf-43d0948e86ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationDockPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDockPosition         : IntPtr
        get_CurrentDockPosition : IntPtr
        get_CachedDockPosition  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationDockPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {DockPosition} 
     */
    CurrentDockPosition {
        get => this.get_CurrentDockPosition()
    }

    /**
     * @type {DockPosition} 
     */
    CachedDockPosition {
        get => this.get_CachedDockPosition()
    }

    /**
     * Sets the dock position of this element.
     * @param {DockPosition} dockPos 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-setdockposition
     */
    SetDockPosition(dockPos) {
        result := ComCall(3, this, DockPosition, dockPos, "HRESULT")
        return result
    }

    /**
     * Retrieves the dock position of this element within its docking container.
     * @returns {DockPosition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-get_currentdockposition
     */
    get_CurrentDockPosition() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached dock position of this element within its docking container.
     * @returns {DockPosition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdockpattern-get_cacheddockposition
     */
    get_CachedDockPosition() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationDockPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDockPosition := CallbackCreate(GetMethod(implObj, "SetDockPosition"), flags, 2)
        this.vtbl.get_CurrentDockPosition := CallbackCreate(GetMethod(implObj, "get_CurrentDockPosition"), flags, 2)
        this.vtbl.get_CachedDockPosition := CallbackCreate(GetMethod(implObj, "get_CachedDockPosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDockPosition)
        CallbackFree(this.vtbl.get_CurrentDockPosition)
        CallbackFree(this.vtbl.get_CachedDockPosition)
    }
}

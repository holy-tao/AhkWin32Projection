#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used in Windows Explorer by an IShellFolder implementation to give suggestions to the view about what panes are visible.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorerpanevisibility
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExplorerPaneVisibility extends IUnknown {
    /**
     * The interface identifier for IExplorerPaneVisibility
     * @type {Guid}
     */
    static IID := Guid("{e07010ec-bc17-44c0-97b0-46c7c95b9edc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExplorerPaneVisibility interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPaneState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExplorerPaneVisibility.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the visibility state of the given Windows Explorer pane.
     * @remarks
     * If the implementer does not care about the state of a given pane and therefore does not want to change it, then the implementer should return a success code for the method and EPS_DONTCARE for the <i>peps</i> parameter. If the method fails, it is treated as if EPS_DONTCARE was returned for the <i>peps</i> parameter.
     * @param {Pointer<Guid>} ep Type: <b>REFEXPLORERPANE</b>
     * 
     * A reference to a GUID that uniquely identifies a Windows Explorer pane. One of the following constants as defined in Shlguid.h.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate">EXPLORERPANESTATE</a>*</b>
     * 
     * When this method returns, contains the visibility state of the given Windows Explorer pane as one of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate">EXPLORERPANESTATE</a> constants.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerpanevisibility-getpanestate
     */
    GetPaneState(ep) {
        result := ComCall(3, this, Guid.Ptr, ep, "uint*", &peps := 0, "HRESULT")
        return peps
    }

    Query(iid) {
        if (IExplorerPaneVisibility.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPaneState := CallbackCreate(GetMethod(implObj, "GetPaneState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPaneState)
    }
}

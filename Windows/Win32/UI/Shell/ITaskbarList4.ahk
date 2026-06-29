#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITaskbarList3.ahk" { ITaskbarList3 }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\STPFLAG.ahk" { STPFLAG }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends ITaskbarList3 by providing a method that allows the caller to control two property values for the tab thumbnail and peek feature.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist">ITaskbarList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist2">ITaskbarList2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist3">ITaskbarList3</a> interfaces, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided in Windows as CLSID_TaskbarList. This interface is not implemented by third parties.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided in Windows as CLSID_TaskbarList. This interface is not implemented by third parties.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use the methods of this interface for the following:
 *                 
 * 
 * <ul>
 * <li>To use the thumbnail image of the application frame window in place of the tab thumbnail in some circumstances.</li>
 * <li>To use the application frame window in place of the tab as the source of the tab's peek image (a full-screen view of the window in response to a mouse-over event in the thumbnail).</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist4
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITaskbarList4 extends ITaskbarList3 {
    /**
     * The interface identifier for ITaskbarList4
     * @type {Guid}
     */
    static IID := Guid("{c43dc798-95d1-4bea-9030-bb99e2983a1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskbarList4 interfaces
    */
    struct Vtbl extends ITaskbarList3.Vtbl {
        SetTabProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskbarList4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows a tab to specify whether the main application frame window or the tab window should be used as a thumbnail or in the peek feature under certain circumstances.
     * @remarks
     * An application might want to use the thumbnail or peek representation of its associated parent window if the application cannot generate its own thumbnail for a tab or for its active tab content (such as an animation) to appear live.
     * @param {HWND} hwndTab Type: <b>HWND</b>
     * 
     * The handle of the tab window that is to have properties set. This handle must already be registered through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-registertab">RegisterTab</a>.
     * @param {STPFLAG} stpFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-stpflag">STPFLAG</a></b>
     * 
     * One or more members of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-stpflag">STPFLAG</a> enumeration that specify the displayed thumbnail and peek image source of the tab thumbnail.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist4-settabproperties
     */
    SetTabProperties(hwndTab, stpFlags) {
        result := ComCall(21, this, HWND, hwndTab, STPFLAG, stpFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskbarList4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTabProperties := CallbackCreate(GetMethod(implObj, "SetTabProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTabProperties)
    }
}

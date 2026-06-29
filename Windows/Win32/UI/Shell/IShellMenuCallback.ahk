#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\SMDATA.ahk" { SMDATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * A callback interface that exposes a method that receives messages from a menu band.
 * @remarks
 * Once you have created the menu band object, pass a pointer to this interface to the menu band object by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>. You receive messages from the menu band through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenucallback-callbacksm">IShellMenuCallback::CallbackSM</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellmenucallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellMenuCallback extends IUnknown {
    /**
     * The interface identifier for IShellMenuCallback
     * @type {Guid}
     */
    static IID := Guid("{4ca300a1-9b8d-11d1-8b22-00c04fd918d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellMenuCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CallbackSM : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellMenuCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Receives messages from a menu band object.
     * @param {Pointer<SMDATA>} psmd Type: <b>LPSMDATA</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-smdata">SMDATA</a> structure that contains information about the menu.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * A message ID. This will be one of the SMC_XXX values. See <a href="https://docs.microsoft.com/windows/desktop/shell/control-panel-applications">Shell Messages and Notifications</a> for a complete list.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * A WPARAM value that contains additional information. See the specific SMC_XXX message reference for details.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * An LPARAM value that contains additional information. See the specific SMC_XXX message reference for details.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenucallback-callbacksm
     */
    CallbackSM(psmd, uMsg, _wParam, _lParam) {
        result := ComCall(3, this, SMDATA.Ptr, psmd, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellMenuCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CallbackSM := CallbackCreate(GetMethod(implObj, "CallbackSM"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CallbackSM)
    }
}

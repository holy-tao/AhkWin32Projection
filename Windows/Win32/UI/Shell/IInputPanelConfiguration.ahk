#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides functionality for desktop apps to opt in to the focus tracking mechanism used in Windows Store apps.
 * @remarks
 * <div class="alert"><b>Warning</b>  <p class="note"><b>IInputPanelConfiguration</b> will not work in Windows 10. 
 * 
 * </div>
 * <div> </div>
 * Implement the <b>IInputPanelConfiguration</b> interface if your Desktop client processes need to leverage the invoking and dismissing semantics of the touch keyboard and handwriting input panel. 
 * 
 * The <b>IInputPanelConfiguration</b> interface enables your app to opt in to the focus tracking mechanism for Windows Store apps.
 * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelconfiguration
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInputPanelConfiguration extends IUnknown {
    /**
     * The interface identifier for IInputPanelConfiguration
     * @type {Guid}
     */
    static IID := Guid("{41c81592-514c-48bd-a22e-e6af638521a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputPanelConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableFocusTracking : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputPanelConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a client process to opt-in to the focus tracking mechanism for Windows Store apps that controls the invoking and dismissing semantics of the touch keyboard.
     * @remarks
     * <div class="alert"><b>Note</b>  <p class="note">This method will not work in Windows 10. A user can manually configure settings through the notification center or through the <b>Typing</b> settings to enable pulling up a touch keyboard automatically when focusing on an edit control.
     * 
     * </div>
     * <div> </div>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nf-inputpanelconfiguration-iinputpanelconfiguration-enablefocustracking
     */
    EnableFocusTracking() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputPanelConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableFocusTracking := CallbackCreate(GetMethod(implObj, "EnableFocusTracking"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableFocusTracking)
    }
}

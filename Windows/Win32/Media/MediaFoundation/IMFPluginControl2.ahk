#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_PLUGIN_CONTROL_POLICY.ahk" { MF_PLUGIN_CONTROL_POLICY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPluginControl.ahk" { IMFPluginControl }

/**
 * Controls how media sources and transforms are enumerated in Microsoft Media Foundation. (IMFPluginControl2)
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetplugincontrol">MFGetPluginControl</a>  and query the returned pointer for <b>IMFPluginControl2</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfplugincontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPluginControl2 extends IMFPluginControl {
    /**
     * The interface identifier for IMFPluginControl2
     * @type {Guid}
     */
    static IID := Guid("{c6982083-3ddc-45cb-af5e-0f7a8ce4de77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPluginControl2 interfaces
    */
    struct Vtbl extends IMFPluginControl.Vtbl {
        SetPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPluginControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the policy for which media sources and transforms are enumerated.
     * @param {MF_PLUGIN_CONTROL_POLICY} policy A value from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_control_policy">MF_PLUGIN_CONTROL_POLICY</a> enumeration that specifies the policy.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol2-setpolicy
     */
    SetPolicy(policy) {
        result := ComCall(9, this, MF_PLUGIN_CONTROL_POLICY, policy, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFPluginControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPolicy := CallbackCreate(GetMethod(implObj, "SetPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPolicy)
    }
}

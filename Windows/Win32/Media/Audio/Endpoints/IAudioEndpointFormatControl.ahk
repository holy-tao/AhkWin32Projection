#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used for resetting the current audio endpoint device format.
 * @remarks
 * This setting is exposed to the user through the "Sounds" control panel  and can be read from the endpoint property store using
 * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/pkey-audioengine-deviceformat">PKEY_AudioEngine_DeviceFormat</a>.
 * @see https://learn.microsoft.com/windows/win32/api/audioendpoints/nn-audioendpoints-iaudioendpointformatcontrol
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointFormatControl extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointFormatControl
     * @type {Guid}
     */
    static IID := Guid("{784cfd40-9f89-456e-a1a6-873b006a664e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointFormatControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResetToDefault : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointFormatControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resets the format to the default setting provided by the device manufacturer.
     * @param {Integer} ResetFlags Allows the application to specify which formats are reset.  If
     *                       no flags are set, then this method reevaluates both the endpoint's 
     *     device format and mix format and sets them to their default values.
     * 
     * ENDPOINT_FORMAT_RESET_MIX_ONLY: Only reset the mix format.  The endpoint's device
     *     format will not be reset if this flag is set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioendpoints/nf-audioendpoints-iaudioendpointformatcontrol-resettodefault
     */
    ResetToDefault(ResetFlags) {
        result := ComCall(3, this, "uint", ResetFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEndpointFormatControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResetToDefault := CallbackCreate(GetMethod(implObj, "ResetToDefault"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResetToDefault)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMixerPinConfig.ahk" { IMixerPinConfig }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\DirectDraw\DDCOLORCONTROL.ahk" { DDCOLORCONTROL }

/**
 * The IMixerPinConfig2 interface is exposed on the input pins of the Overlay Mixer and contains methods that manipulate video color controls, if the VGA chip supports it.This interface derives from the IMixerPinConfig interface.Applications use this interface to get and set video color controls when mixing multiple video streams.
 * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nn-mpconfig-imixerpinconfig2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMixerPinConfig2 extends IMixerPinConfig {
    /**
     * The interface identifier for IMixerPinConfig2
     * @type {Guid}
     */
    static IID := Guid("{ebf47182-8764-11d1-9e69-00c04fd7c15b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMixerPinConfig2 interfaces
    */
    struct Vtbl extends IMixerPinConfig.Vtbl {
        SetOverlaySurfaceColorControls : IntPtr
        GetOverlaySurfaceColorControls : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMixerPinConfig2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the color control settings associated with the specified overlay surface.
     * @param {Pointer<DDCOLORCONTROL>} pColorControl Address of a pointer to the <b>DDCOLORCONTROL</b> structure containing the new values to be applied to the specified surface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. If the allocator on the pin is not using an overlay surface, the method returns E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig2-setoverlaysurfacecolorcontrols
     */
    SetOverlaySurfaceColorControls(pColorControl) {
        result := ComCall(15, this, DDCOLORCONTROL.Ptr, pColorControl, "HRESULT")
        return result
    }

    /**
     * The GetOverlaySurfaceColorControls method retrieves the color control settings associated with the specified overlay surface.
     * @param {Pointer<DDCOLORCONTROL>} pColorControl Address of a pointer to the <b>DDCOLORCONTROL</b> structure containing the color values currently applied to the specified surface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. If the allocator on the pin is not using an overlay surface, the method returns E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig2-getoverlaysurfacecolorcontrols
     */
    GetOverlaySurfaceColorControls(pColorControl) {
        result := ComCall(16, this, DDCOLORCONTROL.Ptr, pColorControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMixerPinConfig2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOverlaySurfaceColorControls := CallbackCreate(GetMethod(implObj, "SetOverlaySurfaceColorControls"), flags, 2)
        this.vtbl.GetOverlaySurfaceColorControls := CallbackCreate(GetMethod(implObj, "GetOverlaySurfaceColorControls"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOverlaySurfaceColorControls)
        CallbackFree(this.vtbl.GetOverlaySurfaceColorControls)
    }
}

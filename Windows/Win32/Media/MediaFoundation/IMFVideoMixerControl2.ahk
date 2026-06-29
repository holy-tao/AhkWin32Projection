#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFVideoMixerControl.ahk" { IMFVideoMixerControl }

/**
 * Controls preferences for video deinterlacing.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideomixercontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoMixerControl2 extends IMFVideoMixerControl {
    /**
     * The interface identifier for IMFVideoMixerControl2
     * @type {Guid}
     */
    static IID := Guid("{8459616d-966e-4930-b658-54fa7e5a16d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoMixerControl2 interfaces
    */
    struct Vtbl extends IMFVideoMixerControl.Vtbl {
        SetMixingPrefs : IntPtr
        GetMixingPrefs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoMixerControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the preferences for video deinterlacing.
     * @param {Integer} dwMixFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideomixprefs">MFVideoMixPrefs</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol2-setmixingprefs
     */
    SetMixingPrefs(dwMixFlags) {
        result := ComCall(7, this, "uint", dwMixFlags, "HRESULT")
        return result
    }

    /**
     * Gets the current preferences for video deinterlacing.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideomixprefs">MFVideoMixPrefs</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol2-getmixingprefs
     */
    GetMixingPrefs() {
        result := ComCall(8, this, "uint*", &pdwMixFlags := 0, "HRESULT")
        return pdwMixFlags
    }

    Query(iid) {
        if (IMFVideoMixerControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMixingPrefs := CallbackCreate(GetMethod(implObj, "SetMixingPrefs"), flags, 2)
        this.vtbl.GetMixingPrefs := CallbackCreate(GetMethod(implObj, "GetMixingPrefs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMixingPrefs)
        CallbackFree(this.vtbl.GetMixingPrefs)
    }
}

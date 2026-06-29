#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMResourceControl interface opens and holds an audio device resource before the device is actually needed, so that playback can be guaranteed or the application can learn in advance that a device is not available.The following filters implement this interface:Audio Capture filter.DirectSound Renderer filter.Audio Renderer (WaveOut) filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamresourcecontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMResourceControl extends IUnknown {
    /**
     * The interface identifier for IAMResourceControl
     * @type {Guid}
     */
    static IID := Guid("{8389d2d0-77d7-11d1-abe6-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMResourceControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reserve : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMResourceControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Reserve method reserves or unreserves a device resource.
     * @remarks
     * A resource can be reserved multiple times. If the method returns S_OK, the filter increments an internal reserve count. For every call to reserve a device that returns S_OK, the caller must make a matching call to unreserve the device.
     * @param {Integer} dwFlags Flag indicating whether to reserve or unreserve this device. The value must be a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_amresctl_reserveflags">AMRESCTL_RESERVEFLAGS</a> enumeration.
     * @returns {HRESULT} Returns S_OK if the device was successfully reserved or unreserved, S_FALSE if the device is currently reserved and will continue to be held, or an <b>HRESULT</b> error code if the device can't be reserved.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamresourcecontrol-reserve
     */
    Reserve(dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "uint", dwFlags, "ptr", pvReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMResourceControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reserve := CallbackCreate(GetMethod(implObj, "Reserve"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reserve)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidPlayback.ahk" { IMSVidPlayback }
#Import ".\IMSVidInputDeviceEvent.ahk" { IMSVidInputDeviceEvent }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This topic applies to Windows XP or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidPlaybackEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidplaybackevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidPlaybackEvent extends IMSVidInputDeviceEvent {
    /**
     * The interface identifier for IMSVidPlaybackEvent
     * @type {Guid}
     */
    static IID := Guid("{37b0353b-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidPlaybackEvent interfaces
    */
    struct Vtbl extends IMSVidInputDeviceEvent.Vtbl {
        EndOfMedia : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidPlaybackEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows XP or later.
     * @remarks
     * The dispatch identifier (dispid) of this method is <b>eventidEndOfMedia</b>.
     * @param {IMSVidPlayback} lpd Specifies a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidplayback">IMSVidPlayback</a> interface of the playback device.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplaybackevent-endofmedia
     */
    EndOfMedia(lpd) {
        result := ComCall(7, this, "ptr", lpd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidPlaybackEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EndOfMedia := CallbackCreate(GetMethod(implObj, "EndOfMedia"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EndOfMedia)
    }
}

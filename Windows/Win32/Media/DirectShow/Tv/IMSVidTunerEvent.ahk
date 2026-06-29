#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidInputDeviceEvent.ahk" { IMSVidInputDeviceEvent }
#Import ".\IMSVidTuner.ahk" { IMSVidTuner }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This topic applies to Windows XP or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidTunerEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidtunerevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidTunerEvent extends IMSVidInputDeviceEvent {
    /**
     * The interface identifier for IMSVidTunerEvent
     * @type {Guid}
     */
    static IID := Guid("{1c15d485-911d-11d2-b632-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidTunerEvent interfaces
    */
    struct Vtbl extends IMSVidInputDeviceEvent.Vtbl {
        TuneChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidTunerEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows XP or later.
     * @remarks
     * The dispatch identifier (dispid) of this method is <b>eventidOnTuneChanged</b>.
     * @param {IMSVidTuner} lpd Pointer to the <b>MSVidTuner</b> object that fired the event.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidtunerevent-tunechanged
     */
    TuneChanged(lpd) {
        result := ComCall(7, this, "ptr", lpd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidTunerEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TuneChanged := CallbackCreate(GetMethod(implObj, "TuneChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TuneChanged)
    }
}

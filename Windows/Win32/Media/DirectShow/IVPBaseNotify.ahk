#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the Overlay Mixer to control the properties of a hardware device such as a decoder that uses a video port. The IVPNotify interface derives from this interface.Applications should never use this interface.
 * @remarks
 * Include Vptype.h before Vpnotify.h.
 * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nn-vpnotify-ivpbasenotify
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVPBaseNotify extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVPBaseNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RenegotiateVPParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVPBaseNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RenegotiateVPParameters method initializes the connection to the decoder.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter negotiates various parameters (by using the <a href="https://docs.microsoft.com/windows/desktop/api/vpconfig/nn-vpconfig-ivpbaseconfig">IVPBaseConfig</a> interface) with the decoder or driver. Call this method if any of those parameters (such as the video format or size) change. Currently, the Overlay Mixer repeats the whole connection process. You can call this method even while the graph is playing.
     * 
     * Include Vptype.h before Vpnotify.h.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpbasenotify-renegotiatevpparameters
     */
    RenegotiateVPParameters() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVPBaseNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenegotiateVPParameters := CallbackCreate(GetMethod(implObj, "RenegotiateVPParameters"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenegotiateVPParameters)
    }
}

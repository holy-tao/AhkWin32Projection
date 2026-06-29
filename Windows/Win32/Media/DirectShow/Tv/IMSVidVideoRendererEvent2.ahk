#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidOutputDeviceEvent.ahk" { IMSVidOutputDeviceEvent }

/**
 * This interface is not implemented.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRendererEvent2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidvideorendererevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidVideoRendererEvent2 extends IMSVidOutputDeviceEvent {
    /**
     * The interface identifier for IMSVidVideoRendererEvent2
     * @type {Guid}
     */
    static IID := Guid("{7145ed66-4730-4fdb-8a53-fde7508d3e5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidVideoRendererEvent2 interfaces
    */
    struct Vtbl extends IMSVidOutputDeviceEvent.Vtbl {
        OverlayUnavailable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidVideoRendererEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not implemented.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererevent2-overlayunavailable
     */
    OverlayUnavailable() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidVideoRendererEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OverlayUnavailable := CallbackCreate(GetMethod(implObj, "OverlayUnavailable"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OverlayUnavailable)
    }
}

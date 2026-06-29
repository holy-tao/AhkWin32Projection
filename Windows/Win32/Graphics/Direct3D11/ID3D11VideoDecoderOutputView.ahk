#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC.ahk" { D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC }
#Import ".\ID3D11View.ahk" { ID3D11View }

/**
 * Identifies the output surfaces that can be accessed during video decoding.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview">ID3D11VideoDevice::CreateVideoDecoderOutputView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videodecoderoutputview
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoDecoderOutputView extends ID3D11View {
    /**
     * The interface identifier for ID3D11VideoDecoderOutputView
     * @type {Guid}
     */
    static IID := Guid("{c2931aea-2a85-4f20-860f-fba1fd256e18}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoDecoderOutputView interfaces
    */
    struct Vtbl extends ID3D11View.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoDecoderOutputView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the properties of the video decoder output view.
     * @param {Pointer<D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_output_view_desc">D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC</a> structure. The method fills the structure with the view properties.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodecoderoutputview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11VideoDecoderOutputView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}

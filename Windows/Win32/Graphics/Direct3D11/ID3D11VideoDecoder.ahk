#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_VIDEO_DECODER_DESC.ahk" { D3D11_VIDEO_DECODER_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_VIDEO_DECODER_CONFIG.ahk" { D3D11_VIDEO_DECODER_CONFIG }

/**
 * Represents a hardware-accelerated video decoder for Microsoft Direct3D 11.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videodecoder
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoDecoder extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11VideoDecoder
     * @type {Guid}
     */
    static IID := Guid("{3c9c5b51-995d-48d1-9b8d-fa5caeded65c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoDecoder interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetCreationParameters : IntPtr
        GetDriverHandle       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoDecoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the parameters that were used to create the decoder.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a> structure that receives a description of the video stream.
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a> structure that receives the decoder configuration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodecoder-getcreationparameters
     */
    GetCreationParameters(pVideoDesc, pConfig) {
        result := ComCall(7, this, D3D11_VIDEO_DECODER_DESC.Ptr, pVideoDesc, D3D11_VIDEO_DECODER_CONFIG.Ptr, pConfig, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the driver.
     * @remarks
     * The driver handle can be used to configure content protection.
     * @returns {HANDLE} Receives a handle to the driver.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodecoder-getdriverhandle
     */
    GetDriverHandle() {
        pDriverHandle := HANDLE.Owned()
        result := ComCall(8, this, HANDLE.Ptr, pDriverHandle, "HRESULT")
        return pDriverHandle
    }

    Query(iid) {
        if (ID3D11VideoDecoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCreationParameters := CallbackCreate(GetMethod(implObj, "GetCreationParameters"), flags, 3)
        this.vtbl.GetDriverHandle := CallbackCreate(GetMethod(implObj, "GetDriverHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCreationParameters)
        CallbackFree(this.vtbl.GetDriverHandle)
    }
}

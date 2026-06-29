#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXVAHD_BLT_STATE.ahk" { DXVAHD_BLT_STATE }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import ".\DXVAHD_STREAM_STATE.ahk" { DXVAHD_STREAM_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DXVAHD_STREAM_DATA.ahk" { DXVAHD_STREAM_DATA }

/**
 * Represents a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nn-dxvahd-idxvahd_videoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDXVAHD_VideoProcessor extends IUnknown {
    /**
     * The interface identifier for IDXVAHD_VideoProcessor
     * @type {Guid}
     */
    static IID := Guid("{95f4edf4-6e03-4cd7-be1b-3075d665aa52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXVAHD_VideoProcessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetVideoProcessBltState    : IntPtr
        GetVideoProcessBltState    : IntPtr
        SetVideoProcessStreamState : IntPtr
        GetVideoProcessStreamState : IntPtr
        VideoProcessBltHD          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXVAHD_VideoProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a state parameter for a blit operation by a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {DXVAHD_BLT_STATE} State The state parameter to set, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Integer} pData A pointer to a buffer that contains the state data. The meaning of the data depends on the <i>State</i> parameter. Each state has a corresponding data structure; for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a>. The caller allocates the buffer and fills in the parameter data before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessbltstate
     */
    SetVideoProcessBltState(State, DataSize, pData) {
        result := ComCall(3, this, DXVAHD_BLT_STATE, State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the value of a state parameter for blit operations performed by a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {DXVAHD_BLT_STATE} State The state parameter to query, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Integer} pData A pointer to a buffer allocated by the caller. The method copies the state data into the buffer. The buffer must be large enough to hold the data structure that corresponds to the state parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-getvideoprocessbltstate
     */
    GetVideoProcessBltState(State, DataSize, pData) {
        result := ComCall(4, this, DXVAHD_BLT_STATE, State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Sets a state parameter for an input stream on a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @remarks
     * Call this method to set state parameters that apply to individual input streams.
     * @param {Integer} StreamNumber The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>MaxStreamStates</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
     * @param {DXVAHD_STREAM_STATE} State The state parameter to set, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Integer} pData A pointer to a buffer that contains the state data. The meaning of the data depends on the <i>State</i> parameter. Each state has a corresponding data structure; for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a>. The caller allocates the buffer and fills in the parameter data before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate
     */
    SetVideoProcessStreamState(StreamNumber, State, DataSize, pData) {
        result := ComCall(5, this, "uint", StreamNumber, DXVAHD_STREAM_STATE, State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the value of a state parameter for an input stream on a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} StreamNumber The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>MaxStreamStates</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
     * @param {DXVAHD_STREAM_STATE} State The state parameter to query, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Integer} pData A pointer to a buffer allocated by the caller. The method copies the state data into the buffer. The buffer must be large enough to hold the data structure that corresponds to the state parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-getvideoprocessstreamstate
     */
    GetVideoProcessStreamState(StreamNumber, State, DataSize, pData) {
        result := ComCall(6, this, "uint", StreamNumber, DXVAHD_STREAM_STATE, State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Performs a video processing blit on one or more input samples and writes the result to a Microsoft Direct3D surface.
     * @remarks
     * The maximum value of <i>StreamCount</i> is given in the <b>MaxStreamStates</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. The maximum number of streams that can be enabled at one time is given in the <b>MaxInputStreams</b> member of that structure.
     * @param {IDirect3DSurface9} pOutputSurface A pointer to the <b>IDirect3DSurface9</b> interface of a Direct3D surface. The output of the video processing operation will be written to this surface. The following surface types can be used:
     * 
     * <ul>
     * <li>A video surface of type <b>DXVAHD_SURFACE_TYPE_VIDEO_OUTPUT</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface">IDXVAHD_Device::CreateVideoSurface</a>. </li>
     * <li>A render-target surface or texture surface created with D3DUSAGE_RENDERTARGET usage.</li>
     * <li>A swap chain.</li>
     * <li>A swap chain with overlay support (<b>D3DSWAPEFFECT_OVERLAY</b>).</li>
     * </ul>
     * @param {Integer} OutputFrame Frame number of the output video frame, indexed from zero.
     * @param {Integer} StreamCount Number of input streams to process.
     * @param {Pointer<DXVAHD_STREAM_DATA>} pStreams Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_data">DXVAHD_STREAM_DATA</a> structures that contain information about the input streams. The caller allocates the array and fills in each structure. The number of elements in the array is given in the <i>StreamCount</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-videoprocessblthd
     */
    VideoProcessBltHD(pOutputSurface, OutputFrame, StreamCount, pStreams) {
        result := ComCall(7, this, "ptr", pOutputSurface, "uint", OutputFrame, "uint", StreamCount, DXVAHD_STREAM_DATA.Ptr, pStreams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXVAHD_VideoProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetVideoProcessBltState := CallbackCreate(GetMethod(implObj, "SetVideoProcessBltState"), flags, 4)
        this.vtbl.GetVideoProcessBltState := CallbackCreate(GetMethod(implObj, "GetVideoProcessBltState"), flags, 4)
        this.vtbl.SetVideoProcessStreamState := CallbackCreate(GetMethod(implObj, "SetVideoProcessStreamState"), flags, 5)
        this.vtbl.GetVideoProcessStreamState := CallbackCreate(GetMethod(implObj, "GetVideoProcessStreamState"), flags, 5)
        this.vtbl.VideoProcessBltHD := CallbackCreate(GetMethod(implObj, "VideoProcessBltHD"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetVideoProcessBltState)
        CallbackFree(this.vtbl.GetVideoProcessBltState)
        CallbackFree(this.vtbl.SetVideoProcessStreamState)
        CallbackFree(this.vtbl.GetVideoProcessStreamState)
        CallbackFree(this.vtbl.VideoProcessBltHD)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nn-dxvahd-idxvahd_videoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDXVAHD_VideoProcessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXVAHD_VideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{95f4edf4-6e03-4cd7-be1b-3075d665aa52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVideoProcessBltState", "GetVideoProcessBltState", "SetVideoProcessStreamState", "GetVideoProcessStreamState", "VideoProcessBltHD"]

    /**
     * Sets a state parameter for a blit operation by a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} State The state parameter to set, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Pointer} pData A pointer to a buffer that contains the state data. The meaning of the data depends on the <i>State</i> parameter. Each state has a corresponding data structure; for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a>. The caller allocates the buffer and fills in the parameter data before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessbltstate
     */
    SetVideoProcessBltState(State, DataSize, pData) {
        result := ComCall(3, this, "int", State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the value of a state parameter for blit operations performed by a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} State The state parameter to query, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Pointer} pData A pointer to a buffer allocated by the caller. The method copies the state data into the buffer. The buffer must be large enough to hold the data structure that corresponds to the state parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_videoprocessor-getvideoprocessbltstate
     */
    GetVideoProcessBltState(State, DataSize, pData) {
        result := ComCall(4, this, "int", State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Sets a state parameter for an input stream on a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} StreamNumber The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>MaxStreamStates</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
     * @param {Integer} State The state parameter to set, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Pointer} pData A pointer to a buffer that contains the state data. The meaning of the data depends on the <i>State</i> parameter. Each state has a corresponding data structure; for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a>. The caller allocates the buffer and fills in the parameter data before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate
     */
    SetVideoProcessStreamState(StreamNumber, State, DataSize, pData) {
        result := ComCall(5, this, "uint", StreamNumber, "int", State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the value of a state parameter for an input stream on a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} StreamNumber The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>MaxStreamStates</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
     * @param {Integer} State The state parameter to query, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a> enumeration.
     * @param {Integer} DataSize The size, in bytes, of the buffer pointed to by <i>pData</i>.
     * @param {Pointer} pData A pointer to a buffer allocated by the caller. The method copies the state data into the buffer. The buffer must be large enough to hold the data structure that corresponds to the state parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_videoprocessor-getvideoprocessstreamstate
     */
    GetVideoProcessStreamState(StreamNumber, State, DataSize, pData) {
        result := ComCall(6, this, "uint", StreamNumber, "int", State, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Performs a video processing blit on one or more input samples and writes the result to a Microsoft Direct3D surface.
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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_videoprocessor-videoprocessblthd
     */
    VideoProcessBltHD(pOutputSurface, OutputFrame, StreamCount, pStreams) {
        result := ComCall(7, this, "ptr", pOutputSurface, "uint", OutputFrame, "uint", StreamCount, "ptr", pStreams, "HRESULT")
        return result
    }
}

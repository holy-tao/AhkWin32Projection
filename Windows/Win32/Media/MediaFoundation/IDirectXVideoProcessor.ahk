#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectXVideoProcessorService.ahk
#Include .\DXVA2_VideoProcessorCaps.ahk
#Include .\DXVA2_ValueRange.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a DirectX Video Acceleration (DXVA) video processor device.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nn-dxva2api-idirectxvideoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoProcessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{8c3a39f0-916e-4690-804f-4c8001355d25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoProcessorService", "GetCreationParameters", "GetVideoProcessorCaps", "GetProcAmpRange", "GetFilterPropertyRange", "VideoProcessBlt"]

    /**
     * Retrieves the DirectX Video Acceleration (DXVA) video processor service that created this video processor device.
     * @returns {IDirectXVideoProcessorService} Receives a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice">IDirectXVideoProcessorService</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nf-dxva2api-idirectxvideoprocessor-getvideoprocessorservice
     */
    GetVideoProcessorService() {
        result := ComCall(3, this, "ptr*", &ppService := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectXVideoProcessorService(ppService)
    }

    /**
     * Retrieves the parameters that were used to create this device. (IDirectXVideoProcessor.GetCreationParameters)
     * @remarks
     * You can set any parameter to <b>NULL</b> if you are not interested in the result. At least one parameter must be non-<b>NULL</b>.
     * @param {Pointer<Guid>} pDeviceGuid Receives the device GUID. This parameter can be <b>NULL</b>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure allocated by the caller. The method fills the structure with a description of the video format. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pRenderTargetFormat Receives the render target format, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pMaxNumSubStreams Receives the maximum number of streams supported by the device. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. At least one parameter must be non-<b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nf-dxva2api-idirectxvideoprocessor-getcreationparameters
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pRenderTargetFormat, pMaxNumSubStreams) {
        pRenderTargetFormatMarshal := pRenderTargetFormat is VarRef ? "uint*" : "ptr"
        pMaxNumSubStreamsMarshal := pMaxNumSubStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, pRenderTargetFormatMarshal, pRenderTargetFormat, pMaxNumSubStreamsMarshal, pMaxNumSubStreams, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the capabilities of the video processor device.
     * @returns {DXVA2_VideoProcessorCaps} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessorcaps">DXVA2_VideoProcessorCaps</a> structure that receives the video processor capabilities.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nf-dxva2api-idirectxvideoprocessor-getvideoprocessorcaps
     */
    GetVideoProcessorCaps() {
        pCaps := DXVA2_VideoProcessorCaps()
        result := ComCall(5, this, "ptr", pCaps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCaps
    }

    /**
     * Retrieves the range of values for a video processor (ProcAmp) setting on this video processor device.
     * @param {Integer} ProcAmpCap The ProcAmp setting to query. See <a href="https://docs.microsoft.com/windows/desktop/medfound/procamp-settings">ProcAmp Settings</a>.
     * @returns {DXVA2_ValueRange} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives the range of values for the setting specified in <i>ProcAmpCaps</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nf-dxva2api-idirectxvideoprocessor-getprocamprange
     */
    GetProcAmpRange(ProcAmpCap) {
        pRange := DXVA2_ValueRange()
        result := ComCall(6, this, "uint", ProcAmpCap, "ptr", pRange, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRange
    }

    /**
     * Retrieves the range of values for an image filter supported by this device.
     * @param {Integer} FilterSetting Filter setting to query. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-image-filter-settings">DXVA Image Filter Settings</a>.
     * @returns {DXVA2_ValueRange} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives the range of values for the setting specified in <i>FilterSetting</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nf-dxva2api-idirectxvideoprocessor-getfilterpropertyrange
     */
    GetFilterPropertyRange(FilterSetting) {
        pRange := DXVA2_ValueRange()
        result := ComCall(7, this, "uint", FilterSetting, "ptr", pRange, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRange
    }

    /**
     * Performs a video process operation on one or more input samples and writes the result to a Direct3D9 surface.
     * @remarks
     * When the method returns, the operation might not be complete.
     *       
     * 
     * If the method returns <b>E_INVALIDARG</b>, check for the following:
     * 
     * <ul>
     * <li>The number of input samples (<i>NumSamples</i>) must be less than or equal to <b>MAX_DEINTERLACE_SURFACES</b>. </li>
     * <li>The Direct3D surface must be a valid target for <b>VideoProcessBlt</b>. See the description of the <i>pRT</i> parameter for details.</li>
     * <li>The presentation time (<b>TargetFrame</b>) given in <i>pBltParams</i> must match the start and end times for the current picture from the primary stream. Specifically, it must be less than the end time and greater than or equal to the start time. Note that the first sample in <i>pSamples</i> might not be the current picture, if the <i>pSamples</i> array contains backward reference pictures. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-video-processing">Input Sample Order</a>.</li>
     * <li>The target rectangle (<b>TargetRect</b>) given in <i>pBltParams</i> cannot be larger than the destination surface (<i>pRT</i>).</li>
     * <li>The  constriction size (<b>ConstrictionSize</b>) given in <i>pBltParams</i> cannot be less than zero or larger than the target rectangle.</li>
     * <li>The alpha component of the background color must be opqaue.</li>
     * <li>The ProcAmp values given in <i>pBltParams</i> must be valid. For any ProcAmp settings that are supported by the driver, these values must fall within the ranges returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getprocamprange">IDirectXVideoProcessor::GetProcAmpRange</a> method.</li>
     * <li>The noise and detail filters given in <i>pBltParams</i> must be valid. For any filters that are supported by the driver, these values must fall within the ranges returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getfilterpropertyrange">IDirectXVideoProcessor::GetFilterPropertyRange</a> method.</li>
     * <li>The alpha value given in <i>pBltParams</i> must be in the range [0...1] inclusive.</li>
     * <li>For each input sample given in <i>pSamples</i>:<ul>
     * <li>The start time cannot be greater than the end time.</li>
     * <li>A valid <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> pointer must be provided.</li>
     * <li>The source rectangle cannot be larger than the input surface.</li>
     * <li>The destination rectangle cannot be larger than than the destination surface.</li>
     * <li>The planar alpha must be in the range [0...1] inclusive.</li>
     * </ul>
     * </li>
     * <li> For all rectangles (source, destination, and target),  the rectangle cannot be inverted (left &gt; right or top &gt; bottom) or have negative values.</li>
     * </ul>
     * @param {IDirect3DSurface9} pRenderTarget A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface of a Direct3D surface. The output of the video processing operation will be written to this surface. The surface may be any of the following types:
     *           
     * 
     * <ul>
     * <li>A surface created by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoaccelerationservice-createsurface">IDirectXVideoAccelerationService::CreateSurface</a> with the <b>DXVA2_VideoProcessRenderTarget</b> flag. You can also use the <b>DXVA2_VideoSoftwareRenderTarget</b> flag, but only when the device GUID is <b>DXVA2_VideoProcSoftwareDevice</b> (software video processing device).
     *               </li>
     * <li>A surface created from a Direct3D device with the <b>D3DUSAGE_RENDERTARGET</b> usage flag.
     *               </li>
     * <li>A Direct3D swap chain.
     *               </li>
     * </ul>
     * @param {Pointer<DXVA2_VideoProcessBltParams>} pBltParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessbltparams">DXVA2_VideoProcessBltParams</a> structure that describes the video processing operation to perform.
     * @param {Pointer<DXVA2_VideoSample>} pSamples A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videosample">DXVA2_VideoSample</a> structures that contain the input samples. There must be at least one element in the array.
     * 
     * The maximum number of input samples is given by the constant <b>MAX_DEINTERLACE_SURFACES</b>, defined in the header file dxva2api.h.
     * @param {Integer} NumSamples The number of elements in the <i>pSamples</i> array.
     * @param {Pointer<HANDLE>} pHandleComplete Reserved; set to <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_DRIVERINTERNALERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal driver error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid arguments.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxva2api/nf-dxva2api-idirectxvideoprocessor-videoprocessblt
     */
    VideoProcessBlt(pRenderTarget, pBltParams, pSamples, NumSamples, pHandleComplete) {
        result := ComCall(8, this, "ptr", pRenderTarget, "ptr", pBltParams, "ptr", pSamples, "uint", NumSamples, "ptr", pHandleComplete, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

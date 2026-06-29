#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }
#Import ".\IMFRemoteDesktopPlugin.ahk" { IMFRemoteDesktopPlugin }
#Import ".\DXVAHD_CONTENT_DESC.ahk" { DXVAHD_CONTENT_DESC }
#Import ".\IDirect3DDeviceManager9.ahk" { IDirect3DDeviceManager9 }
#Import ".\IMFStreamDescriptor.ahk" { IMFStreamDescriptor }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import ".\IMFSensorActivitiesReportCallback.ahk" { IMFSensorActivitiesReportCallback }
#Import ".\IMFPMPHostApp.ahk" { IMFPMPHostApp }
#Import ".\IMFPluginControl.ahk" { IMFPluginControl }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import ".\IMFExtendedCameraIntrinsics.ahk" { IMFExtendedCameraIntrinsics }
#Import ".\DXVAHD_DEVICE_USAGE.ahk" { DXVAHD_DEVICE_USAGE }
#Import "..\DxMediaObjects\IMediaBuffer.ahk" { IMediaBuffer }
#Import ".\IMFMediaSession.ahk" { IMFMediaSession }
#Import ".\MFVideoInterlaceMode.ahk" { MFVideoInterlaceMode }
#Import ".\MF_FILE_OPENMODE.ahk" { MF_FILE_OPENMODE }
#Import ".\IOPMVideoOutput.ahk" { IOPMVideoOutput }
#Import ".\MFT_REGISTER_TYPE_INFO.ahk" { MFT_REGISTER_TYPE_INFO }
#Import ".\IMFASFContentInfo.ahk" { IMFASFContentInfo }
#Import ".\IMFSensorGroup.ahk" { IMFSensorGroup }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import ".\MF_FILE_ACCESSMODE.ahk" { MF_FILE_ACCESSMODE }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }
#Import ".\IMFTopoLoader.ahk" { IMFTopoLoader }
#Import ".\IMFDXGIDeviceManager.ahk" { IMFDXGIDeviceManager }
#Import ".\IMFTransform.ahk" { IMFTransform }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import ".\IMFMediaEventQueue.ahk" { IMFMediaEventQueue }
#Import "..\..\System\Com\IClassFactory.ahk" { IClassFactory }
#Import "..\..\UI\Shell\PropertiesSystem\INamedPropertyStore.ahk" { INamedPropertyStore }
#Import ".\IMFMediaBuffer.ahk" { IMFMediaBuffer }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IMFPresentationTimeSource.ahk" { IMFPresentationTimeSource }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFCameraOcclusionStateMonitor.ahk" { IMFCameraOcclusionStateMonitor }
#Import ".\IMFCameraOcclusionStateReportCallback.ahk" { IMFCameraOcclusionStateReportCallback }
#Import ".\IMFPresentationDescriptor.ahk" { IMFPresentationDescriptor }
#Import ".\IMFCameraControlNotify.ahk" { IMFCameraControlNotify }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFSensorActivityMonitor.ahk" { IMFSensorActivityMonitor }
#Import ".\IMFProtectedEnvironmentAccess.ahk" { IMFProtectedEnvironmentAccess }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\IMFSignedLibrary.ahk" { IMFSignedLibrary }
#Import ".\IMFSensorProfile.ahk" { IMFSensorProfile }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IMFSensorStream.ahk" { IMFSensorStream }
#Import ".\IMFCollection.ahk" { IMFCollection }
#Import ".\IMFVideoMediaType.ahk" { IMFVideoMediaType }
#Import ".\IMFContentDecryptorContext.ahk" { IMFContentDecryptorContext }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IMFPresentationClock.ahk" { IMFPresentationClock }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9Ex.ahk" { IDirect3DDevice9Ex }
#Import ".\MFVirtualCameraType.ahk" { MFVirtualCameraType }
#Import ".\IMFTranscodeProfile.ahk" { IMFTranscodeProfile }
#Import ".\IMFPMediaPlayerCallback.ahk" { IMFPMediaPlayerCallback }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\MFCameraIntrinsic_DistortionModelType.ahk" { MFCameraIntrinsic_DistortionModelType }
#Import ".\IMFTopology.ahk" { IMFTopology }
#Import ".\IMFVirtualCamera.ahk" { IMFVirtualCamera }
#Import ".\IMFSourceReader.ahk" { IMFSourceReader }
#Import ".\IMFRelativePanelWatcher.ahk" { IMFRelativePanelWatcher }
#Import ".\OPM_HDCP_TYPE.ahk" { OPM_HDCP_TYPE }
#Import ".\EAllocationType.ahk" { EAllocationType }
#Import ".\MFP_CREATION_OPTIONS.ahk" { MFP_CREATION_OPTIONS }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\IMFASFStreamSelector.ahk" { IMFASFStreamSelector }
#Import ".\IMFContentProtectionDevice.ahk" { IMFContentProtectionDevice }
#Import ".\IMFSample.ahk" { IMFSample }
#Import ".\OPM_HDCP_STATUS.ahk" { OPM_HDCP_STATUS }
#Import ".\IMFASFProfile.ahk" { IMFASFProfile }
#Import ".\IMFMediaTypeHandler.ahk" { IMFMediaTypeHandler }
#Import "..\..\Graphics\Direct3D12\ID3D12Device.ahk" { ID3D12Device }
#Import ".\IMFNetCredentialCache.ahk" { IMFNetCredentialCache }
#Import ".\IMFASFMultiplexer.ahk" { IMFASFMultiplexer }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MFVirtualCameraAccess.ahk" { MFVirtualCameraAccess }
#Import ".\MF_DXGI_DEVICE_MANAGER_MODE.ahk" { MF_DXGI_DEVICE_MANAGER_MODE }
#Import ".\IMFTopologyNode.ahk" { IMFTopologyNode }
#Import ".\IMFASFIndexer.ahk" { IMFASFIndexer }
#Import ".\IMFSensorProfileCollection.ahk" { IMFSensorProfileCollection }
#Import ".\MFVirtualCameraLifetime.ahk" { MFVirtualCameraLifetime }
#Import ".\IMFQualityManager.ahk" { IMFQualityManager }
#Import ".\MFVIDEOFORMAT.ahk" { MFVIDEOFORMAT }
#Import ".\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import ".\IMFPMediaPlayer.ahk" { IMFPMediaPlayer }
#Import ".\MF_TOPOLOGY_TYPE.ahk" { MF_TOPOLOGY_TYPE }
#Import ".\IDXVAHD_Device.ahk" { IDXVAHD_Device }
#Import ".\IMFTrackedSample.ahk" { IMFTrackedSample }
#Import ".\IMFASFSplitter.ahk" { IMFASFSplitter }
#Import ".\IMFCameraControlMonitor.ahk" { IMFCameraControlMonitor }
#Import ".\IMFSequencerSource.ahk" { IMFSequencerSource }
#Import ".\MFStandardVideoFormat.ahk" { MFStandardVideoFormat }
#Import ".\MFASYNC_WORKQUEUE_TYPE.ahk" { MFASYNC_WORKQUEUE_TYPE }
#Import ".\IMFSampleGrabberSinkCallback.ahk" { IMFSampleGrabberSinkCallback }
#Import ".\IMFMediaSource.ahk" { IMFMediaSource }
#Import ".\IMFAudioMediaType.ahk" { IMFAudioMediaType }
#Import ".\OPM_VIDEO_OUTPUT_SEMANTICS.ahk" { OPM_VIDEO_OUTPUT_SEMANTICS }
#Import ".\MF_FILE_FLAGS.ahk" { MF_FILE_FLAGS }
#Import ".\IMFSourceResolver.ahk" { IMFSourceResolver }
#Import ".\IMFMediaSink.ahk" { IMFMediaSink }
#Import ".\IMFActivate.ahk" { IMFActivate }
#Import ".\IMFExtendedCameraIntrinsicModel.ahk" { IMFExtendedCameraIntrinsicModel }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }
#Import ".\IMFSinkWriter.ahk" { IMFSinkWriter }
#Import ".\IMFPMPServer.ahk" { IMFPMPServer }
#Import ".\IMFNetProxyLocator.ahk" { IMFNetProxyLocator }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IMFSystemId.ahk" { IMFSystemId }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */

;@region Functions
/**
 * Creates a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_device">IDXVAHD_Device</a> interface to get the device capabilities, create the video processor, and allocate video surfaces.
 * @param {IDirect3DDevice9Ex} pD3DDevice A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex">IDirect3DDevice9Ex</a> interface of a Direct3D 9 device.
 * @param {Pointer<DXVAHD_CONTENT_DESC>} pContentDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_content_desc">DXVAHD_CONTENT_DESC</a> structure that describes the video content. The driver uses this information as a hint when it creates the device.
 * @param {DXVAHD_DEVICE_USAGE} Usage A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_usage">DXVAHD_DEVICE_USAGE</a> enumeration, describing how the device will be used. The value indicates the desired trade-off between speed and video quality. The driver uses this flag as a hint when it creates the device.
 * @param {Pointer<PDXVAHDSW_Plugin>} pPlugin A pointer to an initialization function for a software device. Set this pointer if you are using a software plug-in device. Otherwise, set this parameter to <b>NULL</b>. If the value is <b>NULL</b>, the driver creates the DXVA-HD device.
 * 
 * The function pointer type is <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_plugin">PDXVAHDSW_Plugin</a>.
 * @returns {IDXVAHD_Device} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_device">IDXVAHD_Device</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-dxvahd_createdevice
 * @since windows6.1
 */
export DXVAHD_CreateDevice(pD3DDevice, pContentDesc, Usage, pPlugin) {
    result := DllCall("dxva2.dll\DXVAHD_CreateDevice", "ptr", pD3DDevice, DXVAHD_CONTENT_DESC.Ptr, pContentDesc, DXVAHD_DEVICE_USAGE, Usage, "ptr", pPlugin, "ptr*", &ppDevice := 0, "HRESULT")
    return IDXVAHD_Device(ppDevice)
}

/**
 * Creates an instance of the Direct3D Device Manager.
 * @remarks
 * Windows Store apps must use <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-apis">Direct3D 11 Video APIs</a>.
 * @param {Pointer<Integer>} pResetToken Receives a token that identifies this instance of the Direct3D device manager. Use this token when calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice">IDirect3DDeviceManager9::ResetDevice</a>.
 * @param {Pointer<IDirect3DDeviceManager9>} ppDeviceManager Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9">IDirect3DDeviceManager9</a> interface. The caller must release the interface.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-dxva2createdirect3ddevicemanager9
 * @since windows6.0.6000
 */
export DXVA2CreateDirect3DDeviceManager9(pResetToken, ppDeviceManager) {
    pResetTokenMarshal := pResetToken is VarRef ? "uint*" : "ptr"

    result := DllCall("dxva2.dll\DXVA2CreateDirect3DDeviceManager9", pResetTokenMarshal, pResetToken, IDirect3DDeviceManager9.Ptr, ppDeviceManager, "HRESULT")
    return result
}

/**
 * Creates a DirectX Video Acceleration (DXVA) services object.
 * @param {IDirect3DDevice9} pDD A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface of a Direct3D device.
 * @param {Pointer<Guid>} riid The interface identifier (IID) of the requested interface. Any of the following interfaces might be supported by the Direct3D device:
 *           
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoaccelerationservice">IDirectXVideoAccelerationService</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice">IDirectXVideoProcessorService</a>
 * </li>
 * </ul>
 * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-dxva2createvideoservice
 * @since windows6.0.6000
 */
export DXVA2CreateVideoService(pDD, riid) {
    result := DllCall("dxva2.dll\DXVA2CreateVideoService", "ptr", pDD, Guid.Ptr, riid, "ptr*", &ppService := 0, "HRESULT")
    return ppService
}

/**
 * Creates an Output Protection Manager (OPM) object for each physical monitor that is associated with a particular HMONITOR handle.
 * @remarks
 * A single <b>HMONITOR</b> handle can be associated with several physical monitors. Each physical monitor has its own connector. The application must set the protection mechanism individually for each physical monitor, using the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers returned in <i>pppOPMVideoOutputArray</i>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> interface has two modes of behavior, depending on the value of the <i>vos</i> parameter. If <i>vos</i> is <b>OPM_VOS_COPP_SEMANTICS</b>, <b>IOPMVideoOutput</b> uses COPP semantics. This mode is intended for backward compatibility with COPP. If <i>vos</i> is <b>OPM_VOS_OPM_SEMANTICS</b>, <b>IOPMVideoOutput</b> uses the newer OPM semantics. Differences in behavior are noted on the reference page for each method. The mode does not change during the lifetime of the object.
 * @param {HMONITOR} _hMonitor The monitor handle for which to create OPM objects. There are several functions that return <b>HMONITOR</b> values. For more information, see the topic <a href="https://docs.microsoft.com/windows/desktop/gdi/multiple-display-monitors-functions">Multiple Display Monitors Functions</a> in the Windows graphics device interface (GDI) documentation.
 * @param {OPM_VIDEO_OUTPUT_SEMANTICS} vos A member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_video_output_semantics">OPM_VIDEO_OUTPUT_SEMANTICS</a> enumeration.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OPM_VOS_OPM_SEMANTICS"></a><a id="opm_vos_opm_semantics"></a><dl>
 * <dt><b>OPM_VOS_OPM_SEMANTICS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use OPM semantics.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OPM_VOS_COPP_SEMANTICS"></a><a id="opm_vos_copp_semantics"></a><dl>
 * <dt><b>OPM_VOS_COPP_SEMANTICS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use Certified Output Protection Protocol (COPP) semantics.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pulNumVideoOutputs Receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers returned in the <i>pppOPMVideoOutputArray</i> parameter.
 * @param {Pointer<Pointer<IOPMVideoOutput>>} pppOPMVideoOutputArray Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers. Each <b>IOPMVideoOutput</b> pointer is associated with a single physical monitor. The caller must release each pointer in the array, and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the array.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-opmgetvideooutputsfromhmonitor
 * @since windows6.0.6000
 */
export OPMGetVideoOutputsFromHMONITOR(_hMonitor, vos, pulNumVideoOutputs, pppOPMVideoOutputArray) {
    pulNumVideoOutputsMarshal := pulNumVideoOutputs is VarRef ? "uint*" : "ptr"
    pppOPMVideoOutputArrayMarshal := pppOPMVideoOutputArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("dxva2.dll\OPMGetVideoOutputsFromHMONITOR", HMONITOR, _hMonitor, OPM_VIDEO_OUTPUT_SEMANTICS, vos, pulNumVideoOutputsMarshal, pulNumVideoOutputs, pppOPMVideoOutputArrayMarshal, pppOPMVideoOutputArray, "HRESULT")
    return result
}

/**
 * Returns a video output object for the VidPN target on the specified adapter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> interface has two modes of behavior, depending on the value of the <i>vos</i> parameter. If <i>vos</i> is <b>OPM_VOS_COPP_SEMANTICS</b>, <b>IOPMVideoOutput</b> uses COPP semantics. This mode is intended for backward compatibility with COPP. If <i>vos</i> is <b>OPM_VOS_OPM_SEMANTICS</b>, <b>IOPMVideoOutput</b> uses the newer OPM semantics. Differences in behavior are noted on the reference page for each method. The mode does not change during the lifetime of the object.
 * @param {Pointer<LUID>} pAdapterLuid The LUID for the adapter where the target is located.
 * @param {Integer} VidPnTarget Target ID for the target on the specified adapter adapter.
 * @param {OPM_VIDEO_OUTPUT_SEMANTICS} vos A member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_video_output_semantics">OPM_VIDEO_OUTPUT_SEMANTICS</a> enumeration.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OPM_VOS_OPM_SEMANTICS"></a><a id="opm_vos_opm_semantics"></a><dl>
 * <dt><b>OPM_VOS_OPM_SEMANTICS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointer will use OPM semantics.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OPM_VOS_COPP_SEMANTICS"></a><a id="opm_vos_copp_semantics"></a><dl>
 * <dt><b>OPM_VOS_COPP_SEMANTICS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointer will use Certified Output Protection Protocol (COPP) semantics.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {IOPMVideoOutput} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointer. The caller must release this  pointer.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-opmgetvideooutputfortarget
 * @since windows6.0.6000
 */
export OPMGetVideoOutputForTarget(pAdapterLuid, VidPnTarget, vos) {
    result := DllCall("dxva2.dll\OPMGetVideoOutputForTarget", LUID.Ptr, pAdapterLuid, "uint", VidPnTarget, OPM_VIDEO_OUTPUT_SEMANTICS, vos, "ptr*", &ppOPMVideoOutput := 0, "HRESULT")
    return IOPMVideoOutput(ppOPMVideoOutput)
}

/**
 * Creates an Output Protection Manager (OPM) object for each physical monitor that is associated with a particular Direct3D device.
 * @remarks
 * A single Direct3D device can be associated with several physical monitors. Each physical monitor has its own connector. The application must set the protection mechanism individually for each physical monitor, by using the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers returned in <i>pppOPMVideoOutputArray</i>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> interface has two modes of behavior, depending on the value of the <i>vos</i> parameter. If <i>vos</i> is OPM_VOS_COPP_SEMANTICS, <b>IOPMVideoOutput</b> uses COPP semantics. This mode is intended for backward compatibility with COPP. If <i>vos</i> is OPM_VOS_OPM_SEMANTICS, <b>IOPMVideoOutput</b> uses the newer OPM semantics. Differences in behavior are noted on the reference page for each method. The mode does not change during the lifetime of the object.
 * @param {IDirect3DDevice9} pDirect3DDevice9 Pointer to the <b>IDirect3DDevice9</b> interface of a Direct3D device.
 * @param {OPM_VIDEO_OUTPUT_SEMANTICS} vos A member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_video_output_semantics">OPM_VIDEO_OUTPUT_SEMANTICS</a> enumeration.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OPM_VOS_OPM_SEMANTICS"></a><a id="opm_vos_opm_semantics"></a><dl>
 * <dt><b>OPM_VOS_OPM_SEMANTICS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use OPM semantics.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OPM_VOS_COPP_SEMANTICS"></a><a id="opm_vos_copp_semantics"></a><dl>
 * <dt><b>OPM_VOS_COPP_SEMANTICS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use Certified Output Protection Protocol (COPP) semantics.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pulNumVideoOutputs Receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers returned in the <i>pppOPMVideoOutputArray</i> parameter.
 * @param {Pointer<Pointer<IOPMVideoOutput>>} pppOPMVideoOutputArray Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers. Each <b>IOPMVideoOutput</b> pointer is associated with a single physical monitor. The caller must release each pointer in the array, and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the array.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-opmgetvideooutputsfromidirect3ddevice9object
 * @since windows6.0.6000
 */
export OPMGetVideoOutputsFromIDirect3DDevice9Object(pDirect3DDevice9, vos, pulNumVideoOutputs, pppOPMVideoOutputArray) {
    pulNumVideoOutputsMarshal := pulNumVideoOutputs is VarRef ? "uint*" : "ptr"
    pppOPMVideoOutputArrayMarshal := pppOPMVideoOutputArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("dxva2.dll\OPMGetVideoOutputsFromIDirect3DDevice9Object", "ptr", pDirect3DDevice9, OPM_VIDEO_OUTPUT_SEMANTICS, vos, pulNumVideoOutputsMarshal, pulNumVideoOutputs, pppOPMVideoOutputArrayMarshal, pppOPMVideoOutputArray, "HRESULT")
    return result
}

/**
 * Writes the contents of an attribute store to a stream.
 * @remarks
 * If <i>dwOptions</i> contains the MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF flag, the function serializes <b>IUnknown</b> pointers in the attribute store, as follows:
 * 
 * <ul>
 * <li>
 * If the <b>IStream</b> pointer exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfobjectreferencestream">IMFObjectReferenceStream</a> interface (through <b>QueryInterface</b>), the function calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfobjectreferencestream-savereference">IMFObjectReferenceStream::SaveReference</a> to serialize each pointer.
 * 
 * </li>
 * <li>
 * Otherwise, the function calls <b>CoMarshalInterface</b> to serialize a proxy for the object.
 * 
 * </li>
 * </ul>
 * If <i>dwOptions</i> does not include the MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF flag, the function skips <b>IUnknown</b> pointers in the attribute store.
 * 
 * To load the attributes from the stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-mfdeserializeattributesfromstream">MFDeserializeAttributesFromStream</a>.
 * 
 * The main purpose of this function is to marshal attributes across process boundaries.
 * @param {IMFAttributes} pAttr Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
 * @param {Integer} dwOptions Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options">MF_ATTRIBUTE_SERIALIZE_OPTIONS</a> enumeration.
 * @param {IStream} pStm Pointer to the <b>IStream</b> interface of the stream where the attributes are saved.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-mfserializeattributestostream
 * @since windows6.0.6000
 */
export MFSerializeAttributesToStream(pAttr, dwOptions, pStm) {
    result := DllCall("MFPlat.dll\MFSerializeAttributesToStream", "ptr", pAttr, "uint", dwOptions, "ptr", pStm, "HRESULT")
    return result
}

/**
 * Loads attributes from a stream into an attribute store.
 * @remarks
 * Use this function to deserialize an attribute store that was serialized with the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-mfserializeattributestostream">MFSerializeAttributesToStream</a> function.
 * 
 * If <i>dwOptions</i> contains the MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF flag, the function deserializes <b>IUnknown</b> pointers from the stream, as follows:
 * 
 * <ul>
 * <li>
 * If the <b>IStream</b> pointer exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfobjectreferencestream">IMFObjectReferenceStream</a> interface (through <b>QueryInterface</b>), the function calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfobjectreferencestream-loadreference">IMFObjectReferenceStream::LoadReference</a> to deserialize each pointer.
 * 
 * </li>
 * <li>
 * Otherwise, the function calls <b>CoUnmarshalInterface</b> to deserialize a proxy for the object.
 * 
 * </li>
 * </ul>
 * This function deletes any attributes that were previously stored in <i>pAttr</i>.
 * @param {IMFAttributes} pAttr Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
 * @param {Integer} dwOptions Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options">MF_ATTRIBUTE_SERIALIZE_OPTIONS</a> enumeration.
 * @param {IStream} pStm Pointer to the <b>IStream</b> interface of the stream from which to read the attributes.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-mfdeserializeattributesfromstream
 * @since windows6.0.6000
 */
export MFDeserializeAttributesFromStream(pAttr, dwOptions, pStm) {
    result := DllCall("MFPlat.dll\MFDeserializeAttributesFromStream", "ptr", pAttr, "uint", dwOptions, "ptr", pStm, "HRESULT")
    return result
}

/**
 * Creates a generic activation object for Media Foundation transforms (MFTs).
 * @remarks
 * Most applications will not use this function; it is used internally by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> function. 
 * 
 * An <i>activation object</i> is a helper object that creates another object, somewhat similar to a class factory. The <b>MFCreateTransformActivate</b> function creates an activation object for MFTs. Before this activation object can create an MFT, the caller must initialize the activation object by setting one or more attributes on it.
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-transform-clsid-attribute">MFT_TRANSFORM_CLSID_Attribute</a>
 * </td>
 * <td>Required. Contains the CLSID of the MFT. The activation object creates the MFT by passing this CLSID to the <b>CoCreateInstance</b> function.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transform-category-attribute">MF_TRANSFORM_CATEGORY_Attribute</a>
 * </td>
 * <td>Optional. Specifies the category of the MFT.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transform-flags-attribute">MF_TRANSFORM_FLAGS_Attribute</a>
 * </td>
 * <td>Contains various flags that describe the MFT. For hardware-based MFTs, set the <b>MFT_ENUM_FLAG_HARDWARE</b> flag. Otherwise, this attribute is optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-codec-merit-attribute">MFT_CODEC_MERIT_Attribute</a>
 * </td>
 * <td>
 * Optional. Contains the merit value of a hardware codec.
 * 
 * If this attribute is set and its value is greater than zero, the activation object calls <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetmftmerit">MFGetMFTMerit</a> to get the trusted merit value for the MFT. If the trusted merit is less than the value of this attribute, the activation object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> method fails and returns <b>MF_E_INVALID_CODEC_MERIT</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-enum-hardware-url-attribute">MFT_ENUM_HARDWARE_URL_Attribute</a>
 * </td>
 * <td>Required for hardware-based MFTs. Specifies the symbolic link for the hardware device. The device proxy uses this value to configure the MFT.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-fieldofuse-unlock-attribute">MFT_FIELDOFUSE_UNLOCK_Attribute</a>
 * </td>
 * <td>
 * Optional. Contains an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imffieldofusemftunlock">IMFFieldOfUseMFTUnlock</a> pointer, which can be used to unlock the MFT. The <b>IMFFieldOfUseMFTUnlock</b> interface is used with MFTs that have usage restrictions.
 * 
 * If this attribute is set and the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transform-flags-attribute">MF_TRANSFORM_FLAGS_Attribute</a>  attribute contains the <b>MFT_ENUM_FLAG_FIELDOFUSE</b> flag, the activation object calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffieldofusemftunlock-unlock">IMFFieldOfUseMFTUnlock::Unlock</a> when it creates the MFT. An application can also set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-fieldofuse-unlock-attribute">MFT_FIELDOFUSE_UNLOCK_Attribute</a> attribute without setting the <b>MFT_ENUM_FLAG_FIELDOFUSE</b> flag. In that case, the application must call <b>Unlock</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-preferred-encoder-profile">MFT_PREFERRED_ENCODER_PROFILE</a>
 * </td>
 * <td>
 * Optional. Contains the encoding profile for an encoder. The value of this attribute is an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> pointer.
 * 
 * If this attribute is set and the value of the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transform-category-attribute">MF_TRANSFORM_CATEGORY_Attribute</a> attribute is <b>MFT_CATEGORY_AUDIO_ENCODER</b> or <b>MFT_CATEGORY_VIDEO_ENCODER</b>, the activation object uses the encoding profile to configure the MFT. The MFT must expose either <b>ICodecAPI</b>  or <b>IPropertyStore</b> for this purpose.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-preferred-outputtype-attribute">MFT_PREFERRED_OUTPUTTYPE_Attribute</a>
 * </td>
 * <td>
 * Optional. Specifies the preferred output format for an encoder.
 * 
 * If this attribute set and the value of the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transform-category-attribute">MF_TRANSFORM_CATEGORY_Attribute</a> attribute is <b>MFT_CATEGORY_AUDIO_ENCODER</b> or <b>MFT_CATEGORY_VIDEO_ENCODER</b>, the activation object sets this media type on the MFT.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information about activation objects, see <a href="https://docs.microsoft.com/windows/desktop/medfound/activation-objects">Activation Objects</a>.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface.
 *           The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-mfcreatetransformactivate
 * @since windows6.1
 */
export MFCreateTransformActivate() {
    result := DllCall("MFPlat.dll\MFCreateTransformActivate", "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates the Media Session in the application's process.
 * @remarks
 * If your application does not play protected content, you can use this function to create the Media Session in the application's process. To use the Media Session for protected content, you must call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepmpmediasession">MFCreatePMPMediaSession</a>.
 *       
 * 
 * You can use the <i>pConfiguration</i> parameter to specify any of the following attributes:
 *       
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-global-time-attribute">MF_SESSION_GLOBAL_TIME</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-quality-manager-attribute">MF_SESSION_QUALITY_MANAGER</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-topoloader-attribute">MF_SESSION_TOPOLOADER</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-low-latency">MF_LOW_LATENCY</a>
 * </li>
 * </ul>
 * @param {IMFAttributes} pConfiguration Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. This parameter can be <b>NULL</b>. See Remarks.
 * @returns {IMFMediaSession} Receives a pointer to the Media Session's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasession">IMFMediaSession</a> interface. The caller must release the interface. Before releasing the last reference to the <b>IMFMediaSession</b> pointer, the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-shutdown">IMFMediaSession::Shutdown</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatemediasession
 * @since windows6.0.6000
 */
export MFCreateMediaSession(pConfiguration) {
    result := DllCall("MF.dll\MFCreateMediaSession", "ptr", pConfiguration, "ptr*", &ppMediaSession := 0, "HRESULT")
    return IMFMediaSession(ppMediaSession)
}

/**
 * Creates an instance of the Media Session inside a Protected Media Path (PMP) process.
 * @remarks
 * You can use the <i>pConfiguration</i> parameter to set any of the following attributes:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-content-protection-manager-attribute">MF_SESSION_CONTENT_PROTECTION_MANAGER</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-global-time-attribute">MF_SESSION_GLOBAL_TIME</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-quality-manager-attribute">MF_SESSION_QUALITY_MANAGER</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-remote-source-mode-attribute">MF_SESSION_REMOTE_SOURCE_MODE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-server-context-attribute">MF_SESSION_SERVER_CONTEXT</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-topoloader-attribute">MF_SESSION_TOPOLOADER</a>
 * </li>
 * </ul>
 * If this function cannot create the PMP Media Session because a trusted binary was revoked, the <i>ppEnablerActivate</i> parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointer. The application can use this pointer to create a content enabler object, which can then be used to download an updated binary:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> with the interface identifier IID_IMFContentEnabler to get an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentenabler">IMFContentEnabler</a> interface pointer.
 *           </li>
 * <li>Use that interface to download the updated binary.
 *           </li>
 * <li>Call <b>MFCreatePMPMediaSession</b> again.
 *           </li>
 * </ol>
 * If the function successfully creates the PMP Media Session, the <i>ppEnablerActivate</i> parameter receives the value <b>NULL</b>.
 * 
 * Do not make calls to the PMP Media Session from a thread that is processing a window message sent from another thread. To test whether the current thread falls into this category, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insendmessage">InSendMessage</a>.
 * @param {Integer} dwCreationFlags A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpmpsession_creation_flags">MFPMPSESSION_CREATION_FLAGS</a> enumeration that specifies how to create the session object.
 * @param {IMFAttributes} pConfiguration A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. This parameter can be <b>NULL</b>. See Remarks.
 * @param {Pointer<IMFMediaSession>} ppMediaSession Receives a pointer to the PMP Media Session's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasession">IMFMediaSession</a> interface. The caller must release the interface. Before releasing the last reference to the <b>IMFMediaSession</b> pointer, the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-shutdown">IMFMediaSession::Shutdown</a> method.
 * @param {Pointer<IMFActivate>} ppEnablerActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface or the value <b>NULL</b>. If non-<b>NULL</b>, the caller must release the interface. See Remarks.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
 *           
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatepmpmediasession
 * @since windows6.0.6000
 */
export MFCreatePMPMediaSession(dwCreationFlags, pConfiguration, ppMediaSession, ppEnablerActivate) {
    result := DllCall("MF.dll\MFCreatePMPMediaSession", "uint", dwCreationFlags, "ptr", pConfiguration, IMFMediaSession.Ptr, ppMediaSession, IMFActivate.Ptr, ppEnablerActivate, "HRESULT")
    return result
}

/**
 * Creates the source resolver, which is used to create a media source from a URL or byte stream.
 * @remarks
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from mf.dll. Starting in Windows 7, this function is exported from mfplat.dll, and mf.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @returns {IMFSourceResolver} Receives a pointer to the source resolver's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsourceresolver">IMFSourceResolver</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesourceresolver
 * @since windows6.0.6000
 */
export MFCreateSourceResolver() {
    result := DllCall("MFPlat.dll\MFCreateSourceResolver", "ptr*", &ppISourceResolver := 0, "HRESULT")
    return IMFSourceResolver(ppISourceResolver)
}

/**
 * Creates an empty property store object.
 * @remarks
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @returns {IPropertyStore} Receives a pointer to the <b>IPropertyStore</b> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-createpropertystore
 * @since windows6.0.6000
 */
export CreatePropertyStore() {
    result := DllCall("MFPlat.dll\CreatePropertyStore", "ptr*", &ppStore := 0, "HRESULT")
    return IPropertyStore(ppStore)
}

/**
 * Retrieves the URL schemes that are registered for the source resolver.
 * @param {Pointer<PROPVARIANT>} pPropVarSchemeArray Pointer to a <b>PROPVARIANT</b> that receives the URL schemes. Before calling this method, call <b>PropVariantInit</b> to initialize the <b>PROPVARIANT</b>. If the method succeeds, the <b>PROPVARIANT</b> contains an array of wide-character strings. The <b>PROPVARIANT</b> data type is VT_VECTOR | VT_LPWSTR. The caller must release the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgetsupportedschemes
 * @since windows6.0.6000
 */
export MFGetSupportedSchemes(pPropVarSchemeArray) {
    result := DllCall("MFPlat.dll\MFGetSupportedSchemes", PROPVARIANT.Ptr, pPropVarSchemeArray, "HRESULT")
    return result
}

/**
 * Retrieves the MIME types that are registered for the source resolver.
 * @param {Pointer<PROPVARIANT>} pPropVarMimeTypeArray Pointer to a <b>PROPVARIANT</b> that receives the MIME types. Before calling this method, call <b>PropVariantInit</b> to initialize the <b>PROPVARIANT</b>. If the method succeeds, the <b>PROPVARIANT</b> contains an array of wide-character strings. The <b>PROPVARIANT</b> data type is VT_VECTOR | VT_LPWSTR. The caller must release the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 *               
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgetsupportedmimetypes
 * @since windows6.0.6000
 */
export MFGetSupportedMimeTypes(pPropVarMimeTypeArray) {
    result := DllCall("MFPlat.dll\MFGetSupportedMimeTypes", PROPVARIANT.Ptr, pPropVarMimeTypeArray, "HRESULT")
    return result
}

/**
 * Creates a topology object.
 * @returns {IMFTopology} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology object. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetopology
 * @since windows6.0.6000
 */
export MFCreateTopology() {
    result := DllCall("MF.dll\MFCreateTopology", "ptr*", &ppTopo := 0, "HRESULT")
    return IMFTopology(ppTopo)
}

/**
 * Creates a topology node.
 * @param {MF_TOPOLOGY_TYPE} NodeType The type of node to create, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_topology_type">MF_TOPOLOGY_TYPE</a> enumeration.
 * @returns {IMFTopologyNode} Receives a pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetopologynode
 * @since windows6.0.6000
 */
export MFCreateTopologyNode(NodeType) {
    result := DllCall("MF.dll\MFCreateTopologyNode", MF_TOPOLOGY_TYPE, NodeType, "ptr*", &ppNode := 0, "HRESULT")
    return IMFTopologyNode(ppNode)
}

/**
 * Gets the media type for a stream associated with a topology node.
 * @remarks
 * This function gets the actual media type from the object that is associated with the topology node. The <i>pNode</i> parameter should specify a node that belongs to a fully resolved topology.  If the node belongs to a partial topology, the function will probably fail. 
 * 
 * Tee nodes do not have an associated object to query. For tee nodes, the function gets the node's input type, if available. Otherwise, if no input type is available, the function gets the media type of the node's primary output stream. The primary output stream is identified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-primaryoutput-attribute">MF_TOPONODE_PRIMARYOUTPUT</a>  attribute.
 * @param {IMFTopologyNode} pNode A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface.
 * @param {Integer} dwStreamIndex The identifier of the stream to query. This parameter is interpreted as follows:
 * 
 * <ul>
 * <li>Transform nodes: The value is the zero-based index of the input or output stream.</li>
 * <li>All other node types: The value must be zero.</li>
 * </ul>
 * @param {BOOL} fOutput <b>If TRUE</b>, the function gets an output type<b>. If FALSE</b>, the function gets an input type. This parameter is interpreted as follows:
 * 
 * <ul>
 * <li>Output nodes: The value must be <b>TRUE</b>.</li>
 * <li>Source nodes: The value must be <b>FALSE</b>.</li>
 * <li>Tee nodes: The value is ignored.</li>
 * <li>Transform nodes: If the value is <b>TRUE</b>, the <i>dwStreamIndex</i> parameter is the index for an output stream. Otherwise, <i>dwStreamIndex</i> is the index for an input stream.</li>
 * </ul>
 * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgettoponodecurrenttype
 * @since windows6.1
 */
export MFGetTopoNodeCurrentType(pNode, dwStreamIndex, fOutput) {
    result := DllCall("MF.dll\MFGetTopoNodeCurrentType", "ptr", pNode, "uint", dwStreamIndex, BOOL, fOutput, "ptr*", &ppType := 0, "HRESULT")
    return IMFMediaType(ppType)
}

/**
 * Queries an object for a specified service interface. (MFGetService)
 * @param {IUnknown} punkObject A pointer to the <b>IUnknown</b> interface of the object to query.
 * @param {Pointer<Guid>} guidService The service identifier (SID) of the service. For a list of service identifiers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/service-interfaces">Service Interfaces</a>.
 * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
 * @returns {Pointer<Void>} Receives the interface pointer. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgetservice
 * @since windows6.0.6000
 */
export MFGetService(punkObject, guidService, riid) {
    result := DllCall("MF.dll\MFGetService", "ptr", punkObject, Guid.Ptr, guidService, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Returns the system time.
 * @returns {Integer} Returns the system time, in 100-nanosecond units.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgetsystemtime
 * @since windows6.0.6000
 */
export MFGetSystemTime() {
    result := DllCall("MFPlat.dll\MFGetSystemTime", Int64)
    return result
}

/**
 * Creates the presentation clock.
 * @remarks
 * The caller must shut down the presentation clock by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfshutdown-shutdown">IMFShutdown::Shutdown</a> on the clock.
 * 
 * Typically applications do not create the presentation clock. The Media Session automatically creates the presentation clock. To get a pointer to the presentation clock from the Media Session, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-getclock">IMFMediaSession::GetClock</a>.
 * @returns {IMFPresentationClock} Receives a pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatepresentationclock
 * @since windows6.0.6000
 */
export MFCreatePresentationClock() {
    result := DllCall("MF.dll\MFCreatePresentationClock", "ptr*", &ppPresentationClock := 0, "HRESULT")
    return IMFPresentationClock(ppPresentationClock)
}

/**
 * Creates a presentation time source that is based on the system time.
 * @returns {IMFPresentationTimeSource} Receives a pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationtimesource">IMFPresentationTimeSource</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesystemtimesource
 * @since windows6.0.6000
 */
export MFCreateSystemTimeSource() {
    result := DllCall("MFPlat.dll\MFCreateSystemTimeSource", "ptr*", &ppSystemTimeSource := 0, "HRESULT")
    return IMFPresentationTimeSource(ppSystemTimeSource)
}

/**
 * Creates a presentation descriptor.
 * @remarks
 * If you are writing a custom media source, you can use this function to create the source presentation descriptor. The presentation descriptor is created with no streams selected. Generally, a media source should select at least one stream by default. To select a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-selectstream">IMFPresentationDescriptor::SelectStream</a>.
 *       
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} cStreamDescriptors Number of elements in the <i>apStreamDescriptors</i> array.
 * @param {Pointer<IMFStreamDescriptor>} apStreamDescriptors Array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface pointers. Each pointer represents a stream descriptor for one stream in the presentation.
 * @returns {IMFPresentationDescriptor} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatepresentationdescriptor
 * @since windows6.0.6000
 */
export MFCreatePresentationDescriptor(cStreamDescriptors, apStreamDescriptors) {
    result := DllCall("MFPlat.dll\MFCreatePresentationDescriptor", "uint", cStreamDescriptors, IMFStreamDescriptor.Ptr, apStreamDescriptors, "ptr*", &ppPresentationDescriptor := 0, "HRESULT")
    return IMFPresentationDescriptor(ppPresentationDescriptor)
}

/**
 * Queries whether a media presentation requires the Protected Media Path (PMP).
 * @remarks
 * If this function returns <b>S_OK</b>, it means the PMP is required for this presentation. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepmpmediasession">MFCreatePMPMediaSession</a> to create the PMP session object.
 * 
 * If the function returns <b>S_FALSE</b>, you can use the unprotected pipeline. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatemediasession">MFCreateMediaSession</a> to create the regular Media Session object.
 * 
 * Internally, this function checks whether any of the stream descriptors in the presentation have the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sd-protected-attribute">MF_SD_PROTECTED</a> attribute with the value <b>TRUE</b>.
 * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of a presentation descriptor. The presentation descriptor is created by the media source, and describes the presentation.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This presentation requires a protected environment.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_FALSE</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This presentation does not require a protected environment.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfrequireprotectedenvironment
 * @since windows6.0.6000
 */
export MFRequireProtectedEnvironment(pPresentationDescriptor) {
    result := DllCall("MF.dll\MFRequireProtectedEnvironment", "ptr", pPresentationDescriptor, "HRESULT")
    return result
}

/**
 * Serializes a presentation descriptor to a byte array.
 * @remarks
 * To deserialize the presentation descriptor, pass the byte array to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfdeserializepresentationdescriptor">MFDeserializePresentationDescriptor</a> function.
 * @param {IMFPresentationDescriptor} pPD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor to serialize.
 * @param {Pointer<Integer>} pcbData Receives the size of the <i>ppbData</i> array, in bytes.
 * @param {Pointer<Pointer<Integer>>} ppbData Receives a pointer to an array of bytes containing the serialized presentation descriptor. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfserializepresentationdescriptor
 * @since windows6.0.6000
 */
export MFSerializePresentationDescriptor(pPD, pcbData, ppbData) {
    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
    ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

    result := DllCall("MFPlat.dll\MFSerializePresentationDescriptor", "ptr", pPD, pcbDataMarshal, pcbData, ppbDataMarshal, ppbData, "HRESULT")
    return result
}

/**
 * Deserializes a presentation descriptor from a byte array.
 * @param {Integer} cbData Size of the <i>pbData</i> array, in bytes.
 * @param {Pointer<Integer>} pbData Pointer to an array of bytes that contains the serialized presentation descriptor.
 * @returns {IMFPresentationDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfdeserializepresentationdescriptor
 * @since windows6.0.6000
 */
export MFDeserializePresentationDescriptor(cbData, pbData) {
    pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

    result := DllCall("MFPlat.dll\MFDeserializePresentationDescriptor", "uint", cbData, pbDataMarshal, pbData, "ptr*", &ppPD := 0, "HRESULT")
    return IMFPresentationDescriptor(ppPD)
}

/**
 * Creates a stream descriptor.
 * @remarks
 * If you are writing a custom media source, you can use this function to create stream descriptors for the source. This function automatically creates the stream descriptor media type handler and initializes it with the list of types given in <i>apMediaTypes</i>. The function does not set the current media type on the handler, however. To set the type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-setcurrentmediatype">IMFMediaTypeHandler::SetCurrentMediaType</a>.
 *       
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} dwStreamIdentifier Stream identifier.
 * @param {Integer} cMediaTypes Number of elements in the <i>apMediaTypes</i> array.
 * @param {Pointer<IMFMediaType>} apMediaTypes Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface pointers. These pointers are used to initialize the media type handler for the stream descriptor.
 * @returns {IMFStreamDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface of the new stream descriptor. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatestreamdescriptor
 * @since windows6.0.6000
 */
export MFCreateStreamDescriptor(dwStreamIdentifier, cMediaTypes, apMediaTypes) {
    result := DllCall("MFPlat.dll\MFCreateStreamDescriptor", "uint", dwStreamIdentifier, "uint", cMediaTypes, IMFMediaType.Ptr, apMediaTypes, "ptr*", &ppDescriptor := 0, "HRESULT")
    return IMFStreamDescriptor(ppDescriptor)
}

/**
 * Creates a media-type handler that supports a single media type at a time.
 * @remarks
 * The media-type handler created by this function supports one media type at a time. Set the media type by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-setcurrentmediatype">IMFMediaTypeHandler::SetCurrentMediaType</a>. After the type is set, <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported">IMFMediaTypeHandler::IsMediaTypeSupported</a> always checks against that type.
 * @returns {IMFMediaTypeHandler} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediatypehandler">IMFMediaTypeHandler</a> interface of the media-type handler. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesimpletypehandler
 * @since windows6.0.6000
 */
export MFCreateSimpleTypeHandler() {
    result := DllCall("MF.dll\MFCreateSimpleTypeHandler", "ptr*", &ppHandler := 0, "HRESULT")
    return IMFMediaTypeHandler(ppHandler)
}

/**
 * Shuts down a Media Foundation object and releases all resources associated with the object. (MFShutdownObject)
 * @remarks
 * This function is not related to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function, which shuts down the Media Foundation platform, as described in <a href="https://docs.microsoft.com/windows/desktop/medfound/initializing-media-foundation">Initializing Media Foundation</a>.
 * @param {IUnknown} pUnk Pointer to the <b>IUnknown</b> interface of the object.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 *               
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfshutdownobject
 * @since windows6.0.6000
 */
export MFShutdownObject(pUnk) {
    result := DllCall("MF.dll\MFShutdownObject", "ptr", pUnk, "HRESULT")
    return result
}

/**
 * Creates the Streaming Audio Renderer.
 * @remarks
 * To configure the audio renderer, set any of the following attributes on the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface specified in the <i>pAudioAttributes</i> parameter.
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-endpoint-id-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ID</a>
 * </td>
 * <td>The audio endpoint device identifier.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-endpoint-role-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ROLE</a>
 * </td>
 * <td>The audio endpoint role.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-flags-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS</a>
 * </td>
 * <td>Miscellaneous configuration flags.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-session-id-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_SESSION_ID</a>
 * </td>
 * <td>The audio policy class.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-stream-category">MF_AUDIO_RENDERER_ATTRIBUTE_STREAM_CATEGORY</a>
 * </td>
 * <td>The audio stream category.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-low-latency">MF_LOW_LATENCY</a>
 * </td>
 * <td>Enables low-latency audio streaming.</td>
 * </tr>
 * </table>
 * @param {IMFAttributes} pAudioAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, which is used to configure the audio renderer. This parameter can be <b>NULL</b>. See Remarks.
 * @returns {IMFMediaSink} Receives a pointer to the audio renderer's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateaudiorenderer
 * @since windows6.0.6000
 */
export MFCreateAudioRenderer(pAudioAttributes) {
    result := DllCall("MF.dll\MFCreateAudioRenderer", "ptr", pAudioAttributes, "ptr*", &ppSink := 0, "HRESULT")
    return IMFMediaSink(ppSink)
}

/**
 * Creates an activation object for the Streaming Audio Renderer.
 * @remarks
 * To create the audio renderer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> on the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer.
 * 
 * <div class="alert"><b>Note</b>  To avoid a memory leak, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-shutdownobject">IMFActivate::ShutdownObject</a> before releasing the final reference to the audio renderer or the audio renderer activate object.</div>
 * <div> </div>
 * To configure the audio renderer, set any of the following attributes on the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> object before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a>. (If you are using the Media Session, the Media Session automatically calls <b>ActivateObject</b> when you queue the topology.)
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-endpoint-id-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ID</a>
 * </td>
 * <td>The audio endpoint device identifier.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-endpoint-role-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ROLE</a>
 * </td>
 * <td>The audio endpoint role.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-flags-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS</a>
 * </td>
 * <td>Miscellaneous configuration flags.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-session-id-attribute">MF_AUDIO_RENDERER_ATTRIBUTE_SESSION_ID</a>
 * </td>
 * <td>The audio policy class.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-audio-renderer-attribute-stream-category">MF_AUDIO_RENDERER_ATTRIBUTE_STREAM_CATEGORY</a>
 * </td>
 * <td>The audio stream category.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-low-latency">MF_LOW_LATENCY</a>
 * </td>
 * <td>Enables low-latency audio streaming.</td>
 * </tr>
 * </table>
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the audio renderer. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateaudiorendereractivate
 * @since windows6.0.6000
 */
export MFCreateAudioRendererActivate() {
    result := DllCall("MF.dll\MFCreateAudioRendererActivate", "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates an activation object for the enhanced video renderer (EVR) media sink.
 * @remarks
 * To create the EVR, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> on the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer. (If you are using the Media Session, the Media Session automatically calls <b>ActivateObject</b> when you queue the topology.)
 * 
 * To configure the EVR, set any of the following attributes on the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> object before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a>.
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-activate-custom-video-mixer-activate-attribute">MF_ACTIVATE_CUSTOM_VIDEO_MIXER_ACTIVATE</a>
 * </td>
 * <td>Activation object for a custom mixer.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-activate-custom-video-mixer-clsid-attribute">MF_ACTIVATE_CUSTOM_VIDEO_MIXER_CLSID</a>
 * </td>
 * <td>CLSID for a custom mixer.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-activate-custom-video-mixer-flags-attribute">MF_ACTIVATE_CUSTOM_VIDEO_MIXER_FLAGS</a>
 * </td>
 * <td>Flags for creating a custom mixer.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-activate-custom-video-presenter-activate-attribute">MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_ACTIVATE</a>
 * </td>
 * <td>Activation object for a custom presenter.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-activate-custom-video-presenter-clsid-attribute">MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_CLSID</a>
 * </td>
 * <td>CLSID for a custom presenter.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-activate-custom-video-presenter-flags-attribute">MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_FLAGS</a>
 * </td>
 * <td>Flags for creating a custom presenter.</td>
 * </tr>
 * </table>
 *  
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> is called, the activation objects sets the video window on the EVR by calling <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setvideoposition">IMFVideoDisplayControl::SetVideoPosition</a>. Passing <b>NULL</b> for the <i>hwndVideo</i> parameter is not an error, but no video will render unless the EVR has a valid video window.
 * @param {HWND} hwndVideo Handle to the window where the video will be displayed.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the EVR. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatevideorendereractivate
 * @since windows6.0.6000
 */
export MFCreateVideoRendererActivate(hwndVideo) {
    result := DllCall("MF.dll\MFCreateVideoRendererActivate", HWND, hwndVideo, "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates a media sink for authoring MP4 files.
 * @remarks
 * The MP4 media sink supports a maximum of one video stream and one audio stream. The initial stream formats are given in the <i>pVideoMediaType</i> and <i>pAudioMediaType</i> parameters. To create an MP4 file with one stream, set the other stream type to <b>NULL</b>. For example, to create an audio-only file, set <i>pVideoMediaType</i> to <b>NULL</b>. 
 * 
 * The number of streams is fixed when you create the media sink. The sink does not support the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method.
 * 
 * To author 3GP files, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreate3gpmediasink">MFCreate3GPMediaSink</a> function.
 * @param {IMFByteStream} pIByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the MP4 file to this byte stream. The byte stream must be writable and support seeking.
 * @param {IMFMediaType} pVideoMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type. This type specifies the format of the video stream.
 * 
 * This parameter can be <b>NULL</b>, but not if <i>pAudioMediaType</i> is <b>NULL</b>.
 * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of an audio media type. This type specifies the format of the audio stream.
 * 
 * This parameter can be <b>NULL</b>, but not if <i>pVideoMediaType</i> is <b>NULL</b>.
 * @returns {IMFMediaSink} Receives a pointer to the MP4 media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatempeg4mediasink
 * @since windows6.1
 */
export MFCreateMPEG4MediaSink(pIByteStream, pVideoMediaType, pAudioMediaType) {
    result := DllCall("MF.dll\MFCreateMPEG4MediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", &ppIMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppIMediaSink)
}

/**
 * Creates a media sink for authoring 3GP files.
 * @remarks
 * The 3GP media sink supports a maximum of one video stream and one audio stream. The initial stream formats are given in the <i>pVideoMediaType</i> and <i>pAudioMediaType</i> parameters. To create an MP4 file with one stream, set the other stream type to <b>NULL</b>. For example, to create an audio-only file, set <i>pVideoMediaType</i> to <b>NULL</b>. 
 * 
 * The number of streams is fixed when you create the media sink. The sink does not support the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method.
 * 
 * To author MP4 files, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatempeg4mediasink">MFCreateMPEG4MediaSink</a> function.
 * @param {IMFByteStream} pIByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the 3GP file to this byte stream. The byte stream must be writable and support seeking.
 * @param {IMFMediaType} pVideoMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type. This type specifies the format of the video stream.
 * 
 * This parameter can be <b>NULL</b>, but not if <i>pAudioMediaType</i> is <b>NULL</b>.
 * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of an audio media type. This type specifies the format of the audio stream.
 * 
 * This parameter can be <b>NULL</b>, but not if <i>pVideoMediaType</i> is <b>NULL</b>.
 * @returns {IMFMediaSink} Receives a pointer to the 3GP media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreate3gpmediasink
 * @since windows6.1
 */
export MFCreate3GPMediaSink(pIByteStream, pVideoMediaType, pAudioMediaType) {
    result := DllCall("MF.dll\MFCreate3GPMediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", &ppIMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppIMediaSink)
}

/**
 * Creates the MP3 media sink.
 * @remarks
 * The MP3  media sink takes compressed MP3
 * audio samples as input, and writes an MP3 file with ID3 headers as output. The MP3 media sink does not perform MP3 audio encoding.
 * @param {IMFByteStream} pTargetByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the MP3 file to this byte stream. The byte stream must be writable.
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the MP3 media sink.. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatemp3mediasink
 * @since windows6.1
 */
export MFCreateMP3MediaSink(pTargetByteStream) {
    result := DllCall("MF.dll\MFCreateMP3MediaSink", "ptr", pTargetByteStream, "ptr*", &ppMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppMediaSink)
}

/**
 * Creates an instance of the AC-3 media sink.
 * @remarks
 * The AC-3 media sink takes compressed AC-3 audio as input and writes the audio to the  byte stream without modification. The primary use for this media sink is to stream AC-3 audio over a network. The media sink does not perform AC-3 audio encoding.
 * @param {IMFByteStream} pTargetByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The media sink writes the AC-3 file to this byte stream. The byte stream must be writable.
 * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the media type for the AC-3 audio stream. The media type must contain the following attributes.
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-major-type-attribute">MF_MT_MAJOR_TYPE</a>
 * </td>
 * <td><b>MFMediaType_Audio</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a>
 * </td>
 * <td><b>MFAudioFormat_Dolby_AC3</b> or <b>MFAudioFormat_Dolby_DDPlus</b></td>
 * </tr>
 * </table>
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateac3mediasink
 * @since windows8.0
 */
export MFCreateAC3MediaSink(pTargetByteStream, pAudioMediaType) {
    result := DllCall("MF.dll\MFCreateAC3MediaSink", "ptr", pTargetByteStream, "ptr", pAudioMediaType, "ptr*", &ppMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppMediaSink)
}

/**
 * Creates an instance of the audio data transport stream (ADTS) media sink.
 * @remarks
 * The ADTS media sink converts Advanced Audio Coding (AAC) audio packets into an ADTS stream. The primary use for this media sink is to stream ADTS over a network. The output is not an audio file, but a stream of audio frames with ADTS headers.
 * 
 * The media sink can accept raw AAC frames (<a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-aac-payload-type">MF_MT_AAC_PAYLOAD_TYPE</a> = 0) or ADTS packets (MF_MT_AAC_PAYLOAD_TYPE = 1). If the input is raw AAC, the media sink inserts an ADTS header at the start of each audio frame. If the input is ADTS packets, the media sink passes the packets through to the byte stream, without modification.
 * @param {IMFByteStream} pTargetByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The media sink writes the ADTS stream to this byte stream. The byte stream must be writable.
 * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the media type for the ADTS stream. The media type must contain the following attributes.
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-major-type-attribute">MF_MT_MAJOR_TYPE</a>
 * </td>
 * <td><b>MFMediaType_Audio</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a>
 * </td>
 * <td><b>MFAudioFormat_AAC</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-aac-payload-type">MF_MT_AAC_PAYLOAD_TYPE</a>
 * </td>
 * <td>0 (raw AAC) or 1 (ADTS)</td>
 * </tr>
 * </table>
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateadtsmediasink
 * @since windows8.0
 */
export MFCreateADTSMediaSink(pTargetByteStream, pAudioMediaType) {
    result := DllCall("MF.dll\MFCreateADTSMediaSink", "ptr", pTargetByteStream, "ptr", pAudioMediaType, "ptr*", &ppMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppMediaSink)
}

/**
 * Creates a generic media sink that wraps a multiplexer Microsoft Media Foundation transform (MFT).
 * @remarks
 * This function attempts to find a multiplexer MFT that supports an output type with the following definition:
 * 
 * <ul>
 * <li>Major type: <b>MFMediaType_Stream</b></li>
 * <li>Subtype: <i>guidOutputSubType</i></li>
 * <li>Additional format attributes (optional)</li>
 * </ul>
 * To provide a list of additional format attributes:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> to get an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> pointer.</li>
 * <li>Use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface to set the attributes. (See <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-attributes">Media Type Attributes</a>.)</li>
 * <li>Pass the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> pointer in the <i>pOutputAttributes</i> parameter.</li>
 * </ol>
 * The multiplexer MFT must be registered in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY_MULTIPLEXER</a>  category.
 * @param {Guid} guidOutputSubType The subtype GUID of the output type for the MFT.
 * @param {IMFAttributes} pOutputAttributes A list of format attributes for the MFT output type. This parameter is optional and can be <b>NULL</b>.
 * @param {IMFByteStream} pOutputByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The output from the MFT is written to this byte stream. This parameter can be <b>NULL</b>.
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the media sink. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatemuxsink
 * @since windows8.0
 */
export MFCreateMuxSink(guidOutputSubType, pOutputAttributes, pOutputByteStream) {
    result := DllCall("MF.dll\MFCreateMuxSink", Guid, guidOutputSubType, "ptr", pOutputAttributes, "ptr", pOutputByteStream, "ptr*", &ppMuxSink := 0, "HRESULT")
    return IMFMediaSink(ppMuxSink)
}

/**
 * Creates a media sink for authoring fragmented MP4 files.
 * @param {IMFByteStream} pIByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the MP4 file to this byte stream. The byte stream must be writable and support seeking.
 * @param {IMFMediaType} pVideoMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type. This type specifies the format of the video stream.
 * 
 * This parameter can be <b>NULL</b>, but not if <i>pAudioMediaType</i> is <b>NULL</b>.
 * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of an audio media type. This type specifies the format of the audio stream.
 * 
 * This parameter can be <b>NULL</b>, but not if <i>pVideoMediaType</i> is <b>NULL</b>.
 * @returns {IMFMediaSink} Receives a pointer to the MP4 media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatefmpeg4mediasink
 * @since windows8.0
 */
export MFCreateFMPEG4MediaSink(pIByteStream, pVideoMediaType, pAudioMediaType) {
    result := DllCall("MF.dll\MFCreateFMPEG4MediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", &ppIMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppIMediaSink)
}

/**
 * Creates an Audio-Video Interleaved (AVI) Sink.
 * @param {IMFByteStream} pIByteStream Pointer to the byte stream that will be used to write the AVI file.
 * @param {IMFMediaType} pVideoMediaType Pointer to the media type of the video input stream
 * @param {IMFMediaType} pAudioMediaType Pointer to the media type of the audio input stream
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> Interface.  The caller must release this interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateavimediasink
 * @since windows8.1
 */
export MFCreateAVIMediaSink(pIByteStream, pVideoMediaType, pAudioMediaType) {
    result := DllCall("mfsrcsnk.dll\MFCreateAVIMediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", &ppIMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppIMediaSink)
}

/**
 * Creates an WAVE archive sink. The WAVE archive sink takes audio and writes it to an .wav file.
 * @param {IMFByteStream} pTargetByteStream Pointer to the byte stream that will be used to write the .wav file.
 * @param {IMFMediaType} pAudioMediaType Pointer to the audio media type.
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface.  The caller must release this interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatewavemediasink
 * @since windows8.1
 */
export MFCreateWAVEMediaSink(pTargetByteStream, pAudioMediaType) {
    result := DllCall("mfsrcsnk.dll\MFCreateWAVEMediaSink", "ptr", pTargetByteStream, "ptr", pAudioMediaType, "ptr*", &ppMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppMediaSink)
}

/**
 * Creates a new instance of the topology loader.
 * @returns {IMFTopoLoader} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopoloader">IMFTopoLoader</a> interface of the topology loader. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetopoloader
 * @since windows6.0.6000
 */
export MFCreateTopoLoader() {
    result := DllCall("MF.dll\MFCreateTopoLoader", "ptr*", &ppObj := 0, "HRESULT")
    return IMFTopoLoader(ppObj)
}

/**
 * Creates an activation object for the sample grabber media sink.
 * @remarks
 * To create the sample grabber sink, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> on the pointer received in the <i>ppIActivate</i> parameter.
 * 
 * Before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a>, you can configure the sample grabber by setting any of the following attributes on the <i>ppIActivate</i> pointer:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-samplegrabbersink-ignore-clock">MF_SAMPLEGRABBERSINK_IGNORE_CLOCK</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-samplegrabbersink-sample-time-offset-attribute">MF_SAMPLEGRABBERSINK_SAMPLE_TIME_OFFSET</a>
 * </li>
 * </ul>
 * @param {IMFMediaType} pIMFMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface, defining the media type for the sample grabber's input stream.
 * @param {IMFSampleGrabberSinkCallback} pIMFSampleGrabberSinkCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsamplegrabbersinkcallback">IMFSampleGrabberSinkCallback</a> interface of a callback object. The caller must implement this interface.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to complete the creation of the sample grabber. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesamplegrabbersinkactivate
 * @since windows6.0.6000
 */
export MFCreateSampleGrabberSinkActivate(pIMFMediaType, pIMFSampleGrabberSinkCallback) {
    result := DllCall("MF.dll\MFCreateSampleGrabberSinkActivate", "ptr", pIMFMediaType, "ptr", pIMFSampleGrabberSinkCallback, "ptr*", &ppIActivate := 0, "HRESULT")
    return IMFActivate(ppIActivate)
}

/**
 * Creates the default implementation of the quality manager.
 * @returns {IMFQualityManager} Receives a pointer to the quality manager's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualitymanager">IMFQualityManager</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatestandardqualitymanager
 * @since windows6.0.6000
 */
export MFCreateStandardQualityManager() {
    result := DllCall("MF.dll\MFCreateStandardQualityManager", "ptr*", &ppQualityManager := 0, "HRESULT")
    return IMFQualityManager(ppQualityManager)
}

/**
 * Creates the sequencer source.
 * @param {IUnknown} pReserved Reserved. Must be <b>NULL</b>.
 * @returns {IMFSequencerSource} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsequencersource">IMFSequencerSource</a> interface of the sequencer source. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesequencersource
 * @since windows6.0.6000
 */
export MFCreateSequencerSource(pReserved) {
    result := DllCall("MF.dll\MFCreateSequencerSource", "ptr", pReserved, "ptr*", &ppSequencerSource := 0, "HRESULT")
    return IMFSequencerSource(ppSequencerSource)
}

/**
 * Creates a PROPVARIANT that can be used to seek within a sequencer source presentation.
 * @remarks
 * The <b>PROPVARIANT</b> returned in <i>pvarSegmentOffset</i> can be used for the <i>pvarStartPosition</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-start">IMFMediaSession::Start</a> method. Use the time format <b>GUID MF_TIME_FORMAT_SEGMENT_OFFSET</b>.
 * @param {Integer} dwId Sequencer element identifier. This value specifies the segment in which to begin playback. The element identifier is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsequencersource-appendtopology">IMFSequencerSource::AppendTopology</a> method.
 * @param {Integer} hnsOffset Starting position within the segment, in 100-nanosecond units.
 * @param {Pointer<PROPVARIANT>} pvarSegmentOffset Pointer to a <b>PROPVARIANT</b>. The method fills in the <b>PROPVARIANT</b> with the information needed for performing a seek operation. The caller must free the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesequencersegmentoffset
 * @since windows6.0.6000
 */
export MFCreateSequencerSegmentOffset(dwId, hnsOffset, pvarSegmentOffset) {
    result := DllCall("MF.dll\MFCreateSequencerSegmentOffset", "uint", dwId, "int64", hnsOffset, PROPVARIANT.Ptr, pvarSegmentOffset, "HRESULT")
    return result
}

/**
 * Creates a media source that aggregates a collection of media sources.
 * @remarks
 * The aggregated media source is useful for combining  streams from separate media sources. For example, you can use it to  combine a video capture source and an audio capture source.
 * @param {IMFCollection} pSourceCollection A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface of the collection object that contains a list of media sources.
 * @returns {IMFMediaSource} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of the aggregated media source. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateaggregatesource
 * @since windows6.1
 */
export MFCreateAggregateSource(pSourceCollection) {
    result := DllCall("MF.dll\MFCreateAggregateSource", "ptr", pSourceCollection, "ptr*", &ppAggSource := 0, "HRESULT")
    return IMFMediaSource(ppAggSource)
}

/**
 * Creates a credential cache object. An application can use this object to implement a custom credential manager.
 * @returns {IMFNetCredentialCache} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredentialcache">IMFNetCredentialCache</a> interface of the new credential cache object. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecredentialcache
 * @since windows6.0.6000
 */
export MFCreateCredentialCache() {
    result := DllCall("MF.dll\MFCreateCredentialCache", "ptr*", &ppCache := 0, "HRESULT")
    return IMFNetCredentialCache(ppCache)
}

/**
 * Creates a default proxy locator.
 * @param {PWSTR} pszProtocol The name of the protocol.
 * 
 * <div class="alert"><b>Note</b>  In this release of Media Foundation, the default proxy locator does not support RTSP.</div>
 * <div> </div>
 * @param {IPropertyStore} pProxyConfig Pointer to the <b>IPropertyStore</b> interface of a property store that contains the proxy configuration in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-proxysettings-property">MFNETSOURCE_PROXYSETTINGS</a> property.
 * @returns {IMFNetProxyLocator} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetproxylocator">IMFNetProxyLocator</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateproxylocator
 * @since windows6.0.6000
 */
export MFCreateProxyLocator(pszProtocol, pProxyConfig) {
    pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

    result := DllCall("MF.dll\MFCreateProxyLocator", "ptr", pszProtocol, "ptr", pProxyConfig, "ptr*", &ppProxyLocator := 0, "HRESULT")
    return IMFNetProxyLocator(ppProxyLocator)
}

/**
 * Creates the scheme handler for the network source.
 * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface to retrieve.
 * @param {Pointer<Pointer<Void>>} ppvHandler Receives a pointer to the requested interface. The caller must release the interface. The scheme handler exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfschemehandler">IMFSchemeHandler</a> interface.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatenetschemeplugin
 * @since windows6.0.6000
 */
export MFCreateNetSchemePlugin(riid, ppvHandler) {
    ppvHandlerMarshal := ppvHandler is VarRef ? "ptr*" : "ptr"

    result := DllCall("MF.dll\MFCreateNetSchemePlugin", Guid.Ptr, riid, ppvHandlerMarshal, ppvHandler, "HRESULT")
    return result
}

/**
 * Creates the protected media path (PMP) server object.
 * @param {Integer} dwCreationFlags A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpmpsession_creation_flags">MFPMPSESSION_CREATION_FLAGS</a> enumeration that specifies how to create the PMP session.
 * @returns {IMFPMPServer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmpserver">IMFPMPServer</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatepmpserver
 * @since windows6.0.6000
 */
export MFCreatePMPServer(dwCreationFlags) {
    result := DllCall("MF.dll\MFCreatePMPServer", "uint", dwCreationFlags, "ptr*", &ppPMPServer := 0, "HRESULT")
    return IMFPMPServer(ppPMPServer)
}

/**
 * Creates the remote desktop plug-in object. Use this object if the application is running in a Terminal Services client session.
 * @returns {IMFRemoteDesktopPlugin} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfremotedesktopplugin">IMFRemoteDesktopPlugin</a> interface of the plug-in object. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateremotedesktopplugin
 * @since windows6.0.6000
 */
export MFCreateRemoteDesktopPlugin() {
    result := DllCall("MF.dll\MFCreateRemoteDesktopPlugin", "ptr*", &ppPlugin := 0, "HRESULT")
    return IMFRemoteDesktopPlugin(ppPlugin)
}

/**
 * Creates an empty property store to hold name/value pairs.
 * @returns {INamedPropertyStore} Receives a pointer to the <b>INamedPropertyStore</b> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-createnamedpropertystore
 * @since windows6.0.6000
 */
export CreateNamedPropertyStore() {
    result := DllCall("MF.dll\CreateNamedPropertyStore", "ptr*", &ppStore := 0, "HRESULT")
    return INamedPropertyStore(ppStore)
}

/**
 * Creates an instance of the sample copier transform.
 * @remarks
 * The sample copier is a Media Foundation transform (MFT) that copies data from input samples to output samples without modifying the data. The following data is copied from the sample:
 * 
 * <ul>
 * <li>All <a href="https://docs.microsoft.com/windows/desktop/medfound/sample-attributes">Sample Attributes</a>.</li>
 * <li>The time stamp and duration.</li>
 * <li>Sample flags (see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-setsampleflags">IMFSample::SetSampleFlags</a>).</li>
 * <li>The data in the media buffers. If the input sample contains multiple buffers, the data is copied into a single buffer on the output sample.</li>
 * </ul>
 * This MFT is useful in the following situation:
 * 
 * <ul>
 * <li>One pipeline object, such as a media source, allocates media samples for output.</li>
 * <li>Another pipeline object, such as a media sink, allocates its own media samples for input. For example, the object might require buffers allocated from a special memory pool, such as video memory.</li>
 * </ul>
 * The following diagram shows this situation with a media source and a media sink.
 * 
 * <img alt="Diagram: Media Source points to a Sample; Media Sink points to a second Sample; Sample Copier points to an arrow from the first sample to the second" src="./images/SampleCopierMFT.gif"/>
 * 
 * In order for the media sink to receive data from the media source, the data must be copied into the media samples owned by the media sink. The sample copier can be used for this purpose.
 * 
 * A specific example of such a media sink is the  <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer">Enhanced Video Renderer</a> (EVR). The EVR allocates samples that contain Direct3D surface buffers, so it cannot receive video samples directly from a media source. Starting in Windows 7, the topology loader automatically handles this case by inserting the sample copier between the media source and the EVR.
 * @returns {IMFTransform} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesamplecopiermft
 * @since windows6.1
 */
export MFCreateSampleCopierMFT() {
    result := DllCall("MF.dll\MFCreateSampleCopierMFT", "ptr*", &ppCopierMFT := 0, "HRESULT")
    return IMFTransform(ppCopierMFT)
}

/**
 * Creates an empty transcode profile object.
 * @remarks
 * The <b>MFCreateTranscodeProfile</b> function creates an empty transcode profile. You must configure the transcode profile setting attributes that define the media types and the container properties. Use the following methods to configure the profile:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setaudioattributes">IMFTranscodeProfile::SetAudioAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setvideoattributes">IMFTranscodeProfile::SetVideoAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setcontainerattributes">IMFTranscodeProfile::SetContainerAttributes</a>
 * </li>
 * </ul>
 * For example code that uses this function, see the following topics:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/tutorial--encoding-an-mp4-file-">Tutorial: Encoding an MP4 File</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/tutorial--converting-an-mp3-file-to-a-wma-file">Tutorial: Encoding a WMA File</a>
 * </li>
 * </ul>
 * @returns {IMFTranscodeProfile} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface of the transcode profile object. Caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetranscodeprofile
 * @since windows6.1
 */
export MFCreateTranscodeProfile() {
    result := DllCall("MF.dll\MFCreateTranscodeProfile", "ptr*", &ppTranscodeProfile := 0, "HRESULT")
    return IMFTranscodeProfile(ppTranscodeProfile)
}

/**
 * Creates a partial transcode topology.
 * @remarks
 * For example code that uses this function, see the following topics:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/tutorial--encoding-an-mp4-file-">Tutorial: Encoding an MP4 File</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/tutorial--converting-an-mp3-file-to-a-wma-file">Tutorial: Encoding a WMA File</a>
 * </li>
 * </ul>
 * @param {IMFMediaSource} pSrc A pointer to a media source that encapsulates the source file to be transcoded. The media source object exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface and can be created by using the source resolver. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/using-the-source-resolver">Using the Source Resolver</a>.
 * @param {PWSTR} pwszOutputFilePath A pointer to a null-terminated string that contains the name and path of the output file to be generated.
 * @param {IMFTranscodeProfile} pProfile A pointer to the transcode profile that contains the configuration settings for the audio stream, the video stream, and the container to which the file is written. The transcode profile object exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface and must be created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodeprofile">MFCreateTranscodeProfile</a> function. After the object has been created the caller must provide the configuration settings by calling appropriate the <b>IMFTranscodeProfile</b> methods.
 * @returns {IMFTopology} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the transcode topology object. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetranscodetopology
 * @since windows6.1
 */
export MFCreateTranscodeTopology(pSrc, pwszOutputFilePath, pProfile) {
    pwszOutputFilePath := pwszOutputFilePath is String ? StrPtr(pwszOutputFilePath) : pwszOutputFilePath

    result := DllCall("MF.dll\MFCreateTranscodeTopology", "ptr", pSrc, "ptr", pwszOutputFilePath, "ptr", pProfile, "ptr*", &ppTranscodeTopo := 0, "HRESULT")
    return IMFTopology(ppTranscodeTopo)
}

/**
 * Creates a topology for transcoding to a byte stream.
 * @remarks
 * This function creates a partial topology that contains the media source, the encoder, and the media sink.
 * @param {IMFMediaSource} pSrc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of a media source. The media source provides that source content for transcoding.
 * @param {IMFByteStream} pOutputStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The transcoded output will be written to this byte stream.
 * @param {IMFTranscodeProfile} pProfile A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface of a transcoding profile.
 * @returns {IMFTopology} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetranscodetopologyfrombytestream
 * @since windows8.0
 */
export MFCreateTranscodeTopologyFromByteStream(pSrc, pOutputStream, pProfile) {
    result := DllCall("MF.dll\MFCreateTranscodeTopologyFromByteStream", "ptr", pSrc, "ptr", pOutputStream, "ptr", pProfile, "ptr*", &ppTranscodeTopo := 0, "HRESULT")
    return IMFTopology(ppTranscodeTopo)
}

/**
 * Gets a list of output formats from an audio encoder.
 * @remarks
 * This function assumes the encoder will be used in its default encoding mode, which is typically constant bit-rate (CBR) encoding. Therefore, the types returned by the function might not work with other modes, such as variable bit-rate (VBR) encoding.
 * 
 * Internally, this function works by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> to find a matching encoder, and then calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputavailabletype">IMFTransform::GetOutputAvailableType</a> to get the encoder's output types.
 * @param {Pointer<Guid>} guidSubType Specifies the subtype of the output media. The encoder uses this value as a filter when it is enumerating the available output types. For information about the audio subtypes, see  <a href="https://docs.microsoft.com/windows/desktop/medfound/audio-subtype-guids">Audio Subtype GUIDs</a>.
 * @param {Integer} dwMFTFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
 * @param {IMFAttributes} pCodecConfig A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. The attribute store specifies the encoder configuration settings. This parameter can be <b>NULL</b>. The attribute store can hold any of the following attributes.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_FIELDOFUSE_UNLOCK_Attribute"></a><a id="mft_fieldofuse_unlock_attribute"></a><a id="MFT_FIELDOFUSE_UNLOCK_ATTRIBUTE"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mft-fieldofuse-unlock-attribute">MFT_FIELDOFUSE_UNLOCK_Attribute</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Set this attribute to unlock an encoder that has field-of-use descriptions.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_TRANSCODE_ENCODINGPROFILE"></a><a id="mf_transcode_encodingprofile"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-encodingprofile">MF_TRANSCODE_ENCODINGPROFILE</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies a device conformance profile for a Windows Media encoder.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_TRANSCODE_QUALITYVSSPEED"></a><a id="mf_transcode_qualityvsspeed"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-qualityvsspeed">MF_TRANSCODE_QUALITYVSSPEED</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the tradeoff between encoding quality and encoding speed.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {IMFCollection} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface of a collection object that contains a list of preferred audio media types. The collection contains <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointers. The caller must release the interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mftranscodegetaudiooutputavailabletypes
 * @since windows6.1
 */
export MFTranscodeGetAudioOutputAvailableTypes(guidSubType, dwMFTFlags, pCodecConfig) {
    result := DllCall("MF.dll\MFTranscodeGetAudioOutputAvailableTypes", Guid.Ptr, guidSubType, "uint", dwMFTFlags, "ptr", pCodecConfig, "ptr*", &ppAvailableTypes := 0, "HRESULT")
    return IMFCollection(ppAvailableTypes)
}

/**
 * Creates the transcode sink activation object.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. This interface is used to create the file sink instance from the activation object. Before doing so, query the returned pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodesinkinfoprovider">IMFTranscodeSinkInfoProvider</a> interface and use that interface to initialize the object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetranscodesinkactivate
 * @since windows6.1
 */
export MFCreateTranscodeSinkActivate() {
    result := DllCall("MF.dll\MFCreateTranscodeSinkActivate", "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates an IMFTrackedSample object that tracks the reference counts on a video media sample.
 * @returns {IMFTrackedSample} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrackedsample">IMFTrackedSample</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatetrackedsample
 * @since windows8.0
 */
export MFCreateTrackedSample() {
    result := DllCall("MFPlat.dll\MFCreateTrackedSample", "ptr*", &ppMFSample := 0, "HRESULT")
    return IMFTrackedSample(ppMFSample)
}

/**
 * Creates a Microsoft Media Foundation byte stream that wraps an IStream pointer.
 * @remarks
 * This function enables applications to pass an <b>IStream</b> object to a Media Foundation API that takes an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> pointer.
 * @param {IStream} pStream A pointer to the <b>IStream</b> interface.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatemfbytestreamonstream
 * @since windows6.1
 */
export MFCreateMFByteStreamOnStream(pStream) {
    result := DllCall("MFPlat.dll\MFCreateMFByteStreamOnStream", "ptr", pStream, "ptr*", &ppByteStream := 0, "HRESULT")
    return IMFByteStream(ppByteStream)
}

/**
 * Returns an IStream pointer that wraps a Microsoft Media Foundation byte stream.
 * @remarks
 * This function enables an application to pass a Media Foundation byte stream to an API that takes an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer.
 * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the Media Foundation byte stream.
 * @returns {IStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatestreamonmfbytestream
 * @since windows8.0
 */
export MFCreateStreamOnMFByteStream(pByteStream) {
    result := DllCall("MFPlat.dll\MFCreateStreamOnMFByteStream", "ptr", pByteStream, "ptr*", &ppStream := 0, "HRESULT")
    return IStream(ppStream)
}

/**
 * Creates a Microsoft Media Foundation byte stream that wraps an IRandomAccessStream object.
 * @param {IUnknown} punkStream A pointer to the <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a> interface.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatemfbytestreamonstreamex
 * @since windows8.0
 */
export MFCreateMFByteStreamOnStreamEx(punkStream) {
    result := DllCall("MFPlat.dll\MFCreateMFByteStreamOnStreamEx", "ptr", punkStream, "ptr*", &ppByteStream := 0, "HRESULT")
    return IMFByteStream(ppByteStream)
}

/**
 * Creates an IRandomAccessStream object that wraps a Microsoft Media Foundation byte stream.
 * @remarks
 * The returned byte stream object exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfgetservice">IMFGetService</a> interface. To get the original <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> using the service identifier <b>MF_WRAPPED_OBJECT</b>.
 * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the Media Foundation byte stream.
 * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatestreamonmfbytestreamex
 * @since windows8.0
 */
export MFCreateStreamOnMFByteStreamEx(pByteStream, riid) {
    result := DllCall("MFPlat.dll\MFCreateStreamOnMFByteStreamEx", "ptr", pByteStream, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Create an IMFMediaType from properties.
 * @param {IUnknown} punkStream A pointer to properties.
 * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a>. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatemediatypefromproperties
 * @since windows8.0
 */
export MFCreateMediaTypeFromProperties(punkStream) {
    result := DllCall("MFPlat.dll\MFCreateMediaTypeFromProperties", "ptr", punkStream, "ptr*", &ppMediaType := 0, "HRESULT")
    return IMFMediaType(ppMediaType)
}

/**
 * Creates properties from a IMFMediaType.
 * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
 * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatepropertiesfrommediatype
 * @since windows8.0
 */
export MFCreatePropertiesFromMediaType(pMediaType, riid) {
    result := DllCall("MFPlat.dll\MFCreatePropertiesFromMediaType", "ptr", pMediaType, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Enumerates a list of audio or video capture devices.
 * @remarks
 * Each returned <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer represents a capture device, and can be used to create a media source for that device. You can also use the <b>IMFActivate</b> pointer to query for attributes that describe the device. The following attributes might be set:
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-friendly-name">MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME</a>
 * </td>
 * <td>The display name of the device.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-media-type">MF_DEVSOURCE_ATTRIBUTE_MEDIA_TYPE</a>
 * </td>
 * <td>The major type and subtype GUIDs that describe the device's output format.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE</a>
 * </td>
 * <td>The type of capture device (audio or video).</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a>
 * </td>
 * <td>The audio endpoint ID string. (Audio devices only.)</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-category">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY</a>
 * </td>
 * <td>The device category. (Video devices only.)</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-hw-source">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_HW_SOURCE</a>
 * </td>
 * <td> Whether a device is a hardware or software device. (Video devices only.)</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK</a>
 * </td>
 * <td>The symbolic link for the device driver. (Video devices only.)</td>
 * </tr>
 * </table>
 *  
 * 
 * To create a media source from an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> method.
 * @param {IMFAttributes} pAttributes Pointer to an attribute store that contains search criteria. To create the attribute store, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a>. Set one or more of the following attributes on the attribute store:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE"></a><a id="mf_devsource_attribute_source_type"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies whether to enumerate audio or video devices. (Required.)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE"></a><a id="mf_devsource_attribute_source_type_audcap_role"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-role">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * For audio capture devices, specifies the device role. (Optional.)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY"></a><a id="mf_devsource_attribute_source_type_vidcap_category"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-category">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * For video capture devices, specifies the device category. (Optional.)
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<IMFActivate>>} pppSourceActivate Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointers. Each pointer represents an activation object for a media source. The function allocates the memory for the array. The caller must release the pointers in the array and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the memory for the array.
 * @param {Pointer<Integer>} pcSourceActivate Receives the number of elements in the <i>pppSourceActivate</i> array. If no capture devices match the search criteria, this parameter receives the value 0.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfenumdevicesources
 * @since windows6.1
 */
export MFEnumDeviceSources(pAttributes, pppSourceActivate, pcSourceActivate) {
    pppSourceActivateMarshal := pppSourceActivate is VarRef ? "ptr*" : "ptr"
    pcSourceActivateMarshal := pcSourceActivate is VarRef ? "uint*" : "ptr"

    result := DllCall("MF.dll\MFEnumDeviceSources", "ptr", pAttributes, pppSourceActivateMarshal, pppSourceActivate, pcSourceActivateMarshal, pcSourceActivate, "HRESULT")
    return result
}

/**
 * Creates a media source for a hardware capture device.
 * @remarks
 * <div class="alert"><b>Important</b>  When the capture device is no longer needed, you must shut down the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> object you obtained by calling <b>MFCreateDeviceSource</b>. Failure to call <b>Shutdown</b> can result in memory links because the system may keep a reference to <b>IMFMediaSource</b> resources until <b>Shutdown</b> is called.
 * 
 * </div>
 * <div> </div>
 * The <i>pAttributes</i> parameter specifies an attribute store. To create the attribute store, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> function.  You must set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE</a> attribute, which specifies the type of device (audio or video).
 * 
 * For audio capture devices, optionally set one of the following attributes:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID"></a><a id="mf_devsource_attribute_source_type_audcap_endpoint_id"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a>
 * 
 * 
 * </td>
 * <td width="60%">
 * Specifies the audio endpoint ID of the audio capture device.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE"></a><a id="mf_devsource_attribute_source_type_audcap_role"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-role">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE</a>
 * 
 * 
 * </td>
 * <td width="60%">
 * Specifies the device role. If this attribute is set, the function uses the default audio capture device for that device role.
 * 
 * Do not combine this attribute with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a> attribute.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If neither attribute is specified, the function selects the default audio capture device for the <b>eCommunications</b> role.
 * 
 * For video capture devices, you must set the following attribute:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK"></a><a id="mf_devsource_attribute_source_type_vidcap_symbolic_link"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK</a>
 * 
 * 
 * </td>
 * <td width="60%">
 * Specifies the symbolic link to the device.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store, which is used to select the device. See Remarks.
 * @returns {IMFMediaSource} Receives a pointer to the media source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatedevicesource
 * @since windows6.1
 */
export MFCreateDeviceSource(pAttributes) {
    result := DllCall("MF.dll\MFCreateDeviceSource", "ptr", pAttributes, "ptr*", &ppSource := 0, "HRESULT")
    return IMFMediaSource(ppSource)
}

/**
 * Creates an activation object that represents a hardware capture device.
 * @remarks
 * This function creates an activation object that can be used to create a media source for a hardware device. To create the media source itself, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a>.
 * 
 * The <i>pAttributes</i> parameter specifies an attribute store. To create the attribute store, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> function.  You must set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE</a> attribute, which specifies the type of device (audio or video).
 * 
 * For audio capture devices, optionally set one of the following attributes:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID"></a><a id="mf_devsource_attribute_source_type_audcap_endpoint_id"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a>
 * 
 * 
 * </td>
 * <td width="60%">
 * Specifies the audio endpoint ID of the audio capture device.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE"></a><a id="mf_devsource_attribute_source_type_audcap_role"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-role">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE</a>
 * 
 * 
 * </td>
 * <td width="60%">
 * Specifies the device role. If this attribute is set, the function uses the default audio capture device for that device role.
 * 
 * Do not combine this attribute with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a> attribute.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If neither attribute is specified, the function selects the default audio capture device for the <b>eCommunications</b> role.
 * 
 * For video capture devices, you must set the following attribute:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK"></a><a id="mf_devsource_attribute_source_type_vidcap_symbolic_link"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK</a>
 * 
 * 
 * </td>
 * <td width="60%">
 * Specifies the symbolic link to the device.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store, which is used to select the device. See Remarks.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatedevicesourceactivate
 * @since windows6.1
 */
export MFCreateDeviceSourceActivate(pAttributes) {
    result := DllCall("MF.dll\MFCreateDeviceSourceActivate", "ptr", pAttributes, "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates an IMFProtectedEnvironmentAccess object that allows content protection systems to perform a handshake with the protected environment.
 * @returns {IMFProtectedEnvironmentAccess} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfprotectedenvironmentaccess">IMFProtectedEnvironmentAccess</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreateprotectedenvironmentaccess
 * @since windows8.0
 */
export MFCreateProtectedEnvironmentAccess() {
    result := DllCall("MF.dll\MFCreateProtectedEnvironmentAccess", "ptr*", &ppAccess := 0, "HRESULT")
    return IMFProtectedEnvironmentAccess(ppAccess)
}

/**
 * Loads a dynamic link library that is signed for the protected environment.
 * @remarks
 * A singlemodule load count is maintained on the dynamic link library (as it is with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>).  This load count  is freed when the final release is called on the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsignedlibrary">IMFSignedLibrary</a> object.
 * @param {PWSTR} pszName The name of the dynamic link library to load.  This dynamic link library must be signed for the protected environment.
 * @returns {IMFSignedLibrary} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsignedlibrary">IMFSignedLibrary</a> interface for the library.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfloadsignedlibrary
 * @since windows8.0
 */
export MFLoadSignedLibrary(pszName) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("MF.dll\MFLoadSignedLibrary", "ptr", pszName, "ptr*", &ppLib := 0, "HRESULT")
    return IMFSignedLibrary(ppLib)
}

/**
 * Returns an IMFSystemId object for retrieving system id data.
 * @returns {IMFSystemId} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsystemid">IMFSystemId</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgetsystemid
 * @since windows8.0
 */
export MFGetSystemId() {
    result := DllCall("MF.dll\MFGetSystemId", "ptr*", &ppId := 0, "HRESULT")
    return IMFSystemId(ppId)
}

/**
 * Gets the local system ID.
 * @param {Integer} verifier Application-specific verifier value.
 * @param {Integer} _size Length in bytes of verifier.
 * @returns {PWSTR} Returned ID string.  This value must be freed by the caller by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfgetlocalid
 * @since windows8.0
 */
export MFGetLocalId(verifier, _size) {
    result := DllCall("MF.dll\MFGetLocalId", "ptr", verifier, "uint", _size, PWSTR.Ptr, &id := 0, "HRESULT")
    return id
}

/**
 * Creates an IMFContentProtectionDevice interface for the specified media protection system.
 * @param {Pointer<Guid>} ProtectionSystemId The identifier of the media protection system for which you want to create the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectiondevice">IMFContentProtectionDevice</a> interface.
 * @returns {IMFContentProtectionDevice} Pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectiondevice">IMFContentProtectionDevice</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecontentprotectiondevice
 * @since windows10.0.10240
 */
export MFCreateContentProtectionDevice(ProtectionSystemId) {
    result := DllCall("MFPlat.dll\MFCreateContentProtectionDevice", Guid.Ptr, ProtectionSystemId, "ptr*", &ContentProtectionDevice := 0, "HRESULT")
    return IMFContentProtectionDevice(ContentProtectionDevice)
}

/**
 * Checks whether a hardware security processor is supported for the specified media protection system.
 * @param {Pointer<Guid>} ProtectionSystemId The identifier of the protection system that you want to check.
 * @returns {BOOL} <b>TRUE</b> if the hardware security processor is supported for the specified protection system; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfiscontentprotectiondevicesupported
 * @since windows10.0.10240
 */
export MFIsContentProtectionDeviceSupported(ProtectionSystemId) {
    result := DllCall("MFPlat.dll\MFIsContentProtectionDeviceSupported", Guid.Ptr, ProtectionSystemId, BOOL.Ptr, &isSupported := 0, "HRESULT")
    return isSupported
}

/**
 * Creates an IMFContentDecryptorContext interface for the specified media protection system.
 * @param {Pointer<Guid>} guidMediaProtectionSystemId The identifier of the media protection system for which you want to create an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentdecryptorcontext">IMFContentDecryptorContext</a> interface.
 * @param {IMFDXGIDeviceManager} pD3DManager Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface that you want to use for sharing the Direct3D 11 device.
 * @param {IMFContentProtectionDevice} pContentProtectionDevice The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectiondevice">IMFContentProtectionDevice</a> interface for the specified media protection system.
 * @returns {IMFContentDecryptorContext} Pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentdecryptorcontext">IMFContentDecryptorContext</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecontentdecryptorcontext
 * @since windows10.0.10240
 */
export MFCreateContentDecryptorContext(guidMediaProtectionSystemId, pD3DManager, pContentProtectionDevice) {
    result := DllCall("MFPlat.dll\MFCreateContentDecryptorContext", Guid.Ptr, guidMediaProtectionSystemId, "ptr", pD3DManager, "ptr", pContentProtectionDevice, "ptr*", &ppContentDecryptorContext := 0, "HRESULT")
    return IMFContentDecryptorContext(ppContentDecryptorContext)
}

/**
 * Creates an instance of the IMFSensorGroup interface based on the provided symbolic link name.
 * @remarks
 * If the function succeeds, <i>ppSensorGroup</i> will point to a valid <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a> object.  The caller must release this interface.
 * 
 * <div class="alert"><b>Note</b>  When this API is used with a <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_SENSOR_CAMERA</a> or <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_VIDEO_CAMERA</a> symbolic name, the resulting <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a> object will only contain one sensor device but behaves as a virtualized sensor group.  The caller  may use the resulting object in the same manner as a sensor group obtained from a <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_SENSOR_GROUP</a>.</div>
 * <div> </div>
 * @param {PWSTR} SensorGroupSymbolicLink The symbolic link for the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a>. This name can be obtained through device enumeration APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdigetclassdevsw">SetupDiGetClassDevs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfenumdevicesources">MFEnumDeviceSources</a> or by getting the  <a href="https://docs.microsoft.com/uwp/api/Windows.Devices.Enumeration.DeviceInformation">Id</a> property of the <a href="https://docs.microsoft.com/uwp/api/Windows.Devices.Enumeration.DeviceInformation">DeviceInformation</a> class.
 * @returns {IMFSensorGroup} The symbolic link for the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesensorgroup
 * @since windows10.0.14393
 */
export MFCreateSensorGroup(SensorGroupSymbolicLink) {
    SensorGroupSymbolicLink := SensorGroupSymbolicLink is String ? StrPtr(SensorGroupSymbolicLink) : SensorGroupSymbolicLink

    result := DllCall("MFSENSORGROUP.dll\MFCreateSensorGroup", "ptr", SensorGroupSymbolicLink, "ptr*", &ppSensorGroup := 0, "HRESULT")
    return IMFSensorGroup(ppSensorGroup)
}

/**
 * Creates an instance of the IMFSensorStream interface.
 * @param {Integer} StreamId The identifier for the created stream. This is the same as setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devicestream-stream-id">MF_DEVICESTREAM_STREAM_ID</a> attribute. This value is used if <i>pAttributes</i> is null.
 * @param {IMFAttributes} pAttributes The attribute store for the created stream.
 * @param {IMFCollection} pMediaTypeCollection The collection of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> objects specifying the media types supported by the stream.
 * @returns {IMFSensorStream} The created stream interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesensorstream
 * @since windows10.0.15063
 */
export MFCreateSensorStream(StreamId, pAttributes, pMediaTypeCollection) {
    result := DllCall("MFSENSORGROUP.dll\MFCreateSensorStream", "uint", StreamId, "ptr", pAttributes, "ptr", pMediaTypeCollection, "ptr*", &ppStream := 0, "HRESULT")
    return IMFSensorStream(ppStream)
}

/**
 * Creates a sensor profile, based on the specified type, index, and optional constraints.
 * @param {Pointer<Guid>} ProfileType The profile type to create.
 * @param {Integer} ProfileIndex The profile index.
 * @param {PWSTR} Constraints Any optional constraints to be put on the profile.
 * @returns {IMFSensorProfile} On success, returns a double pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofile">IMFSensorProfile</a> containing the sensor profile.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesensorprofile
 * @since windows10.0.17134
 */
export MFCreateSensorProfile(ProfileType, ProfileIndex, Constraints) {
    Constraints := Constraints is String ? StrPtr(Constraints) : Constraints

    result := DllCall("MFSENSORGROUP.dll\MFCreateSensorProfile", Guid.Ptr, ProfileType, "uint", ProfileIndex, "ptr", Constraints, "ptr*", &ppProfile := 0, "HRESULT")
    return IMFSensorProfile(ppProfile)
}

/**
 * Creates a sensor profile collection.
 * @returns {IMFSensorProfileCollection} On success, points to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofilecollection">IMFSensorProfileCollection</a> containing the sensor profile collection.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesensorprofilecollection
 * @since windows10.0.15063
 */
export MFCreateSensorProfileCollection() {
    result := DllCall("MFSENSORGROUP.dll\MFCreateSensorProfileCollection", "ptr*", &ppSensorProfile := 0, "HRESULT")
    return IMFSensorProfileCollection(ppSensorProfile)
}

/**
 * Initializes a new instance of the IMFSensorActivityMonitor interface.
 * @param {IMFSensorActivitiesReportCallback} pCallback An implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreportcallback">IMFSensorActivitiesReportCallback</a> interface through which the system delivers <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreport">IMFSensorActivitiesReport</a> objects.
 * @returns {IMFSensorActivityMonitor} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitymonitor">IMFSensorActivityMonitor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatesensoractivitymonitor
 */
export MFCreateSensorActivityMonitor(pCallback) {
    result := DllCall("MFSENSORGROUP.dll\MFCreateSensorActivityMonitor", "ptr", pCallback, "ptr*", &ppActivityMonitor := 0, "HRESULT")
    return IMFSensorActivityMonitor(ppActivityMonitor)
}

/**
 * 
 * @returns {IMFExtendedCameraIntrinsics} 
 */
export MFCreateExtendedCameraIntrinsics() {
    result := DllCall("MFCORE.dll\MFCreateExtendedCameraIntrinsics", "ptr*", &ppExtendedCameraIntrinsics := 0, "HRESULT")
    return IMFExtendedCameraIntrinsics(ppExtendedCameraIntrinsics)
}

/**
 * 
 * @param {MFCameraIntrinsic_DistortionModelType} distortionModelType 
 * @returns {IMFExtendedCameraIntrinsicModel} 
 */
export MFCreateExtendedCameraIntrinsicModel(distortionModelType) {
    result := DllCall("MFCORE.dll\MFCreateExtendedCameraIntrinsicModel", MFCameraIntrinsic_DistortionModelType, distortionModelType, "ptr*", &ppExtendedCameraIntrinsicModel := 0, "HRESULT")
    return IMFExtendedCameraIntrinsicModel(ppExtendedCameraIntrinsicModel)
}

/**
 * Creates a new instance of the **IMFRelativePanelWatcher** interface
 * @param {PWSTR} videoDeviceId A string containing the symbolic link name of the video capture device.
 * @param {PWSTR} displayMonitorDeviceId A string containing the symbolic link name of the display monitor device.
 * @returns {IMFRelativePanelWatcher} A pointer to an **IMFRelativePanelWatcher** interface representing the watcher.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreaterelativepanelwatcher
 * @since windows10.0.19041
 */
export MFCreateRelativePanelWatcher(videoDeviceId, displayMonitorDeviceId) {
    videoDeviceId := videoDeviceId is String ? StrPtr(videoDeviceId) : videoDeviceId
    displayMonitorDeviceId := displayMonitorDeviceId is String ? StrPtr(displayMonitorDeviceId) : displayMonitorDeviceId

    result := DllCall("MFSENSORGROUP.dll\MFCreateRelativePanelWatcher", "ptr", videoDeviceId, "ptr", displayMonitorDeviceId, "ptr*", &ppRelativePanelWatcher := 0, "HRESULT")
    return IMFRelativePanelWatcher(ppRelativePanelWatcher)
}

/**
 * Creates a new instance of IMFCameraOcclusionStateMonitor which allows an application to receive notifications when the camera occlusion state changes.
 * @param {PWSTR} symbolicLink The symbolic link name of the video device for which occlusion state will be monitored. This value is enumerated through the standard Windows enumeration APIs such as [MFEnumDeviceSources](../mfidl/nf-mfidl-mfenumdevicesources.md) and [DeviceInformation](/uwp/api/Windows.Devices.Enumeration.DeviceInformation)
 * @param {IMFCameraOcclusionStateReportCallback} callback The [IMFCameraOcclusionStateReportCallback](nn-mfidl-imfcameraocclusionstatereportcallback.md) implemented by the client to receive camera occlusion state change notifications.
 * @returns {IMFCameraOcclusionStateMonitor} An output parameter that receives the [IMFCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecameraocclusionstatemonitor
 */
export MFCreateCameraOcclusionStateMonitor(symbolicLink, callback) {
    symbolicLink := symbolicLink is String ? StrPtr(symbolicLink) : symbolicLink

    result := DllCall("MFSENSORGROUP.dll\MFCreateCameraOcclusionStateMonitor", "ptr", symbolicLink, "ptr", callback, "ptr*", &occlusionStateMonitor := 0, "HRESULT")
    return IMFCameraOcclusionStateMonitor(occlusionStateMonitor)
}

/**
 * Creates an instance of IMFCameraControlMonitor.
 * @remarks
 * The symbolic link can be obtained from an   [MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK](/windows/win32/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link) attribute returned by [MFEnumDeviceSources](nf-mfidl-mfenumdevicesources.md) or obtained by accessing the [DeviceInformation.Id](/uwp/api/windows.devices.enumeration.deviceinformation.id) property obtained through the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) APIs.
 * @param {PWSTR} symbolicLink String symbolic link name of the video capture device that is active.
 * @param {IMFCameraControlNotify} callback Pointer to an object that implements the [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md) callback interface.
 * @returns {IMFCameraControlMonitor} Receives a pointer to the created **IMFCameraControlMonitor** object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecameracontrolmonitor
 */
export MFCreateCameraControlMonitor(symbolicLink, callback) {
    symbolicLink := symbolicLink is String ? StrPtr(symbolicLink) : symbolicLink

    result := DllCall("MFSENSORGROUP.dll\MFCreateCameraControlMonitor", "ptr", symbolicLink, "ptr", callback, "ptr*", &ppCameraControlMonitor := 0, "HRESULT")
    return IMFCameraControlMonitor(ppCameraControlMonitor)
}

/**
 * Creates the ASF Header Object object.
 * @returns {IMFASFContentInfo} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfcontentinfo
 * @since windows6.0.6000
 */
export MFCreateASFContentInfo() {
    result := DllCall("MF.dll\MFCreateASFContentInfo", "ptr*", &ppIContentInfo := 0, "HRESULT")
    return IMFASFContentInfo(ppIContentInfo)
}

/**
 * Creates the ASF Indexer object.
 * @returns {IMFASFIndexer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfindexer">IMFASFIndexer</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfindexer
 * @since windows6.0.6000
 */
export MFCreateASFIndexer() {
    result := DllCall("MF.dll\MFCreateASFIndexer", "ptr*", &ppIIndexer := 0, "HRESULT")
    return IMFASFIndexer(ppIIndexer)
}

/**
 * Creates a byte stream to access the index in an ASF stream.
 * @param {IMFByteStream} pIContentByteStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream that contains the ASF stream.
 * @param {Integer} cbIndexStartOffset Byte offset of the index within the ASF stream. To get this value, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexposition">IMFASFIndexer::GetIndexPosition</a>.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. Use this interface to read from the index or write to the index. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfindexerbytestream
 * @since windows6.0.6000
 */
export MFCreateASFIndexerByteStream(pIContentByteStream, cbIndexStartOffset) {
    result := DllCall("MF.dll\MFCreateASFIndexerByteStream", "ptr", pIContentByteStream, "uint", cbIndexStartOffset, "ptr*", &pIIndexByteStream := 0, "HRESULT")
    return IMFByteStream(pIIndexByteStream)
}

/**
 * Creates the ASF Splitter.
 * @returns {IMFASFSplitter} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfsplitter">IMFASFSplitter</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfsplitter
 * @since windows6.0.6000
 */
export MFCreateASFSplitter() {
    result := DllCall("MF.dll\MFCreateASFSplitter", "ptr*", &ppISplitter := 0, "HRESULT")
    return IMFASFSplitter(ppISplitter)
}

/**
 * Creates the ASF profile object.
 * @returns {IMFASFProfile} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfprofile
 * @since windows6.0.6000
 */
export MFCreateASFProfile() {
    result := DllCall("MF.dll\MFCreateASFProfile", "ptr*", &ppIProfile := 0, "HRESULT")
    return IMFASFProfile(ppIProfile)
}

/**
 * Creates an ASF profile object from a presentation descriptor.
 * @param {IMFPresentationDescriptor} pIPD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor that contains the profile information.
 * @returns {IMFASFProfile} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfprofilefrompresentationdescriptor
 * @since windows6.0.6000
 */
export MFCreateASFProfileFromPresentationDescriptor(pIPD) {
    result := DllCall("MF.dll\MFCreateASFProfileFromPresentationDescriptor", "ptr", pIPD, "ptr*", &ppIProfile := 0, "HRESULT")
    return IMFASFProfile(ppIProfile)
}

/**
 * Creates a presentation descriptor from an ASF profile object.
 * @param {IMFASFProfile} pIProfile Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface of the ASF profile object.
 * @returns {IMFPresentationDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreatepresentationdescriptorfromasfprofile
 * @since windows6.0.6000
 */
export MFCreatePresentationDescriptorFromASFProfile(pIProfile) {
    result := DllCall("MF.dll\MFCreatePresentationDescriptorFromASFProfile", "ptr", pIProfile, "ptr*", &ppIPD := 0, "HRESULT")
    return IMFPresentationDescriptor(ppIPD)
}

/**
 * Creates the ASF Multiplexer.
 * @returns {IMFASFMultiplexer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfmultiplexer">IMFASFMultiplexer</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfmultiplexer
 * @since windows6.0.6000
 */
export MFCreateASFMultiplexer() {
    result := DllCall("MF.dll\MFCreateASFMultiplexer", "ptr*", &ppIMultiplexer := 0, "HRESULT")
    return IMFASFMultiplexer(ppIMultiplexer)
}

/**
 * Creates the ASF stream selector.
 * @param {IMFASFProfile} pIASFProfile Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface.
 * @returns {IMFASFStreamSelector} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamselector">IMFASFStreamSelector</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfstreamselector
 * @since windows6.0.6000
 */
export MFCreateASFStreamSelector(pIASFProfile) {
    result := DllCall("MF.dll\MFCreateASFStreamSelector", "ptr", pIASFProfile, "ptr*", &ppSelector := 0, "HRESULT")
    return IMFASFStreamSelector(ppSelector)
}

/**
 * Creates the ASF media sink.
 * @param {IMFByteStream} pIByteStream Pointer to a byte stream that will be used to write the ASF stream.
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfmediasink
 * @since windows6.0.6000
 */
export MFCreateASFMediaSink(pIByteStream) {
    result := DllCall("MF.dll\MFCreateASFMediaSink", "ptr", pIByteStream, "ptr*", &ppIMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppIMediaSink)
}

/**
 * Creates an activation object that can be used to create the ASF media sink.
 * @param {PWSTR} pwszFileName Null-terminated wide-character string that contains the output file name.
 * @param {IMFASFContentInfo} pContentInfo A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of an initialized <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-file-structure">ASF Header Object</a> object. Use this interface to configure the ASF media sink.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfmediasinkactivate
 * @since windows6.0.6000
 */
export MFCreateASFMediaSinkActivate(pwszFileName, pContentInfo) {
    pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

    result := DllCall("MF.dll\MFCreateASFMediaSinkActivate", "ptr", pwszFileName, "ptr", pContentInfo, "ptr*", &ppIActivate := 0, "HRESULT")
    return IMFActivate(ppIActivate)
}

/**
 * Creates an activation object that can be used to create a Windows Media Video (WMV) encoder.
 * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the encoded output format.
 * @param {IPropertyStore} pEncodingConfigurationProperties A pointer to the <b>IPropertyStore</b> interface of a property store that contains encoding parameters. Encoding parameters for the WMV encoder are defined in the header file wmcodecdsp.h. If you have an ASF ContentInfo object that contains an ASF profile object with all the streams for the output file, you can get the property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore">IMFASFContentInfo::GetEncodingConfigurationPropertyStore</a>.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the encoder. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreatewmvencoderactivate
 * @since windows6.0.6000
 */
export MFCreateWMVEncoderActivate(pMediaType, pEncodingConfigurationProperties) {
    result := DllCall("MF.dll\MFCreateWMVEncoderActivate", "ptr", pMediaType, "ptr", pEncodingConfigurationProperties, "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates an activation object that can be used to create a Windows Media Audio (WMA) encoder.
 * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the encoded output format.
 * @param {IPropertyStore} pEncodingConfigurationProperties A pointer to the <b>IPropertyStore</b> interface of a property store that contains encoding parameters. Encoding parameters for the WMV encoder are defined in the header file wmcodecdsp.h. If you have an ASF ContentInfo object that contains an ASF profile object with all the streams for the output file, you can get the property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore">IMFASFContentInfo::GetEncodingConfigurationPropertyStore</a>.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the encoder. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreatewmaencoderactivate
 * @since windows6.0.6000
 */
export MFCreateWMAEncoderActivate(pMediaType, pEncodingConfigurationProperties) {
    result := DllCall("MF.dll\MFCreateWMAEncoderActivate", "ptr", pMediaType, "ptr", pEncodingConfigurationProperties, "ptr*", &ppActivate := 0, "HRESULT")
    return IMFActivate(ppActivate)
}

/**
 * Creates an activation object for the ASF streaming sink. (MFCreateASFStreamingMediaSink)
 * @remarks
 * To create the ASF streaming sink in another process, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-mfcreateasfstreamingmediasinkactivate">MFCreateASFStreamingMediaSinkActivate</a>.
 *       
 * 
 * An application can get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-contentinfo-object">ASF ContentInfo Object</a> by calling <b>IUnknown::QueryInterface</b> on the media sink object received in the <i>ppIMediaSink</i> parameter. The ContentInfo object is used to set the encoder configuration settings, provide stream properties supplied by an ASF profile, and add metadata information. These configuration settings populate the various ASF header objects of the encoded ASF file. For more information, see  
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/setting-properties-in-the-contentinfo-object">Setting Properties in the ContentInfo Object</a>.
 * @param {IMFByteStream} pIByteStream A pointer to a byte stream object in which the ASF media sink writes the streamed content.
 * @returns {IMFMediaSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the ASF streaming-media sink object. To create the media sink, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> on the received pointer. The caller must release the interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfstreamingmediasink
 * @since windows6.1
 */
export MFCreateASFStreamingMediaSink(pIByteStream) {
    result := DllCall("MF.dll\MFCreateASFStreamingMediaSink", "ptr", pIByteStream, "ptr*", &ppIMediaSink := 0, "HRESULT")
    return IMFMediaSink(ppIMediaSink)
}

/**
 * Creates an activation object for the ASF streaming sink. (MFCreateASFStreamingMediaSinkActivate)
 * @remarks
 * Starting in Windows 7, Media Foundation provides an ASF streaming  sink that writes the content in  a live streaming scenario. This function should be used in secure transcode scenarios where this  media sink needs to be created and configured in the remote
 * process. Like the ASF file sink, the new media sink performs ASF related tasks such as writing the ASF header, generating data packets (muxing). The content is written to a caller-implemented byte stream such as an HTTP byte stream.
 * The caller must also provide an activation object that media sink can use to create the byte stream remotely.  
 * 
 * In addition, it performs transcryption for streaming protected content. It hosts the Windows Media Digital Rights Management (DRM) for Network Devices Output Trust Authority (OTA) that handles the license request and response. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfdrmnethelper">IMFDRMNetHelper</a> interface.
 * 
 * The new media sink does not perform any time adjustments.  If the clock seeks, the timestamps are not changed.
 * @param {IMFActivate} pByteStreamActivate A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation object. The caller  implements this interface.  The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> method of the activation object must create a byte-stream object. The byte stream exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. The ASF streaming sink will write data to this byte stream.
 * @param {IMFASFContentInfo} pContentInfo A pointer to an <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-contentinfo-object">ASF ContentInfo Object</a> that contains the properties that describe the ASF content. These  settings can contain  stream settings, encoding properties, and metadata. For more information about these properties, see <a href="https://docs.microsoft.com/windows/desktop/medfound/setting-properties-in-the-contentinfo-object">Setting Properties in the ContentInfo Object</a>.
 * @returns {IMFActivate} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of the activation object that is used to create the ASF streaming-media sink. To create the media sink, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> by using the received pointer. The <b>ActivateObject</b> method also calls   <b>IMFActivate::Activate</b> on the byte stream activate object specified by  <i>pByteStreamActivate</i>, to create it so that the media sink can write streamed content in the byte stream. The caller must release the <b>IMFActivate</b> interface pointer of the media sink activation object received in <i>ppIActivate</i>.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-mfcreateasfstreamingmediasinkactivate
 * @since windows6.1
 */
export MFCreateASFStreamingMediaSinkActivate(pByteStreamActivate, pContentInfo) {
    result := DllCall("MF.dll\MFCreateASFStreamingMediaSinkActivate", "ptr", pByteStreamActivate, "ptr", pContentInfo, "ptr*", &ppIActivate := 0, "HRESULT")
    return IMFActivate(ppIActivate)
}

/**
 * Instantiates an a Media Foundation D3D12 synchronization primitive used to synchronize access to a D3D12 resource stored in an Media Foundation object.
 * @param {ID3D12Device} pDevice The [ID3D12Device](../d3d12/nn-d3d12-id3d12device.md) associated with the resource and primitive being created.
 * @param {Pointer<Guid>} riid The GUID identifying the interface of the synchronization object that will be created.
 * @returns {Pointer<Void>} Receives a **void\*\*** pointing to the created synchronization object.
 * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-mfcreated3d12synchronizationobject
 */
export MFCreateD3D12SynchronizationObject(pDevice, riid) {
    result := DllCall("MFPlat.dll\MFCreateD3D12SynchronizationObject", "ptr", pDevice, Guid.Ptr, riid, "ptr*", &ppvSyncObject := 0, "HRESULT")
    return ppvSyncObject
}

/**
 * Initializes Microsoft Media Foundation.
 * @remarks
 * An application must call this function before using Media Foundation. Before your application quits, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> once for every previous call to <b>MFStartup</b>.
 *       
 * **MFStartup** should be called during should be called during app initialization and not from static constructors during process initialization.
 * 
 * Do not call <b>MFStartup</b> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> from work queue threads. For more information about work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queues">Work Queues</a>.
 *       
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} _Version Version number. Use the value <b>MF_VERSION</b>, defined in mfapi.h.
 * @param {Integer} dwFlags This parameter is optional when using C++ but required in C. The value must be one of the following flags:
 *           
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>MFSTARTUP_NOSOCKET</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not initialize the sockets library.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>MFSTARTUP_LITE</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Equivalent to MFSTARTUP_NOSOCKET.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>MFSTARTUP_FULL</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Initialize the entire Media Foundation platform. This is the default value when <i>dwFlags</i> is not specified.
 *               
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * <dt><b>MF_E_BAD_STARTUP_VERSION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>Version</i> parameter requires a newer version of Media Foundation than the version that is running.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_DISABLED_IN_SAFEMODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Media Foundation platform is disabled because the system was started in "Safe Mode" (fail-safe boot).
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Media Foundation is not implemented on the system.  This error can occur if the media components are not present (See <a href="https://support.microsoft.com/help/2703761">KB2703761</a> for more info). 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfstartup
 * @since windows6.0.6000
 */
export MFStartup(_Version, dwFlags) {
    result := DllCall("MFPlat.dll\MFStartup", "uint", _Version, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Shuts down the Microsoft Media Foundation platform.
 * @remarks
 * **MFShutdown** should be called during should be called during app uninitialization and not from static destructors during process exit.
 * 
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfshutdown
 * @since windows6.0.6000
 */
export MFShutdown() {
    result := DllCall("MFPlat.dll\MFShutdown", "HRESULT")
    return result
}

/**
 * Blocks the MFShutdown function.
 * @remarks
 * This function prevents work queue threads from being shut down when <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> is called. Use this function to ensure that asynchronous operations complete gracefully before the platform shuts down.
 * 
 * This function holds a lock on the Media Foundation platform. To unlock the platform, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockplatform">MFUnlockPlatform</a>. The application must call <b>MFUnlockPlatform</b> once for every call to <b>MFLockPlatform</b>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function blocks until the platform is unlocked, or until a fixed wait period has elapsed. (The wait period is a few seconds.) To avoid memory leaks, the application should unlock the platform before the wait period ends. For example, cancel any asynchronous operations that are waiting to complete and are holding a lock on the platform.
 * 
 * The default implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface automatically locks the Media Foundation platform when the result object is created. Releasing the interface unlocks the platform. Therefore, in most cases your application does not need to lock the platform directly. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queues">Work Queues</a>.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mflockplatform
 * @since windows6.0.6000
 */
export MFLockPlatform() {
    result := DllCall("MFPlat.dll\MFLockPlatform", "HRESULT")
    return result
}

/**
 * Unlocks the Media Foundation platform after it was locked by a call to the MFLockPlatform function.
 * @remarks
 * The application must call <b>MFUnlockPlatform</b> once for every call to <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mflockplatform">MFLockPlatform</a>.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfunlockplatform
 * @since windows6.0.6000
 */
export MFUnlockPlatform() {
    result := DllCall("MFPlat.dll\MFUnlockPlatform", "HRESULT")
    return result
}

/**
 * Puts an asynchronous operation on a work queue. (MFPutWorkItem)
 * @remarks
 * This function creates an asynchronous result object and puts the result object on the work queue. The work queue calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method specified by <i>pCallback</i>.
 * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueueex">MFAllocateWorkQueueEx</a>.
 * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. The caller must implement this interface.
 * @param {IUnknown} pState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid work queue. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfputworkitem
 * @since windows6.0.6000
 */
export MFPutWorkItem(dwQueue, pCallback, pState) {
    result := DllCall("MFPlat.dll\MFPutWorkItem", "uint", dwQueue, "ptr", pCallback, "ptr", pState, "HRESULT")
    return result
}

/**
 * Puts an asynchronous operation on a work queue, with a specified priority. (MFPutWorkItem2)
 * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or  MFAllocateWorkQueueEx.
 * @param {Integer} _Priority The priority of the work item. Work items are performed in order of priority.
 * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. The caller must implement this interface.
 * @param {IUnknown} pState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid work queue identifier.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfputworkitem2
 * @since windows8.0
 */
export MFPutWorkItem2(dwQueue, _Priority, pCallback, pState) {
    result := DllCall("MFPlat.dll\MFPutWorkItem2", "uint", dwQueue, "int", _Priority, "ptr", pCallback, "ptr", pState, "HRESULT")
    return result
}

/**
 * Puts an asynchronous operation on a work queue. (MFPutWorkItemEx)
 * @remarks
 * To invoke the work-item, this function passes <i>pResult</i> to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinvokecallback">MFInvokeCallback</a> function. The callback is specified when you create the result object specified by <i>pResult</i>.
 *       
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueueex">MFAllocateWorkQueueEx</a>.
 * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
 * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid work queue identifier. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfputworkitemex
 * @since windows6.0.6000
 */
export MFPutWorkItemEx(dwQueue, pResult) {
    result := DllCall("MFPlat.dll\MFPutWorkItemEx", "uint", dwQueue, "ptr", pResult, "HRESULT")
    return result
}

/**
 * Puts an asynchronous operation on a work queue, with a specified priority. (MFPutWorkItemEx2)
 * @remarks
 * To invoke the work item, this function passes <i>pResult</i> to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinvokecallback">MFInvokeCallback</a> function. The callback is specified when you create the result object specified by <i>pResult</i>.
 * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueueex">MFAllocateWorkQueueEx</a>.
 * @param {Integer} _Priority The priority of the work item. This value should be 1, 0, or -1. Items with a value of 1 are executed before items with a value of 0. Items with a value of  -1 are executed after items with a value of 0.
 * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
 * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid work queue identifier.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfputworkitemex2
 * @since windows8.0
 */
export MFPutWorkItemEx2(dwQueue, _Priority, pResult) {
    result := DllCall("MFPlat.dll\MFPutWorkItemEx2", "uint", dwQueue, "int", _Priority, "ptr", pResult, "HRESULT")
    return result
}

/**
 * Queues a work item that waits for an event to be signaled. (MFPutWaitingWorkItem)
 * @remarks
 * This function enables a component to wait for an event without blocking the current thread. 
 * 
 * The function puts a work item on the specified work queue. This work item waits for the event given in <i>hEvent</i> to be signaled. When the event is signaled, the work item invokes a callback. (The callback is contained in the result object given in <i>pResult</i>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>).
 * 
 * The work item is dispatched on a work queue by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a> method of the callback. The work queue can be any of the following:
 * 
 * <ul>
 * <li>The default work queue (<b>MFASYNC_CALLBACK_QUEUE_STANDARD</b>).</li>
 * <li>The platform multithreaded queue (<b>MFASYNC_CALLBACK_QUEUE_MULTITHREADED</b>).</li>
 * <li>A multithreaded queue returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mflocksharedworkqueue">MFLockSharedWorkQueue</a>  function.</li>
 * <li>A serial queue created by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateserialworkqueue">MFAllocateSerialWorkQueue</a> function.</li>
 * </ul>
 * Do not use any of the following work queues: <b>MFASYNC_CALLBACK_QUEUE_IO</b>, <b>MFASYNC_CALLBACK_QUEUE_LONG_FUNCTION</b>, <b>MFASYNC_CALLBACK_QUEUE_RT</b>, or <b>MFASYNC_CALLBACK_QUEUE_TIMER</b>.
 * @param {HANDLE} hEvent A handle to an event object. To create an event object, call <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a>.
 * @param {Integer} _Priority The priority of the work item. Work items are performed in order of priority.
 * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
 * @returns {Integer} Receives a key that can be used to cancel the wait. To cancel the wait, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelworkitem">MFCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
 * 
 * This parameter can be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfputwaitingworkitem
 * @since windows8.0
 */
export MFPutWaitingWorkItem(hEvent, _Priority, pResult) {
    result := DllCall("MFPlat.dll\MFPutWaitingWorkItem", HANDLE, hEvent, "int", _Priority, "ptr", pResult, "uint*", &pKey := 0, "HRESULT")
    return pKey
}

/**
 * Creates a work queue that is guaranteed to serialize work items.
 * @remarks
 * When you are done using the work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockworkqueue">MFUnlockWorkQueue</a>.
 * 
 * Multithreaded queues use a thread pool, which  can reduce the total number of threads in the pipeline. However, they do not serialize work items. A serial work queue enables the application to get the benefits of the thread pool, without needing to perform manual serialization of its own work items.
 * 
 * <h3><a id="Reply_Mode"></a><a id="reply_mode"></a><a id="REPLY_MODE"></a>Reply Mode</h3>
 * A serializer queue can also work in "reply" mode. If the caller’s <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a> method returns the <b>MFASYNC_REPLY_CALLBACK</b> flag, the serializer queue does not automatically advance to the next work item. Instead, the queue waits for a reply from the caller. The caller signals the reply by invoking the asynchronous result object that the work queue passes to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method. The following code illustrates how the caller signals the work queue.
 * 
 * 
 * ```cpp
 * HRESULT CCallback::Invoke(IMFAsyncResult *pResult)
 * {
 *     DoSomeWork();
 *     
 *     // Reply to the work queue that you are done.
 *     MFInvokeCallback(pResult);
 * 
 *     // Note: This call to MFInvokeCallback does not have to occur inside the
 *     // Invoke method. You could call MFInvokeCallback at a later time. 
 * 
 *     return S_OK;
 * }
 * HRESULT CCallback::GetParameters(DWORD *pdwFlags, DWORD *pdwQueue)
 * {
 *     *pdwFlags = MFASYNC_REPLY_CALLBACK;
 *     *pdwQueue = m_QueueId;
 *     return S_OK;
 * }
 * 
 * ```
 * @param {Integer} dwWorkQueue The identifier of an existing work queue. This must be either a multithreaded queue or another serial work queue. Any of the following can be used:
 * 
 * <ul>
 * <li>The default work queue (<b>MFASYNC_CALLBACK_QUEUE_STANDARD</b>)</li>
 * <li>The platform multithreaded queue (<b>MFASYNC_CALLBACK_QUEUE_MULTITHREADED</b>)</li>
 * <li>A multithreaded queue returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mflocksharedworkqueue">MFLockSharedWorkQueue</a>  function.</li>
 * <li>A serial queue created by the <b>MFAllocateSerialWorkQueue</b> function.</li>
 * </ul>
 * @returns {Integer} Receives an identifier for the new serial work queue. Use this identifier when queuing work items.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfallocateserialworkqueue
 * @since windows8.0
 */
export MFAllocateSerialWorkQueue(dwWorkQueue) {
    result := DllCall("MFPlat.dll\MFAllocateSerialWorkQueue", "uint", dwWorkQueue, "uint*", &pdwWorkQueue := 0, "HRESULT")
    return pdwWorkQueue
}

/**
 * Schedules an asynchronous operation to be completed after a specified interval. (MFScheduleWorkItemEx)
 * @remarks
 * When the timer interval elapses, the timer calls <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinvokecallback">MFInvokeCallback</a> with the <i>pResult</i> pointer to invoke the asynchronous callback. The callback is specified when you create the result object.
 * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
 * @param {Integer} Timeout Time-out interval, in milliseconds. Set this parameter to a negative value. The callback is invoked after −<i>Timeout</i> milliseconds. For example, if <i>Timeout</i> is −5000, the callback is invoked after 5000 milliseconds.
 * @returns {Integer} Receives a key that can be used to cancel the timer. To cancel the timer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelworkitem">MFCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfscheduleworkitemex
 * @since windows6.0.6000
 */
export MFScheduleWorkItemEx(pResult, Timeout) {
    result := DllCall("MFPlat.dll\MFScheduleWorkItemEx", "ptr", pResult, "int64", Timeout, "uint*", &pKey := 0, "HRESULT")
    return pKey
}

/**
 * Schedules an asynchronous operation to be completed after a specified interval. (MFScheduleWorkItem)
 * @remarks
 * This function creates an asynchronous result object. When the timer interval elapses, the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method specified by <i>pCallback</i> is called.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. The caller must implement this interface.
 * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @param {Integer} Timeout Time-out interval, in milliseconds. Set this parameter to a negative value. The callback is invoked after −<i>Timeout</i> milliseconds. For example, if <i>Timeout</i> is −5000, the callback is invoked after 5000 milliseconds.
 * @returns {Integer} Receives a key that can be used to cancel the timer. To cancel the timer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelworkitem">MFCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfscheduleworkitem
 * @since windows6.0.6000
 */
export MFScheduleWorkItem(pCallback, pState, Timeout) {
    result := DllCall("MFPlat.dll\MFScheduleWorkItem", "ptr", pCallback, "ptr", pState, "int64", Timeout, "uint*", &pKey := 0, "HRESULT")
    return pKey
}

/**
 * Attempts to cancel an asynchronous operation that was scheduled with MFScheduleWorkItem or MFScheduleWorkItemEx.
 * @remarks
 * Because work items are asynchronous, the  work-item callback might still be invoked after <b>MFCancelWorkItem</b> is called.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} Key The key that was received in the <i>pKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfscheduleworkitem">MFScheduleWorkItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfscheduleworkitemex">MFScheduleWorkItemEx</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputwaitingworkitem">MFPutWaitingWorkItem</a> functions.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcancelworkitem
 * @since windows6.0.6000
 */
export MFCancelWorkItem(Key) {
    result := DllCall("MFPlat.dll\MFCancelWorkItem", "uint", Key, "HRESULT")
    return result
}

/**
 * Retrieves the timer interval for the MFAddPeriodicCallback function.
 * @returns {Integer} Receives the timer interval, in milliseconds.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgettimerperiodicity
 * @since windows6.0.6000
 */
export MFGetTimerPeriodicity() {
    result := DllCall("MFPlat.dll\MFGetTimerPeriodicity", "uint*", &Periodicity := 0, "HRESULT")
    return Periodicity
}

/**
 * Sets a callback function to be called at a fixed interval. (MFAddPeriodicCallback)
 * @remarks
 * To get the timer interval for the periodic callback, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgettimerperiodicity">MFGetTimerPeriodicity</a>.
 * @param {Pointer<MFPERIODICCALLBACK>} Callback Pointer to the callback function, of type <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nc-mfapi-mfperiodiccallback">MFPERIODICCALLBACK</a>.
 * @param {IUnknown} pContext Pointer to a caller-provided object that implements <b>IUnknown</b>, or <b>NULL</b>. This parameter is passed to the callback function.
 * @returns {Integer} Receives a key that can be used to cancel the callback. To cancel the callback, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfremoveperiodiccallback">MFRemovePeriodicCallback</a> and pass this key as the <i>dwKey</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfaddperiodiccallback
 * @since windows6.0.6000
 */
export MFAddPeriodicCallback(Callback, pContext) {
    result := DllCall("MFPlat.dll\MFAddPeriodicCallback", "ptr", Callback, "ptr", pContext, "uint*", &pdwKey := 0, "HRESULT")
    return pdwKey
}

/**
 * Cancels a callback function that was set by the MFAddPeriodicCallback function.
 * @remarks
 * The callback is dispatched on another thread, and this function does not attempt to synchronize with the callback thread. Therefore, it is possible for the callback to be invoked after this function returns.
 * @param {Integer} dwKey Key that identifies the callback. This value is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfaddperiodiccallback">MFAddPeriodicCallback</a> function.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfremoveperiodiccallback
 * @since windows6.0.6000
 */
export MFRemovePeriodicCallback(dwKey) {
    result := DllCall("MFPlat.dll\MFRemovePeriodicCallback", "uint", dwKey, "HRESULT")
    return result
}

/**
 * Creates a new work queue. (MFAllocateWorkQueueEx)
 * @remarks
 * When you are done using the work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockworkqueue">MFUnlockWorkQueue</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function is equivalent to calling <b>MFAllocateWorkQueueEx</b> with the value MF_STANDARD_WORKQUEUE for the <i>WorkQueueType</i> parameter.
 * 
 * This function is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @param {MFASYNC_WORKQUEUE_TYPE} WorkQueueType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ne-mfapi-mfasync_workqueue_type">MFASYNC_WORKQUEUE_TYPE</a> enumeration, specifying the type of work queue to create.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_MULTITHREADED_WORKQUEUE"></a><a id="mf_multithreaded_workqueue"></a><dl>
 * <dt><b>MF_MULTITHREADED_WORKQUEUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Create a multithreaded work queue. Generally, applications should not create private multithreaded queues. Use the platform multithreaded queues instead. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-work-queue-and-threading-improvements">Work Queue and Threading Improvements</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_STANDARD_WORKQUEUE"></a><a id="mf_standard_workqueue"></a><dl>
 * <dt><b>MF_STANDARD_WORKQUEUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Create a work queue without a message loop. Using this flag is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_WINDOW_WORKQUEUE"></a><a id="mf_window_workqueue"></a><dl>
 * <dt><b>MF_WINDOW_WORKQUEUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Create a work queue with a message loop. The thread that dispatches the work items for this queue will also call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dispatchmessage">DispatchMessage</a>. Use this option if your callback performs any actions that require a message loop.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Receives an identifier for the work queue that was created.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfallocateworkqueueex
 * @since windows6.1
 */
export MFAllocateWorkQueueEx(WorkQueueType) {
    result := DllCall("MFPlat.dll\MFAllocateWorkQueueEx", MFASYNC_WORKQUEUE_TYPE, WorkQueueType, "uint*", &pdwWorkQueue := 0, "HRESULT")
    return pdwWorkQueue
}

/**
 * Creates a new work queue. (MFAllocateWorkQueue)
 * @remarks
 * When you are done using the work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockworkqueue">MFUnlockWorkQueue</a>.
 * @returns {Integer} Receives an identifier for the work queue.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfallocateworkqueue
 * @since windows6.0.6000
 */
export MFAllocateWorkQueue() {
    result := DllCall("MFPlat.dll\MFAllocateWorkQueue", "uint*", &pdwWorkQueue := 0, "HRESULT")
    return pdwWorkQueue
}

/**
 * Locks a work queue. (MFLockWorkQueue)
 * @remarks
 * This function prevents the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function from shutting down the work queue. Use this function to ensure that asynchronous operations on the work queue complete gracefully before the platform shuts down. The <b>MFShutdown</b> function blocks until the work queue is unlocked, or until a fixed wait period has elapsed. (The wait period is a few seconds.)
 * 
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockworkqueue">MFUnlockWorkQueue</a> to unlock the work queue. Each call to <b>MFLockWorkQueue</b> must be matched by a corresponding call to <b>MFUnlockWorkQueue</b>.
 * 
 * 
 * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function implicitly locks the work queue that it creates.</div>
 * <div> </div>
 * @param {Integer} dwWorkQueue The identifier for the work queue. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mflockworkqueue
 * @since windows6.0.6000
 */
export MFLockWorkQueue(dwWorkQueue) {
    result := DllCall("MFPlat.dll\MFLockWorkQueue", "uint", dwWorkQueue, "HRESULT")
    return result
}

/**
 * Unlocks a work queue. (MFUnlockWorkQueue)
 * @remarks
 * The application must call <b>MFUnlockWorkQueue</b> once for every call to <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> and then once for every call to <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mflockworkqueue">MFLockWorkQueue</a>.
 * @param {Integer} dwWorkQueue Identifier for the work queue to be unlocked. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfunlockworkqueue
 * @since windows6.0.6000
 */
export MFUnlockWorkQueue(dwWorkQueue) {
    result := DllCall("MFPlat.dll\MFUnlockWorkQueue", "uint", dwWorkQueue, "HRESULT")
    return result
}

/**
 * Associates a work queue with a Multimedia Class Scheduler Service (MMCSS) task. (MFBeginRegisterWorkQueueWithMMCSS)
 * @remarks
 * This function is asynchronous. When the operation completes, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfendregisterworkqueuewithmmcss">MFEndRegisterWorkQueueWithMMCSS</a> to complete the asynchronous request.
 * 
 * To unregister the work queue from the MMCSS task, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss">MFBeginUnregisterWorkQueueWithMMCSS</a>.
 * @param {Integer} dwWorkQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
 * @param {PWSTR} wszClass The name of the MMCSS task.For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/multimedia-class-scheduler-service">Multimedia Class Scheduler Service</a>.
 * @param {Integer} dwTaskId The unique task identifier. To obtain a new task identifier, set this value to zero.
 * @param {IMFAsyncCallback} pDoneCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
 * @param {IUnknown} pDoneState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss
 * @since windows6.0.6000
 */
export MFBeginRegisterWorkQueueWithMMCSS(dwWorkQueueId, wszClass, dwTaskId, pDoneCallback, pDoneState) {
    wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

    result := DllCall("MFPlat.dll\MFBeginRegisterWorkQueueWithMMCSS", "uint", dwWorkQueueId, "ptr", wszClass, "uint", dwTaskId, "ptr", pDoneCallback, "ptr", pDoneState, "HRESULT")
    return result
}

/**
 * Associates a work queue with a Multimedia Class Scheduler Service (MMCSS) task. (MFBeginRegisterWorkQueueWithMMCSSEx)
 * @remarks
 * This function extends the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss">MFBeginRegisterWorkQueueWithMMCSS</a> function by adding the <i>lPriority</i> parameter.
 * 
 * This function is asynchronous. When the operation completes, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfendregisterworkqueuewithmmcss">MFEndRegisterWorkQueueWithMMCSS</a> to complete the asynchronous request.
 *       
 * 
 * To unregister the work queue from the MMCSS task, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss">MFBeginUnregisterWorkQueueWithMMCSS</a>.
 * @param {Integer} dwWorkQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
 * @param {PWSTR} wszClass The name of the MMCSS task. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/multimedia-class-scheduler-service">Multimedia Class Scheduler Service</a>.
 * @param {Integer} dwTaskId The unique task identifier. To obtain a new task identifier, set this value to zero.
 * @param {Integer} lPriority The base relative priority for the work-queue threads. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadpriority">AvSetMmThreadPriority</a>.
 * @param {IMFAsyncCallback} pDoneCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
 * @param {IUnknown} pDoneState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcssex
 * @since windows8.0
 */
export MFBeginRegisterWorkQueueWithMMCSSEx(dwWorkQueueId, wszClass, dwTaskId, lPriority, pDoneCallback, pDoneState) {
    wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

    result := DllCall("MFPlat.dll\MFBeginRegisterWorkQueueWithMMCSSEx", "uint", dwWorkQueueId, "ptr", wszClass, "uint", dwTaskId, "int", lPriority, "ptr", pDoneCallback, "ptr", pDoneState, "HRESULT")
    return result
}

/**
 * Completes an asynchronous request to associate a work queue with a Multimedia Class Scheduler Service (MMCSS) task. (MFEndRegisterWorkQueueWithMMCSS)
 * @remarks
 * Call this function when the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss">MFBeginRegisterWorkQueueWithMMCSS</a> function completes asynchronously.
 * 
 * To unregister the work queue from the MMCSS class, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss">MFBeginUnregisterWorkQueueWithMMCSS</a>.
 * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
 * @returns {Integer} The unique task identifier.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfendregisterworkqueuewithmmcss
 * @since windows6.0.6000
 */
export MFEndRegisterWorkQueueWithMMCSS(pResult) {
    result := DllCall("MFPlat.dll\MFEndRegisterWorkQueueWithMMCSS", "ptr", pResult, "uint*", &pdwTaskId := 0, "HRESULT")
    return pdwTaskId
}

/**
 * Unregisters a work queue from a Multimedia Class Scheduler Service (MMCSS) task. (MFBeginUnregisterWorkQueueWithMMCSS)
 * @remarks
 * This function unregisters a work queue that was associated with an MMCSS class through the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss">MFBeginRegisterWorkQueueWithMMCSS</a> function.
 * 
 * This function is asynchronous. When the operation completes, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfendunregisterworkqueuewithmmcss">MFEndUnregisterWorkQueueWithMMCSS</a> to complete the asynchronous request.
 * @param {Integer} dwWorkQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
 * @param {IMFAsyncCallback} pDoneCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
 * @param {IUnknown} pDoneState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss
 * @since windows6.0.6000
 */
export MFBeginUnregisterWorkQueueWithMMCSS(dwWorkQueueId, pDoneCallback, pDoneState) {
    result := DllCall("MFPlat.dll\MFBeginUnregisterWorkQueueWithMMCSS", "uint", dwWorkQueueId, "ptr", pDoneCallback, "ptr", pDoneState, "HRESULT")
    return result
}

/**
 * Completes an asynchronous request to unregister a work queue from a Multimedia Class Scheduler Service (MMCSS) task.
 * @remarks
 * Call this function when the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss">MFBeginUnregisterWorkQueueWithMMCSS</a> function completes asynchronously.
 * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfendunregisterworkqueuewithmmcss
 * @since windows6.0.6000
 */
export MFEndUnregisterWorkQueueWithMMCSS(pResult) {
    result := DllCall("MFPlat.dll\MFEndUnregisterWorkQueueWithMMCSS", "ptr", pResult, "HRESULT")
    return result
}

/**
 * Retrieves the Multimedia Class Scheduler Service (MMCSS) class currently associated with this work queue. (MFGetWorkQueueMMCSSClass)
 * @remarks
 * If the work queue is not associated with an MMCSS task, the function retrieves an empty string.
 * 
 * To associate a work queue with an MMCSS task, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss">MFBeginRegisterWorkQueueWithMMCSS</a>.
 * @param {Integer} dwWorkQueueId Identifier for the work queue. The identifier is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
 * @param {PWSTR} pwszClass Pointer to a buffer that receives the name of the MMCSS class. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} pcchClass On input, specifies the size of the <i>pwszClass</i> buffer, in characters. On output, receives the required size of the buffer, in characters. The size includes the terminating null character.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pwszClass</i> buffer is too small to receive the task name.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetworkqueuemmcssclass
 * @since windows6.0.6000
 */
export MFGetWorkQueueMMCSSClass(dwWorkQueueId, pwszClass, pcchClass) {
    pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

    pcchClassMarshal := pcchClass is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFGetWorkQueueMMCSSClass", "uint", dwWorkQueueId, "ptr", pwszClass, pcchClassMarshal, pcchClass, "HRESULT")
    return result
}

/**
 * Retrieves the Multimedia Class Scheduler Service (MMCSS) task identifier currently associated with this work queue. (MFGetWorkQueueMMCSSTaskId)
 * @remarks
 * To associate a work queue with an MMCSS task, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss">MFBeginRegisterWorkQueueWithMMCSS</a>.
 * @param {Integer} dwWorkQueueId Identifier for the work queue. The identifier is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
 * @returns {Integer} Receives the task identifier.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetworkqueuemmcsstaskid
 * @since windows6.0.6000
 */
export MFGetWorkQueueMMCSSTaskId(dwWorkQueueId) {
    result := DllCall("MFPlat.dll\MFGetWorkQueueMMCSSTaskId", "uint", dwWorkQueueId, "uint*", &pdwTaskId := 0, "HRESULT")
    return pdwTaskId
}

/**
 * Registers the standard Microsoft Media Foundation platform work queues with the Multimedia Class Scheduler Service (MMCSS).
 * @remarks
 * To unregister the platform work queues from the MMCSS class, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunregisterplatformfrommmcss">MFUnregisterPlatformFromMMCSS</a>.
 * @param {PWSTR} wszClass The name of the MMCSS task.
 * @param {Pointer<Integer>} pdwTaskId The MMCSS task identifier. On input, specify an existing  MCCSS task group ID, or use the value zero to create a new task group. On output, receives the actual task group ID.
 * @param {Integer} lPriority The base priority of the work-queue threads.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfregisterplatformwithmmcss
 * @since windows8.0
 */
export MFRegisterPlatformWithMMCSS(wszClass, pdwTaskId, lPriority) {
    wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

    pdwTaskIdMarshal := pdwTaskId is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFRegisterPlatformWithMMCSS", "ptr", wszClass, pdwTaskIdMarshal, pdwTaskId, "int", lPriority, "HRESULT")
    return result
}

/**
 * Unregisters the Microsoft Media Foundation platform work queues from a Multimedia Class Scheduler Service (MMCSS) task.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfunregisterplatformfrommmcss
 * @since windows8.0
 */
export MFUnregisterPlatformFromMMCSS() {
    result := DllCall("MFPlat.dll\MFUnregisterPlatformFromMMCSS", "HRESULT")
    return result
}

/**
 * Obtains and locks a shared work queue. (MFLockSharedWorkQueue)
 * @remarks
 * A <i>multithreaded work queue</i> uses a thread pool to dispatch work items. Whenever a thread becomes available, it dequeues the next work item from the queue. Work items are dequeued in first-in-first-out order, but work items are not serialized. In other words, the work queue does not wait for a work item to complete before it starts the next work item. 
 * 
 * Within a single process, the Microsoft Media Foundation platform creates up to one multithreaded queue for each Multimedia Class Scheduler Service (MMCSS) task. The <b>MFLockSharedWorkQueue</b> function checks whether a matching work queue already exists. If not, the function creates a new work queue and registers the work queue with MMCSS. The function returns the MMCSS task identifier (<i>pdwTaskId</i>) and the work queue identifier (<i>pID</i>). To queue a work item, pass the work queue identifier to any of the following functions: 
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitem">MFPutWorkItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitem2">MFPutWorkItem2</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitemex">MFPutWorkItemEx</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitemex2">MFPutWorkItemEx2</a>
 * </li>
 * </ul>
 * The <b>MFLockSharedWorkQueue</b> function also locks the queue. Before the process exits, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockworkqueue">MFUnlockWorkQueue</a> to unlock the work queue.
 * 
 * If the regular priority queue is being used (<i>wszClass</i>=""), then NULL must be passed in to <i>pdwTaskId</i> and the value 0 must be passed into <i>BasePriority</i>.
 * @param {PWSTR} wszClass The name of the MMCSS task.
 * @param {Integer} BasePriority The base priority of the work-queue threads. 
 * 
 * If the regular-priority queue is being used (<i>wszClass</i>=""), then the value 0 must be passed in.
 * @param {Pointer<Integer>} pdwTaskId The MMCSS task identifier. On input, specify an existing MCCSS task group ID , or use the value zero to create a new task group. If the regular priority queue is being used (<i>wszClass</i>=""), then <b>NULL</b> must be passed in. On output, receives the actual task group ID.
 * @returns {Integer} Receives an identifier for the new work queue. Use this identifier when queuing work items.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mflocksharedworkqueue
 * @since windows8.0
 */
export MFLockSharedWorkQueue(wszClass, BasePriority, pdwTaskId) {
    wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

    pdwTaskIdMarshal := pdwTaskId is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFLockSharedWorkQueue", "ptr", wszClass, "int", BasePriority, pdwTaskIdMarshal, pdwTaskId, "uint*", &pID := 0, "HRESULT")
    return pID
}

/**
 * Gets the relative thread priority of a work queue. (MFGetWorkQueueMMCSSPriority)
 * @remarks
 * This function returns the relative thread priority set by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcssex">MFBeginRegisterWorkQueueWithMMCSSEx</a> function.
 * @param {Integer} dwWorkQueueId The identifier of the work queue. For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
 * @returns {Integer} Receives the relative thread priority.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetworkqueuemmcsspriority
 * @since windows8.0
 */
export MFGetWorkQueueMMCSSPriority(dwWorkQueueId) {
    result := DllCall("MFPlat.dll\MFGetWorkQueueMMCSSPriority", "uint", dwWorkQueueId, "int*", &lPriority := 0, "HRESULT")
    return lPriority
}

/**
 * Creates an asynchronous result object. Use this function if you are implementing an asynchronous method. (MFCreateAsyncResult)
 * @remarks
 * To invoke the callback specified in <i>pCallback</i>, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinvokecallback">MFInvokeCallback</a> function.
 * @param {IUnknown} punkObject Pointer to the object stored in the asynchronous result. This pointer is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasyncresult-getobject">IMFAsyncResult::GetObject</a> method. This parameter can be <b>NULL</b>.
 * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. This interface is implemented by the caller of the asynchronous method.
 * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object. This value is provided by the caller of the asynchronous method. This parameter can be <b>NULL</b>.
 * @returns {IMFAsyncResult} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreateasyncresult
 * @since windows6.0.6000
 */
export MFCreateAsyncResult(punkObject, pCallback, punkState) {
    result := DllCall("MFPlat.dll\MFCreateAsyncResult", "ptr", punkObject, "ptr", pCallback, "ptr", punkState, "ptr*", &ppAsyncResult := 0, "HRESULT")
    return IMFAsyncResult(ppAsyncResult)
}

/**
 * Invokes a callback method to complete an asynchronous operation. (MFInvokeCallback)
 * @remarks
 * If you are implementing an asynchronous method, use this function to invoke the caller's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
 * 
 * The callback is invoked from a Media Foundation work queue. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/writing-an-asynchronous-method">Writing an Asynchronous Method</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function shuts down the work queue threads, so the callback is not guaranteed to be invoked after <b>MFShutdown</b> is called.
 * @param {IMFAsyncResult} pAsyncResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. To create this object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid work queue. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function was called to shut down the Media Foundation platform.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinvokecallback
 * @since windows6.0.6000
 */
export MFInvokeCallback(pAsyncResult) {
    result := DllCall("MFPlat.dll\MFInvokeCallback", "ptr", pAsyncResult, "HRESULT")
    return result
}

/**
 * Creates a byte stream from a file.
 * @remarks
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {MF_FILE_ACCESSMODE} AccessMode The requested access mode, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode">MF_FILE_ACCESSMODE</a> enumeration.
 * @param {MF_FILE_OPENMODE} OpenMode The behavior of the function if the file already exists or does not exist, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode">MF_FILE_OPENMODE</a> enumeration.
 * @param {MF_FILE_FLAGS} fFlags Bitwise <b>OR</b> of values from the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags">MF_FILE_FLAGS</a> enumeration.
 * @param {PWSTR} pwszFileURL Pointer to a null-terminated string that contains the file name.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatefile
 * @since windows6.0.6000
 */
export MFCreateFile(AccessMode, OpenMode, fFlags, pwszFileURL) {
    pwszFileURL := pwszFileURL is String ? StrPtr(pwszFileURL) : pwszFileURL

    result := DllCall("MFPlat.dll\MFCreateFile", MF_FILE_ACCESSMODE, AccessMode, MF_FILE_OPENMODE, OpenMode, MF_FILE_FLAGS, fFlags, "ptr", pwszFileURL, "ptr*", &ppIByteStream := 0, "HRESULT")
    return IMFByteStream(ppIByteStream)
}

/**
 * Creates a byte stream that is backed by a temporary local file.
 * @remarks
 * This function creates a file in the system temporary folder, and then returns a byte stream object for that file.
 *       The full path name of the file is stored in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-bytestream-origin-name-attribute">MF_BYTESTREAM_ORIGIN_NAME</a> attribute. The file is created with the <b>FILE_FLAG_DELETE_ON_CLOSE</b> flag, and is deleted after the byte stream is released.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {MF_FILE_ACCESSMODE} AccessMode The requested access mode, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode">MF_FILE_ACCESSMODE</a> enumeration.
 * @param {MF_FILE_OPENMODE} OpenMode The behavior of the function if the file already exists or does not exist, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode">MF_FILE_OPENMODE</a> enumeration.
 * @param {MF_FILE_FLAGS} fFlags Bitwise <b>OR</b> of values from the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags">MF_FILE_FLAGS</a> enumeration.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatetempfile
 * @since windows6.0.6000
 */
export MFCreateTempFile(AccessMode, OpenMode, fFlags) {
    result := DllCall("MFPlat.dll\MFCreateTempFile", MF_FILE_ACCESSMODE, AccessMode, MF_FILE_OPENMODE, OpenMode, MF_FILE_FLAGS, fFlags, "ptr*", &ppIByteStream := 0, "HRESULT")
    return IMFByteStream(ppIByteStream)
}

/**
 * Begins an asynchronous request to create a byte stream from a file.
 * @remarks
 * When the request is completed, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. The callback object should then call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfendcreatefile">MFEndCreateFile</a> function to get a pointer to the byte stream.
 * @param {MF_FILE_ACCESSMODE} AccessMode The requested access mode, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode">MF_FILE_ACCESSMODE</a> enumeration.
 * @param {MF_FILE_OPENMODE} OpenMode The behavior of the function if the file already exists or does not exist, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode">MF_FILE_OPENMODE</a> enumeration.
 * @param {MF_FILE_FLAGS} fFlags Bitwise <b>OR</b> of values from the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags">MF_FILE_FLAGS</a> enumeration.
 * @param {PWSTR} pwszFilePath Pointer to a null-terminated string containing the file name.
 * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface
 * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
 * @returns {IUnknown} Receives an <b>IUnknown</b> pointer or the value <b>NULL</b>. If the value is not <b>NULL</b>, you can cancel the asynchronous operation by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelcreatefile">MFCancelCreateFile</a> function. The caller must release the interface. This parameter is optional and can be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfbegincreatefile
 * @since windows6.0.6000
 */
export MFBeginCreateFile(AccessMode, OpenMode, fFlags, pwszFilePath, pCallback, pState) {
    pwszFilePath := pwszFilePath is String ? StrPtr(pwszFilePath) : pwszFilePath

    result := DllCall("MFPlat.dll\MFBeginCreateFile", MF_FILE_ACCESSMODE, AccessMode, MF_FILE_OPENMODE, OpenMode, MF_FILE_FLAGS, fFlags, "ptr", pwszFilePath, "ptr", pCallback, "ptr", pState, "ptr*", &ppCancelCookie := 0, "HRESULT")
    return IUnknown(ppCancelCookie)
}

/**
 * Completes an asynchronous request to create a byte stream from a file.
 * @remarks
 * Call this function when the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbegincreatefile">MFBeginCreateFile</a> function completes asynchronously.
 * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfendcreatefile
 * @since windows6.0.6000
 */
export MFEndCreateFile(pResult) {
    result := DllCall("MFPlat.dll\MFEndCreateFile", "ptr", pResult, "ptr*", &ppFile := 0, "HRESULT")
    return IMFByteStream(ppFile)
}

/**
 * Cancels an asynchronous request to create a byte stream from a file.
 * @remarks
 * You can use this function to cancel a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbegincreatefile">MFBeginCreateFile</a>. Because that function is asynchronous, however, it might complete before the operation can be canceled. Therefore, your callback might still be invoked after you call this function.
 * @param {IUnknown} pCancelCookie A pointer to the <b>IUnknown</b> interface of the cancellation object. This pointer is received in the <i>ppCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbegincreatefile">MFBeginCreateFile</a> function.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcancelcreatefile
 * @since windows6.0.6000
 */
export MFCancelCreateFile(pCancelCookie) {
    result := DllCall("MFPlat.dll\MFCancelCreateFile", "ptr", pCancelCookie, "HRESULT")
    return result
}

/**
 * Allocates system memory and creates a media buffer to manage it.
 * @remarks
 * The function allocates a buffer with a 1-byte memory alignment. To allocate a buffer that is aligned to a larger memory boundary, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatealignedmemorybuffer">MFCreateAlignedMemoryBuffer</a>.
 * 
 * When the media buffer object is destroyed, it releases the allocated memory.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} cbMaxLength Size of the buffer, in bytes.
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the media buffer. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatememorybuffer
 * @since windows6.0.6000
 */
export MFCreateMemoryBuffer(cbMaxLength) {
    result := DllCall("MFPlat.dll\MFCreateMemoryBuffer", "uint", cbMaxLength, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Creates a media buffer that wraps an existing media buffer.
 * @remarks
 * The maximum size of the wrapper buffer is limited to the size of the valid data in the original buffer. This might be less than the allocated size of the original buffer. To set the size of the valid data, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength">IMFMediaBuffer::SetCurrentLength</a>.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {IMFMediaBuffer} pBuffer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the original media buffer.
 * @param {Integer} cbOffset The start of the new buffer, as an offset in bytes from the start of the original buffer.
 * @param {Integer} dwLength The size of the new buffer. The value of <i>cbOffset</i> + <i>dwLength</i> must be less than or equal to the size of valid data the original buffer. (The size of the valid data is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength">IMFMediaBuffer::GetCurrentLength</a> method.)
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemediabufferwrapper
 * @since windows6.0.6000
 */
export MFCreateMediaBufferWrapper(pBuffer, cbOffset, dwLength) {
    result := DllCall("MFPlat.dll\MFCreateMediaBufferWrapper", "ptr", pBuffer, "uint", cbOffset, "uint", dwLength, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Converts a Media Foundation media buffer into a buffer that is compatible with DirectX Media Objects (DMOs).
 * @remarks
 * The DMO buffer created by this function also exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface. If <i>pIMFSample</i> is <b>NULL</b>, all of the <b>IMFSample</b> methods return MF_E_NOT_INITIALIZED. Otherwise, they call through to the <i>pIMFSample</i> pointer.
 * 
 * If the Media Foundation buffer specified by <i>pIMFMediaBuffer</i> exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a> interface, the DMO buffer also exposes <b>IMF2DBuffer</b>.
 * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the sample that contains the Media Foundation buffer. This parameter can be <b>NULL</b>.
 * @param {IMFMediaBuffer} pMFMediaBuffer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the Media Foundation buffer.
 * @param {Integer} cbOffset Offset in bytes from the start of the Media Foundation buffer. This offset defines where the DMO buffer starts. If this parameter is zero, the DMO buffer starts at the beginning of the Media Foundation buffer.
 * @returns {IMediaBuffer} Receives a pointer to the <b>IMediaBuffer</b> interface. This interface is documented in the DirectShow SDK documentation. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatelegacymediabufferonmfmediabuffer
 * @since windows6.0.6000
 */
export MFCreateLegacyMediaBufferOnMFMediaBuffer(pSample, pMFMediaBuffer, cbOffset) {
    result := DllCall("MFPlat.dll\MFCreateLegacyMediaBufferOnMFMediaBuffer", "ptr", pSample, "ptr", pMFMediaBuffer, "uint", cbOffset, "ptr*", &ppMediaBuffer := 0, "HRESULT")
    return IMediaBuffer(ppMediaBuffer)
}

/**
 * Converts a Microsoft Direct3D 9 format identifier to a Microsoft DirectX Graphics Infrastructure (DXGI) format identifier.
 * @param {Integer} dx9 The <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data">D3DFORMAT</a> value or FOURCC code to convert.
 * @returns {DXGI_FORMAT} Returns a <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfmapdx9formattodxgiformat
 * @since windows8.0
 */
export MFMapDX9FormatToDXGIFormat(dx9) {
    result := DllCall("MFPlat.dll\MFMapDX9FormatToDXGIFormat", "uint", dx9, DXGI_FORMAT)
    return result
}

/**
 * Converts a Microsoft DirectX Graphics Infrastructure (DXGI) format identifier to a Microsoft Direct3D 9 format identifier.
 * @param {DXGI_FORMAT} dx11 The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value to convert.
 * @returns {Integer} Returns a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data">D3DFORMAT</a> value or FOURCC code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfmapdxgiformattodx9format
 * @since windows8.0
 */
export MFMapDXGIFormatToDX9Format(dx11) {
    result := DllCall("MFPlat.dll\MFMapDXGIFormatToDX9Format", DXGI_FORMAT, dx11, UInt32)
    return result
}

/**
 * Locks the shared Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
 * @remarks
 * This function obtains a pointer to a  DXGI Device Manager instance that can be shared between components. The Microsoft Media Foundation platform creates this instance of the  DXGI Device Manager as a singleton object. Alternatively, you can create a new DXGI Device Manager by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a>.
 * 
 * The first time this function is called, the Media Foundation platform creates the shared DXGI Device Manager. 
 * 
 * When you are done use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> pointer, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunlockdxgidevicemanager">MFUnlockDXGIDeviceManager</a>.
 * @param {Pointer<Integer>} pResetToken Receives a token that identifies this instance of the DXGI Device Manager. Use this token when calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>.
 *           This parameter can be <b>NULL</b>.
 * @param {Pointer<IMFDXGIDeviceManager>} ppManager Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface. The caller must release the interface.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mflockdxgidevicemanager
 * @since windows8.0
 */
export MFLockDXGIDeviceManager(pResetToken, ppManager) {
    pResetTokenMarshal := pResetToken is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFLockDXGIDeviceManager", pResetTokenMarshal, pResetToken, IMFDXGIDeviceManager.Ptr, ppManager, "HRESULT")
    return result
}

/**
 * Unlocks the shared Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
 * @remarks
 * Call this function after a successful call to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mflockdxgidevicemanager">MFLockDXGIDeviceManager</a> function.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfunlockdxgidevicemanager
 * @since windows8.0
 */
export MFUnlockDXGIDeviceManager() {
    result := DllCall("MFPlat.dll\MFUnlockDXGIDeviceManager", "HRESULT")
    return result
}

/**
 * Creates a media buffer object that manages a Direct3D 9 surface.
 * @remarks
 * This function creates a media buffer object that holds a pointer to the Direct3D surface specified in <i>punkSurface</i>. Locking the buffer gives the caller access to the surface memory. When the buffer object is destroyed, it releases the surface. For more information about media buffers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-buffers">Media Buffers</a>.
 * 
 * <div class="alert"><b>Note</b>  This function does not allocate the Direct3D surface itself.</div>
 * <div> </div>
 * The buffer object created by this function also exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a> interface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/directx-surface-buffer">DirectX Surface Buffer</a>.
 *       
 * 
 * This function does not support DXGI surfaces.
 * @param {Pointer<Guid>} riid Identifies the type of Direct3D 9 surface. Currently this value must be <b>IID_IDirect3DSurface9</b>.
 * @param {IUnknown} punkSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DirectX surface.
 * @param {BOOL} fBottomUpWhenLinear If <b>TRUE</b>, the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto">IMF2DBuffer::ContiguousCopyTo</a> method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is <b>FALSE</b>, the <b>ContiguousCopyTo</b> method copies the buffer into a top-down format, which is compatible with DirectX.
 *           
 * 
 * For more information about top-down versus bottom-up images, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatedxsurfacebuffer
 * @since windows6.0.6000
 */
export MFCreateDXSurfaceBuffer(riid, punkSurface, fBottomUpWhenLinear) {
    result := DllCall("MFPlat.dll\MFCreateDXSurfaceBuffer", Guid.Ptr, riid, "ptr", punkSurface, BOOL, fBottomUpWhenLinear, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Creates a media buffer object that manages a Windows Imaging Component (WIC).
 * @param {Pointer<Guid>} riid Set this parameter to <c>__uuidof(IWICBitmap)</c>.
 * @param {IUnknown} punkSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the bitmap surface. The bitmap surface must be a WIC bitmap that exposes the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a> interface.
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatewicbitmapbuffer
 * @since windows8.0
 */
export MFCreateWICBitmapBuffer(riid, punkSurface) {
    result := DllCall("MFPlat.dll\MFCreateWICBitmapBuffer", Guid.Ptr, riid, "ptr", punkSurface, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Creates a media buffer to manage a Microsoft DirectX Graphics Infrastructure (DXGI) surface.
 * @remarks
 * The returned buffer object supports the following interfaces:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer2">IMF2DBuffer2</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgibuffer">IMFDXGIBuffer</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a>
 * </li>
 * </ul>
 * @param {Pointer<Guid>} riid Identifies the type of DXGI surface. This value must be <b>IID_ID3D11Texture2D</b>.
 * @param {IUnknown} punkSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DXGI surface.
 * @param {Integer} uSubresourceIndex The zero-based index of a subresource of the surface. The media buffer object is associated with this subresource.
 * @param {BOOL} fBottomUpWhenLinear If <b>TRUE</b>, the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto">IMF2DBuffer::ContiguousCopyTo</a> method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is <b>FALSE</b>, the <b>ContiguousCopyTo</b> method copies the buffer into a top-down format, which is compatible with Direct3D.
 *           
 * 
 * For more information about top-down versus bottom-up images, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer
 * @since windows8.0
 */
export MFCreateDXGISurfaceBuffer(riid, punkSurface, uSubresourceIndex, fBottomUpWhenLinear) {
    result := DllCall("MFPlat.dll\MFCreateDXGISurfaceBuffer", Guid.Ptr, riid, "ptr", punkSurface, "uint", uSubresourceIndex, BOOL, fBottomUpWhenLinear, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * 
 * @param {Pointer<Guid>} riid 
 * @param {IUnknown} punkDevice 
 * @param {IMFMediaType} pMediaType 
 * @param {Integer} uSubresource 
 * @returns {IMFMediaBuffer} 
 */
export MFCreateDXGICrossAdapterBuffer(riid, punkDevice, pMediaType, uSubresource) {
    result := DllCall("MFPlat.DLL\MFCreateDXGICrossAdapterBuffer", Guid.Ptr, riid, "ptr", punkDevice, "ptr", pMediaType, "uint", uSubresource, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Creates an object that allocates video samples that are compatible with Microsoft DirectX Graphics Infrastructure (DXGI).
 * @remarks
 * This function creates an allocator for DXGI video surfaces. The buffers created by this allocator expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgibuffer">IMFDXGIBuffer</a> interface. To create an allocator for Microsoft Direct3D 9 video surfaces, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nc-evr-mfcreatevideosampleallocator">MFCreateVideoSampleAllocator</a>.
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatevideosampleallocatorex
 * @since windows8.0
 */
export MFCreateVideoSampleAllocatorEx(riid) {
    result := DllCall("MFPlat.dll\MFCreateVideoSampleAllocatorEx", Guid.Ptr, riid, "ptr*", &ppSampleAllocator := 0, "HRESULT")
    return ppSampleAllocator
}

/**
 * Creates an instance of the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
 * @remarks
 * When you create an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> with <b>MFCreateDXGIDeviceManager</b>, a Microsoft Direct3D 11 device is not associated with the device manager. To associate a Direct3D 11 device with the device manager, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>, passing in the pointer to the Direct3D 11 device. To create a Direct3D 11 device, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>. The device should be created with the <b>D3D11_CREATE_DEVICE_VIDEO_SUPPORT</b> device creation flag which is defined in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a> enumeration.
 * @param {Pointer<Integer>} resetToken Receives a token that identifies this instance of the DXGI Device Manager. Use this token when calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>.
 * @param {Pointer<IMFDXGIDeviceManager>} ppDeviceManager Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface. The caller must release the interface.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager
 * @since windows8.0
 */
export MFCreateDXGIDeviceManager(resetToken, ppDeviceManager) {
    resetTokenMarshal := resetToken is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFCreateDXGIDeviceManager", resetTokenMarshal, resetToken, IMFDXGIDeviceManager.Ptr, ppDeviceManager, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} pDeviceManager 
 * @returns {MF_DXGI_DEVICE_MANAGER_MODE} 
 */
export MFGetDXGIDeviceManageMode(pDeviceManager) {
    result := DllCall("MFPlat.DLL\MFGetDXGIDeviceManageMode", "ptr", pDeviceManager, "int*", &_mode := 0, "HRESULT")
    return _mode
}

/**
 * Allocates system memory with a specified byte alignment and creates a media buffer to manage the memory.
 * @remarks
 * When the media buffer object is destroyed, it releases the allocated memory.
 * @param {Integer} cbMaxLength Size of the buffer, in bytes.
 * @param {Integer} cbAligment Specifies the memory alignment for the buffer. Use one of the following constants.
 *           
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_1_BYTE_ALIGNMENT"></a><a id="mf_1_byte_alignment"></a><dl>
 * <dt><b>MF_1_BYTE_ALIGNMENT</b></dt>
 * <dt>0x00000000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 1 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_2_BYTE_ALIGNMENT"></a><a id="mf_2_byte_alignment"></a><dl>
 * <dt><b>MF_2_BYTE_ALIGNMENT</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 2 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_4_BYTE_ALIGNMENT"></a><a id="mf_4_byte_alignment"></a><dl>
 * <dt><b>MF_4_BYTE_ALIGNMENT</b></dt>
 * <dt>0x00000003</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 4 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_8_BYTE_ALIGNMENT"></a><a id="mf_8_byte_alignment"></a><dl>
 * <dt><b>MF_8_BYTE_ALIGNMENT</b></dt>
 * <dt>0x00000007</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 8 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_16_BYTE_ALIGNMENT"></a><a id="mf_16_byte_alignment"></a><dl>
 * <dt><b>MF_16_BYTE_ALIGNMENT</b></dt>
 * <dt>0x0000000F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 16 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_32_BYTE_ALIGNMENT"></a><a id="mf_32_byte_alignment"></a><dl>
 * <dt><b>MF_32_BYTE_ALIGNMENT</b></dt>
 * <dt>0x0000001F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 32 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_64_BYTE_ALIGNMENT"></a><a id="mf_64_byte_alignment"></a><dl>
 * <dt><b>MF_64_BYTE_ALIGNMENT</b></dt>
 * <dt>0x0000003F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 64 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_128_BYTE_ALIGNMENT"></a><a id="mf_128_byte_alignment"></a><dl>
 * <dt><b>MF_128_BYTE_ALIGNMENT</b></dt>
 * <dt>0x0000007F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 128 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_256_BYTE_ALIGNMENT"></a><a id="mf_256_byte_alignment"></a><dl>
 * <dt><b>MF_256_BYTE_ALIGNMENT</b></dt>
 * <dt>0x000000FF</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 256 bytes.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MF_512_BYTE_ALIGNMENT"></a><a id="mf_512_byte_alignment"></a><dl>
 * <dt><b>MF_512_BYTE_ALIGNMENT</b></dt>
 * <dt>0x000001FF</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Align to 512 bytes.
 *               
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the media buffer. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatealignedmemorybuffer
 * @since windows6.0.6000
 */
export MFCreateAlignedMemoryBuffer(cbMaxLength, cbAligment) {
    result := DllCall("MFPlat.dll\MFCreateAlignedMemoryBuffer", "uint", cbMaxLength, "uint", cbAligment, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Creates a media event object.
 * @remarks
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} met The event type. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-gettype">IMFMediaEvent::GetType</a>. For a list of event types, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-events">Media Foundation Events</a>.
 * @param {Pointer<Guid>} guidExtendedType The extended type. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype">IMFMediaEvent::GetExtendedType</a>. If the event type does not have an extended type, use the value GUID_NULL.
 * @param {HRESULT} hrStatus The event status. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getstatus">IMFMediaEvent::GetStatus</a>
 * @param {Pointer<PROPVARIANT>} pvValue The value associated with the event, if any. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue">IMFMediaEvent::GetValue</a>. This parameter can be <b>NULL</b>.
 * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemediaevent
 * @since windows6.0.6000
 */
export MFCreateMediaEvent(met, guidExtendedType, hrStatus, pvValue) {
    result := DllCall("MFPlat.dll\MFCreateMediaEvent", "uint", met, Guid.Ptr, guidExtendedType, "int", hrStatus, PROPVARIANT.Ptr, pvValue, "ptr*", &ppEvent := 0, "HRESULT")
    return IMFMediaEvent(ppEvent)
}

/**
 * Creates an event queue.
 * @remarks
 * This function creates a helper object that you can use to implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a> interface.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @returns {IMFMediaEventQueue} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventqueue">IMFMediaEventQueue</a> interface of the event queue. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreateeventqueue
 * @since windows6.0.6000
 */
export MFCreateEventQueue() {
    result := DllCall("MFPlat.dll\MFCreateEventQueue", "ptr*", &ppMediaEventQueue := 0, "HRESULT")
    return IMFMediaEventQueue(ppMediaEventQueue)
}

/**
 * Creates an empty media sample.
 * @remarks
 * Initially the sample does not contain any media buffers.
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @returns {IMFSample} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the media sample. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatesample
 * @since windows6.0.6000
 */
export MFCreateSample() {
    result := DllCall("MFPlat.dll\MFCreateSample", "ptr*", &ppIMFSample := 0, "HRESULT")
    return IMFSample(ppIMFSample)
}

/**
 * Creates an empty attribute store.
 * @remarks
 * Attributes are used throughout Microsoft Media Foundation to configure objects, describe media formats, query object properties, and other purposes. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/attributes-and-properties">Attributes in Media Foundation</a>.
 * 
 * For a complete list of all the defined attribute GUIDs in Media Foundation, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-attributes">Media Foundation Attributes</a>.
 * @param {Integer} cInitialSize The initial number of elements allocated for the attribute store. The attribute store grows as needed.
 * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreateattributes
 * @since windows6.0.6000
 */
export MFCreateAttributes(cInitialSize) {
    result := DllCall("MFPlat.dll\MFCreateAttributes", "ptr*", &ppMFAttributes := 0, "uint", cInitialSize, "HRESULT")
    return IMFAttributes(ppMFAttributes)
}

/**
 * Initializes the contents of an attribute store from a byte array.
 * @remarks
 * Use this function to deserialize an attribute store that was serialized with the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetattributesasblob">MFGetAttributesAsBlob</a> function.
 * 
 * This function deletes any attributes that were previously stored in <i>pAttributes</i>.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
 * @param {Integer} pBuf Pointer to the array that contains the initialization data.
 * @param {Integer} cbBufSize Size of the <i>pBuf</i> array, in bytes.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
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
 * The buffer is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitattributesfromblob
 * @since windows6.0.6000
 */
export MFInitAttributesFromBlob(pAttributes, pBuf, cbBufSize) {
    result := DllCall("MFPlat.dll\MFInitAttributesFromBlob", "ptr", pAttributes, "ptr", pBuf, "uint", cbBufSize, "HRESULT")
    return result
}

/**
 * Retrieves the size of the buffer needed for the MFGetAttributesAsBlob function.
 * @remarks
 * Use this function to find the size of the array that is needed for the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetattributesasblob">MFGetAttributesAsBlob</a> function.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
 * @returns {Integer} Receives the required size of the array, in bytes.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetattributesasblobsize
 * @since windows6.0.6000
 */
export MFGetAttributesAsBlobSize(pAttributes) {
    result := DllCall("MFPlat.dll\MFGetAttributesAsBlobSize", "ptr", pAttributes, "uint*", &pcbBufSize := 0, "HRESULT")
    return pcbBufSize
}

/**
 * Converts the contents of an attribute store to a byte array.
 * @remarks
 * The function skips any attributes with <b>IUnknown</b> pointer values (MF_ATTRIBUTE_IUNKNOWN); they are not stored in the array.
 * 
 * To convert the byte array back into an attribute store, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinitattributesfromblob">MFInitAttributesFromBlob</a>.
 * 
 * To write an attribute store to a stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-mfserializeattributestostream">MFSerializeAttributesToStream</a> function.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
 * @param {Integer} pBuf Pointer to an array that receives the attribute data.
 * @param {Integer} cbBufSize Size of the <i>pBuf</i> array, in bytes. To get the required size of the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetattributesasblobsize">MFGetAttributesAsBlobSize</a>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer given in <i>pBuf</i> is too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetattributesasblob
 * @since windows6.0.6000
 */
export MFGetAttributesAsBlob(pAttributes, pBuf, cbBufSize) {
    result := DllCall("MFPlat.dll\MFGetAttributesAsBlob", "ptr", pAttributes, "ptr", pBuf, "uint", cbBufSize, "HRESULT")
    return result
}

/**
 * Adds information about a Media Foundation transform (MFT) to the registry.
 * @remarks
 * The registry entries created by this function are read by the following functions: 
 * 
 * <table>
 * <tr>
 * <th>Function</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenum">MFTEnum</a>
 * </td>
 * <td>Enumerates MFTs by media type and category.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a>
 * </td>
 * <td>Extended version of <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenum">MFTEnum</a>.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a>
 * </td>
 * <td>Looks up an MFT by CLSID and retrieves the registry information.</td>
 * </tr>
 * </table>
 *  
 * 
 * This function does not register the CLSID of the MFT for the <b>CoCreateInstance</b> or <b>CoGetClassObject</b> functions.
 *       
 * 
 * To remove the entries from the registry, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftunregister">MFTUnregister</a>.
 *       If you remove an MFT from the system, you should always call <b>MFTUnregister</b>.
 * 
 * The formats given in the <i>pInputTypes</i> and <i>pOutputTypes</i> parameters are intended to help applications search for MFTs by format. Applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenum">MFTEnum</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> functions to enumerate MFTs that match a particular set of formats.
 * 
 * It is recommended 
 *         to specify at least one input type in <i>pInputTypes</i> and one output type in the <i>pOutputTypes</i> parameter. Otherwise, the MFT might be skipped in the enumeration.
 * 
 * On 64-bit Windows, the 32-bit version of this function registers the MFT in the 32-bit node of the registry. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * @param {Guid} clsidMFT The CLSID of the MFT.
 *           The MFT must also be registered as a COM object using the same CLSID.
 * @param {Guid} guidCategory GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
 * @param {PWSTR} pszName Wide-character string that contains the friendly name of the MFT.
 * @param {Integer} Flags Bitwise <b>OR</b> of zero or more of the following flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a>  enumeration:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_ENUM_FLAG_ASYNCMFT"></a><a id="mft_enum_flag_asyncmft"></a><dl>
 * <dt><b>MFT_ENUM_FLAG_ASYNCMFT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The MFT performs asynchronous processing in software. See <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>. This flag does not apply to hardware transforms.
 * 
 * Requires Windows 7.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_ENUM_FLAG_FIELDOFUSE"></a><a id="mft_enum_flag_fieldofuse"></a><dl>
 * <dt><b>MFT_ENUM_FLAG_FIELDOFUSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application must unlock the MFT in order to use it. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imffieldofusemftunlock">IMFFieldOfUseMFTUnlock</a>.
 * 
 * Requires Windows 7.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_ENUM_FLAG_HARDWARE"></a><a id="mft_enum_flag_hardware"></a><dl>
 * <dt><b>MFT_ENUM_FLAG_HARDWARE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The MFT performs hardware-based data processing, using either the AVStream driver or a GPU-based proxy MFT. MFTs in this category always process data asynchronously. See <a href="https://docs.microsoft.com/windows/desktop/medfound/hardware-mfts">Hardware MFTs</a>.
 * 
 * <div class="alert"><b>Note</b>  This flag applies to video codecs and video processors that perform their work entirely in hardware. It does not apply to software decoders that use DirectX Video Acceleration to assist decoding.</div>
 * <div> </div>
 * Requires Windows 7.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_ENUM_FLAG_SYNCMFT"></a><a id="mft_enum_flag_syncmft"></a><dl>
 * <dt><b>MFT_ENUM_FLAG_SYNCMFT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The MFT performs synchronous processing in software. This flag does not apply to hardware transforms.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_ENUM_FLAG_TRANSCODE_ONLY"></a><a id="mft_enum_flag_transcode_only"></a><dl>
 * <dt><b>MFT_ENUM_FLAG_TRANSCODE_ONLY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The MFT is optimized for transcoding and should not be used for playback.
 * 
 * Requires Windows 7.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Setting <i>Flags</i> to zero is  equivalent to setting the <b>MFT_ENUM_FLAG_SYNCMFT</b> flag. The default processing model for MFTs is synchronous processing.
 * 
 * Prior to Windows 7, the <i>Flags</i> parameter was reserved.
 * @param {Integer} cInputTypes Number of elements in the <i>pInputTypes</i> array.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputTypes Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports.  This parameter can be <b>NULL</b>.
 * 
 * This parameter can be <b>NULL</b>. However, if the parameter is <b>NULL</b>, the MFT will be enumerated only when an application specifies <b>NULL</b> for the desired input type.
 * @param {Integer} cOutputTypes Number of elements in the <i>pOutputTypes</i> array.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputTypes Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. 
 * 
 * This parameter can be <b>NULL</b>. However, if the parameter is <b>NULL</b>, the MFT will be enumerated only when an application specifies <b>NULL</b> for the desired output type.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store that contains additional registry information. This parameter can be <b>NULL</b>. If the parameter is non-<b>NULL</b>, the attributes are written to the registry as a byte array.
 *       You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a> function to retrieve the attributes.
 * 
 * The following attribute is defined for this parameter:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MFT_CODEC_MERIT_Attribute"></a><a id="mft_codec_merit_attribute"></a><a id="MFT_CODEC_MERIT_ATTRIBUTE"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mft-codec-merit-attribute">MFT_CODEC_MERIT_Attribute</a></b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Contains the merit value of a hardware codec. See <a href="https://docs.microsoft.com/windows/desktop/medfound/codec-merit">Codec Merit</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftregister
 * @since windows6.0.6000
 */
export MFTRegister(clsidMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes, pAttributes) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("MFPlat.dll\MFTRegister", Guid, clsidMFT, Guid, guidCategory, "ptr", pszName, "uint", Flags, "uint", cInputTypes, MFT_REGISTER_TYPE_INFO.Ptr, pInputTypes, "uint", cOutputTypes, MFT_REGISTER_TYPE_INFO.Ptr, pOutputTypes, "ptr", pAttributes, "HRESULT")
    return result
}

/**
 * Unregisters a Media Foundation transform (MFT).
 * @remarks
 * This function removes the registry entries created by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a> function.
 * 
 * It is safe to call <b>MFTUnregister</b> twice with the same CLSID. If the CLSID is not found in the registry, the function succeeds and does nothing.
 * @param {Guid} clsidMFT The CLSID of the MFT.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftunregister
 * @since windows6.0.6000
 */
export MFTUnregister(clsidMFT) {
    result := DllCall("MFPlat.dll\MFTUnregister", Guid, clsidMFT, "HRESULT")
    return result
}

/**
 * Registers a Media Foundation transform (MFT) in the caller's process. (MFTRegisterLocal)
 * @remarks
 * The primary purpose of this function is to make an MFT available for automatic topology resolution without making the MFT available to other processes or applications.
 * 
 * After you call this function, the MFT can be enumerated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> function with the <b>MFT_ENUM_FLAG_LOCALMFT</b> flag. The MFT can be enumerated from within the same process, but is not visible to other processes.
 * 
 * The <i>pClassFactory</i> parameter specifies a class factory object that creates the MFT. The class factory's <b>IClassFactory::CreateInstance</b> method must return an object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
 * 
 * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> function retrieves a list of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointers. However, the class factory does not need to support the <b>IMFActivate</b> interface. Instead, the <b>MFTEnumEx</b> function provides an implementation of <b>IMFActivate</b> that wraps the class factory.</div>
 * <div> </div>
 * To unregister the MFT from the current process, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftunregisterlocal">MFTUnregisterLocal</a>.
 * 
 * If you need to register an MFT in the Protected Media Path (PMP) process, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imflocalmftregistration">IMFLocalMFTRegistration</a> interface.
 * @param {IClassFactory} pClassFactory A pointer to the <b>IClassFactory</b> interface of a class factory object. The class factory creates the MFT.
 * @param {Pointer<Guid>} guidCategory A GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
 * @param {PWSTR} pszName A wide-character null-terminated string that contains the friendly name of the MFT.
 * @param {Integer} Flags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
 * @param {Integer} cInputTypes The number of elements in the <i>pInputTypes</i> array.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports. This parameter can be <b>NULL</b> if <i>cInputTypes</i> is zero.
 * @param {Integer} cOutputTypes The number of elements in the <i>pOutputTypes</i> array.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. This parameter can be <b>NULL</b> if <i>cOutputTypes</i> is zero.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftregisterlocal
 * @since windows6.1
 */
export MFTRegisterLocal(pClassFactory, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("MFPlat.dll\MFTRegisterLocal", "ptr", pClassFactory, Guid.Ptr, guidCategory, "ptr", pszName, "uint", Flags, "uint", cInputTypes, MFT_REGISTER_TYPE_INFO.Ptr, pInputTypes, "uint", cOutputTypes, MFT_REGISTER_TYPE_INFO.Ptr, pOutputTypes, "HRESULT")
    return result
}

/**
 * Unregisters one or more Media Foundation transforms (MFTs) from the caller's process.
 * @remarks
 * Use this function to unregister a local MFT that was previously registered through the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a> function.
 * 
 * If the <i>pClassFactory</i> parameter is <b>NULL</b>, all local MFTs in the process are unregistered. Otherwise, the function unregisters the MFT associated with the class factory specified by the <i>pClassFactory</i> parameter. In that case, the <i>pClassFactory</i> parameter should equal a pointer value that was previously passed to  the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a> function.
 * @param {IClassFactory} pClassFactory A pointer to the <b>IClassFactory</b> interface of a class factory object. This parameter can be <b>NULL</b>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
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
 * <dt><b>HRESULT_FROM_WIN32(<b>ERROR_NOT_FOUND</b>)</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The MFT specified by the <i>pClassFactory</i> parameter was not registered in this process.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftunregisterlocal
 * @since windows6.1
 */
export MFTUnregisterLocal(pClassFactory) {
    result := DllCall("MFPlat.dll\MFTUnregisterLocal", "ptr", pClassFactory, "HRESULT")
    return result
}

/**
 * Registers a Media Foundation transform (MFT) in the caller's process. (MFTRegisterLocalByCLSID)
 * @remarks
 * The primary purpose of this function is to make an MFT available for automatic topology resolution without making the MFT available to other processes or applications.
 * 
 * After you call this function, the MFT can be enumerated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> function with the <b>MFT_ENUM_FLAG_LOCALMFT</b> flag. The MFT can be enumerated from within the same process, but is not visible to other processes.
 * 
 * To unregister the MFT from the current process, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftunregisterlocalbyclsid">MFTUnregisterLocalByCLSID</a>.
 * 
 * If you need to register an MFT in the Protected Media Path (PMP) process, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imflocalmftregistration">IMFLocalMFTRegistration</a> interface.
 * @param {Pointer<Guid>} clisdMFT The class identifier (CLSID) of the MFT.
 * @param {Pointer<Guid>} guidCategory A GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
 * @param {PWSTR} pszName A wide-character null-terminated string that contains the friendly name of the MFT.
 * @param {Integer} Flags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
 * @param {Integer} cInputTypes The number of elements in the <i>pInputTypes</i> array.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports. This parameter can be <b>NULL</b> if <i>cInputTypes</i> is zero.
 * @param {Integer} cOutputTypes The number of elements in the <i>pOutputTypes</i> array.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. This parameter can be <b>NULL</b> if <i>cOutputTypes</i> is zero.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftregisterlocalbyclsid
 * @since windows6.1
 */
export MFTRegisterLocalByCLSID(clisdMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("MFPlat.dll\MFTRegisterLocalByCLSID", Guid.Ptr, clisdMFT, Guid.Ptr, guidCategory, "ptr", pszName, "uint", Flags, "uint", cInputTypes, MFT_REGISTER_TYPE_INFO.Ptr, pInputTypes, "uint", cOutputTypes, MFT_REGISTER_TYPE_INFO.Ptr, pOutputTypes, "HRESULT")
    return result
}

/**
 * Unregisters a Media Foundation transform (MFT) from the caller's process.
 * @remarks
 * Use this function to unregister a local MFT that was previously registered through the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a> function.
 * @param {Guid} clsidMFT The class identifier (CLSID) of the MFT.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b><b>S_OK</b></b></dt>
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
 * <dt><b>HRESULT_FROM_WIN32(<b>ERROR_NOT_FOUND</b>)</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The MFT specified by the <i>clsidMFT</i> parameter was not registered in this process.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftunregisterlocalbyclsid
 * @since windows6.1
 */
export MFTUnregisterLocalByCLSID(clsidMFT) {
    result := DllCall("MFPlat.dll\MFTUnregisterLocalByCLSID", Guid, clsidMFT, "HRESULT")
    return result
}

/**
 * Enumerates Media Foundation transforms (MFTs) in the registry.
 * @remarks
 * This function returns a list of all the MFTs in the specified category that match the search criteria given by the <i>pInputType</i>, <i>pOutputType</i>, and <i>pAttributes</i> parameters. Any of those parameters can be <b>NULL</b>.
 *       
 * 
 * If no MFTs match the criteria, the method succeeds but returns the value zero in <i>pcMFTs</i>.
 * @param {Guid} guidCategory GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
 * @param {Integer} Flags Reserved. Must be zero.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputType Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an input media type to match. 
 * 
 * This parameter can be <b>NULL</b>. If <b>NULL</b>, all input types are matched.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputType Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an output media type to match.
 * 
 * This parameter can be <b>NULL</b>.
 *           If <b>NULL</b>, all output types are matched.
 * @param {IMFAttributes} pAttributes Reserved. Set to <b>NULL</b>.
 * 
 * <div class="alert"><b>Note</b>  Windows Vista and Windows Server 2008: This parameter can specify a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. The <b>MFTEnum</b> function matches the attributes in this object against the attributes stored in the registry. (Registry attributes are specified in the <i>pAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a> function.) Only MFTs with matching attributes are returned in the enumeration results.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  Windows 7 and later: This parameter is ignored.</div>
 * <div> </div>
 * @param {Pointer<Pointer<Guid>>} ppclsidMFT Receives a pointer to an array of CLSIDs. To create an MFT from this list, call <b>CoCreateInstance</b> with one of the CLSIDs. To get information about a particular MFT from its CLSID, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a>. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
 * @param {Pointer<Integer>} pcMFTs Receives the number of elements in the <i>ppclsidMFT</i> array. The value can be zero.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftenum
 * @since windows6.0.6000
 */
export MFTEnum(guidCategory, Flags, pInputType, pOutputType, pAttributes, ppclsidMFT, pcMFTs) {
    ppclsidMFTMarshal := ppclsidMFT is VarRef ? "ptr*" : "ptr"
    pcMFTsMarshal := pcMFTs is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFTEnum", Guid, guidCategory, "uint", Flags, MFT_REGISTER_TYPE_INFO.Ptr, pInputType, MFT_REGISTER_TYPE_INFO.Ptr, pOutputType, "ptr", pAttributes, ppclsidMFTMarshal, ppclsidMFT, pcMFTsMarshal, pcMFTs, "HRESULT")
    return result
}

/**
 * Gets a list of Microsoft Media Foundation transforms (MFTs) that match specified search criteria. This function extends the MFTEnum function.
 * @remarks
 * The <i>Flags</i> parameter controls which MFTs are enumerated, and the order in which they are returned. The flags for this parameter fall into several groups.
 * 
 * 
 * The first set of flags specifies how an MFT processes data.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_SYNCMFT"></a><a id="mft_enum_flag_syncmft"></a>MFT_ENUM_FLAG_SYNCMFT
 * 
 * </td>
 * <td width="60%">
 * The MFT performs synchronous data processing in software. This is the original MFT processing model, and is  compatible with Windows Vista.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_ASYNCMFT"></a><a id="mft_enum_flag_asyncmft"></a>MFT_ENUM_FLAG_ASYNCMFT
 * 
 * </td>
 * <td width="60%">
 * The MFT performs asynchronous data processing in software. This processing model requires Windows 7. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_HARDWARE"></a><a id="mft_enum_flag_hardware"></a>MFT_ENUM_FLAG_HARDWARE
 * 
 * </td>
 * <td width="60%">
 * The MFT performs hardware-based data processing, using either the AVStream driver or a GPU-based proxy MFT. MFTs in this category always process data asynchronously. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/hardware-mfts">Hardware MFTs</a>.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Every MFT falls into exactly one of these categories.  To enumerate a category, set the corresponding flag in the <i>Flags</i> parameter. You can combine these flags to enumerate more than one category. If none of these flags is specified, the default category is synchronous MFTs (<b>MFT_ENUM_FLAG_SYNCMFT</b>).
 * 
 * 
 * 
 * Next, the following flags include MFTs that are otherwise  excluded from the results. By default, flags that match these criteria are excluded from the results. Use any these flags to include them.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_FIELDOFUSE"></a><a id="mft_enum_flag_fieldofuse"></a><b>MFT_ENUM_FLAG_FIELDOFUSE</b>
 * 
 * </td>
 * <td width="60%">
 * Include MFTs that must be unlocked by the application.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_LOCALMFT"></a><a id="mft_enum_flag_localmft"></a><b>MFT_ENUM_FLAG_LOCALMFT</b>
 * 
 * </td>
 * <td width="60%">
 * Include MFTs that are registered in the caller's process through either the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_TRANSCODE_ONLY"></a><a id="mft_enum_flag_transcode_only"></a><b>MFT_ENUM_FLAG_TRANSCODE_ONLY</b>
 * 
 * </td>
 * <td width="60%">
 * Include MFTs that are optimized for transcoding rather than playback.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * 
 * 
 * The last flag is used to sort and filter the results:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_SORTANDFILTER"></a><a id="mft_enum_flag_sortandfilter"></a><b>MFT_ENUM_FLAG_SORTANDFILTER</b>
 * 
 * </td>
 * <td width="60%">
 * Sort and filter the results.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * If the <b>MFT_ENUM_FLAG_SORTANDFILTER</b> flag is set, the <b>MFTEnumEx</b> function sorts the results as follows:
 * 
 * <ul>
 * <li>Local: If the <b>MFT_ENUM_FLAG_LOCALMFT</b> flag is set, local MFTs appear first in the list. To register a local MFT, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a> function.</li>
 * <li>Merit: MFTs with a merit value appear next on the list, in order of merit value (highest to lowest). For more information about merit, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-codec-merit-attribute">MFT_CODEC_MERIT_Attribute</a>. </li>
 * <li>Preferred: If an MFT is listed in the plug-in control's preferred list, it appears next in the list. For more information about the plug-in control, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a>.</li>
 * <li>If an MFT appears on the blocked list, it is excluded from the results. For more information about the blocked list, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfplugincontrol-isdisabled">IMFPluginControl::IsDisabled</a>.</li>
 * <li>Any other MFTs that match the search criteria appear at the end of the list, unsorted.</li>
 * </ul>
 * If you do not set the <b>MFT_ENUM_FLAG_SORTANDFILTER</b> flag, the <b>MFTEnumEx</b> function returns an unsorted list.
 * 
 * Setting the <i>Flags</i> parameter to zero is equivalent to using the value <b>MFT_ENUM_FLAG_SYNCMFT</b> | <b>MFT_ENUM_FLAG_LOCALMFT</b> | <b>MFT_ENUM_FLAG_SORTANDFILTER</b>.
 * 
 * Setting <i>Flags</i> to <b>MFT_ENUM_FLAG_SYNCMFT</b> is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenum">MFTEnum</a> function.
 * 
 * If no MFTs match the search criteria, the function returns <b>S_OK</b>, unless some other error occurs. Therefore, always check the count received in the <i>pcMFTActivate</i> parameter before you dereference the <i>pppMFTActivate</i> pointer.
 * 
 * <div class="alert"><b>Note</b>  There is no way to enumerate just local MFTs and nothing else. Setting <i>Flags</i> equal to <b>MFT_ENUM_FLAG_LOCALMFT</b> is equivalent to  including the <b>MFT_ENUM_FLAG_SYNCMFT</b> flag. However, if you also sort the results by specifying the <b>MFT_ENUM_FLAG_SORTANDFILTER</b> flag, local MFTs appear first in the list.</div>
 * <div> </div>
 * <h3><a id="Creating_the_MFT"></a><a id="creating_the_mft"></a><a id="CREATING_THE_MFT"></a>Creating the MFT</h3>
 * If at least one MFT matches the search criteria, the <i>pppMFTActivate</i> parameter receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointers. One pointer is returned for each matching MFT. Each pointer represents an <i>activation object</i> for the MFT. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/activation-objects">Activation Objects</a>.
 * 
 * Additional information about each MFT is stored as attributes on the activation objects. For a list of the possible attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/transform-attributes">Transform Attributes</a>.
 * 
 * To create an instance of the MFT, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a>.
 * 
 * <h3><a id="Hardware_Codecs"></a><a id="hardware_codecs"></a><a id="HARDWARE_CODECS"></a>Hardware Codecs</h3>
 * Hardware codecs are excluded from the enumeration results if the following registry keys are set to zero:
 * 
 * Decoders: <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows Media Foundation</b>&#92;<b>HardwareMFT</b>&#92;<b>EnableDecoders</b>
 * 
 * 
 * 
 * Encoders: <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows Media Foundation</b>&#92;<b>HardwareMFT</b>&#92;<b>EnableEncoders</b>
 * 
 * 
 * 
 * Video processors: <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows Media Foundation</b>&#92;<b>HardwareMFT</b>&#92;<b>EnableVideoProcessors</b>
 * 
 * 
 * 
 * These keys are intended for OEMs, and should not be used by applications.
 * 
 * For hardware codecs, the <i>guidCategory</i> parameter of <b>MFTEnumEx</b> can also specify one of the following kernel streaming (KS) device categories:
 * 
 * <ul>
 * <li><b>KSCATEGORY_DATACOMPRESSOR</b></li>
 * <li><b>KSCATEGORY_DATADECOMPRESSOR</b></li>
 * </ul>
 * Hardware codecs should also be registered under an <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a> GUID, so applications should generally use those categories instead of the KS device categories.
 * @param {Guid} guidCategory A GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
 * @param {Integer} Flags The bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an input media type to match. 
 * 
 * This parameter can be <b>NULL</b>. If <b>NULL</b>, all input types are matched.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an output media type to match.
 * 
 * This parameter can be <b>NULL</b>. If <b>NULL</b>, all output types are matched.
 * @param {Pointer<Pointer<IMFActivate>>} pppMFTActivate Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointers. Each pointer represents an activation object for an MFT that matches the search criteria. The function allocates the memory for the array. The caller must release the pointers and call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory for the array.
 * @param {Pointer<Integer>} pnumMFTActivate Receives the number of elements in the <i>pppMFTActivate</i> array. If no MFTs match the search criteria, this parameter receives the value zero.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftenumex
 * @since windows6.1
 */
export MFTEnumEx(guidCategory, Flags, pInputType, pOutputType, pppMFTActivate, pnumMFTActivate) {
    pppMFTActivateMarshal := pppMFTActivate is VarRef ? "ptr*" : "ptr"
    pnumMFTActivateMarshal := pnumMFTActivate is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFTEnumEx", Guid, guidCategory, "uint", Flags, MFT_REGISTER_TYPE_INFO.Ptr, pInputType, MFT_REGISTER_TYPE_INFO.Ptr, pOutputType, pppMFTActivateMarshal, pppMFTActivate, pnumMFTActivateMarshal, pnumMFTActivate, "HRESULT")
    return result
}

/**
 * Gets a list of Microsoft Media Foundation transforms (MFTs) that match specified search criteria.
 * @remarks
 * The <i>Flags</i> parameter controls which MFTs are enumerated, and the order in which they are returned. The flags for this parameter fall into several groups.
 * 
 * 
 * The first set of flags specifies how an MFT processes data.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_SYNCMFT"></a><a id="mft_enum_flag_syncmft"></a>MFT_ENUM_FLAG_SYNCMFT
 * 
 * </td>
 * <td width="60%">
 * The MFT performs synchronous data processing in software. This is the original MFT processing model, and is  compatible with Windows Vista.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_ASYNCMFT"></a><a id="mft_enum_flag_asyncmft"></a>MFT_ENUM_FLAG_ASYNCMFT
 * 
 * </td>
 * <td width="60%">
 * The MFT performs asynchronous data processing in software. This processing model requires Windows 7. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_HARDWARE"></a><a id="mft_enum_flag_hardware"></a>MFT_ENUM_FLAG_HARDWARE
 * 
 * </td>
 * <td width="60%">
 * The MFT performs hardware-based data processing, using either the AVStream driver or a GPU-based proxy MFT. MFTs in this category always process data asynchronously. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/hardware-mfts">Hardware MFTs</a>.
 * 
 * <div class="alert"><b>Note</b>  If an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> containing the MFT_ENUM_ADAPTER_LUID attribute is provided in the <i>pAttributes</i> parameter, the MFT_ENUM_FLAG_HARDWARE flag must be set or E_INVALIDARG will be returned.</div>
 * <div> </div>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Every MFT falls into exactly one of these categories.  To enumerate a category, set the corresponding flag in the <i>Flags</i> parameter. You can combine these flags to enumerate more than one category. If none of these flags is specified, the default category is synchronous MFTs (<b>MFT_ENUM_FLAG_SYNCMFT</b>).
 * 
 * 
 * 
 * Next, the following flags include MFTs that are otherwise  excluded from the results. By default, flags that match these criteria are excluded from the results. Use any these flags to include them.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_FIELDOFUSE"></a><a id="mft_enum_flag_fieldofuse"></a><b>MFT_ENUM_FLAG_FIELDOFUSE</b>
 * 
 * </td>
 * <td width="60%">
 * Include MFTs that must be unlocked by the application.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_LOCALMFT"></a><a id="mft_enum_flag_localmft"></a><b>MFT_ENUM_FLAG_LOCALMFT</b>
 * 
 * </td>
 * <td width="60%">
 * Include MFTs that are registered in the caller's process through either the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_TRANSCODE_ONLY"></a><a id="mft_enum_flag_transcode_only"></a><b>MFT_ENUM_FLAG_TRANSCODE_ONLY</b>
 * 
 * </td>
 * <td width="60%">
 * Include MFTs that are optimized for transcoding rather than playback.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * 
 * 
 * The last flag is used to sort and filter the results:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MFT_ENUM_FLAG_SORTANDFILTER"></a><a id="mft_enum_flag_sortandfilter"></a><b>MFT_ENUM_FLAG_SORTANDFILTER</b>
 * 
 * </td>
 * <td width="60%">
 * Sort and filter the results.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * If the <b>MFT_ENUM_FLAG_SORTANDFILTER</b> flag is set, the <b>MFTEnum2</b> function sorts the results as follows:
 * 
 * <ul>
 * <li>Local: If the <b>MFT_ENUM_FLAG_LOCALMFT</b> flag is set, local MFTs appear first in the list. To register a local MFT, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a> function.</li>
 * <li>Merit: MFTs with a merit value appear next on the list, in order of merit value (highest to lowest). For more information about merit, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-codec-merit-attribute">MFT_CODEC_MERIT_Attribute</a>. </li>
 * <li>Preferred: If an MFT is listed in the plug-in control's preferred list, it appears next in the list. For more information about the plug-in control, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a>.</li>
 * <li>If an MFT appears on the blocked list, it is excluded from the results. For more information about the blocked list, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfplugincontrol-isdisabled">IMFPluginControl::IsDisabled</a>.</li>
 * <li>Any other MFTs that match the search criteria appear at the end of the list, unsorted.</li>
 * </ul>
 * If you do not set the <b>MFT_ENUM_FLAG_SORTANDFILTER</b> flag, the <b>MFTEnum2</b> function returns an unsorted list.
 * 
 * Setting the <i>Flags</i> parameter to zero is equivalent to using the value <b>MFT_ENUM_FLAG_SYNCMFT</b> | <b>MFT_ENUM_FLAG_LOCALMFT</b> | <b>MFT_ENUM_FLAG_SORTANDFILTER</b>.
 * 
 * Setting <i>Flags</i> to <b>MFT_ENUM_FLAG_SYNCMFT</b> is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenum">MFTEnum</a> function.
 * 
 * If no MFTs match the search criteria, the function returns <b>S_OK</b>, unless some other error occurs. Therefore, always check the count received in the <i>pcMFTActivate</i> parameter before you dereference the <i>pppMFTActivate</i> pointer.
 * 
 * <div class="alert"><b>Note</b>  There is no way to enumerate just local MFTs and nothing else. Setting <i>Flags</i> equal to <b>MFT_ENUM_FLAG_LOCALMFT</b> is equivalent to  including the <b>MFT_ENUM_FLAG_SYNCMFT</b> flag. However, if you also sort the results by specifying the <b>MFT_ENUM_FLAG_SORTANDFILTER</b> flag, local MFTs appear first in the list.</div>
 * <div> </div>
 * <h3><a id="Creating_the_MFT"></a><a id="creating_the_mft"></a><a id="CREATING_THE_MFT"></a>Creating the MFT</h3>
 * If at least one MFT matches the search criteria, the <i>pppMFTActivate</i> parameter receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointers. One pointer is returned for each matching MFT. Each pointer represents an <i>activation object</i> for the MFT. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/activation-objects">Activation Objects</a>.
 * 
 * Additional information about each MFT is stored as attributes on the activation objects. For a list of the possible attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/transform-attributes">Transform Attributes</a>.
 * 
 * To create an instance of the MFT, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a>.
 * 
 * <h3><a id="Hardware_Codecs"></a><a id="hardware_codecs"></a><a id="HARDWARE_CODECS"></a>Hardware Codecs</h3>
 * Hardware codecs are excluded from the enumeration results if the following registry keys are set to zero:
 * 
 * Decoders: <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows Media Foundation</b>&#92;<b>HardwareMFT</b>&#92;<b>EnableDecoders</b>
 * 
 * 
 * 
 * Encoders: <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows Media Foundation</b>&#92;<b>HardwareMFT</b>&#92;<b>EnableEncoders</b>
 * 
 * 
 * 
 * Video processors: <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows Media Foundation</b>&#92;<b>HardwareMFT</b>&#92;<b>EnableVideoProcessors</b>
 * 
 * 
 * 
 * These keys are intended for OEMs, and should not be used by applications.
 * 
 * For hardware codecs, the <i>guidCategory</i> parameter of <b>MFTEnum2</b> can also specify one of the following kernel streaming (KS) device categories:
 * 
 * <ul>
 * <li><b>KSCATEGORY_DATACOMPRESSOR</b></li>
 * <li><b>KSCATEGORY_DATADECOMPRESSOR</b></li>
 * </ul>
 * Hardware codecs should also be registered under an <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a> GUID, so applications should generally use those categories instead of the KS device categories.
 * @param {Guid} guidCategory A GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
 * @param {Integer} Flags The bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an input media type to match. 
 * 
 * This parameter can be <b>NULL</b>. If <b>NULL</b>, all input types are matched.
 * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an output media type to match.
 * 
 * This parameter can be <b>NULL</b>. If <b>NULL</b>, all output types are matched.
 * @param {IMFAttributes} pAttributes A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface that enables access to the standard attribute store. To specify a specific hardware adapter for which MFTs are queried, set the  <a href="https://docs.microsoft.com/windows/win32/medfound/mft-enum-adapter-luid">MFT_ENUM_ADAPTER_LUID</a> attribute to the LUID of the adapter. If you do this, you must also specify the MFT_ENUM_FLAG_HARDWARE flag or E_INVALIDARG is returned.
 * @param {Pointer<Pointer<IMFActivate>>} pppMFTActivate Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointers. Each pointer represents an activation object for an MFT that matches the search criteria. The function allocates the memory for the array. The caller must release the pointers and call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory for the array.
 * @param {Pointer<Integer>} pnumMFTActivate Receives the number of elements in the <i>pppMFTActivate</i> array. If no MFTs match the search criteria, this parameter receives the value zero.
 * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> containing the MFT_ENUM_ADAPTER_LUID attribute was provided in the <i>pAttributes</i> parameter and the MFT_ENUM_FLAG_HARDWARE flag was not specified.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftenum2
 * @since windows10.0.10240
 */
export MFTEnum2(guidCategory, Flags, pInputType, pOutputType, pAttributes, pppMFTActivate, pnumMFTActivate) {
    pppMFTActivateMarshal := pppMFTActivate is VarRef ? "ptr*" : "ptr"
    pnumMFTActivateMarshal := pnumMFTActivate is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFTEnum2", Guid, guidCategory, "uint", Flags, MFT_REGISTER_TYPE_INFO.Ptr, pInputType, MFT_REGISTER_TYPE_INFO.Ptr, pOutputType, "ptr", pAttributes, pppMFTActivateMarshal, pppMFTActivate, pnumMFTActivateMarshal, pnumMFTActivate, "HRESULT")
    return result
}

/**
 * Gets information from the registry about a Media Foundation transform (MFT).
 * @param {Guid} clsidMFT The CLSID of the MFT.
 * @param {Pointer<PWSTR>} pszName Receives a pointer to a wide-character string containing the friendly name of the MFT. The caller must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
 * @param {Pointer<Pointer<MFT_REGISTER_TYPE_INFO>>} ppInputTypes Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array describes an input format that the MFT supports. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} pcInputTypes Receives the number of elements in the <i>ppInputTypes</i> array. If <i>ppInputTypes</i> is <b>NULL</b>, this parameter is ignored and can be <b>NULL</b>.
 * @param {Pointer<Pointer<MFT_REGISTER_TYPE_INFO>>} ppOutputTypes Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array describes an output format that the MFT supports. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} pcOutputTypes Receives the number of elements in the <i>ppOutputType</i> array. If <i>ppOutputTypes</i> is <b>NULL</b>, this parameter is ignored and can be <b>NULL</b>.
 * @param {Pointer<IMFAttributes>} ppAttributes Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. The caller must release the interface. The attribute store might contain attributes that are stored in the registry for the specified MFT. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a>.)  If no attributes are stored in the registry for this MFT, the attribute store is empty. 
 * 
 * This parameter can be <b>NULL</b>.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mftgetinfo
 * @since windows6.0.6000
 */
export MFTGetInfo(clsidMFT, pszName, ppInputTypes, pcInputTypes, ppOutputTypes, pcOutputTypes, ppAttributes) {
    pszNameMarshal := pszName is VarRef ? "ptr*" : "ptr"
    ppInputTypesMarshal := ppInputTypes is VarRef ? "ptr*" : "ptr"
    pcInputTypesMarshal := pcInputTypes is VarRef ? "uint*" : "ptr"
    ppOutputTypesMarshal := ppOutputTypes is VarRef ? "ptr*" : "ptr"
    pcOutputTypesMarshal := pcOutputTypes is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFTGetInfo", Guid, clsidMFT, pszNameMarshal, pszName, ppInputTypesMarshal, ppInputTypes, pcInputTypesMarshal, pcInputTypes, ppOutputTypesMarshal, ppOutputTypes, pcOutputTypesMarshal, pcOutputTypes, IMFAttributes.Ptr, ppAttributes, "HRESULT")
    return result
}

/**
 * Gets a pointer to the Microsoft Media Foundation plug-in manager.
 * @returns {IMFPluginControl} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetplugincontrol
 * @since windows6.1
 */
export MFGetPluginControl() {
    result := DllCall("MFPlat.dll\MFGetPluginControl", "ptr*", &ppPluginControl := 0, "HRESULT")
    return IMFPluginControl(ppPluginControl)
}

/**
 * Gets the merit value of a hardware codec.
 * @remarks
 * The function fails if the MFT does not represent a hardware device with a valid Output Protection Manager (OPM) certificate.
 * @param {IUnknown} pMFT A pointer to the <b>IUnknown</b> interface of the Media Foundation transform (MFT) that represents the codec.
 * @param {Integer} cbVerifier The size, in bytes, of the <i>verifier</i> array.
 * @param {Integer} verifier The address of a buffer that contains one of the following:
 * 
 * <ul>
 * <li>The class identifier (CLSID) of the MFT.</li>
 * <li>A null-terminated wide-character string that contains the symbol link for the underlying hardware device. Include the size of the terminating null in the value of <i>cbVerifier</i>.</li>
 * </ul>
 * @returns {Integer} Receives the merit value.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetmftmerit
 * @since windows6.1
 */
export MFGetMFTMerit(pMFT, cbVerifier, verifier) {
    result := DllCall("MFPlat.dll\MFGetMFTMerit", "ptr", pMFT, "uint", cbVerifier, "ptr", verifier, "uint*", &merit := 0, "HRESULT")
    return merit
}

/**
 * Registers a scheme handler in the caller's process.
 * @remarks
 * Scheme handlers are used in Microsoft Media Foundation during the source resolution process, which creates a media 
 *     source from a URL. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/medfound/scheme-handlers-and-byte-stream-handlers">Scheme Handlers and Byte-Stream Handlers</a>.
 * 
 * Within a process, local scheme handlers take precedence over scheme handlers that are registered in the 
 *     registry. Local scheme handlers are not visible to other processes.
 * 
 * Use this function if you want to register a custom scheme handler for your application, but do not want the 
 *     handler available to other applications.
 * @param {PWSTR} szScheme A string that contains the scheme. The scheme includes the trailing ':' character; for example, 
 *       "http:".
 * @param {IMFActivate} pActivate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation 
 *       object. The caller implements this interface. The 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> 
 *       method of the activation object must create a scheme handler object. The scheme handler exposes the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfschemehandler">IMFSchemeHandler</a> interface.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfregisterlocalschemehandler
 * @since windows8.0
 */
export MFRegisterLocalSchemeHandler(szScheme, pActivate) {
    szScheme := szScheme is String ? StrPtr(szScheme) : szScheme

    result := DllCall("MFPlat.dll\MFRegisterLocalSchemeHandler", "ptr", szScheme, "ptr", pActivate, "HRESULT")
    return result
}

/**
 * Registers a byte-stream handler in the caller's process.
 * @remarks
 * Byte-stream handlers are used in Microsoft Media Foundation during the source resolution process, which creates a media source from a URL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/scheme-handlers-and-byte-stream-handlers">Scheme Handlers and Byte-Stream Handlers</a>.
 * 
 * Within a process, local byte-stream handlers take precedence over byte-stream handlers that are registered in the registry. Local byte-stream handlers are not visible to other processes.
 * 
 * Use this function if you want to register a custom byte-stream handler for your application, but do not want the handler available to other applications.
 * 
 * Either <i>szFileExtension</i> or <i>szMimeType</i> can be <b>NULL</b>; at least one must be non-<b>NULL</b>.
 * @param {PWSTR} szFileExtension A string that contains the file name extension for this handler.
 * @param {PWSTR} szMimeType A string that contains the MIME type for this handler.
 * @param {IMFActivate} pActivate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation object. The caller implements this interface. The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> method of the activation object must create a byte-stream handler. The byte-stream handler exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfbytestreamhandler">IMFByteStreamHandler</a> interface.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfregisterlocalbytestreamhandler
 * @since windows8.0
 */
export MFRegisterLocalByteStreamHandler(szFileExtension, szMimeType, pActivate) {
    szFileExtension := szFileExtension is String ? StrPtr(szFileExtension) : szFileExtension
    szMimeType := szMimeType is String ? StrPtr(szMimeType) : szMimeType

    result := DllCall("MFPlat.dll\MFRegisterLocalByteStreamHandler", "ptr", szFileExtension, "ptr", szMimeType, "ptr", pActivate, "HRESULT")
    return result
}

/**
 * Creates a wrapper for a byte stream.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> methods on the wrapper call directly through to the original byte stream, except for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-close">IMFByteStream::Close</a> method. Calling <b>Close</b> on the wrapper closes the wrapper object, but leaves the original byte stream open.
 * @param {IMFByteStream} pStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the original byte stream.
 * @returns {IMFByteStream} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the wrapper. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemfbytestreamwrapper
 * @since windows8.0
 */
export MFCreateMFByteStreamWrapper(pStream) {
    result := DllCall("MFPlat.dll\MFCreateMFByteStreamWrapper", "ptr", pStream, "ptr*", &ppStreamWrapper := 0, "HRESULT")
    return IMFByteStream(ppStreamWrapper)
}

/**
 * Creates an activation object for a Windows Runtime class.
 * @remarks
 * To create the Windows Runtime object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iclassfactory-createinstance">IClassFactory::CreateInstance</a>.
 * @param {PWSTR} szActivatableClassId The class identifier that is associated with the activatable runtime class.
 * @param {IUnknown} pConfiguration A pointer to an optional <a href="https://docs.microsoft.com/uwp/api/windows.foundation.collections.ipropertyset">IPropertySet</a> object, which is used to configure the Windows Runtime class. This parameter can be <b>NULL</b>.
 * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested. The activation object created  by this function supports the following interfaces:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>
 * </li>
 * </ul>
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemediaextensionactivate
 * @since windows8.0
 */
export MFCreateMediaExtensionActivate(szActivatableClassId, pConfiguration, riid) {
    szActivatableClassId := szActivatableClassId is String ? StrPtr(szActivatableClassId) : szActivatableClassId

    result := DllCall("MFPlat.dll\MFCreateMediaExtensionActivate", "ptr", szActivatableClassId, "ptr", pConfiguration, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Creates an IMFAttributes describing the content of multiplexed substreams.
 * @param {IMFCollection} pAttributesToMux The collection containing the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> for each multiplexed substream.
 * @returns {IMFAttributes} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> containing the attributes for the multiplexed substreams.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemuxstreamattributes
 * @since windows10.0.15063
 */
export MFCreateMuxStreamAttributes(pAttributesToMux) {
    result := DllCall("MFPlat.dll\MFCreateMuxStreamAttributes", "ptr", pAttributesToMux, "ptr*", &ppMuxAttribs := 0, "HRESULT")
    return IMFAttributes(ppMuxAttribs)
}

/**
 * Creates an IMFMediaType describing the media types of multiplexed substreams.
 * @param {IMFCollection} pMediaTypesToMux The collection containing the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> for each multiplexed substream.
 * @returns {IMFMediaType} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> containing the media types for the multiplexed substreams.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemuxstreammediatype
 * @since windows10.0.15063
 */
export MFCreateMuxStreamMediaType(pMediaTypesToMux) {
    result := DllCall("MFPlat.dll\MFCreateMuxStreamMediaType", "ptr", pMediaTypesToMux, "ptr*", &ppMuxMediaType := 0, "HRESULT")
    return IMFMediaType(ppMuxMediaType)
}

/**
 * Creates an IMFSample containing the samples of multiplexed substreams.
 * @param {IMFCollection} pSamplesToMux The collection containing the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> for each multiplexed substream.
 * @returns {IMFSample} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> containing the samples for the multiplexed substreams.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemuxstreamsample
 * @since windows10.0.15063
 */
export MFCreateMuxStreamSample(pSamplesToMux) {
    result := DllCall("MFPlat.dll\MFCreateMuxStreamSample", "ptr", pSamplesToMux, "ptr*", &ppMuxSample := 0, "HRESULT")
    return IMFSample(ppMuxSample)
}

/**
 * Validates the size of a buffer for a video format block.
 * @remarks
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Guid} FormatType 
 * @param {Integer} pBlock Pointer to a buffer that contains the format block.
 * @param {Integer} cbSize Size of the <i>pBlock</i> buffer, in bytes.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The buffer that contains the format block is large enough.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer that contains the format block is too small, or the format block is not valid.
 *               
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_UNSUPPORTED_FORMAT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This function does not support the specified format type.
 *               
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfvalidatemediatypesize
 * @since windows6.0.6000
 */
export MFValidateMediaTypeSize(FormatType, pBlock, cbSize) {
    result := DllCall("MFPlat.dll\MFValidateMediaTypeSize", Guid, FormatType, "ptr", pBlock, "uint", cbSize, "HRESULT")
    return result
}

/**
 * Creates an empty media type.
 * @remarks
 * The media type is created without any attributes.
 * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemediatype
 * @since windows6.0.6000
 */
export MFCreateMediaType() {
    result := DllCall("MFPlat.dll\MFCreateMediaType", "ptr*", &ppMFType := 0, "HRESULT")
    return IMFMediaType(ppMFType)
}

/**
 * Creates an MFVIDEOFORMAT structure from a video media type.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type.
 * @param {Pointer<Pointer<MFVIDEOFORMAT>>} ppMFVF Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The caller must release the memory allocated for the structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
 * @param {Pointer<Integer>} pcbSize Receives the size of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemfvideoformatfrommfmediatype
 * @since windows6.0.6000
 */
export MFCreateMFVideoFormatFromMFMediaType(pMFType, ppMFVF, pcbSize) {
    ppMFVFMarshal := ppMFVF is VarRef ? "ptr*" : "ptr"
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFCreateMFVideoFormatFromMFMediaType", "ptr", pMFType, ppMFVFMarshal, ppMFVF, pcbSizeMarshal, pcbSize, "HRESULT")
    return result
}

/**
 * Converts a Media Foundation audio media type to a WAVEFORMATEX structure.
 * @remarks
 * If the <b>wFormatTag</b> member of the returned structure is <b>WAVE_FORMAT_EXTENSIBLE</b>, you can cast the pointer to a <b>WAVEFORMATEXTENSIBLE</b> structure.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
 * @param {Pointer<Pointer<WAVEFORMATEX>>} ppWF Receives a pointer to the <b>WAVEFORMATEX</b> structure. The caller must release the memory allocated for the structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
 * @param {Pointer<Integer>} pcbSize Receives the size of the <b>WAVEFORMATEX</b> structure.
 * @param {Integer} Flags Contains a flag from the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ne-mfapi-mfwaveformatexconvertflags">MFWaveFormatExConvertFlags</a> enumeration.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatewaveformatexfrommfmediatype
 * @since windows6.0.6000
 */
export MFCreateWaveFormatExFromMFMediaType(pMFType, ppWF, pcbSize, Flags) {
    ppWFMarshal := ppWF is VarRef ? "ptr*" : "ptr"
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFCreateWaveFormatExFromMFMediaType", "ptr", pMFType, ppWFMarshal, ppWF, pcbSizeMarshal, pcbSize, "uint", Flags, "HRESULT")
    return result
}

/**
 * Initializes a media type from a DirectShow VIDEOINFOHEADER structure.
 * @remarks
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Integer} pVIH Pointer to a <b>VIDEOINFOHEADER</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @param {Integer} cbBufSize Size of the <b>VIDEOINFOHEADER</b> structure, in bytes.
 * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>VIDEOINFOHEADER</b> structure.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromvideoinfoheader
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromVideoInfoHeader(pMFType, pVIH, cbBufSize, pSubtype) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromVideoInfoHeader", "ptr", pMFType, "ptr", pVIH, "uint", cbBufSize, Guid.Ptr, pSubtype, "HRESULT")
    return result
}

/**
 * Initializes a media type from a DirectShow VIDEOINFOHEADER2 structure.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Integer} pVIH2 Pointer to a <b>VIDEOINFOHEADER2</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @param {Integer} cbBufSize Size of the <b>VIDEOINFOHEADER2</b> structure, in bytes.
 * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>VIDEOINFOHEADER2</b> structure.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromvideoinfoheader2
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromVideoInfoHeader2(pMFType, pVIH2, cbBufSize, pSubtype) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromVideoInfoHeader2", "ptr", pMFType, "ptr", pVIH2, "uint", cbBufSize, Guid.Ptr, pSubtype, "HRESULT")
    return result
}

/**
 * Initializes a media type from a DirectShow MPEG1VIDEOINFO structure.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Integer} pMP1VI Pointer to a <b>MPEG1VIDEOINFO</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @param {Integer} cbBufSize Size of the <b>MPEG1VIDEOINFO</b> structure, in bytes.
 * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>MPEG1VIDEOINFO</b> structure.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefrommpeg1videoinfo
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromMPEG1VideoInfo(pMFType, pMP1VI, cbBufSize, pSubtype) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromMPEG1VideoInfo", "ptr", pMFType, "ptr", pMP1VI, "uint", cbBufSize, Guid.Ptr, pSubtype, "HRESULT")
    return result
}

/**
 * Initializes a media type from a DirectShow MPEG2VIDEOINFO structure.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Integer} pMP2VI Pointer to a <b>MPEG2VIDEOINFO</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @param {Integer} cbBufSize Size of the <b>MPEG2VIDEOINFO</b> structure, in bytes.
 * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>MPEG2VIDEOINFO</b> structure.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefrommpeg2videoinfo
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromMPEG2VideoInfo(pMFType, pMP2VI, cbBufSize, pSubtype) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromMPEG2VideoInfo", "ptr", pMFType, "ptr", pMP2VI, "uint", cbBufSize, Guid.Ptr, pSubtype, "HRESULT")
    return result
}

/**
 * Retrieves the image size for a video format.
 * @remarks
 * Before calling this function, you must set at least the following members of the <b>BITMAPINFOHEADER</b> structure:
 * 
 * <ul>
 * <li><b>biCompression</b></li>
 * <li><b>biBitCount</b></li>
 * <li><b>biWidth</b></li>
 * <li><b>biHeight</b></li>
 * </ul>
 * Also, if <b>biCompression</b> is <b>BI_BITFIELDS</b>, the <b>BITMAPINFOHEADER</b> structure must be followed by an array of color masks.
 *       
 * 
 * This function fails if the <b>BITMAPINFOHEADER</b> structure describes a format that is not a video format. For example, it fails if <b>biCompresson</b> is <b>BI_JPEG</b> or <b>BI_PNG</b> .
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Integer} pBMIH Pointer to a <b>BITMAPINFOHEADER</b> structure that describes the format.
 * @param {Integer} cbBufSize Size of the <i>pBMIH</i> buffer, in bytes. The size includes any color masks or palette entries that follow the <b>BITMAPINFOHEADER</b> structure.
 * @param {Pointer<Integer>} pcbImageSize Receives the image size, in bytes.
 * @param {Pointer<BOOL>} pbKnown Receives the value <b>TRUE</b> if the function recognizes the video format. Otherwise, receives the value <b>FALSE</b>. This parameter can be <b>NULL</b>.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 *               
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
 * The <b>BITMAPINFOHEADER</b> structure is not valid, or the value of <i>cbBufSize</i> is too small.
 *               
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcalculatebitmapimagesize
 * @since windows6.0.6000
 */
export MFCalculateBitmapImageSize(pBMIH, cbBufSize, pcbImageSize, pbKnown) {
    pcbImageSizeMarshal := pcbImageSize is VarRef ? "uint*" : "ptr"
    pbKnownMarshal := pbKnown is VarRef ? "int*" : "ptr"

    result := DllCall("MFPlat.dll\MFCalculateBitmapImageSize", "ptr", pBMIH, "uint", cbBufSize, pcbImageSizeMarshal, pcbImageSize, pbKnownMarshal, pbKnown, "HRESULT")
    return result
}

/**
 * Retrieves the image size, in bytes, for an uncompressed video format. (MFCalculateImageSize)
 * @param {Pointer<Guid>} guidSubtype Media subtype for the video format. For a list of subtypes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Media Type GUIDs</a>.
 * @param {Integer} unWidth Width of the image, in pixels.
 * @param {Integer} unHeight Height of the image, in pixels.
 * @returns {Integer} Receives the size of each frame, in bytes. If the format is compressed or is not recognized, the value is zero.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcalculateimagesize
 * @since windows6.0.6000
 */
export MFCalculateImageSize(guidSubtype, unWidth, unHeight) {
    result := DllCall("MFPlat.dll\MFCalculateImageSize", Guid.Ptr, guidSubtype, "uint", unWidth, "uint", unHeight, "uint*", &pcbImageSize := 0, "HRESULT")
    return pcbImageSize
}

/**
 * Converts a video frame rate into a frame duration.
 * @remarks
 * This function is useful for calculating time stamps on a sample, given the frame rate.
 * 
 * Also, average time per frame is used in the older <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> format structures. This function provides a standard conversion so that all components in the pipeline can use consistent values, if they need to translate between the older format structures and the media type attributes used in Media Foundation.
 * 
 * For certain common frame rates, the function gets the frame duration from a look-up table:
 * 
 * <table>
 * <tr>
 * <th>Frames per second (floating point)</th>
 * <th>Frames per second (fractional)</th>
 * <th>Average time per frame</th>
 * </tr>
 * <tr>
 * <td>59.94</td>
 * <td>60000/1001</td>
 * <td>166833</td>
 * </tr>
 * <tr>
 * <td>29.97</td>
 * <td>30000/1001</td>
 * <td>333667</td>
 * </tr>
 * <tr>
 * <td>23.976</td>
 * <td>24000/1001</td>
 * <td>417188</td>
 * </tr>
 * <tr>
 * <td>60</td>
 * <td>60/1</td>
 * <td>166667</td>
 * </tr>
 * <tr>
 * <td>30</td>
 * <td>30/1</td>
 * <td>333333</td>
 * </tr>
 * <tr>
 * <td>50</td>
 * <td>50/1</td>
 * <td>200000</td>
 * </tr>
 * <tr>
 * <td>25</td>
 * <td>25/1</td>
 * <td>400000</td>
 * </tr>
 * <tr>
 * <td>24</td>
 * <td>24/1</td>
 * <td>416667</td>
 * </tr>
 * </table>
 *  
 * 
 * Most video content uses one of the frame rates listed here.
 *       For other frame rates, the function calculates the duration.
 * @param {Integer} unNumerator The numerator of the frame rate.
 * @param {Integer} unDenominator The denominator of the frame rate.
 * @returns {Integer} Receives the average duration of a video frame, in 100-nanosecond units.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfframeratetoaveragetimeperframe
 * @since windows6.0.6000
 */
export MFFrameRateToAverageTimePerFrame(unNumerator, unDenominator) {
    result := DllCall("MFPlat.dll\MFFrameRateToAverageTimePerFrame", "uint", unNumerator, "uint", unDenominator, "uint*", &punAverageTimePerFrame := 0, "HRESULT")
    return punAverageTimePerFrame
}

/**
 * Calculates the frame rate, in frames per second, from the average duration of a video frame.
 * @remarks
 * Average time per frame is used in the older <b>VIDEOINFOHEADER</b> and <b>VIDEOINFOHEADER2</b> format structures. This function provides a standard conversion so that all components in the pipeline can use consistent values, if they need to translate between the older format structures and the media type attributes used in Media Foundation.
 * 
 * This function uses a look-up table for certain common durations. The table is listed in the Remarks section for the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfframeratetoaveragetimeperframe">MFFrameRateToAverageTimePerFrame</a> function.
 * @param {Integer} unAverageTimePerFrame The average duration of a video frame, in 100-nanosecond units.
 * @param {Pointer<Integer>} punNumerator Receives the numerator of the frame rate.
 * @param {Pointer<Integer>} punDenominator Receives the denominator of the frame rate.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfaveragetimeperframetoframerate
 * @since windows6.0.6000
 */
export MFAverageTimePerFrameToFrameRate(unAverageTimePerFrame, punNumerator, punDenominator) {
    punNumeratorMarshal := punNumerator is VarRef ? "uint*" : "ptr"
    punDenominatorMarshal := punDenominator is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFAverageTimePerFrameToFrameRate", "uint", unAverageTimePerFrame, punNumeratorMarshal, punNumerator, punDenominatorMarshal, punDenominator, "HRESULT")
    return result
}

/**
 * Initializes a media type from a WAVEFORMATEX structure.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Integer} pWaveFormat Pointer to a <b>WAVEFORMATEX</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @param {Integer} cbBufSize Size of the <b>WAVEFORMATEX</b> structure, in bytes.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromwaveformatex
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromWaveFormatEx(pMFType, pWaveFormat, cbBufSize) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromWaveFormatEx", "ptr", pMFType, "ptr", pWaveFormat, "uint", cbBufSize, "HRESULT")
    return result
}

/**
 * Initializes a media type from an MFVIDEOFORMAT structure.
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Integer} pMFVF Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @param {Integer} cbBufSize Size of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure, in bytes.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefrommfvideoformat
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromMFVideoFormat(pMFType, pMFVF, cbBufSize) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromMFVideoFormat", "ptr", pMFType, "ptr", pMFVF, "uint", cbBufSize, "HRESULT")
    return result
}

/**
 * Initializes a media type from a DirectShow AM_MEDIA_TYPE structure.
 * @remarks
 * This function can also be used with the following format structures that are equivalent to <b>AM_MEDIA_TYPE</b>:
 * 
 * <ul>
 * <li>
 * <b>DMO_MEDIA_TYPE</b> (DirectX Media Objects)
 * 
 * </li>
 * <li>
 * <b>WM_MEDIA_TYPE</b> (Windows Media Format SDK)
 * 
 * </li>
 * </ul>
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 * @param {Pointer<AM_MEDIA_TYPE>} pAMType Pointer to an <b>AM_MEDIA_TYPE</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromammediatype
 * @since windows6.0.6000
 */
export MFInitMediaTypeFromAMMediaType(pMFType, pAMType) {
    result := DllCall("MFPlat.dll\MFInitMediaTypeFromAMMediaType", "ptr", pMFType, AM_MEDIA_TYPE.Ptr, pAMType, "HRESULT")
    return result
}

/**
 * Initializes a DirectShow AM_MEDIA_TYPE structure from a Media Foundation media type.
 * @remarks
 * This function can also be used with the following format structures that are equivalent to <b>AM_MEDIA_TYPE</b>:
 * 
 * <ul>
 * <li><b>DMO_MEDIA_TYPE</b> (DirectX Media Objects)</li>
 * <li><b>WM_MEDIA_TYPE</b> (Windows Media Format SDK)</li>
 * </ul>
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to convert.
 * @param {Guid} guidFormatBlockType Format type GUID. This value corresponds to the <b>formattype</b> member of the <b>AM_MEDIA_TYPE</b> structure and specifies the type of format block to allocate. If the value is GUID_NULL, the function attempts to deduce the correct format block, based on the major type and subtype.
 * @param {Pointer<AM_MEDIA_TYPE>} pAMType Pointer to an <b>AM_MEDIA_TYPE</b> structure. The function allocates memory for the format block. The caller must release the format block by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> on the <b>pbFormat</b> member.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The media type is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitammediatypefrommfmediatype
 * @since windows6.0.6000
 */
export MFInitAMMediaTypeFromMFMediaType(pMFType, guidFormatBlockType, pAMType) {
    result := DllCall("MFPlat.dll\MFInitAMMediaTypeFromMFMediaType", "ptr", pMFType, Guid, guidFormatBlockType, AM_MEDIA_TYPE.Ptr, pAMType, "HRESULT")
    return result
}

/**
 * Creates a DirectShow AM_MEDIA_TYPE structure from a Media Foundation media type.
 * @remarks
 * This function can also be used with the following format structures that are equivalent to <b>AM_MEDIA_TYPE</b>:
 * 
 * <ul>
 * <li>
 * <b>DMO_MEDIA_TYPE</b> (DirectX Media Objects)
 * 
 * </li>
 * <li>
 * <b>WM_MEDIA_TYPE</b> (Windows Media Format SDK)
 * 
 * </li>
 * </ul>
 * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to convert.
 * @param {Guid} guidFormatBlockType Format type GUID. This value corresponds to the <b>formattype</b> member of the <b>AM_MEDIA_TYPE</b> structure and specifies the type of format block to allocate. If the value is GUID_NULL, the function attempts to deduce the correct format block, based on the major type and subtype.
 * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppAMType Receives a pointer to an <b>AM_MEDIA_TYPE</b> structure. The caller must release the memory allocated for the structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The function also allocates memory for the format block, which the caller must release by calling <b>CoTaskMemFree</b> on the <b>pbFormat</b> member.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreateammediatypefrommfmediatype
 * @since windows6.0.6000
 */
export MFCreateAMMediaTypeFromMFMediaType(pMFType, guidFormatBlockType, ppAMType) {
    ppAMTypeMarshal := ppAMType is VarRef ? "ptr*" : "ptr"

    result := DllCall("MFPlat.dll\MFCreateAMMediaTypeFromMFMediaType", "ptr", pMFType, Guid, guidFormatBlockType, ppAMTypeMarshal, ppAMType, "HRESULT")
    return result
}

/**
 * Compares a full media type to a partial media type.
 * @remarks
 * A pipeline component can return a partial media type to describe a range of possible formats the component might accept. A partial media type has at least a major type GUID, but might be missing some of the other attributes that are needed to fully describe the type. The missing attributes represent "don't care" values for the partial type. For example, a partial video type might be missing the attributes for the width and height of the video.
 * 
 * This function returns <b>TRUE</b> if the following conditions are both true:
 * 
 * <ul>
 * <li>The partial media type contains a major type GUID.
 *           </li>
 * <li>All of the attributes in the partial type exist in the full type and are set to the same value.
 *           </li>
 * </ul>
 * Otherwise, the function returns <b>FALSE</b>.
 * @param {IMFMediaType} pMFTypeFull Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the full media type.
 * @param {IMFMediaType} pMFTypePartial Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the partial media type.
 * @returns {BOOL} If the full media type is compatible with the partial media type, the function returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcomparefulltopartialmediatype
 * @since windows6.0.6000
 */
export MFCompareFullToPartialMediaType(pMFTypeFull, pMFTypePartial) {
    result := DllCall("MFPlat.dll\MFCompareFullToPartialMediaType", "ptr", pMFTypeFull, "ptr", pMFTypePartial, BOOL)
    return result
}

/**
 * Creates a media type that wraps another media type.
 * @remarks
 * The original media type (<i>pOrig</i>) is stored in the new media type under the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-wrapped-type-attribute">MF_MT_WRAPPED_TYPE</a> attribute. To extract the original media type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfunwrapmediatype">MFUnwrapMediaType</a>.
 *       
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {IMFMediaType} pOrig A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to wrap in a new media type.
 * @param {Pointer<Guid>} MajorType A 
 *             GUID that specifies the major type for the new media type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
 * @param {Pointer<Guid>} SubType A 
 *             GUID that specifies the subtype for the new media type. For possible values, see:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/audio-subtypes">Audio Subtypes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-subtypes">Video Subtypes</a>
 * </li>
 * </ul>
 * Applications can define custom subtype GUIDs.
 * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the new media type that wraps the original media type. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfwrapmediatype
 * @since windows6.0.6000
 */
export MFWrapMediaType(pOrig, MajorType, SubType) {
    result := DllCall("MFPlat.dll\MFWrapMediaType", "ptr", pOrig, Guid.Ptr, MajorType, Guid.Ptr, SubType, "ptr*", &ppWrap := 0, "HRESULT")
    return IMFMediaType(ppWrap)
}

/**
 * Retrieves a media type that was wrapped in another media type by the MFWrapMediaType function.
 * @remarks
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {IMFMediaType} pWrap Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type that was retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfwrapmediatype">MFWrapMediaType</a>.
 * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the original media type. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfunwrapmediatype
 * @since windows6.0.6000
 */
export MFUnwrapMediaType(pWrap) {
    result := DllCall("MFPlat.dll\MFUnwrapMediaType", "ptr", pWrap, "ptr*", &ppOrig := 0, "HRESULT")
    return IMFMediaType(ppOrig)
}

/**
 * Calculates the minimum surface stride for a video format.
 * @remarks
 * This function calculates the minimum stride needed to hold the image in memory. Use this function if you are allocating buffers in system memory. Surfaces allocated in video memory might require a larger stride, depending on the graphics card.
 *       
 * 
 * If you are working with a DirectX surface buffer, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">IMF2DBuffer::Lock2D</a> method to find the surface stride.
 *       
 * 
 * For planar YUV formats, this function returns the stride for the Y plane. Depending on the format, the chroma planes might have a different stride.
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Integer} format FOURCC code or <b>D3DFORMAT</b> value that specifies the video format. If you have a video subtype GUID, you can use the first <b>DWORD</b> of the subtype.
 * @param {Integer} dwWidth Width of the image, in pixels.
 * @returns {Integer} Receives the minimum surface stride, in pixels.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetstrideforbitmapinfoheader
 * @since windows6.0.6000
 */
export MFGetStrideForBitmapInfoHeader(format, dwWidth) {
    result := DllCall("MFPlat.dll\MFGetStrideForBitmapInfoHeader", "uint", format, "uint", dwWidth, "int*", &pStride := 0, "HRESULT")
    return pStride
}

/**
 * Creates a video media type from an MFVIDEOFORMAT structure.
 * @remarks
 * Instead of using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure to initialize a video media type, you can call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a> and set the media type attributes directly.
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure that describes the video format.
 * @returns {IMFVideoMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatype
 * @since windows6.0.6000
 */
export MFCreateVideoMediaType(pVideoFormat) {
    result := DllCall("MFPlat.dll\MFCreateVideoMediaType", MFVIDEOFORMAT.Ptr, pVideoFormat, "ptr*", &ppIVideoMediaType := 0, "HRESULT")
    return IMFVideoMediaType(ppIVideoMediaType)
}

/**
 * Creates a partial video media type with a specified subtype.
 * @remarks
 * This function creates a media type and sets the major type equal to <b>MFMediaType_Video</b> and the subtype equal to the value specified in <i>pAMSubtype</i>.
 *       
 * 
 * You can get the same result with the following steps:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>. This function returns a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
 *           </li>
 * <li>Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-major-type-attribute">MF_MT_MAJOR_TYPE</a> attribute to <b>MFMediaType_Video</b>.
 *           </li>
 * <li>Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a> attribute to the subtype.
 *           </li>
 * </ol>
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<Guid>} pAMSubtype Pointer to a GUID that specifies the subtype. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>.
 * @returns {IMFVideoMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefromsubtype
 * @since windows6.0.6000
 */
export MFCreateVideoMediaTypeFromSubtype(pAMSubtype) {
    result := DllCall("MFPlat.dll\MFCreateVideoMediaTypeFromSubtype", Guid.Ptr, pAMSubtype, "ptr*", &ppIVideoMediaType := 0, "HRESULT")
    return IMFVideoMediaType(ppIVideoMediaType)
}

/**
 * Queries whether a FOURCC code or D3DFORMAT value is a YUV format.
 * @remarks
 * This function checks whether <i>Format</i> specifies a YUV format. Not every YUV format is recognized by this function. However, if a YUV format is not recognized by this function, it is probably not supported for video rendering or DirectX video acceleration (DXVA).
 * @param {Integer} Format FOURCC code or <b>D3DFORMAT</b> value.
 * @returns {BOOL} The function returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value specifies a YUV format.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value does not specify a recognized YUV format.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfisformatyuv
 * @since windows6.0.6000
 */
export MFIsFormatYUV(Format) {
    result := DllCall("EVR.dll\MFIsFormatYUV", "uint", Format, BOOL)
    return result
}

/**
 * This function is not implemented. (MFCreateVideoMediaTypeFromBitMapInfoHeader)
 * @remarks
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<BITMAPINFOHEADER>} pbmihBitMapInfoHeader Reserved.
 * @param {Integer} dwPixelAspectRatioX Reserved.
 * @param {Integer} dwPixelAspectRatioY Reserved.
 * @param {MFVideoInterlaceMode} InterlaceMode Reserved.
 * @param {Integer} VideoFlags Reserved.
 * @param {Integer} qwFramesPerSecondNumerator Reserved.
 * @param {Integer} qwFramesPerSecondDenominator Reserved.
 * @param {Integer} dwMaxBitRate Reserved.
 * @returns {IMFVideoMediaType} Reserved.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefrombitmapinfoheader
 * @since windows6.0.6000
 */
export MFCreateVideoMediaTypeFromBitMapInfoHeader(pbmihBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, qwFramesPerSecondNumerator, qwFramesPerSecondDenominator, dwMaxBitRate) {
    result := DllCall("MFPlat.dll\MFCreateVideoMediaTypeFromBitMapInfoHeader", BITMAPINFOHEADER.Ptr, pbmihBitMapInfoHeader, "uint", dwPixelAspectRatioX, "uint", dwPixelAspectRatioY, MFVideoInterlaceMode, InterlaceMode, "uint", VideoFlags, "uint", qwFramesPerSecondNumerator, "uint", qwFramesPerSecondDenominator, "uint", dwMaxBitRate, "ptr*", &ppIVideoMediaType := 0, "HRESULT")
    return IMFVideoMediaType(ppIVideoMediaType)
}

/**
 * Retrieves the image size, in bytes, for an uncompressed video format. (MFGetPlaneSize)
 * @remarks
 * This function is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcalculateimagesize">MFCalculateImageSize</a> function.
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll.</div>
 * <div> </div>
 * @param {Integer} format FOURCC code or <b>D3DFORMAT</b> value that specifies the video format.
 * @param {Integer} dwWidth Width of the image, in pixels.
 * @param {Integer} dwHeight Height of the image, in pixels.
 * @returns {Integer} Receives the size of one frame, in bytes. If the format is compressed or is not recognized, this value is zero.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetplanesize
 * @since windows6.0.6000
 */
export MFGetPlaneSize(format, dwWidth, dwHeight) {
    result := DllCall("EVR.dll\MFGetPlaneSize", "uint", format, "uint", dwWidth, "uint", dwHeight, "uint*", &pdwPlaneSize := 0, "HRESULT")
    return pdwPlaneSize
}

/**
 * Creates a video media type from a BITMAPINFOHEADER structure.
 * @param {Integer} pbmihBitMapInfoHeader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure to convert.
 * @param {Integer} cbBitMapInfoHeader The size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure in bytes, including the size of any palette entries or color masks that follow the structure.
 * @param {Integer} dwPixelAspectRatioX The X dimension of the pixel aspect ratio.
 * @param {Integer} dwPixelAspectRatioY The Y dimension of the pixel aspect ratio.
 * @param {MFVideoInterlaceMode} InterlaceMode A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideointerlacemode">MFVideoInterlaceMode</a> enumeration, specifying how the video is interlaced.
 * @param {Integer} VideoFlags A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoflags">MFVideoFlags</a> enumeration.
 * @param {Integer} dwFramesPerSecondNumerator The numerator of the 
 *           frame rate in frames per second.
 * @param {Integer} dwFramesPerSecondDenominator The denominator of the frame rate in frames per second
 * @param {Integer} dwMaxBitRate The approximate data rate of the video stream, in bits per second. If the rate is unknown, set this parameter to zero.
 * @returns {IMFVideoMediaType} Receives a pointer to the 
 *           <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefrombitmapinfoheaderex
 * @since windows6.1
 */
export MFCreateVideoMediaTypeFromBitMapInfoHeaderEx(pbmihBitMapInfoHeader, cbBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, dwFramesPerSecondNumerator, dwFramesPerSecondDenominator, dwMaxBitRate) {
    result := DllCall("MFPlat.dll\MFCreateVideoMediaTypeFromBitMapInfoHeaderEx", "ptr", pbmihBitMapInfoHeader, "uint", cbBitMapInfoHeader, "uint", dwPixelAspectRatioX, "uint", dwPixelAspectRatioY, MFVideoInterlaceMode, InterlaceMode, "uint", VideoFlags, "uint", dwFramesPerSecondNumerator, "uint", dwFramesPerSecondDenominator, "uint", dwMaxBitRate, "ptr*", &ppIVideoMediaType := 0, "HRESULT")
    return IMFVideoMediaType(ppIVideoMediaType)
}

/**
 * Creates a Media Foundation media type from another format representation.
 * @remarks
 * If the original format is a DirectShow audio media type, and the format type is not recognized, the function sets the following attributes on the converted media type.
 * 
 * <table>
 * <tr>
 * <th>Attribute</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-am-format-type-attribute">MF_MT_AM_FORMAT_TYPE</a>
 * </td>
 * <td>Contains the format type GUID.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-user-data-attribute">MF_MT_USER_DATA</a>
 * </td>
 * <td>Contains the format block.</td>
 * </tr>
 * </table>
 * @param {Guid} guidRepresentation GUID that specifies which format representation to convert. The following value is defined.
 * 
 * <table>
 * <tr>
 * <th>GUID</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>AM_MEDIA_TYPE_REPRESENTATION</td>
 * <td>Convert a DirectShow <b>AM_MEDIA_TYPE</b> structure.</td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pvRepresentation Pointer to a buffer that contains the format representation to convert. The layout of the buffer depends on the value of <i>guidRepresentation</i>.
 * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemediatypefromrepresentation
 * @since windows6.0.6000
 */
export MFCreateMediaTypeFromRepresentation(guidRepresentation, pvRepresentation) {
    pvRepresentationMarshal := pvRepresentation is VarRef ? "ptr" : "ptr"

    result := DllCall("MFPlat.dll\MFCreateMediaTypeFromRepresentation", Guid, guidRepresentation, pvRepresentationMarshal, pvRepresentation, "ptr*", &ppIMediaType := 0, "HRESULT")
    return IMFMediaType(ppIMediaType)
}

/**
 * Creates an audio media type from a WAVEFORMATEX structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfaudiomediatype">IMFAudioMediaType</a> interface is deprecated, so applications should avoid using this function. To create a media type from a <b>WAVEFORMATEX</b> structure, do the following:
 *       
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>. This function returns a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The returned media type object is initially empty.
 *           </li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinitmediatypefromwaveformatex">MFInitMediaTypeFromWaveFormatEx</a> to populate the media type from the <b>WAVEFORMATEX</b> structure.
 *           </li>
 * </ol>
 * Alternatively, you can call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a> and then set the media type attributes directly.
 *       
 * 
 * This function is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @param {Pointer<WAVEFORMATEX>} pAudioFormat Pointer to a <b>WAVEFORMATEX</b> structure that describes the audio format.
 * @returns {IMFAudioMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfaudiomediatype">IMFAudioMediaType</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreateaudiomediatype
 * @since windows6.0.6000
 */
export MFCreateAudioMediaType(pAudioFormat) {
    result := DllCall("MFPlat.dll\MFCreateAudioMediaType", WAVEFORMATEX.Ptr, pAudioFormat, "ptr*", &ppIAudioMediaType := 0, "HRESULT")
    return IMFAudioMediaType(ppIAudioMediaType)
}

/**
 * Returns the FOURCC or D3DFORMAT value for an uncompressed video format.
 * @remarks
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
 * @returns {Integer} Returns a FOURCC or <b>D3DFORMAT</b> value that identifies the video format. If the video format is compressed or not recognized, the return value is D3DFMT_UNKNOWN.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetuncompressedvideoformat
 * @since windows6.0.6000
 */
export MFGetUncompressedVideoFormat(pVideoFormat) {
    result := DllCall("MFPlat.dll\MFGetUncompressedVideoFormat", MFVIDEOFORMAT.Ptr, pVideoFormat, UInt32)
    return result
}

/**
 * Initializes an MFVIDEOFORMAT structure for a standard video format such as DVD, analog television, or ATSC digital television.
 * @remarks
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The function fills in the structure members based on the video format specified in the type parameter.
 * @param {MFStandardVideoFormat} type The video format, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfstandardvideoformat">MFStandardVideoFormat</a> enumeration.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitvideoformat
 * @since windows6.0.6000
 */
export MFInitVideoFormat(pVideoFormat, type) {
    result := DllCall("MFPlat.dll\MFInitVideoFormat", MFVIDEOFORMAT.Ptr, pVideoFormat, MFStandardVideoFormat, type, "HRESULT")
    return result
}

/**
 * Initializes an MFVIDEOFORMAT structure for an uncompressed RGB video format.
 * @remarks
 * This function fills in some reasonable default values for the specified RGB format.
 *       
 * 
 * Developers are encouraged to use media type attributes instead of using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. See <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-attributes">Media Type Attributes</a>.
 *       
 * 
 * In general, you should avoid calling this function. If you know all of the format details, you can fill in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure without this function. If you do not know all of the format details, attributes are preferable to using the <b>MFVIDEOFORMAT</b> structure.
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The functions fills in the structure members with the format information.
 * @param {Integer} dwWidth The width of the video, in pixels.
 * @param {Integer} dwHeight The height of the video, in pixels.
 * @param {Integer} D3Dfmt A <b>D3DFORMAT</b> value that specifies the RGB format.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfinitvideoformat_rgb
 * @since windows6.0.6000
 */
export MFInitVideoFormat_RGB(pVideoFormat, dwWidth, dwHeight, D3Dfmt) {
    result := DllCall("MFPlat.dll\MFInitVideoFormat_RGB", MFVIDEOFORMAT.Ptr, pVideoFormat, "uint", dwWidth, "uint", dwHeight, "uint", D3Dfmt, "HRESULT")
    return result
}

/**
 * Converts the extended color information from an MFVIDEOFORMAT to the equivalent DirectX Video Acceleration (DXVA) color information.
 * @remarks
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<MFVIDEOFORMAT>} pFromFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure that describes the video format.
 * @returns {Integer} Receives the DXVA extended color information. The bitfields in the <b>DWORD</b> are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfconvertcolorinfotodxva
 * @since windows6.0.6000
 */
export MFConvertColorInfoToDXVA(pFromFormat) {
    result := DllCall("MFPlat.dll\MFConvertColorInfoToDXVA", "uint*", &pdwToDXVA := 0, MFVIDEOFORMAT.Ptr, pFromFormat, "HRESULT")
    return pdwToDXVA
}

/**
 * Sets the extended color information in a MFVIDEOFORMAT structure.
 * @remarks
 * This function sets the following fields in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
 * 
 * <ul>
 * <li><b>videoInfo.MFNominalRange</b></li>
 * <li><b>videoInfo.MFVideoLighting</b></li>
 * <li><b>videoInfo.MFVideoPrimaries</b></li>
 * <li><b>videoInfo.MFVideoTransferFunction</b></li>
 * <li><b>videoInfo.MFVideoTransferMatrix</b></li>
 * <li><b>videoInfo.SourceChromaSubsampling</b></li>
 * </ul>
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<MFVIDEOFORMAT>} pToFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The function fills in the structure members that correspond to the DXVA color information in the <i>dwFromDXVA</i> parameter. The function does not modify the other structure members.
 * @param {Integer} dwFromDXVA <b>DWORD</b> that contains extended color information. The bitfields in the <b>DWORD</b> are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfconvertcolorinfofromdxva
 * @since windows6.0.6000
 */
export MFConvertColorInfoFromDXVA(pToFormat, dwFromDXVA) {
    result := DllCall("MFPlat.dll\MFConvertColorInfoFromDXVA", MFVIDEOFORMAT.Ptr, pToFormat, "uint", dwFromDXVA, "HRESULT")
    return result
}

/**
 * Copies an image or image plane from one buffer to another.
 * @remarks
 * This function copies a single plane of the image. For planar YUV formats, you must call the function once for each plane. In this case, <i>pDest</i> and <i>pSrc</i> must point to the start of each plane.
 *       
 * 
 * This function is optimized if the MMX, SSE, or SSE2 instruction sets are available on the processor. The function performs a non-temporal store (the data is written to memory directly without polluting the cache).
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Integer} lDestStride Stride of the destination buffer, in bytes.
 * @param {Pointer<Integer>} pSrc Pointer to the start of the first row of pixels in the source image.
 * @param {Integer} lSrcStride Stride of the source image, in bytes.
 * @param {Integer} dwWidthInBytes Width of the image, in bytes.
 * @param {Integer} dwLines Number of rows of pixels to copy.
 * @returns {Integer} Pointer to the start of the first row of pixels in the destination buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcopyimage
 * @since windows6.0.6000
 */
export MFCopyImage(lDestStride, pSrc, lSrcStride, dwWidthInBytes, dwLines) {
    pSrcMarshal := pSrc is VarRef ? "char*" : "ptr"

    result := DllCall("MFPlat.dll\MFCopyImage", "char*", &pDest := 0, "int", lDestStride, pSrcMarshal, pSrc, "int", lSrcStride, "uint", dwWidthInBytes, "uint", dwLines, "HRESULT")
    return pDest
}

/**
 * Converts an array of 16-bit floating-point numbers into an array of 32-bit floating-point numbers.
 * @remarks
 * The function converts <i>dwCount</i> values in the <i>pSrc</i> array and writes them into the <i>pDest</i> array.
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<Integer>} pSrc Pointer to an array of 16-bit floating-point values, typed as <b>WORD</b> values. The array must contain at least <i>dwCount</i> elements.
 * @param {Integer} dwCount Number of elements in the <i>pSrc</i> array to convert.
 * @returns {Float} Pointer to an array of <b>float</b> values. The array must contain at least <i>dwCount</i> elements.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfconvertfromfp16array
 * @since windows6.0.6000
 */
export MFConvertFromFP16Array(pSrc, dwCount) {
    pSrcMarshal := pSrc is VarRef ? "ushort*" : "ptr"

    result := DllCall("MFPlat.dll\MFConvertFromFP16Array", "float*", &pDest := 0, pSrcMarshal, pSrc, "uint", dwCount, "HRESULT")
    return pDest
}

/**
 * Converts an array of 32-bit floating-point numbers into an array of 16-bit floating-point numbers.
 * @remarks
 * The function converts the values in the <i>pSrc</i> array and writes them into the <i>pDest</i> array.
 *       
 * 
 * <div class="alert"><b>Note</b>  Prior to Windows 7, this function was exported from evr.dll. Starting in Windows 7, this function is exported from mfplat.dll, and evr.dll exports a stub function that calls into mfplat.dll. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-headers-and-libraries">Library Changes in Windows 7</a>.</div>
 * <div> </div>
 * @param {Pointer<Float>} pSrc Pointer to an array of <b>float</b> values. The array must contain at least <i>dwCount</i> elements.
 * @param {Integer} dwCount Number of elements in the <i>pSrc</i> array to convert.
 * @returns {Integer} Pointer to an array of 16-bit floating-point values, typed as <b>WORD</b> values. The array must contain at least <i>dwCount</i> elements.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfconverttofp16array
 * @since windows6.0.6000
 */
export MFConvertToFP16Array(pSrc, dwCount) {
    pSrcMarshal := pSrc is VarRef ? "float*" : "ptr"

    result := DllCall("MFPlat.dll\MFConvertToFP16Array", "ushort*", &pDest := 0, pSrcMarshal, pSrc, "uint", dwCount, "HRESULT")
    return pDest
}

/**
 * Creates a system-memory buffer object to hold 2D image data.
 * @remarks
 * The returned buffer object also exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer2">IMF2DBuffer2</a> interface.
 * @param {Integer} dwWidth Width of the image, in pixels.
 * @param {Integer} dwHeight Height of the image, in pixels.
 * @param {Integer} dwFourCC A <b>FOURCC</b> code or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> value that specifies the video format. If you have a video subtype GUID, you can use the first <b>DWORD</b> of the subtype.
 * @param {BOOL} fBottomUp If <b>TRUE,</b> the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto">IMF2DBuffer::ContiguousCopyTo</a> method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is <b>FALSE</b>, the <b>ContiguousCopyTo</b> method copies the buffer into a top-down format, which is compatible with DirectX. 
 * 
 * 
 * 
 * For more information about top-down versus bottom-up images, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreate2dmediabuffer
 * @since windows8.0
 */
export MFCreate2DMediaBuffer(dwWidth, dwHeight, dwFourCC, fBottomUp) {
    result := DllCall("MFPlat.dll\MFCreate2DMediaBuffer", "uint", dwWidth, "uint", dwHeight, "uint", dwFourCC, BOOL, fBottomUp, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Allocates a system-memory buffer that is optimal for a specified media type.
 * @remarks
 * For video formats, if the format is recognized, the function creates a 2-D buffer that implements the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer2">IMF2DBuffer2</a> interface. Otherwise it creates a linear buffer. To get the  <b>IMF2DBuffer2</b> interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the pointer returned in <i>ppBuffer</i>. If the <b>QueryInterface</b> method fails, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface to access the buffer memory.
 * 
 * For audio formats, the function allocates a buffer that is large enough to contain <i>llDuration</i> audio samples, or <i>dwMinLength</i>, whichever is larger.
 * 
 * This function always allocates system memory. For Direct3D surfaces, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer">MFCreateDXGISurfaceBuffer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxsurfacebuffer">MFCreateDXSurfaceBuffer</a> function.
 * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
 * @param {Integer} llDuration The sample duration. This value is required for audio formats.
 * @param {Integer} dwMinLength The minimum size of the buffer, in bytes. The actual buffer size might be larger. Specify zero to allocate the default buffer size for the media type.
 * @param {Integer} dwMinAlignment The minimum memory alignment for the buffer. Specify zero to use the default memory alignment.
 * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatemediabufferfrommediatype
 * @since windows8.0
 */
export MFCreateMediaBufferFromMediaType(pMediaType, llDuration, dwMinLength, dwMinAlignment) {
    result := DllCall("MFPlat.dll\MFCreateMediaBufferFromMediaType", "ptr", pMediaType, "int64", llDuration, "uint", dwMinLength, "uint", dwMinAlignment, "ptr*", &ppBuffer := 0, "HRESULT")
    return IMFMediaBuffer(ppBuffer)
}

/**
 * Creates an empty collection object.
 * @returns {IMFCollection} Receives a pointer to the collection object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcreatecollection
 * @since windows6.0.6000
 */
export MFCreateCollection() {
    result := DllCall("MFPlat.dll\MFCreateCollection", "ptr*", &ppIMFCollection := 0, "HRESULT")
    return IMFCollection(ppIMFCollection)
}

/**
 * Allocates a block of memory. (MFHeapAlloc)
 * @remarks
 * In the current version of Media Foundation, this function is equivalent to calling the <b>HeapAlloc</b> function and specifying the heap of the calling process.
 * 
 * To free the allocated memory, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfheapfree">MFHeapFree</a>.
 * @param {Pointer} nSize Number of bytes to allocate.
 * @param {Integer} dwFlags Zero or more flags. For a list of valid flags, see <b>HeapAlloc</b> in the Windows SDK documentation.
 * @param {PSTR} pszFile Reserved. Set to <b>NULL</b>.
 * @param {Integer} line Reserved. Set to zero.
 * @param {EAllocationType} eat Reserved. Set to <b>eAllocationTypeIgnore</b>.
 * @returns {Pointer<Void>} If the function succeeds, it returns a pointer to the allocated memory block. If the function fails, it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfheapalloc
 * @since windows6.0.6000
 */
export MFHeapAlloc(nSize, dwFlags, pszFile, line, eat) {
    pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

    result := DllCall("MFPlat.dll\MFHeapAlloc", "ptr", nSize, "uint", dwFlags, "ptr", pszFile, "int", line, EAllocationType, eat, IntPtr)
    return result
}

/**
 * Frees a block of memory that was allocated by calling the MFHeapAlloc function.
 * @param {Pointer<Void>} pv Pointer to the memory to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfheapfree
 * @since windows6.0.6000
 */
export MFHeapFree(pv) {
    pvMarshal := pv is VarRef ? "ptr" : "ptr"

    DllCall("MFPlat.dll\MFHeapFree", pvMarshal, pv)
}

/**
 * Calculates ((a * b) + d) / c, where each term is a 64-bit signed value.
 * @remarks
 * <div class="alert"><b>Note</b>  A previous version of this topic described the parameters incorrectly. The divisor is <i>c</i> and the rounding factor is <i>d</i>.</div>
 * <div> </div>
 * @param {Integer} a A multiplier.
 * @param {Integer} b Another multiplier.
 * @param {Integer} c The divisor.
 * @param {Integer} d The rounding factor.
 * @returns {Integer} Returns the result of the calculation. If numeric overflow occurs, the function returns _I64_MAX (positive overflow) or LLONG_MIN (negative overflow). If Mfplat.dll cannot be loaded, the function returns _I64_MAX.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfllmuldiv
 * @since windows6.1
 */
export MFllMulDiv(a, b, c, d) {
    result := DllCall("MFPlat.dll\MFllMulDiv", "int64", a, "int64", b, "int64", c, "int64", d, Int64)
    return result
}

/**
 * Gets the class identifier for a content protection system.
 * @remarks
 * The class identifier can be used to create the input trust authority (ITA) for the content protection system. Call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmphost-createobjectbyclsid">IMFPMPHost::CreateObjectByCLSID</a> to get an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrustedinput">IMFTrustedInput</a>  pointer.
 * @param {Pointer<Guid>} guidProtectionSystemID The GUID that identifies the content protection system.
 * @param {Pointer<Guid>} pclsid Receives the class identifier to the content protection system.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfgetcontentprotectionsystemclsid
 * @since windows8.0
 */
export MFGetContentProtectionSystemCLSID(guidProtectionSystemID, pclsid) {
    result := DllCall("MFPlat.dll\MFGetContentProtectionSystemCLSID", Guid.Ptr, guidProtectionSystemID, Guid.Ptr, pclsid, "HRESULT")
    return result
}

/**
 * Concatenates a media sample onto another sample if their combined duration does not exceed the specified duration.
 * @remarks
 * Split combined samples by calling [MFSplitSample](nf-mfapi-mfsplitsample.md)
 * @param {IMFSample} pSample A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) to which the the sample provided in the *pSampleToAdd* parameter is appended.
 * @param {IMFSample} pSampleToAdd A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) to append to the sample provided in the  *pSample* parameter.
 * @param {Integer} dwMaxMergedDurationInMS The maximum duration in milliseconds that the combined sample can fill for the operation to be successful.
 * @returns {BOOL} Output parameter that receives a BOOL indicating whether the sample was successfully appended.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfcombinesamples
 * @since windows10.0.19041
 */
export MFCombineSamples(pSample, pSampleToAdd, dwMaxMergedDurationInMS) {
    result := DllCall("MFPlat.dll\MFCombineSamples", "ptr", pSample, "ptr", pSampleToAdd, "uint", dwMaxMergedDurationInMS, BOOL.Ptr, &pMerged := 0, "HRESULT")
    return pMerged
}

/**
 * Split up a combined media sample back into individual samples.
 * @remarks
 * Combine samples by calling [MFCombineSamples](nf-mfapi-mfsplitsample.md)
 * @param {IMFSample} pSample A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) representing a combined sample to be split.
 * @param {Pointer<IMFSample>} pOutputSamples Receives a pointer to an array of output samples from the split operation.
 * @param {Integer} dwOutputSampleMaxCount The maximum output array size. Call [IMFSample::GetBufferCount](../mfobjects/nf-mfobjects-imfsample-getbuffercount.md) on the sample provided in *pSample* to find out an upper bound.
 * @param {Pointer<Integer>} pdwOutputSampleCount Output parameter that receives the number of samples contained in the pOutputSamples array.
 * @returns {HRESULT} 
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/nf-mfapi-mfsplitsample
 * @since windows10.0.19041
 */
export MFSplitSample(pSample, pOutputSamples, dwOutputSampleMaxCount, pdwOutputSampleCount) {
    pdwOutputSampleCountMarshal := pdwOutputSampleCount is VarRef ? "uint*" : "ptr"

    result := DllCall("MFPlat.dll\MFSplitSample", "ptr", pSample, IMFSample.Ptr, pOutputSamples, "uint", dwOutputSampleMaxCount, pdwOutputSampleCountMarshal, pdwOutputSampleCount, "HRESULT")
    return result
}

/**
 * Creates the source reader from a URL.
 * @remarks
 * Call <b>CoInitialize(Ex)</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> before calling this function.
 * 
 * Internally, the source reader calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-createobjectfromurl">IMFSourceResolver::CreateObjectFromURL</a> method to create a media source from the URL.
 *       
 * 
 * This function is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @param {PWSTR} pwszURL The URL  of a media file to open.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the source reader. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>. This parameter can be <b>NULL</b>.
 * @returns {IMFSourceReader} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfromurl
 * @since windows6.1
 */
export MFCreateSourceReaderFromURL(pwszURL, pAttributes) {
    pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

    result := DllCall("MFReadWrite.dll\MFCreateSourceReaderFromURL", "ptr", pwszURL, "ptr", pAttributes, "ptr*", &ppSourceReader := 0, "HRESULT")
    return IMFSourceReader(ppSourceReader)
}

/**
 * Creates the source reader from a byte stream.
 * @remarks
 * Call <b>CoInitialize(Ex)</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> before calling this function.
 * 
 * Internally, the source reader calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-createobjectfrombytestream">IMFSourceResolver::CreateObjectFromByteStream</a> method to create a media source from the byte stream. Therefore, a byte-stream handler must be registered for the byte stream. For more information about byte-stream handlers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/scheme-handlers-and-byte-stream-handlers">Scheme Handlers and Byte-Stream Handlers</a>.
 *       
 * 
 * This function is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. This byte stream will provide the source data for the source reader.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the source reader. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>. This parameter can be <b>NULL</b>.
 * @returns {IMFSourceReader} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrombytestream
 * @since windows6.1
 */
export MFCreateSourceReaderFromByteStream(pByteStream, pAttributes) {
    result := DllCall("MFReadWrite.dll\MFCreateSourceReaderFromByteStream", "ptr", pByteStream, "ptr", pAttributes, "ptr*", &ppSourceReader := 0, "HRESULT")
    return IMFSourceReader(ppSourceReader)
}

/**
 * Creates the source reader from a media source.
 * @remarks
 * Call <b>CoInitialize(Ex)</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> before calling this function.
 * 
 * By default, when the application releases the source reader, the source reader shuts down the media source by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">IMFMediaSource::Shutdown</a> on the media source. At that point, the application can no longer use the media source.
 * 
 * To change this default behavior, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-disconnect-mediasource-on-shutdown">MF_SOURCE_READER_DISCONNECT_MEDIASOURCE_ON_SHUTDOWN</a> attribute in the <i>pAttributes</i> parameter. If this attribute is <b>TRUE</b>, the application is responsible for  shutting down the media source.
 * 
 * When using the Source Reader, do not call any of the following methods on the media source:<ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-pause">IMFMediaSource::Pause</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-start">IMFMediaSource::Start</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-stop">IMFMediaSource::Stop</a>
 * </li>
 * <li>All <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a> methods</li>
 * </ul>
 * 
 * 
 * This function is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @param {IMFMediaSource} pMediaSource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of a media source.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the source reader. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>. This parameter can be <b>NULL</b>.
 * @returns {IMFSourceReader} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrommediasource
 * @since windows6.1
 */
export MFCreateSourceReaderFromMediaSource(pMediaSource, pAttributes) {
    result := DllCall("MFReadWrite.dll\MFCreateSourceReaderFromMediaSource", "ptr", pMediaSource, "ptr", pAttributes, "ptr*", &ppSourceReader := 0, "HRESULT")
    return IMFSourceReader(ppSourceReader)
}

/**
 * Creates the sink writer from a URL or byte stream.
 * @remarks
 * Call <b>CoInitialize(Ex)</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> before calling this function.
 * 
 * The first three parameters to this function can be <b>NULL</b>; however, only certain combinations are valid:
 * 
 * 
 * <table>
 * <tr>
 * <th>Description</th>
 * <th><i>pwszOutputURL</i></th>
 * <th><i>pByteStream</i></th>
 * <th><i>pAttributes</i></th>
 * </tr>
 * <tr>
 * <td>Specify a byte stream, with no URL.</td>
 * <td><b>NULL</b></td>
 * <td>non-<b>NULL</b></td>
 * <td>Required (must not be <b>NULL</b>).</td>
 * </tr>
 * <tr>
 * <td>Specify a URL, with no byte stream.</td>
 * <td>not <b>NULL</b></td>
 * <td><b>NULL</b></td>
 * <td>Optional (may be <b>NULL</b>).</td>
 * </tr>
 * <tr>
 * <td>Specify both a URL and a byte stream.</td>
 * <td>non-<b>NULL</b></td>
 * <td>non-<b>NULL</b></td>
 * <td>Optional (may be <b>NULL</b>).</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The <i>pAttributes</i> parameter is required in the first case and optional in the others.
 * 
 * <ul>
 * <li>Case 1: Specify a byte stream without a URL. The <i>pAttributes</i> parameter must point to an attribute store that contains the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a> attribute. The sink writer uses the  MF_TRANSCODE_CONTAINERTYPE attribute to determine the type of file container to write, such as ASF or MP4.</li>
 * <li>Case 2: Specify a URL without a byte stream. The sink writer creates a new file named <i>pwszOutputURL</i>. If <i>pAttributes</i> specifies an attribute store with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a> attribute, the sink writer uses that attribute to determine the type of file container. Otherwise, if the MF_TRANSCODE_CONTAINERTYPE attribute is absent or <i>pAttributes</i> is <b>NULL</b>, the sink writer uses the file name extension to select the container type; for example, ".asf" for an ASF file.</li>
 * <li>Case 3: Specify both a URL and a byte stream. The sink writer writes to the byte stream. The URL provided in <i>pwszOutputURL</i> is informational only; the sink writer does not create a new file. If <i>pAttributes</i> specifies an attribute store with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a> attribute, the sink writer uses that attribute to determine the type of file container. Otherwise, the sink writer uses the file name extension to select the container type. The MF_TRANSCODE_CONTAINERTYPE attribute overrides the URL file name extension in this case.</li>
 * </ul>
 * This function is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @param {PWSTR} pwszOutputURL A null-terminated string that contains the URL of the output file. This parameter can be <b>NULL</b>.
 * @param {IMFByteStream} pByteStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. This parameter can be <b>NULL</b>.
 * 
 * If this parameter is a valid pointer, the sink writer writes to the provided byte stream. (The byte stream must be writable.) Otherwise, if <i>pByteStream</i> is <b>NULL</b>, the sink writer creates a new file named <i>pwszOutputURL</i>.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the sink writer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer-attributes">Sink Writer Attributes</a>. This parameter can be <b>NULL</b>.
 * @returns {IMFSinkWriter} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfromurl
 * @since windows6.1
 */
export MFCreateSinkWriterFromURL(pwszOutputURL, pByteStream, pAttributes) {
    pwszOutputURL := pwszOutputURL is String ? StrPtr(pwszOutputURL) : pwszOutputURL

    result := DllCall("MFReadWrite.dll\MFCreateSinkWriterFromURL", "ptr", pwszOutputURL, "ptr", pByteStream, "ptr", pAttributes, "ptr*", &ppSinkWriter := 0, "HRESULT")
    return IMFSinkWriter(ppSinkWriter)
}

/**
 * Creates the sink writer from a media sink.
 * @remarks
 * Call <b>CoInitialize(Ex)</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> before calling this function.
 * 
 * When you are done using the media sink, call the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">IMFMediaSink::Shutdown</a> method. (The sink writer does not shut down the media sink.) Release the sink writer before calling <b>Shutdown</b> on the media sink.
 * 
 * This function is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @param {IMFMediaSink} pMediaSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of a media sink.
 * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the sink writer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer-attributes">Sink Writer Attributes</a>. This parameter can be <b>NULL</b>.
 * @returns {IMFSinkWriter} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfrommediasink
 * @since windows6.1
 */
export MFCreateSinkWriterFromMediaSink(pMediaSink, pAttributes) {
    result := DllCall("MFReadWrite.dll\MFCreateSinkWriterFromMediaSink", "ptr", pMediaSink, "ptr", pAttributes, "ptr*", &ppSinkWriter := 0, "HRESULT")
    return IMFSinkWriter(ppSinkWriter)
}

/**
 * Creates the default video presenter for the enhanced video renderer (EVR).
 * @param {IUnknown} pOwner Pointer to the owner of the object. If the object is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
 * @param {Pointer<Guid>} riidDevice Interface identifier (IID) of the video device interface that will be used for processing the video. Currently the only supported value is IID_IDirect3DDevice9.
 * @param {Pointer<Guid>} riid IID of the requested interface on the video presenter. The video presenter exposes the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface.
 * @returns {Pointer<Void>} Receives a pointer to the requested interface on the video presenter. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nc-evr-mfcreatevideopresenter
 */
export MFCreateVideoPresenter(pOwner, riidDevice, riid) {
    result := DllCall("EVR.dll\MFCreateVideoPresenter", "ptr", pOwner, Guid.Ptr, riidDevice, Guid.Ptr, riid, "ptr*", &ppVideoPresenter := 0, "HRESULT")
    return ppVideoPresenter
}

/**
 * Creates the default video mixer for the enhanced video renderer (EVR).
 * @param {IUnknown} pOwner Pointer to the owner of this object. If the object is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
 * @param {Pointer<Guid>} riidDevice Interface identifier (IID) of the video device interface that will be used for processing the video. Currently the only supported value is IID_IDirect3DDevice9.
 * @param {Pointer<Guid>} riid IID of the requested interface on the video mixer.  The video mixer exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nc-evr-mfcreatevideomixer
 */
export MFCreateVideoMixer(pOwner, riidDevice, riid) {
    result := DllCall("EVR.dll\MFCreateVideoMixer", "ptr", pOwner, Guid.Ptr, riidDevice, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Creates the default video mixer and video presenter for the enhanced video renderer (EVR).
 * @param {IUnknown} pMixerOwner Pointer to the owner of the video mixer. If the mixer is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
 * @param {IUnknown} pPresenterOwner Pointer to the owner of the video presenter. If the presenter is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
 * @param {Pointer<Guid>} riidMixer Interface identifier (IID) of the requested interface on the video mixer. The video mixer exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
 * @param {Pointer<Pointer<Void>>} ppvVideoMixer Receives a pointer to the requested interface on the video mixer. The caller must release the interface.
 * @param {Pointer<Guid>} riidPresenter IID of the requested interface on the video presenter. The video presenter exposes the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface.
 * @param {Pointer<Pointer<Void>>} ppvVideoPresenter Receives a pointer to the requested interface on the video presenter. The caller must release the interface.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/evr/nc-evr-mfcreatevideomixerandpresenter
 */
export MFCreateVideoMixerAndPresenter(pMixerOwner, pPresenterOwner, riidMixer, ppvVideoMixer, riidPresenter, ppvVideoPresenter) {
    ppvVideoMixerMarshal := ppvVideoMixer is VarRef ? "ptr*" : "ptr"
    ppvVideoPresenterMarshal := ppvVideoPresenter is VarRef ? "ptr*" : "ptr"

    result := DllCall("EVR.dll\MFCreateVideoMixerAndPresenter", "ptr", pMixerOwner, "ptr", pPresenterOwner, Guid.Ptr, riidMixer, ppvVideoMixerMarshal, ppvVideoMixer, Guid.Ptr, riidPresenter, ppvVideoPresenterMarshal, ppvVideoPresenter, "HRESULT")
    return result
}

/**
 * Creates an instance of the enhanced video renderer (EVR) media sink.
 * @remarks
 * This function creates the Media Foundation version of the EVR. To create the DirectShow EVR filter, call <b>CoCreateInstance</b> with the class identifier CLSID_EnhancedVideoRenderer.
 * @param {Pointer<Guid>} riidRenderer Interface identifier (IID) of the requested interface on the EVR.
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nc-evr-mfcreatevideorenderer
 */
export MFCreateVideoRenderer(riidRenderer) {
    result := DllCall("MF.dll\MFCreateVideoRenderer", Guid.Ptr, riidRenderer, "ptr*", &ppVideoRenderer := 0, "HRESULT")
    return ppVideoRenderer
}

/**
 * Creates a media sample that manages a Direct3D surface.
 * @remarks
 * The media sample created by this function exposes the following interfaces in addition to <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a>:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfdesiredsample">IMFDesiredSample</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrackedsample">IMFTrackedSample</a>
 * </li>
 * </ul>
 * If <i>pUnkSurface</i> is non-<b>NULL</b>, the sample contains a single media buffer, which holds a pointer to the Direct3D surface. To get the Direct3D surface from the media buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> on the buffer, using the service identifier MR_BUFFER_SERVICE. The media buffer does not implement <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a>, nor does it implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">IMFMediaBuffer::Lock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock">Unlock</a> methods.
 * 
 * Alternatively, you can set <i>pUnkSurface</i> to <b>NULL</b>, and later add a DirectX surface buffer to the sample by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-addbuffer">IMFSample::AddBuffer</a>. To create a DirectX surface buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxsurfacebuffer">MFCreateDXSurfaceBuffer</a>.
 * @param {IUnknown} pUnkSurface A pointer to the <b>IUnknown</b> interface of the Direct3D surface. This parameter can be <b>NULL</b>.
 * @returns {IMFSample} Receives a pointer to the sample's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface.
 *           The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nc-evr-mfcreatevideosamplefromsurface
 */
export MFCreateVideoSampleFromSurface(pUnkSurface) {
    result := DllCall("EVR.dll\MFCreateVideoSampleFromSurface", "ptr", pUnkSurface, "ptr*", &ppSample := 0, "HRESULT")
    return IMFSample(ppSample)
}

/**
 * Creates an object that allocates video samples.
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nc-evr-mfcreatevideosampleallocator
 */
export MFCreateVideoSampleAllocator(riid) {
    result := DllCall("EVR.dll\MFCreateVideoSampleAllocator", Guid.Ptr, riid, "ptr*", &ppSampleAllocator := 0, "HRESULT")
    return ppSampleAllocator
}

/**
 * Creates a new instance of the MFPlay player object.
 * @remarks
 * Before calling this function, call <b>CoIntialize(Ex)</b> from the same thread to initialize the COM library.
 * 
 * Internally, <b>MFPCreateMediaPlayer</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> to initialize the Microsoft Media Foundation platform. When the player object is destroyed, it calls  <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> to shut down the platform. It is not necessary for an application to call <b>MFStartup</b> or <b>MFShutdown</b> when using MFPlay.
 * 
 * <div class="alert"><b>Note</b>  If you use other Media Foundation APIs outside the life time of the player object, then your application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a>.</div>
 * <div> </div>
 * @param {PWSTR} pwszURL Null-terminated string that contains the URL  of a media file to open. This parameter can be <b>NULL</b>. If the parameter is <b>NULL</b>, <i>fStartPlayback</i> must be <b>FALSE</b>.
 * 
 * If this parameter is <b>NULL</b>, you can open a URL later by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a>.
 * @param {BOOL} fStartPlayback If <b>TRUE</b>, playback starts automatically. If <b>FALSE</b>, playback does not start until the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-play">IMFMediaPlayer::Play</a>.
 * 
 * If <i>pwszURL</i> is <b>NULL</b>, this parameter is ignored.
 * @param {MFP_CREATION_OPTIONS} creationOptions Bitwise <b>OR</b> of zero of more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_creation_options">_MFP_CREATION_OPTIONS</a> enumeration.
 * @param {IMFPMediaPlayerCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayercallback">IMFPMediaPlayerCallback</a> interface of a callback object, implemented by the application. Use this interface to get event notifications from the MFPlay player object. This parameter can be <b>NULL</b>. If  the parameter is <b>NULL</b>, the application will not receive  event notifications from the player object.
 * @param {HWND} _hWnd A handle to a window where the video will appear. For audio-only playback, this parameter can be <b>NULL</b>.
 * 
 * The window specified by <i>hWnd</i> is used for the first selected video stream in the source. If the source has multiple video streams, you must call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamsink">IMFPMediaItem::SetStreamSink</a> to render any of the video streams after the first.
 * 
 * If <i>hWnd</i> is <b>NULL</b>, MFPlay will not display any video unless the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamsink">IMFPMediaItem::SetStreamSink</a> to specify a media sink for the video stream.
 * @returns {IMFPMediaPlayer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> interface. The caller must release the interface. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, <i>fStartPlayback</i> must be <b>TRUE</b> and <i>pwszURL</i> cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-mfpcreatemediaplayer
 * @since windows6.1
 */
export MFPCreateMediaPlayer(pwszURL, fStartPlayback, creationOptions, pCallback, _hWnd) {
    pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

    result := DllCall("MFPlay.dll\MFPCreateMediaPlayer", "ptr", pwszURL, BOOL, fStartPlayback, MFP_CREATION_OPTIONS, creationOptions, "ptr", pCallback, HWND, _hWnd, "ptr*", &ppMediaPlayer := 0, "HRESULT")
    return IMFPMediaPlayer(ppMediaPlayer)
}

/**
 * The MFCreateEncryptedMediaExtensionsStoreActivate function creates an object that implements IMFActivate. This object’s implementation of ActivateObject is based on the specified IMFPMPHostApp and class ID.
 * @remarks
 * The **IMFActivate** can be created in a protected process and activated in an app process.
 * @param {IMFPMPHostApp} pmpHost An [IMFPMPHostApp](../mfidl/nn-mfidl-imfpmphostapp.md) with the necessary information to create the **IMFActivate** for this app package.
 * @param {IStream} objectStream An [IStream](../objidl/nn-objidl-istream.md) representing the object stream that will be loaded via IMFActivate::Load.
 * @param {PWSTR} classId An **LPCWSTR** representing the target object's activatable class id.
 * @returns {IMFActivate} Receives a reference to the to an **IMFActivate**.
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-mfcreateencryptedmediaextensionsstoreactivate
 * @since windows10.0.19041
 */
export MFCreateEncryptedMediaExtensionsStoreActivate(pmpHost, objectStream, classId) {
    classId := classId is String ? StrPtr(classId) : classId

    result := DllCall("MF.dll\MFCreateEncryptedMediaExtensionsStoreActivate", "ptr", pmpHost, "ptr", objectStream, "ptr", classId, "ptr*", &activate := 0, "HRESULT")
    return IMFActivate(activate)
}

/**
 * Creates a virtual camera object which can be used by the caller to register, unregister, or remove the virtual camera from the system.
 * @remarks
 * The virtual camera created by **MFCreateVirtualCamera** is keyed off the parameters passed in to this API.  By keeping the same parameters, applications can re-open the same virtual camera. When called for the first time, the resulting [IMFVirtualCamera](nn-mfvirtualcamera-imfvirtualcamera.md) contains a set of configuration information which may be modified or updated by the caller to create a new instance of a virtual camera.  If the same parameters are used for this function on subsequent calls, the resulting **IMFVirtualCamera** will open the existing virtual camera when the [IMFVirtualCamera::Start](nf-mfvirtualcamera-imfvirtualcamera-start.md) or [IMFVirtualCamera::Stop](nf-mfvirtualcamera-imfvirtualcamera-stop.md) method is called. Calling [IMFVirtualCamera::Remove](nf-mfvirtualcamera-imfvirtualcamera-remove.md) will remove the existing virtual camera. If MFVirtualCameraAccess_CurrentUser is specified for the *access* parameter, each user account gets a unique virtual camera.
 * 
 * UWP and Packaged Application must declare the *webcam* device capability in their manifest in order to use this API. This API is also subject to the webcam privacy control so when privacy is set to deny access, this API will result in an E_ACCESSDENIED failure.
 * 
 * > [!NOTE]
 * > UWP and Packaged Apps must not invoke **MFCreateVirtualCamera** on their UI thread.  Doing so will potentially trigger a deadlock as the Capability Access Manager check for the webcam access consent dialog will be blocked.
 * @param {MFVirtualCameraType} type A member of the [MFVirtualCameraType](ne-mfvirtualcamera-mfvirtualcameratype.md) enumeration specifying the virtual camera type. In the current release, only **MFVirtualCameraType_SoftwareCameraSource** is supported.
 * @param {MFVirtualCameraLifetime} lifetime A member of the [MFVirtualCameraLifetime](ne-mfvirtualcamera-mfvirtualcameralifetime.md) enumeration specifying the lifetime of the camera. If **MFVirtualCameraLifetime_Session** is specified, when the returned [IMFVirtualCamera](nn-mfvirtualcamera-imfvirtualcamera.md) object is disposed or [IMFVirtualCamera::Shutdown](nf-mfvirtualcamera-imfvirtualcamera-shutdown.md) is called, the virtual camera will no longer be enumerable or activatable on the device.  If you want the virtual camera to persist across sessions and/or across reboots, you must specify the value **MFVirtualCameraLifetime_System**.
 * @param {MFVirtualCameraAccess} access A member of the [MFVirtualCameraAccess](ne-mfvirtualcamera-mfvirtualcameraaccess.md) enumeration specifying the access scope of the created virtual camera. If **MFVirtualCameraAccess_CurrentUser** is specified, the virtual camera is only created for the user account that called the **MFCreateVirtualCamera**.  If **MFVirtualCameraAccess_AllUsers** is specified, all users on the device will be able to enumerate or activate the virtual camera.  To create a virtual camera with **MFVirtualCameraAccess_AllUsers**, the caller of **MFCreateVirtualCamera** must have administrator permissions.
 * @param {PWSTR} friendlyName A null-terminated, user-readable Unicode string friendly name for the created virtual camera.  The pipeline will automatically append “Windows Virtual Camera” to the provided friendly name to ensure end users can distinguish virtual cameras from physical cameras based on the friendly name.  This parameter must not be nullptr.
 * @param {PWSTR} sourceId The unique CLSID of the custom media source to be activated for this virtual camera.  The string must be in the “{CLSID}” format.  This parameter must not be nullptr.
 * @param {Pointer<Guid>} categories 
 * @param {Integer} categoryCount The number of categories provided in the *categories* parameter.  If *categories* is nullptr, *categoryCount* must be 0.
 * @returns {IMFVirtualCamera} Output parameter that receives the newly created [IMFVirtualCamera](nn-mfvirtualcamera-imfvirtualcamera.md).  This parameter must not be nullptr.
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-mfcreatevirtualcamera
 */
export MFCreateVirtualCamera(type, lifetime, access, friendlyName, sourceId, categories, categoryCount) {
    friendlyName := friendlyName is String ? StrPtr(friendlyName) : friendlyName
    sourceId := sourceId is String ? StrPtr(sourceId) : sourceId

    result := DllCall("MFSENSORGROUP.dll\MFCreateVirtualCamera", MFVirtualCameraType, type, MFVirtualCameraLifetime, lifetime, MFVirtualCameraAccess, access, "ptr", friendlyName, "ptr", sourceId, Guid.Ptr, categories, "uint", categoryCount, "ptr*", &virtualCamera := 0, "HRESULT")
    return IMFVirtualCamera(virtualCamera)
}

/**
 * Returns a value indicating if a particular virtual camera is supported on the platform.
 * @param {MFVirtualCameraType} type A member of the [MFVirtualCameraType](ne-mfvirtualcamera-mfvirtualcameratype.md) enumeration specifying the virtual camera type for which support is being queried. In the current release, only **MFVirtualCameraType_SoftwareCameraSource** is supported.
 * @returns {BOOL} An output parameter that receives a boolean indicating if the specified camera type is supported on the current device.
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-mfisvirtualcameratypesupported
 */
export MFIsVirtualCameraTypeSupported(type) {
    result := DllCall("MFSENSORGROUP.dll\MFIsVirtualCameraTypeSupported", MFVirtualCameraType, type, BOOL.Ptr, &supported := 0, "HRESULT")
    return supported
}

/**
 * 
 * @param {OPM_HDCP_TYPE} HDCPType 
 * @returns {HRESULT} 
 */
export OPMXboxEnableHDCP(HDCPType) {
    result := DllCall("OPMXbox.dll\OPMXboxEnableHDCP", OPM_HDCP_TYPE, HDCPType, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<OPM_HDCP_STATUS>} pHDCPStatus 
 * @returns {HRESULT} 
 */
export OPMXboxGetHDCPStatus(pHDCPStatus) {
    pHDCPStatusMarshal := pHDCPStatus is VarRef ? "int*" : "ptr"

    result := DllCall("OPMXbox.dll\OPMXboxGetHDCPStatus", pHDCPStatusMarshal, pHDCPStatus, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<OPM_HDCP_STATUS>} pHDCPStatus 
 * @param {Pointer<OPM_HDCP_TYPE>} pHDCPType 
 * @returns {HRESULT} 
 */
export OPMXboxGetHDCPStatusAndType(pHDCPStatus, pHDCPType) {
    pHDCPStatusMarshal := pHDCPStatus is VarRef ? "int*" : "ptr"
    pHDCPTypeMarshal := pHDCPType is VarRef ? "int*" : "ptr"

    result := DllCall("OPMXbox.dll\OPMXboxGetHDCPStatusAndType", pHDCPStatusMarshal, pHDCPStatus, pHDCPTypeMarshal, pHDCPType, "HRESULT")
    return result
}

;@endregion Functions

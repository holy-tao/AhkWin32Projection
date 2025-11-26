#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectXVideoDecoder.ahk
#Include .\IDirectXVideoAccelerationService.ahk

/**
 * Provides access to DirectX Video Acceleration (DXVA) decoder services.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideodecoderservice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoDecoderService extends IDirectXVideoAccelerationService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoDecoderService
     * @type {Guid}
     */
    static IID => Guid("{fc51a551-d5e7-11d9-af55-00054e43ff02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecoderDeviceGuids", "GetDecoderRenderTargets", "GetDecoderConfigurations", "CreateVideoDecoder"]

    /**
     * Retrieves an array of GUIDs that identifies the decoder devices supported by the graphics hardware.
     * @param {Pointer<Integer>} pCount Receives the number of GUIDs.
     * @param {Pointer<Pointer<Guid>>} pGuids Receives an array of GUIDs. The size of the array is retrieved in the <i>Count</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error from the Direct3D device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the Microsoft Basic Display Adapter is being used or the Direct3D 11 device type is the reference rasterizer.  These devices do not support video decoders.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids
     */
    GetDecoderDeviceGuids(pCount, pGuids) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pGuidsMarshal := pGuids is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pCountMarshal, pCount, pGuidsMarshal, pGuids, "HRESULT")
        return result
    }

    /**
     * Retrieves the supported render targets for a specified decoder device.
     * @param {Pointer<Guid>} Guid GUID that identifies the decoder device. To get the available device GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>.
     * @param {Pointer<Integer>} pCount Receives the number of formats.
     * @param {Pointer<Pointer<Integer>>} pFormats Receives an array of formats, specified as <b>D3DFORMAT</b> values. The size of the array is retrieved in the <i>pCount</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderrendertargets
     */
    GetDecoderRenderTargets(Guid, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", Guid, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * Gets the configurations that are available for a decoder device.
     * @param {Pointer<Guid>} Guid A GUID that identifies the decoder device. To get the available device GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<Integer>} pCount Receives the number of configurations.
     * @param {Pointer<Pointer<DXVA2_ConfigPictureDecode>>} ppConfigs Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_configpicturedecode">DXVA2_ConfigPictureDecode</a> structures. The size of the array is retrieved in the <i>pCount</i> parameter. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b> if you simply want the number of configurations (returned in <i>pCount</i>) but not the GUIDs.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderconfigurations
     */
    GetDecoderConfigurations(Guid, pVideoDesc, pCount, ppConfigs) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppConfigsMarshal := ppConfigs is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", Guid, "ptr", pVideoDesc, "ptr", pReserved, pCountMarshal, pCount, ppConfigsMarshal, ppConfigs, "HRESULT")
        return result
    }

    /**
     * Creates a video decoder device.
     * @param {Pointer<Guid>} Guid GUID that specifies the decoder device to create. To get the available device GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<DXVA2_ConfigPictureDecode>} pConfig Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_configpicturedecode">DXVA2_ConfigPictureDecode</a> structure that specifies the decoder configuration.
     * @param {Pointer<IDirect3DSurface9>} ppDecoderRenderTargets Pointer to an array of <b>IDirect3DSurface9</b> pointers containing pointers to the decoder render targets. To create these surfaces, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoaccelerationservice-createsurface">IDirectXVideoAccelerationService::CreateSurface</a>. Specify DXVA2_VideoDecoderRenderTarget for the <i>DxvaType</i> parameter.
     * @param {Integer} NumRenderTargets Size of the <i>ppDecoderRenderTargets</i> array. This value cannot be zero.
     * @returns {IDirectXVideoDecoder} Receives a pointer to the decoder's <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoder">IDirectXVideoDecoder</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoderservice-createvideodecoder
     */
    CreateVideoDecoder(Guid, pVideoDesc, pConfig, ppDecoderRenderTargets, NumRenderTargets) {
        result := ComCall(7, this, "ptr", Guid, "ptr", pVideoDesc, "ptr", pConfig, "ptr*", ppDecoderRenderTargets, "uint", NumRenderTargets, "ptr*", &ppDecode := 0, "HRESULT")
        return IDirectXVideoDecoder(ppDecode)
    }
}

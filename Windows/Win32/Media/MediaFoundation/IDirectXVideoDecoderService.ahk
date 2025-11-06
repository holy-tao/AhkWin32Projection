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
     * 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<Guid>>} pGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids
     */
    GetDecoderDeviceGuids(pCount, pGuids) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pGuidsMarshal := pGuids is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pCountMarshal, pCount, pGuidsMarshal, pGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<Integer>>} pFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderrendertargets
     */
    GetDecoderRenderTargets(Guid, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", Guid, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<DXVA2_ConfigPictureDecode>>} ppConfigs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderconfigurations
     */
    GetDecoderConfigurations(Guid, pVideoDesc, pCount, ppConfigs) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppConfigsMarshal := ppConfigs is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", Guid, "ptr", pVideoDesc, "ptr", pReserved, pCountMarshal, pCount, ppConfigsMarshal, ppConfigs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<DXVA2_ConfigPictureDecode>} pConfig 
     * @param {Pointer<IDirect3DSurface9>} ppDecoderRenderTargets 
     * @param {Integer} NumRenderTargets 
     * @returns {IDirectXVideoDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-createvideodecoder
     */
    CreateVideoDecoder(Guid, pVideoDesc, pConfig, ppDecoderRenderTargets, NumRenderTargets) {
        result := ComCall(7, this, "ptr", Guid, "ptr", pVideoDesc, "ptr", pConfig, "ptr*", ppDecoderRenderTargets, "uint", NumRenderTargets, "ptr*", &ppDecode := 0, "HRESULT")
        return IDirectXVideoDecoder(ppDecode)
    }
}

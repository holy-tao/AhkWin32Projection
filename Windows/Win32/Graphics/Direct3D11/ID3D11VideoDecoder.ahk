#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Represents a hardware-accelerated video decoder for Microsoft Direct3D 11.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videodecoder
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoDecoder extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoDecoder
     * @type {Guid}
     */
    static IID => Guid("{3c9c5b51-995d-48d1-9b8d-fa5caeded65c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCreationParameters", "GetDriverHandle"]

    /**
     * Gets the parameters that were used to create the decoder.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a> structure that receives a description of the video stream.
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a> structure that receives the decoder configuration.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodecoder-getcreationparameters
     */
    GetCreationParameters(pVideoDesc, pConfig) {
        result := ComCall(7, this, "ptr", pVideoDesc, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the driver.
     * @returns {HANDLE} Receives a handle to the driver.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodecoder-getdriverhandle
     */
    GetDriverHandle() {
        pDriverHandle := HANDLE()
        result := ComCall(8, this, "ptr", pDriverHandle, "HRESULT")
        return pDriverHandle
    }
}

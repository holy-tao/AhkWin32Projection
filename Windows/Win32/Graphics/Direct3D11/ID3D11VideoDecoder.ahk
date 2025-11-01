#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pVideoDesc 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodecoder-getcreationparameters
     */
    GetCreationParameters(pVideoDesc, pConfig) {
        result := ComCall(7, this, "ptr", pVideoDesc, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} pDriverHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodecoder-getdriverhandle
     */
    GetDriverHandle(pDriverHandle) {
        result := ComCall(8, this, "ptr", pDriverHandle, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11View.ahk

/**
 * Identifies the output surfaces that can be accessed during video decoding.
 * @remarks
 * 
  * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview">ID3D11VideoDevice::CreateVideoDecoderOutputView</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videodecoderoutputview
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoDecoderOutputView extends ID3D11View{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoDecoderOutputView
     * @type {Guid}
     */
    static IID => Guid("{c2931aea-2a85-4f20-860f-fba1fd256e18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodecoderoutputview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }
}

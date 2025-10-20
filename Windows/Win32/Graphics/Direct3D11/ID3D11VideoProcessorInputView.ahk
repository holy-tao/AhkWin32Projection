#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11View.ahk

/**
 * Identifies the input surfaces that can be accessed during video processing.
 * @remarks
 * 
  * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorinputview">ID3D11VideoDevice::CreateVideoProcessorInputView</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videoprocessorinputview
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoProcessorInputView extends ID3D11View{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoProcessorInputView
     * @type {Guid}
     */
    static IID => Guid("{11ec5a5f-51dc-4945-ab34-6e8c21300ea5}")

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
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorinputview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }
}

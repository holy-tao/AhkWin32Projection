#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets a new mixer or presenter for the Enhanced Video Renderer (EVR).
 * @remarks
 * 
  * The EVR activation object returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatevideorendereractivate">MFCreateVideoRendererActivate</a> function does not expose this interface. Instead, the activation object supports attributes that specify a custom mixer or presenter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer-attributes">Enhanced Video Renderer Attributes</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideorenderer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoRenderer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoRenderer
     * @type {Guid}
     */
    static IID => Guid("{dfdfd197-a9ca-43d8-b341-6af3503792cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeRenderer"]

    /**
     * 
     * @param {IMFTransform} pVideoMixer 
     * @param {IMFVideoPresenter} pVideoPresenter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideorenderer-initializerenderer
     */
    InitializeRenderer(pVideoMixer, pVideoPresenter) {
        result := ComCall(3, this, "ptr", pVideoMixer, "ptr", pVideoPresenter, "HRESULT")
        return result
    }
}

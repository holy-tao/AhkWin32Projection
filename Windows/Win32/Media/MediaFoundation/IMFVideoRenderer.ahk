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
     * 
     * @param {Pointer<IMFTransform>} pVideoMixer 
     * @param {Pointer<IMFVideoPresenter>} pVideoPresenter 
     * @returns {HRESULT} 
     */
    InitializeRenderer(pVideoMixer, pVideoPresenter) {
        result := ComCall(3, this, "ptr", pVideoMixer, "ptr", pVideoPresenter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

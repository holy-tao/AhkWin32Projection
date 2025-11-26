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
     * Sets a new mixer or presenter for the enhanced video renderer (EVR).
     * @param {IMFTransform} pVideoMixer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface of the mixer to use. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the EVR uses its default mixer.
     * @param {IMFVideoPresenter} pVideoPresenter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface of the presenter to use. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the EVR uses its default presenter.
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
     * Either the mixer or the presenter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer and presenter cannot be replaced in the current state. (EVR media sink.)
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
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more input pins are connected. (DirectShow EVR filter.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideorenderer-initializerenderer
     */
    InitializeRenderer(pVideoMixer, pVideoPresenter) {
        result := ComCall(3, this, "ptr", pVideoMixer, "ptr", pVideoPresenter, "HRESULT")
        return result
    }
}

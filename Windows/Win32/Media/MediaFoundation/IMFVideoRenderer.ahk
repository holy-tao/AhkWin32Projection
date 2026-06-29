#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFVideoPresenter.ahk" { IMFVideoPresenter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFTransform.ahk" { IMFTransform }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets a new mixer or presenter for the Enhanced Video Renderer (EVR).
 * @remarks
 * The EVR activation object returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatevideorendereractivate">MFCreateVideoRendererActivate</a> function does not expose this interface. Instead, the activation object supports attributes that specify a custom mixer or presenter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer-attributes">Enhanced Video Renderer Attributes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideorenderer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoRenderer extends IUnknown {
    /**
     * The interface identifier for IMFVideoRenderer
     * @type {Guid}
     */
    static IID := Guid("{dfdfd197-a9ca-43d8-b341-6af3503792cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoRenderer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeRenderer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoRenderer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a new mixer or presenter for the enhanced video renderer (EVR).
     * @remarks
     * Call this method directly after creating the EVR, before you do any of the following:
     * 
     * <ul>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> on the EVR.
     * 
     * </li>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-ievrfilterconfig-setnumberofstreams">IEVRFilterConfig::SetNumberOfStreams</a> on the EVR.
     * 
     * </li>
     * <li>
     * Connect any pins on the EVR filter, or set any media types on EVR media sink.
     * 
     * </li>
     * </ul>
     * The EVR filter returns VFW_E_WRONG_STATE if any of the filter's pins are connected. The EVR media sink returns MF_E_INVALIDREQUEST if a media type is set on any of the streams, or the presentation clock is running or paused.
     * 
     * The device identifiers for the mixer and the presenter must match. The <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodeviceid-getdeviceid">IMFVideoDeviceID::GetDeviceID</a> method returns the device identifier. If they do not match, the method returns E_INVALIDARG.
     * 
     * If the video renderer is in the protected media path (PMP), the mixer and presenter objects must be certified safe components and pass any trust authority verification that is being enforced. Otherwise, this method will fail.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideorenderer-initializerenderer
     */
    InitializeRenderer(pVideoMixer, pVideoPresenter) {
        result := ComCall(3, this, "ptr", pVideoMixer, "ptr", pVideoPresenter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoRenderer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeRenderer := CallbackCreate(GetMethod(implObj, "InitializeRenderer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeRenderer)
    }
}

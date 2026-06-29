#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a plug-in component for the enhanced video renderer (EVR) to work with protected media.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-ievrtrustedvideoplugin
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IEVRTrustedVideoPlugin extends IUnknown {
    /**
     * The interface identifier for IEVRTrustedVideoPlugin
     * @type {Guid}
     */
    static IID := Guid("{83a4ce40-7710-494b-a893-a472049af630}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEVRTrustedVideoPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsInTrustedVideoMode : IntPtr
        CanConstrict         : IntPtr
        SetConstriction      : IntPtr
        DisableImageExport   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEVRTrustedVideoPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries whether the plug-in has any transient vulnerabilities at this time.
     * @remarks
     * This method provides a way for the plug-in to report temporary conditions that would cause the input trust authority (ITA) to distrust the plug-in. For example, if an EVR presenter is in windowed mode, it is vulnerable to GDI screen captures.
     * 
     * To disable screen capture in Direct3D, the plug-in must do the following:
     * 
     * <ul>
     * <li>
     * Create the Direct3D device in full-screen exclusive mode.
     * 
     * </li>
     * <li>
     * Specify the D3DCREATE_DISABLE_PRINTSCREEN flag when you create the device. For more information, see <b>IDirect3D9::CreateDevice</b> in the DirectX documentation.
     * 
     * </li>
     * </ul>
     * In addition, the graphics adapter must support the Windows Vista Display Driver Model (WDDM) and the Direct3D extensions for Windows Vista (sometimes called D3D9Ex or D3D9L).
     * 
     * If these conditions are met, the presenter can return <b>TRUE</b> in the <i>pYes</i> parameter. Otherwise, it should return <b>FALSE</b>.
     * 
     * The EVR calls this method whenever the device changes. If the plug-in returns <b>FALSE</b>, the EVR treats this condition as if the plug-in had a new output connector of unknown type. The policy object can then allow or block playback, depending on the ITA's policy.
     * 
     * This method should be used only to report transient conditions. A plug-in that is never in a trusted state should not implement the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-ievrtrustedvideoplugin">IEVRTrustedVideoPlugin</a> interface at all.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the plug-in has no transient vulnerabilities at the moment and can receive protected content. If <b>FALSE</b>, the plug-in has a transient vulnerability. If the method fails, the EVR treats the value as <b>FALSE</b> (untrusted).
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-isintrustedvideomode
     */
    IsInTrustedVideoMode() {
        result := ComCall(3, this, BOOL.Ptr, &pYes := 0, "HRESULT")
        return pYes
    }

    /**
     * Queries whether the plug-in can limit the effective video resolution.
     * @remarks
     * Constriction is a protection mechanism that limits the effective resolution of the video frame to a specified maximum number of pixels.
     * 
     * Video constriction can be implemented by either the mixer or the presenter.
     * 
     * If the method returns <b>TRUE</b>, the EVR might call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-ievrtrustedvideoplugin-setconstriction">IEVRTrustedVideoPlugin::SetConstriction</a> at any time.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the plug-in can limit the effective video resolution. Otherwise, the plug-in cannot limit the video resolution. If the method fails, the EVR treats the value as <b>FALSE</b> (not supported).
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-canconstrict
     */
    CanConstrict() {
        result := ComCall(4, this, BOOL.Ptr, &pYes := 0, "HRESULT")
        return pYes
    }

    /**
     * Limits the effective video resolution.
     * @remarks
     * This method limits the effective resolution of the video image. The actual resolution on the target device might be higher, due to stretching the image.
     * 
     * The EVR might call this method at any time if the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-ievrtrustedvideoplugin-canconstrict">IEVRTrustedVideoPlugin::CanConstrict</a> method returns <b>TRUE</b>.
     * @param {Integer} dwKPix Maximum number of source pixels that may appear in the final video image, in thousands of pixels. If the value is zero, the video is disabled. If the value is MAXDWORD (0xFFFFFFFF), video constriction is removed and the video may be rendered at full resolution.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-setconstriction
     */
    SetConstriction(dwKPix) {
        result := ComCall(5, this, "uint", dwKPix, "HRESULT")
        return result
    }

    /**
     * Enables or disables the ability of the plug-in to export the video image.
     * @remarks
     * An EVR plug-in might expose a way for the application to get a copy of the video frames. For example, the standard EVR presenter implements <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-getcurrentimage">IMFVideoDisplayControl::GetCurrentImage</a>.
     * 
     * If the plug-in supports image exporting, this method enables or disables it. Before this method has been called for the first time, the EVR assumes that the mechanism is enabled.
     * 
     * If the plug-in does not support image exporting, this method should return S_OK and ignore the value of <i>bDisable</i>. If the method fails, the EVR treats it as a failure to enforce the policy, which will probably cause playback to stop.
     * 
     * While image exporting is disabled, any associated export method, such as <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-getcurrentimage">GetCurrentImage</a>, should return MF_E_LICENSE_INCORRECT_RIGHTS.
     * @param {BOOL} bDisable Boolean value. Specify <b>TRUE</b> to disable image exporting, or <b>FALSE</b> to enable it.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-disableimageexport
     */
    DisableImageExport(bDisable) {
        result := ComCall(6, this, BOOL, bDisable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEVRTrustedVideoPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsInTrustedVideoMode := CallbackCreate(GetMethod(implObj, "IsInTrustedVideoMode"), flags, 2)
        this.vtbl.CanConstrict := CallbackCreate(GetMethod(implObj, "CanConstrict"), flags, 2)
        this.vtbl.SetConstriction := CallbackCreate(GetMethod(implObj, "SetConstriction"), flags, 2)
        this.vtbl.DisableImageExport := CallbackCreate(GetMethod(implObj, "DisableImageExport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsInTrustedVideoMode)
        CallbackFree(this.vtbl.CanConstrict)
        CallbackFree(this.vtbl.SetConstriction)
        CallbackFree(this.vtbl.DisableImageExport)
    }
}

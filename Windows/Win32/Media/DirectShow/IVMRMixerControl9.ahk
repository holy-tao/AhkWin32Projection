#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VMR9ProcAmpControl.ahk" { VMR9ProcAmpControl }
#Import ".\VMR9ProcAmpControlRange.ahk" { VMR9ProcAmpControlRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VMR9NormalizedRect.ahk" { VMR9NormalizedRect }

/**
 * The IVMRMixerControl9 interface enables an application to manipulate the incoming video streams on the Video Mixing Renderer Filter 9 (VMR-9). This interface is intended for use by applications only; it should not be used by upstream filters.
 * @remarks
 * The VMR-9 supports this interface in mixing mode only. To enable mixing mode, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrfilterconfig9-setnumberofstreams">IVMRFilterConfig9::SetNumberOfStreams</a>. Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. 
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrmixercontrol9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRMixerControl9 extends IUnknown {
    /**
     * The interface identifier for IVMRMixerControl9
     * @type {Guid}
     */
    static IID := Guid("{1a777eaa-47c8-4930-b2c9-8fee1c1b0f3b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRMixerControl9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAlpha               : IntPtr
        GetAlpha               : IntPtr
        SetZOrder              : IntPtr
        GetZOrder              : IntPtr
        SetOutputRect          : IntPtr
        GetOutputRect          : IntPtr
        SetBackgroundClr       : IntPtr
        GetBackgroundClr       : IntPtr
        SetMixingPrefs         : IntPtr
        GetMixingPrefs         : IntPtr
        SetProcAmpControl      : IntPtr
        GetProcAmpControl      : IntPtr
        GetProcAmpControlRange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRMixerControl9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAlpha method sets a constant alpha value that is applied to this video stream.
     * @remarks
     * The alpha value specified can range from 0.0 (fully transparent) to 1.0 (full opaque).
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @param {Float} Alpha Specifies the alpha blending value to be applied to all the pixels in this stream.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setalpha
     */
    SetAlpha(dwStreamID, Alpha) {
        result := ComCall(3, this, "uint", dwStreamID, "float", Alpha, "HRESULT")
        return result
    }

    /**
     * The GetAlpha method retrieves the constant alpha value that is applied to this video stream.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @returns {Float} Pointer to a variable that receives the current alpha value.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getalpha
     */
    GetAlpha(dwStreamID) {
        result := ComCall(4, this, "uint", dwStreamID, "float*", &pAlpha := 0, "HRESULT")
        return pAlpha
    }

    /**
     * The SetZOrder method sets this video stream's position in the Z-order; larger values are further away.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @param {Integer} dwZ Double word containing the stream's position within the Z-order.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setzorder
     */
    SetZOrder(dwStreamID, dwZ) {
        result := ComCall(5, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * The GetZOrder method retrieves this video stream's position in the Z-order.
     * @remarks
     * The default Z-order is the order in which the pins were created.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @returns {Integer} Pointer that receives the current position in the Z-order.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getzorder
     */
    GetZOrder(dwStreamID) {
        result := ComCall(6, this, "uint", dwStreamID, "uint*", &pZ := 0, "HRESULT")
        return pZ
    }

    /**
     * The SetOutputRect method sets the position of this stream within the composition rectangle.
     * @remarks
     * Because this rectangle exists in compositional space, there is no such thing as an "invalid" rectangle. For example, set left greater than right to mirror the video in the x direction. Specifying an empty rectangle turns off this stream.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @param {Pointer<VMR9NormalizedRect>} pRect Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9normalizedrect">VMR9NormalizedRect</a> structure that specifies the position of the rectangle with composition space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pRect</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setoutputrect
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, VMR9NormalizedRect.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * The GetOutputRect method retrieves the position of this stream's video rectangle within the composition rectangle.
     * @remarks
     * Because this rectangle exists in compositional space, there is no such thing as an "invalid" rectangle. For example, if left is greater than right, it means the video is mirrored in the x direction. An empty rectangle turns off this stream.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @returns {VMR9NormalizedRect} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-normalizedrect">NORMALIZEDRECT</a> structure that receives the destination rectangle in composition space.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getoutputrect
     */
    GetOutputRect(dwStreamID) {
        pRect := VMR9NormalizedRect()
        result := ComCall(8, this, "uint", dwStreamID, VMR9NormalizedRect.Ptr, pRect, "HRESULT")
        return pRect
    }

    /**
     * The SetBackgroundClr method sets the background color on the output rectangle.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {COLORREF} ClrBkg Specifies the background color.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setbackgroundclr
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, COLORREF, ClrBkg, "HRESULT")
        return result
    }

    /**
     * The GetBackgroundClr method gets the current background color on the output rectangle.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer<COLORREF>} lpClrBkg Pointer to a variable that receives the background color.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getbackgroundclr
     */
    GetBackgroundClr(lpClrBkg) {
        lpClrBkgMarshal := lpClrBkg is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, lpClrBkgMarshal, lpClrBkg, "HRESULT")
        return result
    }

    /**
     * The SetMixingPrefs method sets the mixing preferences for the stream.
     * @remarks
     * The flags for the mixing preferences are divided into three groups: decimation, filtering, and render target. The VMR9MixerPrefs enumeration defines bitmasks to isolate these flags:
     * 
     * <ul>
     * <li>MixerPref9_DecimateMask</li>
     * <li>MixerPref9_FilteringMask</li>
     * <li>MixerPref9_RenderTargetMask</li>
     * </ul>
     * You must specify a valid flag for each group. If you want to change a single flag, you can get the current preferences, remove the flag you don't want, and add the flag you want. For example:
     * 
     * 
     * ```cpp
     * 
     * // Get the current mixing preferences.
     * DWORD dwPrefs;
     * pMixControl->GetMixingPrefs(&dwPrefs);  
     * 
     * // Remove the current render target flag.
     * dwPrefs &= ~MixerPref_RenderTargetMask; 
     * 
     * // Add the render target flag that we want.
     * dwPrefs |= MixerPref_RenderTargetYUV;
     * 
     * // Set the new flags.
     * pMixControl->SetMixingPrefs(dwPrefs);
     * 
     * ```
     * 
     * 
     * If the VMR is in renderless mode, you must set the allocator-presenter before calling <c>SetMixingPrefs</c>. Otherwise, the VMR cannot determine the capabilities of the Direct3D device.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwMixerPrefs Bitwise OR combination of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9mixerprefs">VMR9MixerPrefs</a> flags.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setmixingprefs
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * The GetMixingPrefs method retrieves the mixing preferences for the stream.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {Integer} Address of a variable that receives a bitwise OR combination of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9mixerprefs">VMR9MixerPrefs</a> flags.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getmixingprefs
     */
    GetMixingPrefs() {
        result := ComCall(12, this, "uint*", &pdwMixerPrefs := 0, "HRESULT")
        return pdwMixerPrefs
    }

    /**
     * The SetProcAmpControl method sets the image adjustment for the VMR-9.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @param {Pointer<VMR9ProcAmpControl>} lpClrControl Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9procampcontrol">VMR9ProcAmpControl</a> structure that contains the image adjustment settings.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. Possible causes of this error include:
     * 
     * <ul>
     * <li>The stream number is invalid</li>
     * <li>The value of <b>dwSize</b> in the <b>VMR9ProcAmpControl</b> structure is invalid.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_VMR_NO_PROCAMP_HW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics hardware does not support ProcAmp controls.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setprocampcontrol
     */
    SetProcAmpControl(dwStreamID, lpClrControl) {
        result := ComCall(13, this, "uint", dwStreamID, VMR9ProcAmpControl.Ptr, lpClrControl, "HRESULT")
        return result
    }

    /**
     * The GetProcAmpControl method retrieves the current image adjustment settings for the VMR-9.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @param {Pointer<VMR9ProcAmpControl>} lpClrControl Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9procampcontrol">VMR9ProcAmpControl</a> structure that receives the image adjustment settings. When the method returns, the <b>dwFlags</b> field indicates which properties are supported by the graphics driver. Set the <b>dwSize</b> member in the structure before calling this method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. Possible causes of this error include:
     * 
     * <ul>
     * <li>The stream number is invalid</li>
     * <li>The value of <b>dwSize</b> in the <b>VMR9ProcAmpControl</b> structure is invalid.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_VMR_NO_PROCAMP_HW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics hardware does not support ProcAmp controls.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrol
     */
    GetProcAmpControl(dwStreamID, lpClrControl) {
        result := ComCall(14, this, "uint", dwStreamID, VMR9ProcAmpControl.Ptr, lpClrControl, "HRESULT")
        return result
    }

    /**
     * The GetProcAmpControlRange method retrieves the range of values for an image adjustment setting, such as brightness, contrast, hue, or saturation.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @param {Pointer<VMR9ProcAmpControlRange>} lpClrControl Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9procampcontrolrange">VMR9ProcAmpControlRange</a> structure that receives the range. The caller must set the <b>dwSize</b> and <b>dwProperty</b> fields.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. Possible causes of this error include:
     * 
     * <ul>
     * <li>The stream number is invalid</li>
     * <li>The value of <b>dwSize</b> or <b>dwProperty</b> in the <b>VMR9ProcAmpControl</b> structure is invalid.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_VMR_NO_PROCAMP_HW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics hardware does not support ProcAmp controls.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrolrange
     */
    GetProcAmpControlRange(dwStreamID, lpClrControl) {
        result := ComCall(15, this, "uint", dwStreamID, VMR9ProcAmpControlRange.Ptr, lpClrControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRMixerControl9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAlpha := CallbackCreate(GetMethod(implObj, "SetAlpha"), flags, 3)
        this.vtbl.GetAlpha := CallbackCreate(GetMethod(implObj, "GetAlpha"), flags, 3)
        this.vtbl.SetZOrder := CallbackCreate(GetMethod(implObj, "SetZOrder"), flags, 3)
        this.vtbl.GetZOrder := CallbackCreate(GetMethod(implObj, "GetZOrder"), flags, 3)
        this.vtbl.SetOutputRect := CallbackCreate(GetMethod(implObj, "SetOutputRect"), flags, 3)
        this.vtbl.GetOutputRect := CallbackCreate(GetMethod(implObj, "GetOutputRect"), flags, 3)
        this.vtbl.SetBackgroundClr := CallbackCreate(GetMethod(implObj, "SetBackgroundClr"), flags, 2)
        this.vtbl.GetBackgroundClr := CallbackCreate(GetMethod(implObj, "GetBackgroundClr"), flags, 2)
        this.vtbl.SetMixingPrefs := CallbackCreate(GetMethod(implObj, "SetMixingPrefs"), flags, 2)
        this.vtbl.GetMixingPrefs := CallbackCreate(GetMethod(implObj, "GetMixingPrefs"), flags, 2)
        this.vtbl.SetProcAmpControl := CallbackCreate(GetMethod(implObj, "SetProcAmpControl"), flags, 3)
        this.vtbl.GetProcAmpControl := CallbackCreate(GetMethod(implObj, "GetProcAmpControl"), flags, 3)
        this.vtbl.GetProcAmpControlRange := CallbackCreate(GetMethod(implObj, "GetProcAmpControlRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAlpha)
        CallbackFree(this.vtbl.GetAlpha)
        CallbackFree(this.vtbl.SetZOrder)
        CallbackFree(this.vtbl.GetZOrder)
        CallbackFree(this.vtbl.SetOutputRect)
        CallbackFree(this.vtbl.GetOutputRect)
        CallbackFree(this.vtbl.SetBackgroundClr)
        CallbackFree(this.vtbl.GetBackgroundClr)
        CallbackFree(this.vtbl.SetMixingPrefs)
        CallbackFree(this.vtbl.GetMixingPrefs)
        CallbackFree(this.vtbl.SetProcAmpControl)
        CallbackFree(this.vtbl.GetProcAmpControl)
        CallbackFree(this.vtbl.GetProcAmpControlRange)
    }
}

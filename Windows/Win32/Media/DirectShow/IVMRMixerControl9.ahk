#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VMR9NormalizedRect.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMixerControl9 interface enables an application to manipulate the incoming video streams on the Video Mixing Renderer Filter 9 (VMR-9). This interface is intended for use by applications only; it should not be used by upstream filters.
 * @remarks
 * 
 * The VMR-9 supports this interface in mixing mode only. To enable mixing mode, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrfilterconfig9-setnumberofstreams">IVMRFilterConfig9::SetNumberOfStreams</a>. Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. 
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrmixercontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMixerControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMixerControl9
     * @type {Guid}
     */
    static IID => Guid("{1a777eaa-47c8-4930-b2c9-8fee1c1b0f3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlpha", "GetAlpha", "SetZOrder", "GetZOrder", "SetOutputRect", "GetOutputRect", "SetBackgroundClr", "GetBackgroundClr", "SetMixingPrefs", "GetMixingPrefs", "SetProcAmpControl", "GetProcAmpControl", "GetProcAmpControlRange"]

    /**
     * The SetAlpha method sets a constant alpha value that is applied to this video stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-setalpha
     */
    SetAlpha(dwStreamID, Alpha) {
        result := ComCall(3, this, "uint", dwStreamID, "float", Alpha, "HRESULT")
        return result
    }

    /**
     * The GetAlpha method retrieves the constant alpha value that is applied to this video stream.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @returns {Float} Pointer to a variable that receives the current alpha value.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getalpha
     */
    GetAlpha(dwStreamID) {
        result := ComCall(4, this, "uint", dwStreamID, "float*", &pAlpha := 0, "HRESULT")
        return pAlpha
    }

    /**
     * The SetZOrder method sets this video stream's position in the Z-order; larger values are further away.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-setzorder
     */
    SetZOrder(dwStreamID, dwZ) {
        result := ComCall(5, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * The GetZOrder method retrieves this video stream's position in the Z-order.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @returns {Integer} Pointer that receives the current position in the Z-order.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getzorder
     */
    GetZOrder(dwStreamID) {
        result := ComCall(6, this, "uint", dwStreamID, "uint*", &pZ := 0, "HRESULT")
        return pZ
    }

    /**
     * The SetOutputRect method sets the position of this stream within the composition rectangle.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-setoutputrect
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * The GetOutputRect method retrieves the position of this stream's video rectangle within the composition rectangle.
     * @param {Integer} dwStreamID Specifies the input stream. This value corresponds to the input pin. For example, the first input pin is stream 0.
     * @returns {VMR9NormalizedRect} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ns-strmif-normalizedrect">NORMALIZEDRECT</a> structure that receives the destination rectangle in composition space.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getoutputrect
     */
    GetOutputRect(dwStreamID) {
        pRect := VMR9NormalizedRect()
        result := ComCall(8, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * The SetBackgroundClr method sets the background color on the output rectangle.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-setbackgroundclr
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, "uint", ClrBkg, "HRESULT")
        return result
    }

    /**
     * The GetBackgroundClr method gets the current background color on the output rectangle.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getbackgroundclr
     */
    GetBackgroundClr(lpClrBkg) {
        lpClrBkgMarshal := lpClrBkg is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, lpClrBkgMarshal, lpClrBkg, "HRESULT")
        return result
    }

    /**
     * The SetMixingPrefs method sets the mixing preferences for the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-setmixingprefs
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * The GetMixingPrefs method retrieves the mixing preferences for the stream.
     * @returns {Integer} Address of a variable that receives a bitwise OR combination of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9mixerprefs">VMR9MixerPrefs</a> flags.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getmixingprefs
     */
    GetMixingPrefs() {
        result := ComCall(12, this, "uint*", &pdwMixerPrefs := 0, "HRESULT")
        return pdwMixerPrefs
    }

    /**
     * The SetProcAmpControl method sets the image adjustment for the VMR-9.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-setprocampcontrol
     */
    SetProcAmpControl(dwStreamID, lpClrControl) {
        result := ComCall(13, this, "uint", dwStreamID, "ptr", lpClrControl, "HRESULT")
        return result
    }

    /**
     * The GetProcAmpControl method retrieves the current image adjustment settings for the VMR-9.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrol
     */
    GetProcAmpControl(dwStreamID, lpClrControl) {
        result := ComCall(14, this, "uint", dwStreamID, "ptr", lpClrControl, "HRESULT")
        return result
    }

    /**
     * The GetProcAmpControlRange method retrieves the range of values for an image adjustment setting, such as brightness, contrast, hue, or saturation.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrolrange
     */
    GetProcAmpControlRange(dwStreamID, lpClrControl) {
        result := ComCall(15, this, "uint", dwStreamID, "ptr", lpClrControl, "HRESULT")
        return result
    }
}

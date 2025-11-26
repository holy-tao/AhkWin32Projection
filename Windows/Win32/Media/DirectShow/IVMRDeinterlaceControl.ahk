#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRDeinterlaceControl interface provides support for advanced hardware-accelerated deinterlacing using the Video Mixing Renderer Filter 7 (VMR-7).
 * @remarks
 * 
 * This interface is applicable only when the VMR is in mixer mode. All methods in this interface return VFW_E_VMR_NOT_IN_MIXER_MODE if the VMR is not in mixer mode.
 * 
 * Deinterlacing modes are identified by GUIDs. The graphics device driver returns an array of GUIDs for the modes that it supports. The array is sorted in order of quality, from best quality to lowest quality. To retrieve the list of GUIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-getnumberofdeinterlacemodes">GetNumberOfDeinterlaceModes</a> method. To obtain more information about a particular mode, pass this GUID to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-getdeinterlacemodecaps">GetDeinterlaceModeCaps</a> method. To configure the VMR to use a particular mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-setdeinterlacemode">SetDeinterlaceMode</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrdeinterlacecontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRDeinterlaceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRDeinterlaceControl
     * @type {Guid}
     */
    static IID => Guid("{bb057577-0db8-4e6a-87a7-1a8c9a505a0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberOfDeinterlaceModes", "GetDeinterlaceModeCaps", "GetDeinterlaceMode", "SetDeinterlaceMode", "GetDeinterlacePrefs", "SetDeinterlacePrefs", "GetActualDeinterlaceMode"]

    /**
     * The GetNumberOfDeinterlaceModes method retrieves the deinterlacing modes available to the VMR for the specified video format.
     * @param {Pointer<VMRVideoDesc>} lpVideoDescription Pointer to a [VMRVideoDesc](/windows/desktop/api/strmif/ns-strmif-vmrvideodesc) structure that describes the video.
     * @param {Pointer<Integer>} lpdwNumDeinterlaceModes Pointer to a <b>DWORD</b> value. On input, this value specifies the size of the array given in <i>lpDeinterlaceModes</i>. On output, it receives number of GUIDs the method copied into the array.
     * @returns {Guid} Address of an array allocated by caller. The method fills the array with GUID values. To determine the size of the array that is needed, set this parameter to <b>NULL</b> and check the value returned in <i>lpdwNumDeinterlaceModes</i>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-getnumberofdeinterlacemodes
     */
    GetNumberOfDeinterlaceModes(lpVideoDescription, lpdwNumDeinterlaceModes) {
        lpdwNumDeinterlaceModesMarshal := lpdwNumDeinterlaceModes is VarRef ? "uint*" : "ptr"

        lpDeinterlaceModes := Guid()
        result := ComCall(3, this, "ptr", lpVideoDescription, lpdwNumDeinterlaceModesMarshal, lpdwNumDeinterlaceModes, "ptr", lpDeinterlaceModes, "HRESULT")
        return lpDeinterlaceModes
    }

    /**
     * The GetDeinterlaceModeCaps method retrieves the capabilities of a specific deinterlacing mode supported by the graphics device driver.
     * @param {Pointer<Guid>} lpDeinterlaceMode Pointer to a GUID that identifies the deinterlacing mode. Call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-getnumberofdeinterlacemodes">GetNumberOfDeinterlaceModes</a> method to obtain a list of GUIDs supported by the driver.
     * @param {Pointer<VMRVideoDesc>} lpVideoDescription Pointer to a [VMRVideoDesc](/windows/desktop/api/strmif/ns-strmif-vmrvideodesc) structure describing the video to deinterlace. Set the <b>dwSize</b> member of the structure before calling the method.
     * @param {Pointer<VMRDeinterlaceCaps>} lpDeinterlaceCaps Pointer to a [VMRDeinterlaceCaps](/windows/desktop/api/strmif/ns-strmif-vmrdeinterlacecaps) structure. Set the <b>dwSize</b> member of the structure before calling the method. The method fills the structure with information about the specified deinterlacing mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DDRAW_CAPS_NOT_SUITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video card does not support hardware deinterlacing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_VMR_NO_DEINTERLACE_HW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video card does not support hardware deinterlacing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_VMR_NOT_IN_MIXER_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in mixer mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-getdeinterlacemodecaps
     */
    GetDeinterlaceModeCaps(lpDeinterlaceMode, lpVideoDescription, lpDeinterlaceCaps) {
        result := ComCall(4, this, "ptr", lpDeinterlaceMode, "ptr", lpVideoDescription, "ptr", lpDeinterlaceCaps, "HRESULT")
        return result
    }

    /**
     * The GetDeinterlaceMode method retrieves the deinterlacing mode for the specified video stream.
     * @param {Integer} dwStreamID Index of the video stream to check.
     * @returns {Guid} Pointer to a variable that receives a GUID. The GUID identifies the deinterlacing mode currently in use. If no deinterlacing mode was set, the value is GUID_NULL.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-getdeinterlacemode
     */
    GetDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(5, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return lpDeinterlaceMode
    }

    /**
     * The SetDeinterlaceMode method sets the deinterlacing mode for the specified video stream.
     * @param {Integer} dwStreamID Index of the video stream to set. To set all streams, use the value 0xFFFFFFFF.
     * @param {Pointer<Guid>} lpDeinterlaceMode Pointer to a GUID that specifies the deinterlacing mode. To turn off deinterlacing, use the value GUID_NULL.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Invalid stream number.
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
     * <dt><b>VFW_E_VMR_NOT_IN_MIXER_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in mixer mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-setdeinterlacemode
     */
    SetDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return result
    }

    /**
     * The GetDeinterlacePrefs method queries how the VMR will select a deinterlacing mode if it cannot use the preferred deinterlacing mode.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrdeinterlaceprefs">VMRDeinterlacePrefs</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-getdeinterlaceprefs
     */
    GetDeinterlacePrefs() {
        result := ComCall(7, this, "uint*", &lpdwDeinterlacePrefs := 0, "HRESULT")
        return lpdwDeinterlacePrefs
    }

    /**
     * The SetDeinterlacePrefs method specifies how the VMR will select a deinterlacing mode if it cannot use the preferred deinterlacing mode.
     * @param {Integer} dwDeinterlacePrefs A member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrdeinterlaceprefs">VMRDeinterlacePrefs</a> enumeration type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     *           
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
     * Invalid argument.
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
     * <dt><b>VFW_E_VMR_NOT_IN_MIXER_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in mixer mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-setdeinterlaceprefs
     */
    SetDeinterlacePrefs(dwDeinterlacePrefs) {
        result := ComCall(8, this, "uint", dwDeinterlacePrefs, "HRESULT")
        return result
    }

    /**
     * The GetActualDeinterlaceMode method returns the deinterlacing mode that the VMR is using for a specified stream.
     * @param {Integer} dwStreamID Index of the video stream.
     * @returns {Guid} Pointer to a variable that receives a GUID value that identifies the deinterlacing mode. The method returns GUID_NULL if the VMR has not initialized the deinterlacing hardware, or if the VMR determines that this stream should not be deinterlaced.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrdeinterlacecontrol-getactualdeinterlacemode
     */
    GetActualDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(9, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return lpDeinterlaceMode
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VMR9DeinterlaceCaps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRDeinterlaceControl9 interface supports hardware-accelerated deinterlacing using the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
 * Deinterlacing modes are identified by GUIDs. The graphics device driver returns an array of GUIDs for the modes that it supports. The array is sorted in order of quality, from best quality to lowest quality. To retrieve the list of GUIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">GetNumberOfDeinterlaceModes</a> method. To obtain more information about a particular mode, pass this GUID to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">GetDeinterlaceModeCaps</a> method. To configure the VMR to use a particular mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode">SetDeinterlaceMode</a> method.
 * 
 * To determine what de-interlacing modes are available, perform these steps:
 * 
 * <ol>
 * <li>Create the VMR-9 and put it into mixing mode.
 *       </li>
 * <li>Query the VMR-9 for the <b>IVMRDeinterlaceControl9</b> interface</li>
 * <li>Fill in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ns-strmif-vmrvideodesc">VMRVideoDesc</a> structure that describes the format of the interlaced video.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">IVMRDeinterlaceControl9::GetNumberOfDeinterlaceModes</a> to get the number of available de-interlacing modes.</li>
 * <li>For each mode returned, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">IVMRDeinterlaceControl::GetDeinterlaceModeCaps</a> to get information about the mode.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrdeinterlacecontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRDeinterlaceControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRDeinterlaceControl9
     * @type {Guid}
     */
    static IID => Guid("{a215fb8d-13c2-4f7f-993c-003d6271a459}")

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
     * @param {Pointer<VMR9VideoDesc>} lpVideoDescription Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videodesc">VMR9VideoDesc</a> structure that describes the video.
     * @param {Pointer<Integer>} lpdwNumDeinterlaceModes Pointer to a <b>DWORD</b> value. On input, this value specifies the size of the array given in <i>lpDeinterlaceModes</i>. On output, it receives number of GUIDs the method copied into the array.
     * @returns {Guid} Address of an array allocated by caller. The method fills the array with GUID values. To determine the size of the array that is needed, set this parameter to <b>NULL</b> and check the value returned in <i>lpdwNumDeinterlaceModes</i>.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes
     */
    GetNumberOfDeinterlaceModes(lpVideoDescription, lpdwNumDeinterlaceModes) {
        lpdwNumDeinterlaceModesMarshal := lpdwNumDeinterlaceModes is VarRef ? "uint*" : "ptr"

        lpDeinterlaceModes := Guid()
        result := ComCall(3, this, "ptr", lpVideoDescription, lpdwNumDeinterlaceModesMarshal, lpdwNumDeinterlaceModes, "ptr", lpDeinterlaceModes, "HRESULT")
        return lpDeinterlaceModes
    }

    /**
     * The GetDeinterlaceModeCaps method gets the capabilities of a deinterlacing mode supported by the graphics device driver.
     * @param {Pointer<Guid>} lpDeinterlaceMode Pointer to a GUID that identifies the deinterlacing mode. Call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">IVMRDeinterlaceControl9::GetNumberOfDeinterlaceModes</a> method to obtain a list of GUIDs supported by the driver.
     * @param {Pointer<VMR9VideoDesc>} lpVideoDescription Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videodesc">VMR9VideoDesc</a> structure describing the video to deinterlace.
     *           Set the <b>dwSize</b> member of the structure before calling the method.
     * @returns {VMR9DeinterlaceCaps} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9deinterlacecaps">VMR9DeinterlaceCaps</a> structure. Set the <b>dwSize</b> member of the structure before calling the method. The method fills the structure with information about the specified deinterlacing mode.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps
     */
    GetDeinterlaceModeCaps(lpDeinterlaceMode, lpVideoDescription) {
        lpDeinterlaceCaps := VMR9DeinterlaceCaps()
        result := ComCall(4, this, "ptr", lpDeinterlaceMode, "ptr", lpVideoDescription, "ptr", lpDeinterlaceCaps, "HRESULT")
        return lpDeinterlaceCaps
    }

    /**
     * The GetDeinterlaceMode method retrieves the deinterlacing mode for the specified video stream.
     * @param {Integer} dwStreamID Index of the video stream to check.
     * @returns {Guid} Pointer to a variable that receives a GUID. The GUID identifies the deinterlacing mode currently in use. If no deinterlacing mode was set, or the pin corresponding to the stream ID is not connected to an interlaced stream, the value is GUID_NULL.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemode
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode
     */
    SetDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return result
    }

    /**
     * The GetDeinterlacePrefs method queries how the VMR will select a deinterlacing mode if it cannot use the preferred deinterlacing mode.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9deinterlaceprefs">VMR9DeinterlacePrefs</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlaceprefs
     */
    GetDeinterlacePrefs() {
        result := ComCall(7, this, "uint*", &lpdwDeinterlacePrefs := 0, "HRESULT")
        return lpdwDeinterlacePrefs
    }

    /**
     * The SetDeinterlacePrefs method specifies how the VMR will select a deinterlacing mode if it cannot use the preferred deinterlacing mode.
     * @param {Integer} dwDeinterlacePrefs Specifies a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9deinterlaceprefs">VMR9DeinterlacePrefs</a> enumeration type.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlaceprefs
     */
    SetDeinterlacePrefs(dwDeinterlacePrefs) {
        result := ComCall(8, this, "uint", dwDeinterlacePrefs, "HRESULT")
        return result
    }

    /**
     * The GetActualDeinterlaceMode method returns the deinterlacing mode that the VMR is using for a specified stream.
     * @param {Integer} dwStreamID Index of the video stream.
     * @returns {Guid} Pointer to a variable that receives a GUID value that identifies the deinterlacing mode. The method returns GUID_NULL if the VMR has not initialized the deinterlacing hardware, or if the VMR determines that this stream should not be deinterlaced.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getactualdeinterlacemode
     */
    GetActualDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(9, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return lpDeinterlaceMode
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VMR9DeinterlaceCaps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRDeinterlaceControl9 interface supports hardware-accelerated deinterlacing using the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * Deinterlacing modes are identified by GUIDs. The graphics device driver returns an array of GUIDs for the modes that it supports. The array is sorted in order of quality, from best quality to lowest quality. To retrieve the list of GUIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">GetNumberOfDeinterlaceModes</a> method. To obtain more information about a particular mode, pass this GUID to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">GetDeinterlaceModeCaps</a> method. To configure the VMR to use a particular mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode">SetDeinterlaceMode</a> method.
 * 
 * To determine what de-interlacing modes are available, perform these steps:
 * 
 * <ol>
 * <li>Create the VMR-9 and put it into mixing mode.
 *       </li>
 * <li>Query the VMR-9 for the <b>IVMRDeinterlaceControl9</b> interface</li>
 * <li>Fill in a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrvideodesc">VMRVideoDesc</a> structure that describes the format of the interlaced video.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">IVMRDeinterlaceControl9::GetNumberOfDeinterlaceModes</a> to get the number of available de-interlacing modes.</li>
 * <li>For each mode returned, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">IVMRDeinterlaceControl::GetDeinterlaceModeCaps</a> to get information about the mode.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nn-vmr9-ivmrdeinterlacecontrol9
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
     * @remarks
     * This method returns an array of GUIDs, where each GUID represents a deinterlacing mode that is supported in hardware by the graphics device driver. The array is sorted by quality, so the first entry represents the best quality, the second entry represents the next best quality, and so forth.
     * 
     * All drivers are required to support the following mode:
     * 
     * <table>
     * <tr>
     * <th><b>GUID</b></th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>DXVA_DeinterlaceBobDevice</td>
     * <td>Bob mode</td>
     * </tr>
     * </table>
     *  
     * 
     * Drivers can support additional modes and should define their own GUIDs to identify them. For each returned mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">IVMRDeinterlaceControl9::GetDeinterlaceModeCaps</a> method to get information about that mode.
     * @param {Pointer<VMR9VideoDesc>} lpVideoDescription Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videodesc">VMR9VideoDesc</a> structure that describes the video.
     * @param {Pointer<Integer>} lpdwNumDeinterlaceModes Pointer to a <b>DWORD</b> value. On input, this value specifies the size of the array given in <i>lpDeinterlaceModes</i>. On output, it receives number of GUIDs the method copied into the array.
     * @returns {Guid} Address of an array allocated by caller. The method fills the array with GUID values. To determine the size of the array that is needed, set this parameter to <b>NULL</b> and check the value returned in <i>lpdwNumDeinterlaceModes</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes
     */
    GetNumberOfDeinterlaceModes(lpVideoDescription, lpdwNumDeinterlaceModes) {
        lpdwNumDeinterlaceModesMarshal := lpdwNumDeinterlaceModes is VarRef ? "uint*" : "ptr"

        lpDeinterlaceModes := Guid()
        result := ComCall(3, this, "ptr", lpVideoDescription, lpdwNumDeinterlaceModesMarshal, lpdwNumDeinterlaceModes, "ptr", lpDeinterlaceModes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpDeinterlaceModes
    }

    /**
     * The GetDeinterlaceModeCaps method gets the capabilities of a deinterlacing mode supported by the graphics device driver.
     * @remarks
     * The method returns <b>E_INVALIDARG</b> if you do not set the <b>dwSize</b> member in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videodesc">VMR9VideoDesc</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9deinterlacecaps">VMR9DeinterlaceCaps</a> structures.
     * @param {Pointer<Guid>} lpDeinterlaceMode Pointer to a GUID that identifies the deinterlacing mode. Call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">IVMRDeinterlaceControl9::GetNumberOfDeinterlaceModes</a> method to obtain a list of GUIDs supported by the driver.
     * @param {Pointer<VMR9VideoDesc>} lpVideoDescription Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videodesc">VMR9VideoDesc</a> structure describing the video to deinterlace.
     *           Set the <b>dwSize</b> member of the structure before calling the method.
     * @returns {VMR9DeinterlaceCaps} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9deinterlacecaps">VMR9DeinterlaceCaps</a> structure. Set the <b>dwSize</b> member of the structure before calling the method. The method fills the structure with information about the specified deinterlacing mode.
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps
     */
    GetDeinterlaceModeCaps(lpDeinterlaceMode, lpVideoDescription) {
        lpDeinterlaceCaps := VMR9DeinterlaceCaps()
        result := ComCall(4, this, "ptr", lpDeinterlaceMode, "ptr", lpVideoDescription, "ptr", lpDeinterlaceCaps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpDeinterlaceCaps
    }

    /**
     * The GetDeinterlaceMode method retrieves the deinterlacing mode for the specified video stream.
     * @remarks
     * The VMR may not be able to use the requested mode, in which case it falls back to another deinterlace mode, as specified in the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlaceprefs">IVMRDeinterlaceControl9::SetDeinterlacePrefs</a> method.
     * @param {Integer} dwStreamID Index of the video stream to check.
     * @returns {Guid} Pointer to a variable that receives a GUID. The GUID identifies the deinterlacing mode currently in use. If no deinterlacing mode was set, or the pin corresponding to the stream ID is not connected to an interlaced stream, the value is GUID_NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemode
     */
    GetDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(5, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpDeinterlaceMode
    }

    /**
     * The SetDeinterlaceMode method sets the deinterlacing mode for the specified video stream.
     * @remarks
     * If the application does not specify the mode, the VMR defaults to the first mode reported by the driver. In either case, if the VMR cannot use the preferred mode, it falls back to another mode as specified in the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlaceprefs">IVMRDeinterlaceControl9::SetDeinterlacePrefs</a> method.
     * 
     * The <b>SetDeinterlaceMode</b> method is effective only for new connections made to the VMR. Some deinterlacing mode require that additional reference samples be available; the exact number depends on the mode. The VMR allocates surfaces for these additional samples. The client must set the deinterlace mode before the surfaces have been allocated. Surface allocation occurs after any of the following:
     * 
     * <ul>
     * <li>Pin connections, including dynamic reconnections</li>
     * <li>Dynamic format changes (the upstream filter calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-receiveconnection">IPin::ReceiveConnection</a> to specify a new format)</li>
     * <li>Resolution changes</li>
     * <li>Monitor changes</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode
     */
    SetDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDeinterlacePrefs method queries how the VMR will select a deinterlacing mode if it cannot use the preferred deinterlacing mode.
     * @remarks
     * By default, the preferred deinterlacing mode is the first mode reported by the driver. The application can set the preferred mode by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode">IVMRDeinterlaceControl9::SetDeinterlaceMode</a> method. If the VMR cannot use the preferred mode, it will fall back to another mode as specified by the <i>dwDeinterlacePrefs</i> parameter.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9deinterlaceprefs">VMR9DeinterlacePrefs</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlaceprefs
     */
    GetDeinterlacePrefs() {
        result := ComCall(7, this, "uint*", &lpdwDeinterlacePrefs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpdwDeinterlacePrefs
    }

    /**
     * The SetDeinterlacePrefs method specifies how the VMR will select a deinterlacing mode if it cannot use the preferred deinterlacing mode.
     * @remarks
     * By default, the preferred deinterlacing mode is the first mode reported by the driver. The application can set the preferred mode by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode">IVMRDeinterlaceControl9::SetDeinterlaceMode</a> method. If the VMR cannot use the preferred mode, it will fall back to another mode as specified by the <i>dwDeinterlacePrefs</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlaceprefs
     */
    SetDeinterlacePrefs(dwDeinterlacePrefs) {
        result := ComCall(8, this, "uint", dwDeinterlacePrefs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetActualDeinterlaceMode method returns the deinterlacing mode that the VMR is using for a specified stream.
     * @param {Integer} dwStreamID Index of the video stream.
     * @returns {Guid} Pointer to a variable that receives a GUID value that identifies the deinterlacing mode. The method returns GUID_NULL if the VMR has not initialized the deinterlacing hardware, or if the VMR determines that this stream should not be deinterlaced.
     * @see https://learn.microsoft.com/windows/win32/api//content/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getactualdeinterlacemode
     */
    GetActualDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(9, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpDeinterlaceMode
    }
}

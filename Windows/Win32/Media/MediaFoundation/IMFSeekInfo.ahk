#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * For a particular seek position, gets the two nearest key frames.
 * @remarks
 * 
 * A media source can implement this interface as an optional service. To get a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfgetservice">IMFGetService::GetService</a> with the service identifier <b>MF_SCRUBBING_SERVICE</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfseekinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSeekInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSeekInfo
     * @type {Guid}
     */
    static IID => Guid("{26afea53-d9ed-42b5-ab80-e64f9ee34779}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNearestKeyFrames"]

    /**
     * For a particular seek position, gets the two nearest key frames.
     * @param {Pointer<Guid>} pguidTimeFormat A pointer to a GUID that specifies the time format. The time format defines the units for the other parameters of this method. If the value is <b>GUID_NULL</b>, the time format is 100-nanosecond units. Some media sources might support additional time format GUIDs.
     * @param {Pointer<PROPVARIANT>} pvarStartPosition The seek position. The units for this parameter are specified by <i>pguidTimeFormat</i>.
     * @param {Pointer<PROPVARIANT>} pvarPreviousKeyFrame Receives the position of the nearest key frame that appears earlier than <i>pvarStartPosition</i>. The units for this parameter are specified by <i>pguidTimeFormat</i>.
     * @param {Pointer<PROPVARIANT>} pvarNextKeyFrame Receives the position of the nearest key frame that appears later than <i>pvarStartPosition</i>. The units for this parameter are specified by <i>pguidTimeFormat</i>.
     * @returns {HRESULT} This method can return one of these values.
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
     * <dt><b>MF_E_UNSUPPORTED_TIME_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time format specified in <i>pguidTimeFormat</i> is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfseekinfo-getnearestkeyframes
     */
    GetNearestKeyFrames(pguidTimeFormat, pvarStartPosition, pvarPreviousKeyFrame, pvarNextKeyFrame) {
        result := ComCall(3, this, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "ptr", pvarPreviousKeyFrame, "ptr", pvarNextKeyFrame, "HRESULT")
        return result
    }
}

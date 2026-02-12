#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets or sets the playback rate.
 * @remarks
 * Objects can expose this interface as a service. To obtain a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> with the service identifier MF_RATE_CONTROL_SERVICE. The Media Session supports this interface. Media sources and transforms support this interface if they support rate changes. Media sinks do not need to support this interface. Media sinks are notified of rate changes through the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclocksetrate">IMFClockStateSink::OnClockSetRate</a> method.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
 * 
 * To discover the playback rates that an object supports, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfratesupport">IMFRateSupport</a> interface
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfratecontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRateControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRateControl
     * @type {Guid}
     */
    static IID => Guid("{88ddcd21-03c3-4275-91ed-55ee3929328f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRate", "GetRate"]

    /**
     * Sets the playback rate. (IMFRateControl.SetRate)
     * @remarks
     * The Media Session prevents some transitions between rate boundaries, depending on the current playback state:
     * 
     * <table>
     * <tr>
     * <th>Playback State</th>
     * <th>Forward/Reverse</th>
     * <th>Forward/Zero</th>
     * <th>Reverse/Zero</th>
     * </tr>
     * <tr>
     * <td>Running</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <td>Paused</td>
     * <td>No</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <td>Stopped</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * </tr>
     * </table>
     *  
     * 
     * If the transition is not supported, the method returns <b>MF_E_UNSUPPORTED_RATE_TRANSITION</b>.
     * 
     * When a media source completes a call to <b>SetRate</b>, it sends the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourceratechanged">MESourceRateChanged</a> event. Other pipeline components do not send this event.
     * 
     * If a media source switches between thinned and non-thinned playback, the streams send an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamthinmode">MEStreamThinMode</a> event to indicate the transition. Events from the media source are not synchronized with events from the media streams. After you receive the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourceratechanged">MESourceRateChanged</a> event, you can still receive samples that were queued before the stream switched to thinned or non-thinned mode. The MEStreamThinMode event marks the exact point in the stream where the transition occurs.
     * 
     * When the Media Session completes a call to <b>SetRate</b>, it sends the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesessionratechanged">MESessionRateChanged</a> event.
     * @param {BOOL} fThin If <b>TRUE</b>, the media streams are thinned. Otherwise, the stream is not thinned. For media sources and demultiplexers, the object must thin the streams when this parameter is <b>TRUE</b>. For downstream transforms, such as decoders and multiplexers, this parameter is informative; it notifies the object that the input streams are thinned. For information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
     * @param {Float} flRate The requested playback rate. Positive values indicate forward playback, negative values indicate reverse playback, and zero indicates scrubbing (the source delivers a single frame).
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_REVERSE_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support reverse playback.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_THINNING_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support thinning.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support the requested playback rate.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_RATE_TRANSITION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object cannot change to the new rate while in the running state.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfratecontrol-setrate
     */
    SetRate(fThin, flRate) {
        result := ComCall(3, this, "int", fThin, "float", flRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current playback rate. (IMFRateControl.GetRate)
     * @param {Pointer<BOOL>} pfThin Receives the value <b>TRUE</b> if the stream is currently being thinned. If the object does not support thinning, this parameter always receives the value <b>FALSE</b>. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
     * @param {Pointer<Float>} pflRate Receives the current playback rate.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfratecontrol-getrate
     */
    GetRate(pfThin, pflRate) {
        pfThinMarshal := pfThin is VarRef ? "int*" : "ptr"
        pflRateMarshal := pflRate is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, pfThinMarshal, pfThin, pflRateMarshal, pflRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

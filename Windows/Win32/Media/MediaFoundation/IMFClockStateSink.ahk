#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives state-change notifications from the presentation clock.
 * @remarks
 * To receive state-change notifications from the presentation clock, implement this interface and call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-addclockstatesink">IMFPresentationClock::AddClockStateSink</a> on the presentation clock.
 * 
 * This interface must be implemented by:
 * 
 * <ul>
 * <li>
 * Presentation time sources. The presentation clock uses this interface to request change states from the time source.
 * 
 * </li>
 * <li>
 * Media sinks. Media sinks use this interface to get notifications when the presentation clock changes.
 * 
 * </li>
 * </ul>
 * Other objects that need to be notified can implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfclockstatesink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFClockStateSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFClockStateSink
     * @type {Guid}
     */
    static IID => Guid("{f6696e82-74f7-4f3d-a178-8a5e09c3659f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnClockStart", "OnClockStop", "OnClockPause", "OnClockRestart", "OnClockSetRate"]

    /**
     * Called when the presentation clock starts.
     * @remarks
     * This method is called when the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">IMFPresentationClock::Start</a> method is called, with the following exception: If the clock is paused and <b>Start</b> is called with the value <b>PRESENTATION_CURRENT_POSITION</b>, <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockrestart">IMFClockStateSink::OnClockRestart</a> is called instead of <b>OnClockStart</b>.
     * 
     * The clock notifies the presentation time source by calling the time source's <b>OnClockStart</b> method. This call occurs synchronously within the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">Start</a> method. If the time source returns an error from <b>OnClockStart</b>, the presentation clock's <b>Start</b> method returns an error and the state change does not take place.
     * 
     * For any object that is not the presentation time source, the <b>OnClockStart</b> method is called asynchronously, after the state change is completed. In that case, the return value from this method is ignored.
     * 
     * The value given in <i>llClockStartOffset</i> is the presentation time when the clock starts, so it is relative to the start of the presentation. Media sinks should not render any data with a presentation time earlier than <i>llClockStartOffSet</i>. If a sample straddles the offset—that is, if the offset falls between the sample's start and stop times—the sink should either trim the sample so that only data after <i>llClockStartOffset</i> is rendered, or else simply drop the sample.
     * @param {Integer} hnsSystemTime The system time when the clock started, in 100-nanosecond units.
     * @param {Integer} llClockStartOffset The new starting time for the clock, in 100-nanosecond units. This parameter can also equal <b>PRESENTATION_CURRENT_POSITION</b>, indicating the clock has started or restarted from its current position.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclockstatesink-onclockstart
     */
    OnClockStart(hnsSystemTime, llClockStartOffset) {
        result := ComCall(3, this, "int64", hnsSystemTime, "int64", llClockStartOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the presentation clock stops.
     * @remarks
     * When the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-stop">IMFPresentationClock::Stop</a> method is called, the clock notifies the presentation time source by calling the presentation time source's <b>OnClockStop</b> method. This call occurs synchronously within the <b>Stop</b> method. If the time source returns an error from <b>OnClockStop</b>, the presentation clock's <b>Stop</b> method returns an error and the state change does not take place.
     *       
     * 
     * For any object that is not the presentation time source, the <b>OnClockStop</b> method is called asynchronously, after the state change is completed. 
     * 
     * If an object is already stopped, it should return <b>S_OK</b> from <b>OnClockStop</b>. It should not return an error code. 
     * 
     * <div class="alert"><b>Note</b>  Although the header file mferror.h defines an error code named <b>MF_E_SINK_ALREADYSTOPPED</b>, it should not be returned in this situation.</div>
     * <div> </div>
     * @param {Integer} hnsSystemTime The system time when the clock stopped, in 100-nanosecond units.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_SINK_ALREADYSTOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deprecated. Do not use this error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclockstatesink-onclockstop
     */
    OnClockStop(hnsSystemTime) {
        result := ComCall(4, this, "int64", hnsSystemTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the presentation clock pauses.
     * @remarks
     * When the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-pause">IMFPresentationClock::Pause</a> method is called, the clock notifies the presentation time source by calling the time source's <b>OnClockPause</b> method. This call occurs synchronously within the <b>Pause</b> method. If the time source returns an error from <b>OnClockPause</b>, the presentation clock's <b>Pause</b> method returns an error and the state change does not take place.
     * 
     * For any object that is not the presentation time source, the <b>OnClockPause</b> method is called asynchronously, after the state change is completed. In that case, the return value from this method is ignored.
     * @param {Integer} hnsSystemTime The system time when the clock was paused, in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclockstatesink-onclockpause
     */
    OnClockPause(hnsSystemTime) {
        result := ComCall(5, this, "int64", hnsSystemTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the presentation clock restarts from the same position while paused.
     * @remarks
     * This method is called if the presentation clock is paused and the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">IMFPresentationClock::Start</a> method is called with the value <b>PRESENTATION_CURRENT_POSITION</b>.
     *       
     * 
     * The clock notifies the presentation time source by calling the time source's <b>OnClockRestart</b> method. This call occurs synchronously within the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">Start</a> method. If the time source returns an error from <b>OnClockRestart</b>, the presentation clock's <b>Start</b> method returns an error and the state change does not take place.
     *       
     * 
     * For any object that is not the presentation time source, the <b>OnClockRestart</b> method is called asynchronously, after the state change is completed. In that case, the return value from this method is ignored.
     * @param {Integer} hnsSystemTime The system time when the clock restarted, in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclockstatesink-onclockrestart
     */
    OnClockRestart(hnsSystemTime) {
        result := ComCall(6, this, "int64", hnsSystemTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the rate changes on the presentation clock.
     * @remarks
     * When the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfratecontrol-setrate">IMFRateControl::SetRate</a> method is called, the clock notifies the presentation time source by calling the time source's <b>OnClockSetRate</b> method. This call occurs synchronously within the <b>SetRate</b> method. If the time source returns an error from <b>OnClockSetRate</b>, the presentation clock's <b>SetRate</b> method returns an error and the state change does not take place.
     *       
     * 
     * For any object that is not the presentation time source, the <b>OnClockSetRate</b> method is called asynchronously, after the state change is completed. In that case, the return value from this method is ignored.
     * @param {Integer} hnsSystemTime The system time when the rate was set, in 100-nanosecond units.
     * @param {Float} flRate The new rate, as a multiplier of the normal playback rate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfclockstatesink-onclocksetrate
     */
    OnClockSetRate(hnsSystemTime, flRate) {
        result := ComCall(7, this, "int64", hnsSystemTime, "float", flRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

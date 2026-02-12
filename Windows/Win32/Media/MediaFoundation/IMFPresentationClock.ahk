#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPresentationTimeSource.ahk
#Include .\IMFClock.ahk

/**
 * Represents a presentation clock, which is used to schedule when samples are rendered and to synchronize multiple streams.
 * @remarks
 * To create a new instance of the presentation clock, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepresentationclock">MFCreatePresentationClock</a> function. The presentation clock must have a time source, which is an object that provides the clock times. For example, the audio renderer is a time source that uses the sound card to drive the clock. Time sources expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationtimesource">IMFPresentationTimeSource</a> interface. To set the time source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-settimesource">SetTimeSource</a>. The presentation clock does not begin running until the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">Start</a> method is called.
 * 
 * To get the presentation clock from the Media Session, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-getclock">IMFMediaSession::GetClock</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfpresentationclock
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPresentationClock extends IMFClock{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPresentationClock
     * @type {Guid}
     */
    static IID => Guid("{868ce85c-8ea9-4f55-ab82-b009a910a805}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTimeSource", "GetTimeSource", "GetTime", "AddClockStateSink", "RemoveClockStateSink", "Start", "Stop", "Pause"]

    /**
     * Sets the time source for the presentation clock. The time source is the object that drives the clock by providing the current time.
     * @remarks
     * The presentation clock cannot start until it has a time source.
     * 
     * The time source is automatically registered to receive state change notifications from the clock, through the time source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclockstatesink">IMFClockStateSink</a> interface, which all time sources must implement.
     * 
     * This time source have a frequency of 10 MHz. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getclockcharacteristics">IMFClock::GetClockCharacteristics</a>. If not, the method returns MF_E_CLOCK_NOT_SIMPLE.
     * @param {IMFPresentationTimeSource} pTimeSource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationtimesource">IMFPresentationTimeSource</a> interface of the time source.
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
     * <dt><b>MF_E_CLOCK_NOT_SIMPLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time source does not have a frequency of 10 MHz.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time source has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-settimesource
     */
    SetTimeSource(pTimeSource) {
        result := ComCall(8, this, "ptr", pTimeSource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the clock's presentation time source.
     * @returns {IMFPresentationTimeSource} Receives a pointer to the time source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationtimesource">IMFPresentationTimeSource</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-gettimesource
     */
    GetTimeSource() {
        result := ComCall(9, this, "ptr*", &ppTimeSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFPresentationTimeSource(ppTimeSource)
    }

    /**
     * Retrieves the latest clock time.
     * @remarks
     * This method does not attempt to smooth out jitter or otherwise account for any inaccuracies in the clock time.
     * @returns {Integer} Receives the latest clock time, in 100-nanosecond units. The time is relative to when the clock was last started.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-gettime
     */
    GetTime() {
        result := ComCall(10, this, "int64*", &phnsClockTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phnsClockTime
    }

    /**
     * Registers an object to be notified whenever the clock starts, stops, or pauses, or changes rate.
     * @remarks
     * Before releasing the object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-removeclockstatesink">IMFPresentationClock::RemoveClockStateSink</a> to unregister the object for state-change notifications.
     * @param {IMFClockStateSink} pStateSink Pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclockstatesink">IMFClockStateSink</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-addclockstatesink
     */
    AddClockStateSink(pStateSink) {
        result := ComCall(11, this, "ptr", pStateSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters an object that is receiving state-change notifications from the clock.
     * @param {IMFClockStateSink} pStateSink Pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclockstatesink">IMFClockStateSink</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-removeclockstatesink
     */
    RemoveClockStateSink(pStateSink) {
        result := ComCall(12, this, "ptr", pStateSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts the presentation clock.
     * @remarks
     * This method is valid in all states (stopped, paused, or running).
     * 
     * If the clock is paused and restarted from the same position (<i>llClockStartOffset</i> is PRESENTATION_CURRENT_POSITION), the presentation clock sends an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockrestart">IMFClockStateSink::OnClockRestart</a> notification. Otherwise, the clock sends an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockstart">IMFClockStateSink::OnClockStart</a> notification.
     * 
     * The presentation clock initiates the state change by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockstart">OnClockStart</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockrestart">OnClockRestart</a> on the clock's time source. This call is made synchronously. If it fails, the state change does not occur. If the call succeeds, the state changes, and the clock notifies the other state-change subscribers by calling their <b>OnClockStart</b> or <b>OnClockRestart</b> methods. These calls are made asynchronously.
     * 
     * If the clock is already running, calling <b>Start</b> again has the effect of seeking the clock to the new <i>StartOffset</i> position.
     * @param {Integer} llClockStartOffset Initial starting time, in 100-nanosecond units. At the time the <b>Start</b> method is called, the clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-gettime">IMFPresentationClock::GetTime</a> method returns this value, and the clock time increments from there. If the value is PRESENTATION_CURRENT_POSITION, the clock starts from its current position. Use this value if the clock is paused and you want to restart it from the same position.
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
     * <dt><b>MF_E_CLOCK_NO_TIME_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No time source was set on this clock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-start
     */
    Start(llClockStartOffset) {
        result := ComCall(13, this, "int64", llClockStartOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops the presentation clock. While the clock is stopped, the clock time does not advance, and the clock's IMFPresentationClock::GetTime method returns zero.
     * @remarks
     * This method is valid when the clock is running or paused.
     * 
     * The presentation clock initiates the state change by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockstop">IMFClockStateSink::OnClockStop</a> on the clock's time source. This call is made synchronously. If it fails, the state change does not occur. If the call succeeds, the state changes, and the clock notifies the other state-change subscribers by calling their <b>OnClockStop</b> methods. These calls are made asynchronously.
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
     * <dt><b>MF_E_CLOCK_NO_TIME_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No time source was set on this clock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_CLOCK_STATE_ALREADY_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clock is already stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-stop
     */
    Stop() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Pauses the presentation clock. While the clock is paused, the clock time does not advance, and the clock's IMFPresentationClock::GetTime returns the time at which the clock was paused.
     * @remarks
     * This method is valid when the clock is running. It is not valid when the clock is paused or stopped.
     * 
     * The presentation clock initiates the state change by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclockpause">IMFClockStateSink::OnClockPause</a> on the clock's time source. This call is made synchronously. If it fails, the state change does not occur. If the call succeeds, the state changes, and the clock notifies the other state-change subscribers by calling their <b>OnClockPause</b> methods. These calls are made asynchronously.
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
     * <dt><b>MF_E_CLOCK_NO_TIME_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No time source was set on this clock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_CLOCK_STATE_ALREADY_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clock is already paused.
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
     * The clock is stopped. This request is not valid when the clock is stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationclock-pause
     */
    Pause() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

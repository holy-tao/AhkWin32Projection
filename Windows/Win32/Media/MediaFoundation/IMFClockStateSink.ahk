#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives state-change notifications from the presentation clock.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfclockstatesink
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
     * @param {Integer} hnsSystemTime The system time when the clock started, in 100-nanosecond units.
     * @param {Integer} llClockStartOffset The new starting time for the clock, in 100-nanosecond units. This parameter can also equal <b>PRESENTATION_CURRENT_POSITION</b>, indicating the clock has started or restarted from its current position.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclockstatesink-onclockstart
     */
    OnClockStart(hnsSystemTime, llClockStartOffset) {
        result := ComCall(3, this, "int64", hnsSystemTime, "int64", llClockStartOffset, "HRESULT")
        return result
    }

    /**
     * Called when the presentation clock stops.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclockstatesink-onclockstop
     */
    OnClockStop(hnsSystemTime) {
        result := ComCall(4, this, "int64", hnsSystemTime, "HRESULT")
        return result
    }

    /**
     * Called when the presentation clock pauses.
     * @param {Integer} hnsSystemTime The system time when the clock was paused, in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclockstatesink-onclockpause
     */
    OnClockPause(hnsSystemTime) {
        result := ComCall(5, this, "int64", hnsSystemTime, "HRESULT")
        return result
    }

    /**
     * Called when the presentation clock restarts from the same position while paused.
     * @param {Integer} hnsSystemTime The system time when the clock restarted, in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclockstatesink-onclockrestart
     */
    OnClockRestart(hnsSystemTime) {
        result := ComCall(6, this, "int64", hnsSystemTime, "HRESULT")
        return result
    }

    /**
     * Called when the rate changes on the presentation clock.
     * @param {Integer} hnsSystemTime The system time when the rate was set, in 100-nanosecond units.
     * @param {Float} flRate The new rate, as a multiplier of the normal playback rate.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfclockstatesink-onclocksetrate
     */
    OnClockSetRate(hnsSystemTime, flRate) {
        result := ComCall(7, this, "int64", hnsSystemTime, "float", flRate, "HRESULT")
        return result
    }
}

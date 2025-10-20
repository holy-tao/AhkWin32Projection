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
     * 
     * @param {Integer} hnsSystemTime 
     * @param {Integer} llClockStartOffset 
     * @returns {HRESULT} 
     */
    OnClockStart(hnsSystemTime, llClockStartOffset) {
        result := ComCall(3, this, "int64", hnsSystemTime, "int64", llClockStartOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSystemTime 
     * @returns {HRESULT} 
     */
    OnClockStop(hnsSystemTime) {
        result := ComCall(4, this, "int64", hnsSystemTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSystemTime 
     * @returns {HRESULT} 
     */
    OnClockPause(hnsSystemTime) {
        result := ComCall(5, this, "int64", hnsSystemTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSystemTime 
     * @returns {HRESULT} 
     */
    OnClockRestart(hnsSystemTime) {
        result := ComCall(6, this, "int64", hnsSystemTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSystemTime 
     * @param {Float} flRate 
     * @returns {HRESULT} 
     */
    OnClockSetRate(hnsSystemTime, flRate) {
        result := ComCall(7, this, "int64", hnsSystemTime, "float", flRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

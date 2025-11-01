#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClock.ahk

/**
 * Represents a presentation clock, which is used to schedule when samples are rendered and to synchronize multiple streams.
 * @remarks
 * 
  * To create a new instance of the presentation clock, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepresentationclock">MFCreatePresentationClock</a> function. The presentation clock must have a time source, which is an object that provides the clock times. For example, the audio renderer is a time source that uses the sound card to drive the clock. Time sources expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationtimesource">IMFPresentationTimeSource</a> interface. To set the time source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-settimesource">SetTimeSource</a>. The presentation clock does not begin running until the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-start">Start</a> method is called.
  * 
  * To get the presentation clock from the Media Session, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-getclock">IMFMediaSession::GetClock</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpresentationclock
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
     * 
     * @param {IMFPresentationTimeSource} pTimeSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-settimesource
     */
    SetTimeSource(pTimeSource) {
        result := ComCall(8, this, "ptr", pTimeSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationTimeSource>} ppTimeSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-gettimesource
     */
    GetTimeSource(ppTimeSource) {
        result := ComCall(9, this, "ptr*", ppTimeSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} phnsClockTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-gettime
     */
    GetTime(phnsClockTime) {
        phnsClockTimeMarshal := phnsClockTime is VarRef ? "int64*" : "ptr"

        result := ComCall(10, this, phnsClockTimeMarshal, phnsClockTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFClockStateSink} pStateSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-addclockstatesink
     */
    AddClockStateSink(pStateSink) {
        result := ComCall(11, this, "ptr", pStateSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFClockStateSink} pStateSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-removeclockstatesink
     */
    RemoveClockStateSink(pStateSink) {
        result := ComCall(12, this, "ptr", pStateSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llClockStartOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-start
     */
    Start(llClockStartOffset) {
        result := ComCall(13, this, "int64", llClockStartOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-stop
     */
    Stop() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationclock-pause
     */
    Pause() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}

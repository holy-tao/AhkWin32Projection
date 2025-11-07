#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClock.ahk

/**
 * Provides the clock times for the presentation clock.
 * @remarks
 * 
 * This interface is implemented by presentation time sources. A presentation time source is an object that provides the clock time for the presentation clock. For example, the audio renderer is a presentation time source. The rate at which the audio renderer consumes audio samples determines the clock time. If the audio format is 44100 samples per second, the audio renderer will report that one second has passed for every 44100 audio samples it plays. In this case, the timing is provided by the sound card.
 * 
 * To set the presentation time source on the presentation clock, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-settimesource">IMFPresentationClock::SetTimeSource</a> with a pointer to the time source's <b>IMFPresentationTimeSource</b> interface.
 * 
 * A presentation time source must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclockstatesink">IMFClockStateSink</a> interface. The presentation clock uses this interface to notify the time source when the clock state changes.
 * 
 * Media Foundation provides a presentation time source that is based on the system clock. To create this object, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesystemtimesource">MFCreateSystemTimeSource</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpresentationtimesource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPresentationTimeSource extends IMFClock{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPresentationTimeSource
     * @type {Guid}
     */
    static IID => Guid("{7ff12cce-f76f-41c2-863b-1666c8e5e139}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUnderlyingClock"]

    /**
     * 
     * @returns {IMFClock} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationtimesource-getunderlyingclock
     */
    GetUnderlyingClock() {
        result := ComCall(8, this, "ptr*", &ppClock := 0, "HRESULT")
        return IMFClock(ppClock)
    }
}

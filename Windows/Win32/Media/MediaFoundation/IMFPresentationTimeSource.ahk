#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClock.ahk

/**
 * Provides the clock times for the presentation clock.
 * @remarks
 * This interface is implemented by presentation time sources. A presentation time source is an object that provides the clock time for the presentation clock. For example, the audio renderer is a presentation time source. The rate at which the audio renderer consumes audio samples determines the clock time. If the audio format is 44100 samples per second, the audio renderer will report that one second has passed for every 44100 audio samples it plays. In this case, the timing is provided by the sound card.
 * 
 * To set the presentation time source on the presentation clock, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-settimesource">IMFPresentationClock::SetTimeSource</a> with a pointer to the time source's <b>IMFPresentationTimeSource</b> interface.
 * 
 * A presentation time source must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclockstatesink">IMFClockStateSink</a> interface. The presentation clock uses this interface to notify the time source when the clock state changes.
 * 
 * Media Foundation provides a presentation time source that is based on the system clock. To create this object, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesystemtimesource">MFCreateSystemTimeSource</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfpresentationtimesource
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
     * Retrieves the underlying clock that the presentation time source uses to generate its clock times.
     * @remarks
     * A presentation time source must support stopping, starting, pausing, and rate changes. However, in many cases the time source derives its clock times from a hardware clock or other device. The underlying clock is always running, and might not support rate changes.
     * 
     * Optionally, a time source can expose the underlying clock by implementing this method. The underlying clock is always running, even when the presentation time source is paused or stopped. (Therefore, the underlying clock returns the MFCLOCK_CHARACTERISTICS_FLAG_ALWAYS_RUNNING flag in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getclockcharacteristics">IMFClock::GetClockCharacteristics</a> method).
     * 
     * The underlying clock is useful if you want to make decisions based on the clock times while the presentation clock is stopped or paused.
     * 
     * If the time source does not expose an underlying clock, the method returns MF_E_NO_CLOCK.
     * @returns {IMFClock} Receives a pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclock">IMFClock</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfpresentationtimesource-getunderlyingclock
     */
    GetUnderlyingClock() {
        result := ComCall(8, this, "ptr*", &ppClock := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFClock(ppClock)
    }
}

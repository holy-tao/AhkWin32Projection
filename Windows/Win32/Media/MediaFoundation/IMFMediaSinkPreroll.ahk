#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a media sink to receive samples before the presentation clock is started.
 * @remarks
 * 
 * Media sinks can implement this interface to support seamless playback and transitions. If a media sink exposes this interface, it can receive samples before the presentation clock starts. It can then pre-process the samples, so that rendering can begin immediately when the clock starts. Prerolling helps to avoid glitches during playback.
 * 
 * If a media sink supports preroll, the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics">IMFMediaSink::GetCharacteristics</a> method should return the MEDIASINK_CAN_PREROLL flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasinkpreroll
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSinkPreroll extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSinkPreroll
     * @type {Guid}
     */
    static IID => Guid("{5dfd4b2a-7674-4110-a4e6-8a68fd5f3688}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyPreroll"]

    /**
     * 
     * @param {Integer} hnsUpcomingStartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasinkpreroll-notifypreroll
     */
    NotifyPreroll(hnsUpcomingStartTime) {
        result := ComCall(3, this, "int64", hnsUpcomingStartTime, "HRESULT")
        return result
    }
}

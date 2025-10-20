#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFQualityAdvise.ahk

/**
 * Enables a pipeline object to adjust its own audio or video quality, in response to quality messages.
 * @remarks
 * 
  * This interface enables a pipeline object to respond to quality messages from the media sink. Currently, it is supported only for video decoders.
  * 
  * If a video decoder exposes <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualityadvise">IMFQualityAdvise</a> but not <b>IMFQualityAdvise2</b>, the quality manager controls quality adjustments for the decoder. In this case, the quality manager responds to <a href="https://docs.microsoft.com/windows/desktop/medfound/mequalitynotify">MEQualityNotify</a> events from the Enhanced Video Renderer (EVR) by calling <b>IMFQualityAdvise</b> methods on the decoder.
  * 
  * If the decoder exposes <b>IMFQualityAdvise2</b>, the quality manager forwards the <a href="https://docs.microsoft.com/windows/desktop/medfound/mequalitynotify">MEQualityNotify</a> events to the decoder and does not adjust the decoder's quality settings. The decoder should respond to these events by adjusting its own quality settings internally.
  * 
  * The preceding remarks apply to the default implementation of the quality manager; custom quality managers can implement other behaviors.
  * 
  * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfqualityadvise2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFQualityAdvise2 extends IMFQualityAdvise{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFQualityAdvise2
     * @type {Guid}
     */
    static IID => Guid("{f3706f0d-8ea2-4886-8000-7155e9ec2eae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyQualityEvent"]

    /**
     * 
     * @param {IMFMediaEvent} pEvent 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise2-notifyqualityevent
     */
    NotifyQualityEvent(pEvent, pdwFlags) {
        result := ComCall(8, this, "ptr", pEvent, "uint*", pdwFlags, "HRESULT")
        return result
    }
}

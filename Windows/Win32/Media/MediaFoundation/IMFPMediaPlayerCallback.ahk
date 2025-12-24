#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for the IMFPMediaPlayer interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/nn-mfplay-imfpmediaplayercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMediaPlayerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMediaPlayerCallback
     * @type {Guid}
     */
    static IID => Guid("{766c8ffb-5fdb-4fea-a28d-b912996f51bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMediaPlayerEvent"]

    /**
     * Called by the MFPlay player object to notify the application of a playback event.
     * @remarks
     * 
     * The specific type of playback event is given in the <b>eEventType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure. This structure contains information that is common to all of the event types. Some event types use extended structures. A set of macros is defined for casting the <i>pEventHeader</i> pointer to the correct structure type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_event_type">MFP_EVENT_TYPE</a>.
     *       
     * 
     * It is safe to call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> methods inside the <b>OnMediaPlayer</b> method. MFPlay is guaranteed not to reenter the <b>OnMediaPlayer</b> method. That is, calls to <b>OnMediaPlayer</b> are serialized, and the method will not be invoked again from inside <b>OnMediaPlayer</b>. 
     * 
     * 
     * 
     * @param {Pointer<MFP_EVENT_HEADER>} pEventHeader Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains information about the event.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent
     */
    OnMediaPlayerEvent(pEventHeader) {
        ComCall(3, this, "ptr", pEventHeader)
    }
}

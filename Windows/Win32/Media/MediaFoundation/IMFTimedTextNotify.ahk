#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Interface that defines callbacks for Microsoft Media Foundation Timed Text notifications.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextNotify
     * @type {Guid}
     */
    static IID => Guid("{df6b87b6-ce12-45db-aba7-432fe054e57d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrackAdded", "TrackRemoved", "TrackSelected", "TrackReadyStateChanged", "Error", "Cue", "Reset"]

    /**
     * Called when a text track is added.
     * @param {Integer} trackId Type: <b>DWORD</b>
     * 
     * The identifier of the track that was added.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackadded
     */
    TrackAdded(trackId) {
        ComCall(3, this, "uint", trackId)
    }

    /**
     * Called when a text track is removed.
     * @param {Integer} trackId Type: <b>DWORD</b>
     * 
     * The identifier of the track that was removed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackremoved
     */
    TrackRemoved(trackId) {
        ComCall(4, this, "uint", trackId)
    }

    /**
     * Called when a track is selected or deselected.
     * @param {Integer} trackId Type: <b>DWORD</b>
     * 
     * The identifier of the track that was selected or deselected.
     * @param {BOOL} selected Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the track was selected. <b>FALSE</b> if the track was deselected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackselected
     */
    TrackSelected(trackId, selected) {
        ComCall(5, this, "uint", trackId, "int", selected)
    }

    /**
     * 
     * @param {Integer} trackId 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackReadyStateChanged(trackId) {
        ComCall(6, this, "uint", trackId)
    }

    /**
     * Called when an error occurs in a text track.
     * @param {Integer} errorCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_error_code">MF_TIMED_TEXT_ERROR_CODE</a></b>
     * 
     * An MF_TIMED_TEXT_ERROR_CODE representing the last error.
     * @param {HRESULT} extendedErrorCode Type: <b>extendedErrorCode</b>
     * 
     * The extended error code for the last error.
     * @param {Integer} sourceTrackId Type: <b>extendedErrorCode</b>
     * 
     * The identifier of the track on which the error occurred.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextnotify-error
     */
    Error(errorCode, extendedErrorCode, sourceTrackId) {
        ComCall(7, this, "int", errorCode, "int", extendedErrorCode, "uint", sourceTrackId)
    }

    /**
     * Called when a cue event occurs in a text track.
     * @param {Integer} cueEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_cue_event">MF_TIMED_TEXT_CUE_EVENT</a></b>
     * 
     * A value specifying the type of event that has occured.
     * @param {Float} currentTime Type: <b>double</b>
     * 
     * The current time when the cue event occurred.
     * @param {IMFTimedTextCue} cue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextcue">IMFTimedTextCue</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextcue">IMFTimedTextCue</a> object representing the cue.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextnotify-cue
     */
    Cue(cueEvent, currentTime, cue) {
        ComCall(8, this, "int", cueEvent, "double", currentTime, "ptr", cue)
    }

    /**
     * Resets the timed-text-notify object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextnotify-reset
     */
    Reset() {
        ComCall(9, this)
    }
}

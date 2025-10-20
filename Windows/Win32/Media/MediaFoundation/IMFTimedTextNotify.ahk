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
     * 
     * @param {Integer} trackId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackadded
     */
    TrackAdded(trackId) {
        ComCall(3, this, "uint", trackId)
    }

    /**
     * 
     * @param {Integer} trackId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackremoved
     */
    TrackRemoved(trackId) {
        ComCall(4, this, "uint", trackId)
    }

    /**
     * 
     * @param {Integer} trackId 
     * @param {BOOL} selected 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackselected
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
     * Indicates a significant problem.
     * @param {Integer} errorCode 
     * @param {HRESULT} extendedErrorCode 
     * @param {Integer} sourceTrackId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error(errorCode, extendedErrorCode, sourceTrackId) {
        ComCall(7, this, "int", errorCode, "int", extendedErrorCode, "uint", sourceTrackId)
    }

    /**
     * 
     * @param {Integer} cueEvent 
     * @param {Float} currentTime 
     * @param {IMFTimedTextCue} cue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-cue
     */
    Cue(cueEvent, currentTime, cue) {
        ComCall(8, this, "int", cueEvent, "double", currentTime, "ptr", cue)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-reset
     */
    Reset() {
        ComCall(9, this)
    }
}

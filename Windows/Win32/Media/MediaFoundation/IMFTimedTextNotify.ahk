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
     * 
     * @param {Integer} trackId 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackAdded(trackId) {
        ComCall(3, this, "uint", trackId)
        return result
    }

    /**
     * 
     * @param {Integer} trackId 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackRemoved(trackId) {
        ComCall(4, this, "uint", trackId)
        return result
    }

    /**
     * 
     * @param {Integer} trackId 
     * @param {BOOL} selected 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackSelected(trackId, selected) {
        ComCall(5, this, "uint", trackId, "int", selected)
        return result
    }

    /**
     * 
     * @param {Integer} trackId 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackReadyStateChanged(trackId) {
        ComCall(6, this, "uint", trackId)
        return result
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
        return result
    }

    /**
     * 
     * @param {Integer} cueEvent 
     * @param {Float} currentTime 
     * @param {Pointer<IMFTimedTextCue>} cue 
     * @returns {String} Nothing - always returns an empty string
     */
    Cue(cueEvent, currentTime, cue) {
        ComCall(8, this, "int", cueEvent, "double", currentTime, "ptr", cue)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reset() {
        ComCall(9, this)
        return result
    }
}

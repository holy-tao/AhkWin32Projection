#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_TIMED_TEXT_ERROR_CODE.ahk" { MF_TIMED_TEXT_ERROR_CODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_TIMED_TEXT_CUE_EVENT.ahk" { MF_TIMED_TEXT_CUE_EVENT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFTimedTextCue.ahk" { IMFTimedTextCue }

/**
 * Interface that defines callbacks for Microsoft Media Foundation Timed Text notifications.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtextnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextNotify extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextNotify
     * @type {Guid}
     */
    static IID := Guid("{df6b87b6-ce12-45db-aba7-432fe054e57d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TrackAdded             : IntPtr
        TrackRemoved           : IntPtr
        TrackSelected          : IntPtr
        TrackReadyStateChanged : IntPtr
        Error                  : IntPtr
        Cue                    : IntPtr
        Reset                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when a text track is added.
     * @param {Integer} trackId Type: <b>DWORD</b>
     * 
     * The identifier of the track that was added.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackadded
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackremoved
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-trackselected
     */
    TrackSelected(trackId, selected) {
        ComCall(5, this, "uint", trackId, BOOL, selected)
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
     * @param {MF_TIMED_TEXT_ERROR_CODE} errorCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_error_code">MF_TIMED_TEXT_ERROR_CODE</a></b>
     * 
     * An MF_TIMED_TEXT_ERROR_CODE representing the last error.
     * @param {HRESULT} extendedErrorCode Type: <b>extendedErrorCode</b>
     * 
     * The extended error code for the last error.
     * @param {Integer} sourceTrackId Type: <b>extendedErrorCode</b>
     * 
     * The identifier of the track on which the error occurred.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-error
     */
    Error(errorCode, extendedErrorCode, sourceTrackId) {
        ComCall(7, this, MF_TIMED_TEXT_ERROR_CODE, errorCode, "int", extendedErrorCode, "uint", sourceTrackId)
    }

    /**
     * Called when a cue event occurs in a text track.
     * @param {MF_TIMED_TEXT_CUE_EVENT} cueEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_cue_event">MF_TIMED_TEXT_CUE_EVENT</a></b>
     * 
     * A value specifying the type of event that has occurred.
     * @param {Float} currentTime Type: <b>double</b>
     * 
     * The current time when the cue event occurred.
     * @param {IMFTimedTextCue} cue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextcue">IMFTimedTextCue</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextcue">IMFTimedTextCue</a> object representing the cue.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-cue
     */
    Cue(cueEvent, currentTime, cue) {
        ComCall(8, this, MF_TIMED_TEXT_CUE_EVENT, cueEvent, "double", currentTime, "ptr", cue)
    }

    /**
     * Resets the timed-text-notify object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-reset
     */
    Reset() {
        ComCall(9, this)
    }

    Query(iid) {
        if (IMFTimedTextNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TrackAdded := CallbackCreate(GetMethod(implObj, "TrackAdded"), flags, 2)
        this.vtbl.TrackRemoved := CallbackCreate(GetMethod(implObj, "TrackRemoved"), flags, 2)
        this.vtbl.TrackSelected := CallbackCreate(GetMethod(implObj, "TrackSelected"), flags, 3)
        this.vtbl.TrackReadyStateChanged := CallbackCreate(GetMethod(implObj, "TrackReadyStateChanged"), flags, 2)
        this.vtbl.Error := CallbackCreate(GetMethod(implObj, "Error"), flags, 4)
        this.vtbl.Cue := CallbackCreate(GetMethod(implObj, "Cue"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TrackAdded)
        CallbackFree(this.vtbl.TrackRemoved)
        CallbackFree(this.vtbl.TrackSelected)
        CallbackFree(this.vtbl.TrackReadyStateChanged)
        CallbackFree(this.vtbl.Error)
        CallbackFree(this.vtbl.Cue)
        CallbackFree(this.vtbl.Reset)
    }
}

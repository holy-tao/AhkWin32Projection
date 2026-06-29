#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFP_EVENT_HEADER.ahk" { MFP_EVENT_HEADER }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface for the IMFPMediaPlayer interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/nn-mfplay-imfpmediaplayercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPMediaPlayerCallback extends IUnknown {
    /**
     * The interface identifier for IMFPMediaPlayerCallback
     * @type {Guid}
     */
    static IID := Guid("{766c8ffb-5fdb-4fea-a28d-b912996f51bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPMediaPlayerCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMediaPlayerEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPMediaPlayerCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the MFPlay player object to notify the application of a playback event.
     * @remarks
     * The specific type of playback event is given in the <b>eEventType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure. This structure contains information that is common to all of the event types. Some event types use extended structures. A set of macros is defined for casting the <i>pEventHeader</i> pointer to the correct structure type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_event_type">MFP_EVENT_TYPE</a>.
     *       
     * 
     * It is safe to call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> methods inside the <b>OnMediaPlayer</b> method. MFPlay is guaranteed not to reenter the <b>OnMediaPlayer</b> method. That is, calls to <b>OnMediaPlayer</b> are serialized, and the method will not be invoked again from inside <b>OnMediaPlayer</b>.
     * @param {Pointer<MFP_EVENT_HEADER>} pEventHeader Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains information about the event.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent
     */
    OnMediaPlayerEvent(pEventHeader) {
        ComCall(3, this, MFP_EVENT_HEADER.Ptr, pEventHeader)
    }

    Query(iid) {
        if (IMFPMediaPlayerCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMediaPlayerEvent := CallbackCreate(GetMethod(implObj, "OnMediaPlayerEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMediaPlayerEvent)
    }
}

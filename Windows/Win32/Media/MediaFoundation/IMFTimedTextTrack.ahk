#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_TIMED_TEXT_ERROR_CODE.ahk" { MF_TIMED_TEXT_ERROR_CODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MF_TIMED_TEXT_TRACK_KIND.ahk" { MF_TIMED_TEXT_TRACK_KIND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFTimedTextCueList.ahk" { IMFTimedTextCueList }
#Import ".\MF_TIMED_TEXT_TRACK_READY_STATE.ahk" { MF_TIMED_TEXT_TRACK_READY_STATE }

/**
 * Represents a track of timed text.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtexttrack
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextTrack extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextTrack
     * @type {Guid}
     */
    static IID := Guid("{8822c32d-654e-4233-bf21-d7f2e67d30d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextTrack interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId                              : IntPtr
        GetLabel                           : IntPtr
        SetLabel                           : IntPtr
        GetLanguage                        : IntPtr
        GetTrackKind                       : IntPtr
        IsInBand                           : IntPtr
        GetInBandMetadataTrackDispatchType : IntPtr
        IsActive                           : IntPtr
        GetErrorCode                       : IntPtr
        GetExtendedErrorCode               : IntPtr
        GetDataFormat                      : IntPtr
        GetReadyState                      : IntPtr
        GetCueList                         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextTrack.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the identifier of the track of timed text.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the identifier of the track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getid
     */
    GetId() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Gets the label of the track.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the label of the track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getlabel
     */
    GetLabel() {
        result := ComCall(4, this, PWSTR.Ptr, &label := 0, "HRESULT")
        return label
    }

    /**
     * Sets the label of a timed-text track.
     * @param {PWSTR} label Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated wide-character string that contains the label of the track.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-setlabel
     */
    SetLabel(label) {
        label := label is String ? StrPtr(label) : label

        result := ComCall(5, this, "ptr", label, "HRESULT")
        return result
    }

    /**
     * Gets the language of the track.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the language of the track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getlanguage
     */
    GetLanguage() {
        result := ComCall(6, this, PWSTR.Ptr, &language := 0, "HRESULT")
        return language
    }

    /**
     * Gets the kind of timed-text track.
     * @returns {MF_TIMED_TEXT_TRACK_KIND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a></b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a>-typed value that specifies the kind of timed-text track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-gettrackkind
     */
    GetTrackKind() {
        result := ComCall(7, this, MF_TIMED_TEXT_TRACK_KIND)
        return result
    }

    /**
     * Determines whether the timed-text track is inband.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the timed-text track is inband. If <b>TRUE</b>, the timed-text track is inband; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-isinband
     */
    IsInBand() {
        result := ComCall(8, this, BOOL)
        return result
    }

    /**
     * Gets the in-band metadata of the track.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the in-band metadata of the track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getinbandmetadatatrackdispatchtype
     */
    GetInBandMetadataTrackDispatchType() {
        result := ComCall(9, this, PWSTR.Ptr, &dispatchType := 0, "HRESULT")
        return dispatchType
    }

    /**
     * Determines whether the timed-text track is active.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the timed-text track is active. If <b>TRUE</b>, the timed-text track is active; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-isactive
     */
    IsActive() {
        result := ComCall(10, this, BOOL)
        return result
    }

    /**
     * Gets a value indicating the error type of the latest error associated with the track.
     * @returns {MF_TIMED_TEXT_ERROR_CODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_error_code">MF_TIMED_TEXT_ERROR_CODE</a></b>
     * 
     * A value indicating the error type of the latest error associated with the track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(11, this, MF_TIMED_TEXT_ERROR_CODE)
        return result
    }

    /**
     * Gets the extended error code for the latest error associated with the track.
     * @remarks
     * If the most recent error was associated with a track, this value will be the same <a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a> as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imftimedtextnotify-error">IMFTimedTextNotify::Error</a> method.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * The extended error code for the latest error associated with the track.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getextendederrorcode
     */
    GetExtendedErrorCode() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Gets a GUID that identifies the track's underlying data format.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A GUID that identifies the track's underlying data format.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getdataformat
     */
    GetDataFormat() {
        format := Guid()
        result := ComCall(13, this, Guid.Ptr, format, "HRESULT")
        return format
    }

    /**
     * 
     * @returns {MF_TIMED_TEXT_TRACK_READY_STATE} 
     */
    GetReadyState() {
        result := ComCall(14, this, MF_TIMED_TEXT_TRACK_READY_STATE)
        return result
    }

    /**
     * 
     * @returns {IMFTimedTextCueList} 
     */
    GetCueList() {
        result := ComCall(15, this, "ptr*", &cues := 0, "HRESULT")
        return IMFTimedTextCueList(cues)
    }

    Query(iid) {
        if (IMFTimedTextTrack.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 1)
        this.vtbl.GetLabel := CallbackCreate(GetMethod(implObj, "GetLabel"), flags, 2)
        this.vtbl.SetLabel := CallbackCreate(GetMethod(implObj, "SetLabel"), flags, 2)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 2)
        this.vtbl.GetTrackKind := CallbackCreate(GetMethod(implObj, "GetTrackKind"), flags, 1)
        this.vtbl.IsInBand := CallbackCreate(GetMethod(implObj, "IsInBand"), flags, 1)
        this.vtbl.GetInBandMetadataTrackDispatchType := CallbackCreate(GetMethod(implObj, "GetInBandMetadataTrackDispatchType"), flags, 2)
        this.vtbl.IsActive := CallbackCreate(GetMethod(implObj, "IsActive"), flags, 1)
        this.vtbl.GetErrorCode := CallbackCreate(GetMethod(implObj, "GetErrorCode"), flags, 1)
        this.vtbl.GetExtendedErrorCode := CallbackCreate(GetMethod(implObj, "GetExtendedErrorCode"), flags, 1)
        this.vtbl.GetDataFormat := CallbackCreate(GetMethod(implObj, "GetDataFormat"), flags, 2)
        this.vtbl.GetReadyState := CallbackCreate(GetMethod(implObj, "GetReadyState"), flags, 1)
        this.vtbl.GetCueList := CallbackCreate(GetMethod(implObj, "GetCueList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetLabel)
        CallbackFree(this.vtbl.SetLabel)
        CallbackFree(this.vtbl.GetLanguage)
        CallbackFree(this.vtbl.GetTrackKind)
        CallbackFree(this.vtbl.IsInBand)
        CallbackFree(this.vtbl.GetInBandMetadataTrackDispatchType)
        CallbackFree(this.vtbl.IsActive)
        CallbackFree(this.vtbl.GetErrorCode)
        CallbackFree(this.vtbl.GetExtendedErrorCode)
        CallbackFree(this.vtbl.GetDataFormat)
        CallbackFree(this.vtbl.GetReadyState)
        CallbackFree(this.vtbl.GetCueList)
    }
}

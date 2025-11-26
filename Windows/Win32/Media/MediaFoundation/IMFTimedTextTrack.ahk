#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextCueList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a track of timed text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtexttrack
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextTrack extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextTrack
     * @type {Guid}
     */
    static IID => Guid("{8822c32d-654e-4233-bf21-d7f2e67d30d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetLabel", "SetLabel", "GetLanguage", "GetTrackKind", "IsInBand", "GetInBandMetadataTrackDispatchType", "IsActive", "GetErrorCode", "GetExtendedErrorCode", "GetDataFormat", "GetReadyState", "GetCueList"]

    /**
     * Gets the identifier of the track of timed text.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the identifier of the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getid
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the label of the track.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the label of the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getlabel
     */
    GetLabel() {
        result := ComCall(4, this, "ptr*", &label := 0, "HRESULT")
        return label
    }

    /**
     * Sets the label of a timed-text track.
     * @param {PWSTR} label Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated wide-character string that contains the label of the track.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-setlabel
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
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getlanguage
     */
    GetLanguage() {
        result := ComCall(6, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * Gets the kind of timed-text track.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a></b>
     * 
     * Returns a <a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a>-typed value that specifies the kind of timed-text track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-gettrackkind
     */
    GetTrackKind() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * Determines whether the timed-text track is inband.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the timed-text track is inband. If <b>TRUE</b>, the timed-text track is inband; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-isinband
     */
    IsInBand() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * Gets the in-band metadata of the track.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the in-band metadata of the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getinbandmetadatatrackdispatchtype
     */
    GetInBandMetadataTrackDispatchType() {
        result := ComCall(9, this, "ptr*", &dispatchType := 0, "HRESULT")
        return dispatchType
    }

    /**
     * Determines whether the timed-text track is active.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the timed-text track is active. If <b>TRUE</b>, the timed-text track is active; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-isactive
     */
    IsActive() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Gets a value indicating the error type of the latest error associated with the track.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_error_code">MF_TIMED_TEXT_ERROR_CODE</a></b>
     * 
     * A value indicating the error type of the latest error associated with the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * Gets the extended error code for the latest error associated with the track.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * The extended error code for the latest error associated with the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getextendederrorcode
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
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getdataformat
     */
    GetDataFormat() {
        format := Guid()
        result := ComCall(13, this, "ptr", format, "HRESULT")
        return format
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReadyState() {
        result := ComCall(14, this, "int")
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
}

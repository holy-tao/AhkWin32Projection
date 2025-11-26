#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextTrack.ahk
#Include .\IMFTimedTextTrackList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A timed-text object represents a component of timed text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtext
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedText extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedText
     * @type {Guid}
     */
    static IID => Guid("{1f2a94c9-a3df-430d-9d0f-acd85ddc29af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterNotifications", "SelectTrack", "AddDataSource", "AddDataSourceFromUrl", "AddTrack", "RemoveTrack", "GetCueTimeOffset", "SetCueTimeOffset", "GetTracks", "GetActiveTracks", "GetTextTracks", "GetMetadataTracks", "SetInBandEnabled", "IsInBandEnabled"]

    /**
     * Registers a timed-text notify object.
     * @param {IMFTimedTextNotify} notify Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextnotify">IMFTimedTextNotify</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextnotify">IMFTimedTextNotify</a> interface for the timed-text notify object to register.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-registernotifications
     */
    RegisterNotifications(notify) {
        result := ComCall(3, this, "ptr", notify, "HRESULT")
        return result
    }

    /**
     * Selects or deselects a track of text in the timed-text component.
     * @param {Integer} trackId Type: <b>DWORD</b>
     * 
     * The identifier of the track to select.
     * @param {BOOL} selected Type: <b>BOOL</b>
     * 
     * Specifies whether to select or deselect a track of text. Specify <b>TRUE</b> to select the track or <b>FALSE</b> to deselect the track.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-selecttrack
     */
    SelectTrack(trackId, selected) {
        result := ComCall(4, this, "uint", trackId, "int", selected, "HRESULT")
        return result
    }

    /**
     * Adds a timed-text data source.
     * @param {IMFByteStream} byteStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface for the data source to add.
     * @param {PWSTR} label Type: <b>LPCWSTR</b>
     * 
     * Null-terminated wide-character string that contains the label of the data source.
     * @param {PWSTR} language Type: <b>LPCWSTR</b>
     * 
     * Null-terminated wide-character string that contains the language of the data source.
     * @param {Integer} kind Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a>-typed value that specifies the kind of timed-text track.
     * @param {BOOL} isDefault Type: <b>BOOL</b>
     * 
     * Specifies whether to add the default data source. Specify <b>TRUE</b> to add the default data source or <b>FALSE</b> otherwise.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the unique identifier for the added track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-adddatasource
     */
    AddDataSource(byteStream, label, language, kind, isDefault) {
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(5, this, "ptr", byteStream, "ptr", label, "ptr", language, "int", kind, "int", isDefault, "uint*", &trackId := 0, "HRESULT")
        return trackId
    }

    /**
     * Adds a timed-text data source from the specified URL.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL of the timed-text data source.
     * @param {PWSTR} label Type: <b>LPCWSTR</b>
     * 
     * Null-terminated wide-character string that contains the label of the data source.
     * @param {PWSTR} language Type: <b>LPCWSTR</b>
     * 
     * Null-terminated wide-character string that contains the language of the data source.
     * @param {Integer} kind Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a>-typed value that specifies the kind of timed-text track.
     * @param {BOOL} isDefault Type: <b>BOOL</b>
     * 
     * Specifies whether to add the default data source. Specify <b>TRUE</b> to add the default data source or <b>FALSE</b> otherwise.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the unique identifier for the added track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-adddatasourcefromurl
     */
    AddDataSourceFromUrl(url, label, language, kind, isDefault) {
        url := url is String ? StrPtr(url) : url
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(6, this, "ptr", url, "ptr", label, "ptr", language, "int", kind, "int", isDefault, "uint*", &trackId := 0, "HRESULT")
        return trackId
    }

    /**
     * 
     * @param {PWSTR} label 
     * @param {PWSTR} language 
     * @param {Integer} kind 
     * @returns {IMFTimedTextTrack} 
     */
    AddTrack(label, language, kind) {
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(7, this, "ptr", label, "ptr", language, "int", kind, "ptr*", &track := 0, "HRESULT")
        return IMFTimedTextTrack(track)
    }

    /**
     * Removes the timed-text track with the specified identifier.
     * @param {IMFTimedTextTrack} track Type: <b>DWORD</b>
     * 
     * The identifier of the track to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-removetrack
     */
    RemoveTrack(track) {
        result := ComCall(8, this, "ptr", track, "HRESULT")
        return result
    }

    /**
     * Gets the offset to the cue time.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer to a variable that receives the offset to the cue time.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-getcuetimeoffset
     */
    GetCueTimeOffset() {
        result := ComCall(9, this, "double*", &offset := 0, "HRESULT")
        return offset
    }

    /**
     * Sets the offset to the cue time.
     * @param {Float} offset Type: <b>double</b>
     * 
     * The offset to the cue time.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-setcuetimeoffset
     */
    SetCueTimeOffset(offset) {
        result := ComCall(10, this, "double", offset, "HRESULT")
        return result
    }

    /**
     * Retrieves a list of all timed-text tracks registered with the IMFTimedText.
     * @returns {IMFTimedTextTrackList} Type: <b>IMFTimedTextTrackList**</b>
     * 
     * Receives a pointer to track list.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-gettracks
     */
    GetTracks() {
        result := ComCall(11, this, "ptr*", &tracks := 0, "HRESULT")
        return IMFTimedTextTrackList(tracks)
    }

    /**
     * Gets the list of active timed-text tracks in the timed-text component.
     * @returns {IMFTimedTextTrackList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist">IMFTimedTextTrackList</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist">IMFTimedTextTrackList</a> interface that can enumerate the list of active timed-text tracks.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-getactivetracks
     */
    GetActiveTracks() {
        result := ComCall(12, this, "ptr*", &activeTracks := 0, "HRESULT")
        return IMFTimedTextTrackList(activeTracks)
    }

    /**
     * Gets the list of all the timed-text tracks in the timed-text component.
     * @returns {IMFTimedTextTrackList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist">IMFTimedTextTrackList</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist">IMFTimedTextTrackList</a> interface that can enumerate the list of all of the timed-text tracks.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-gettexttracks
     */
    GetTextTracks() {
        result := ComCall(13, this, "ptr*", &textTracks := 0, "HRESULT")
        return IMFTimedTextTrackList(textTracks)
    }

    /**
     * Gets the list of the timed-metadata tracks in the timed-text component.
     * @returns {IMFTimedTextTrackList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist">IMFTimedTextTrackList</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist">IMFTimedTextTrackList</a> interface that can enumerate the list of the timed-metadata tracks.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-getmetadatatracks
     */
    GetMetadataTracks() {
        result := ComCall(14, this, "ptr*", &metadataTracks := 0, "HRESULT")
        return IMFTimedTextTrackList(metadataTracks)
    }

    /**
     * Enables or disables inband mode.
     * @param {BOOL} enabled Type: <b>BOOL</b>
     * 
     * Specifies whether inband mode is enabled. If <b>TRUE</b>, inband mode is enabled. If <b>FALSE</b>, inband mode is disabled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-setinbandenabled
     */
    SetInBandEnabled(enabled) {
        result := ComCall(15, this, "int", enabled, "HRESULT")
        return result
    }

    /**
     * Determines whether inband mode is enabled.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether inband mode is enabled. If <b>TRUE</b>, inband mode is enabled. If <b>FALSE</b>, inband mode is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtext-isinbandenabled
     */
    IsInBandEnabled() {
        result := ComCall(16, this, "int")
        return result
    }
}

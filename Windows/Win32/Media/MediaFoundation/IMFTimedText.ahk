#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IMFTimedTextNotify} notify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-registernotifications
     */
    RegisterNotifications(notify) {
        result := ComCall(3, this, "ptr", notify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} trackId 
     * @param {BOOL} selected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-selecttrack
     */
    SelectTrack(trackId, selected) {
        result := ComCall(4, this, "uint", trackId, "int", selected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFByteStream} byteStream 
     * @param {PWSTR} label 
     * @param {PWSTR} language 
     * @param {Integer} kind 
     * @param {BOOL} isDefault 
     * @param {Pointer<Integer>} trackId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-adddatasource
     */
    AddDataSource(byteStream, label, language, kind, isDefault, trackId) {
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(5, this, "ptr", byteStream, "ptr", label, "ptr", language, "int", kind, "int", isDefault, "uint*", trackId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} url 
     * @param {PWSTR} label 
     * @param {PWSTR} language 
     * @param {Integer} kind 
     * @param {BOOL} isDefault 
     * @param {Pointer<Integer>} trackId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-adddatasourcefromurl
     */
    AddDataSourceFromUrl(url, label, language, kind, isDefault, trackId) {
        url := url is String ? StrPtr(url) : url
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(6, this, "ptr", url, "ptr", label, "ptr", language, "int", kind, "int", isDefault, "uint*", trackId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} label 
     * @param {PWSTR} language 
     * @param {Integer} kind 
     * @param {Pointer<IMFTimedTextTrack>} track 
     * @returns {HRESULT} 
     */
    AddTrack(label, language, kind, track) {
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(7, this, "ptr", label, "ptr", language, "int", kind, "ptr*", track, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFTimedTextTrack} track 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-removetrack
     */
    RemoveTrack(track) {
        result := ComCall(8, this, "ptr", track, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-getcuetimeoffset
     */
    GetCueTimeOffset(offset) {
        result := ComCall(9, this, "double*", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-setcuetimeoffset
     */
    SetCueTimeOffset(offset) {
        result := ComCall(10, this, "double", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} tracks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-gettracks
     */
    GetTracks(tracks) {
        result := ComCall(11, this, "ptr*", tracks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} activeTracks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-getactivetracks
     */
    GetActiveTracks(activeTracks) {
        result := ComCall(12, this, "ptr*", activeTracks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} textTracks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-gettexttracks
     */
    GetTextTracks(textTracks) {
        result := ComCall(13, this, "ptr*", textTracks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} metadataTracks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-getmetadatatracks
     */
    GetMetadataTracks(metadataTracks) {
        result := ComCall(14, this, "ptr*", metadataTracks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-setinbandenabled
     */
    SetInBandEnabled(enabled) {
        result := ComCall(15, this, "int", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtext-isinbandenabled
     */
    IsInBandEnabled() {
        result := ComCall(16, this, "int")
        return result
    }
}

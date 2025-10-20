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
     * 
     * @param {Pointer<IMFTimedTextNotify>} notify 
     * @returns {HRESULT} 
     */
    RegisterNotifications(notify) {
        result := ComCall(3, this, "ptr", notify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} trackId 
     * @param {BOOL} selected 
     * @returns {HRESULT} 
     */
    SelectTrack(trackId, selected) {
        result := ComCall(4, this, "uint", trackId, "int", selected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} byteStream 
     * @param {PWSTR} label 
     * @param {PWSTR} language 
     * @param {Integer} kind 
     * @param {BOOL} isDefault 
     * @param {Pointer<UInt32>} trackId 
     * @returns {HRESULT} 
     */
    AddDataSource(byteStream, label, language, kind, isDefault, trackId) {
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(5, this, "ptr", byteStream, "ptr", label, "ptr", language, "int", kind, "int", isDefault, "uint*", trackId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} url 
     * @param {PWSTR} label 
     * @param {PWSTR} language 
     * @param {Integer} kind 
     * @param {BOOL} isDefault 
     * @param {Pointer<UInt32>} trackId 
     * @returns {HRESULT} 
     */
    AddDataSourceFromUrl(url, label, language, kind, isDefault, trackId) {
        url := url is String ? StrPtr(url) : url
        label := label is String ? StrPtr(label) : label
        language := language is String ? StrPtr(language) : language

        result := ComCall(6, this, "ptr", url, "ptr", label, "ptr", language, "int", kind, "int", isDefault, "uint*", trackId, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "ptr", label, "ptr", language, "int", kind, "ptr", track, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrack>} track 
     * @returns {HRESULT} 
     */
    RemoveTrack(track) {
        result := ComCall(8, this, "ptr", track, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} offset 
     * @returns {HRESULT} 
     */
    GetCueTimeOffset(offset) {
        result := ComCall(9, this, "double*", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     */
    SetCueTimeOffset(offset) {
        result := ComCall(10, this, "double", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} tracks 
     * @returns {HRESULT} 
     */
    GetTracks(tracks) {
        result := ComCall(11, this, "ptr", tracks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} activeTracks 
     * @returns {HRESULT} 
     */
    GetActiveTracks(activeTracks) {
        result := ComCall(12, this, "ptr", activeTracks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} textTracks 
     * @returns {HRESULT} 
     */
    GetTextTracks(textTracks) {
        result := ComCall(13, this, "ptr", textTracks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextTrackList>} metadataTracks 
     * @returns {HRESULT} 
     */
    GetMetadataTracks(metadataTracks) {
        result := ComCall(14, this, "ptr", metadataTracks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} enabled 
     * @returns {HRESULT} 
     */
    SetInBandEnabled(enabled) {
        result := ComCall(15, this, "int", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsInBandEnabled() {
        result := ComCall(16, this, "int")
        return result
    }
}

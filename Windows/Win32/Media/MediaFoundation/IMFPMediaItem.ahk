#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPMediaPlayer.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk

/**
 * Represents a media item. (Deprecated.).
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/nn-mfplay-imfpmediaitem
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMediaItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMediaItem
     * @type {Guid}
     */
    static IID => Guid("{90eb3e6b-ecbf-45cc-b1da-c6fe3ea70d57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaPlayer", "GetURL", "GetObject", "GetUserData", "SetUserData", "GetStartStopPosition", "SetStartStopPosition", "HasVideo", "HasAudio", "IsProtected", "GetDuration", "GetNumberOfStreams", "GetStreamSelection", "SetStreamSelection", "GetStreamAttribute", "GetPresentationAttribute", "GetCharacteristics", "SetStreamSink", "GetMetadata"]

    /**
     * 
     * @returns {IMFPMediaPlayer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getmediaplayer
     */
    GetMediaPlayer() {
        result := ComCall(3, this, "ptr*", &ppMediaPlayer := 0, "HRESULT")
        return IMFPMediaPlayer(ppMediaPlayer)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-geturl
     */
    GetURL() {
        result := ComCall(4, this, "ptr*", &ppwszURL := 0, "HRESULT")
        return ppwszURL
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject() {
        result := ComCall(5, this, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata
     */
    GetUserData() {
        result := ComCall(6, this, "ptr*", &pdwUserData := 0, "HRESULT")
        return pdwUserData
    }

    /**
     * 
     * @param {Pointer} dwUserData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setuserdata
     */
    SetUserData(dwUserData) {
        result := ComCall(7, this, "ptr", dwUserData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidStartPositionType 
     * @param {Pointer<PROPVARIANT>} pvStartValue 
     * @param {Pointer<Guid>} pguidStopPositionType 
     * @param {Pointer<PROPVARIANT>} pvStopValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstartstopposition
     */
    GetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(8, this, "ptr", pguidStartPositionType, "ptr", pvStartValue, "ptr", pguidStopPositionType, "ptr", pvStopValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidStartPositionType 
     * @param {Pointer<PROPVARIANT>} pvStartValue 
     * @param {Pointer<Guid>} pguidStopPositionType 
     * @param {Pointer<PROPVARIANT>} pvStopValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setstartstopposition
     */
    SetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(9, this, "ptr", pguidStartPositionType, "ptr", pvStartValue, "ptr", pguidStopPositionType, "ptr", pvStopValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasVideo 
     * @param {Pointer<BOOL>} pfSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-hasvideo
     */
    HasVideo(pfHasVideo, pfSelected) {
        pfHasVideoMarshal := pfHasVideo is VarRef ? "int*" : "ptr"
        pfSelectedMarshal := pfSelected is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pfHasVideoMarshal, pfHasVideo, pfSelectedMarshal, pfSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasAudio 
     * @param {Pointer<BOOL>} pfSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-hasaudio
     */
    HasAudio(pfHasAudio, pfSelected) {
        pfHasAudioMarshal := pfHasAudio is VarRef ? "int*" : "ptr"
        pfSelectedMarshal := pfSelected is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pfHasAudioMarshal, pfHasAudio, pfSelectedMarshal, pfSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-isprotected
     */
    IsProtected() {
        result := ComCall(12, this, "int*", &pfProtected := 0, "HRESULT")
        return pfProtected
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getduration
     */
    GetDuration(guidPositionType) {
        pvDurationValue := PROPVARIANT()
        result := ComCall(13, this, "ptr", guidPositionType, "ptr", pvDurationValue, "HRESULT")
        return pvDurationValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(14, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, fEnabled) {
        result := ComCall(16, this, "uint", dwStreamIndex, "int", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(17, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(18, this, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(19, this, "uint*", &pCharacteristics := 0, "HRESULT")
        return pCharacteristics
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IUnknown} pMediaSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setstreamsink
     */
    SetStreamSink(dwStreamIndex, pMediaSink) {
        result := ComCall(20, this, "uint", dwStreamIndex, "ptr", pMediaSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getmetadata
     */
    GetMetadata() {
        result := ComCall(21, this, "ptr*", &ppMetadataStore := 0, "HRESULT")
        return IPropertyStore(ppMetadataStore)
    }
}

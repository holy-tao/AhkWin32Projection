#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * @param {Pointer<IMFPMediaPlayer>} ppMediaPlayer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getmediaplayer
     */
    GetMediaPlayer(ppMediaPlayer) {
        result := ComCall(3, this, "ptr*", ppMediaPlayer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-geturl
     */
    GetURL(ppwszURL) {
        result := ComCall(4, this, "ptr", ppwszURL, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<IUnknown>} ppIUnknown 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ppIUnknown) {
        result := ComCall(5, this, "ptr*", ppIUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pdwUserData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata
     */
    GetUserData(pdwUserData) {
        pdwUserDataMarshal := pdwUserData is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pdwUserDataMarshal, pdwUserData, "HRESULT")
        return result
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
        result := ComCall(10, this, "ptr", pfHasVideo, "ptr", pfSelected, "HRESULT")
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
        result := ComCall(11, this, "ptr", pfHasAudio, "ptr", pfSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProtected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-isprotected
     */
    IsProtected(pfProtected) {
        result := ComCall(12, this, "ptr", pfProtected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvDurationValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getduration
     */
    GetDuration(guidPositionType, pvDurationValue) {
        result := ComCall(13, this, "ptr", guidPositionType, "ptr", pvDurationValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams
     */
    GetNumberOfStreams(pdwStreamCount) {
        pdwStreamCountMarshal := pdwStreamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwStreamCountMarshal, pdwStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstreamselection
     */
    GetStreamSelection(dwStreamIndex, pfEnabled) {
        result := ComCall(15, this, "uint", dwStreamIndex, "ptr", pfEnabled, "HRESULT")
        return result
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
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute, pvValue) {
        result := ComCall(17, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute, pvValue) {
        result := ComCall(18, this, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCharacteristics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getcharacteristics
     */
    GetCharacteristics(pCharacteristics) {
        pCharacteristicsMarshal := pCharacteristics is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pCharacteristicsMarshal, pCharacteristics, "HRESULT")
        return result
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
     * @param {Pointer<IPropertyStore>} ppMetadataStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getmetadata
     */
    GetMetadata(ppMetadataStore) {
        result := ComCall(21, this, "ptr*", ppMetadataStore, "HRESULT")
        return result
    }
}

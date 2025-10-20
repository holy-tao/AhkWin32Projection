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
     * 
     * @param {Pointer<IMFPMediaPlayer>} ppMediaPlayer 
     * @returns {HRESULT} 
     */
    GetMediaPlayer(ppMediaPlayer) {
        result := ComCall(3, this, "ptr", ppMediaPlayer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszURL 
     * @returns {HRESULT} 
     */
    GetURL(ppwszURL) {
        result := ComCall(4, this, "ptr", ppwszURL, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(5, this, "ptr", ppIUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} pdwUserData 
     * @returns {HRESULT} 
     */
    GetUserData(pdwUserData) {
        result := ComCall(6, this, "ptr*", pdwUserData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwUserData 
     * @returns {HRESULT} 
     */
    SetUserData(dwUserData) {
        result := ComCall(7, this, "ptr", dwUserData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidStartPositionType 
     * @param {Pointer<PROPVARIANT>} pvStartValue 
     * @param {Pointer<Guid>} pguidStopPositionType 
     * @param {Pointer<PROPVARIANT>} pvStopValue 
     * @returns {HRESULT} 
     */
    GetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(8, this, "ptr", pguidStartPositionType, "ptr", pvStartValue, "ptr", pguidStopPositionType, "ptr", pvStopValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidStartPositionType 
     * @param {Pointer<PROPVARIANT>} pvStartValue 
     * @param {Pointer<Guid>} pguidStopPositionType 
     * @param {Pointer<PROPVARIANT>} pvStopValue 
     * @returns {HRESULT} 
     */
    SetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(9, this, "ptr", pguidStartPositionType, "ptr", pvStartValue, "ptr", pguidStopPositionType, "ptr", pvStopValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasVideo 
     * @param {Pointer<BOOL>} pfSelected 
     * @returns {HRESULT} 
     */
    HasVideo(pfHasVideo, pfSelected) {
        result := ComCall(10, this, "ptr", pfHasVideo, "ptr", pfSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasAudio 
     * @param {Pointer<BOOL>} pfSelected 
     * @returns {HRESULT} 
     */
    HasAudio(pfHasAudio, pfSelected) {
        result := ComCall(11, this, "ptr", pfHasAudio, "ptr", pfSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProtected 
     * @returns {HRESULT} 
     */
    IsProtected(pfProtected) {
        result := ComCall(12, this, "ptr", pfProtected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvDurationValue 
     * @returns {HRESULT} 
     */
    GetDuration(guidPositionType, pvDurationValue) {
        result := ComCall(13, this, "ptr", guidPositionType, "ptr", pvDurationValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStreamCount 
     * @returns {HRESULT} 
     */
    GetNumberOfStreams(pdwStreamCount) {
        result := ComCall(14, this, "uint*", pdwStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    GetStreamSelection(dwStreamIndex, pfEnabled) {
        result := ComCall(15, this, "uint", dwStreamIndex, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    SetStreamSelection(dwStreamIndex, fEnabled) {
        result := ComCall(16, this, "uint", dwStreamIndex, "int", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute, pvValue) {
        result := ComCall(17, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     */
    GetPresentationAttribute(guidMFAttribute, pvValue) {
        result := ComCall(18, this, "ptr", guidMFAttribute, "ptr", pvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCharacteristics 
     * @returns {HRESULT} 
     */
    GetCharacteristics(pCharacteristics) {
        result := ComCall(19, this, "uint*", pCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IUnknown>} pMediaSink 
     * @returns {HRESULT} 
     */
    SetStreamSink(dwStreamIndex, pMediaSink) {
        result := ComCall(20, this, "uint", dwStreamIndex, "ptr", pMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppMetadataStore 
     * @returns {HRESULT} 
     */
    GetMetadata(ppMetadataStore) {
        result := ComCall(21, this, "ptr", ppMetadataStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

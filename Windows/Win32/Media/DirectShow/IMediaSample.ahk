#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaSample interface sets and retrieves properties on media samples.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediasample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSample extends IUnknown{
    /**
     * The interface identifier for IMediaSample
     * @type {Guid}
     */
    static IID => Guid("{56a8689a-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetPointer(ppBuffer) {
        result := ComCall(3, this, "char*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSize() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    GetTime(pTimeStart, pTimeEnd) {
        result := ComCall(5, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    SetTime(pTimeStart, pTimeEnd) {
        result := ComCall(6, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSyncPoint() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bIsSyncPoint 
     * @returns {HRESULT} 
     */
    SetSyncPoint(bIsSyncPoint) {
        result := ComCall(8, this, "int", bIsSyncPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPreroll() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bIsPreroll 
     * @returns {HRESULT} 
     */
    SetPreroll(bIsPreroll) {
        result := ComCall(10, this, "int", bIsPreroll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetActualDataLength() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IMediaSample0000 
     * @returns {HRESULT} 
     */
    SetActualDataLength(__MIDL__IMediaSample0000) {
        result := ComCall(12, this, "int", __MIDL__IMediaSample0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetMediaType(ppMediaType) {
        result := ComCall(13, this, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    SetMediaType(pMediaType) {
        result := ComCall(14, this, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDiscontinuity() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bDiscontinuity 
     * @returns {HRESULT} 
     */
    SetDiscontinuity(bDiscontinuity) {
        result := ComCall(16, this, "int", bDiscontinuity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    GetMediaTime(pTimeStart, pTimeEnd) {
        result := ComCall(17, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    SetMediaTime(pTimeStart, pTimeEnd) {
        result := ComCall(18, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

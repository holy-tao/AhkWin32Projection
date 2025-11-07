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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPointer", "GetSize", "GetTime", "SetTime", "IsSyncPoint", "SetSyncPoint", "IsPreroll", "SetPreroll", "GetActualDataLength", "SetActualDataLength", "GetMediaType", "SetMediaType", "IsDiscontinuity", "SetDiscontinuity", "GetMediaTime", "SetMediaTime"]

    /**
     * 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getpointer
     */
    GetPointer() {
        result := ComCall(3, this, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getsize
     */
    GetSize() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-gettime
     */
    GetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-settime
     */
    SetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-issyncpoint
     */
    IsSyncPoint() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bIsSyncPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setsyncpoint
     */
    SetSyncPoint(bIsSyncPoint) {
        result := ComCall(8, this, "int", bIsSyncPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-ispreroll
     */
    IsPreroll() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bIsPreroll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setpreroll
     */
    SetPreroll(bIsPreroll) {
        result := ComCall(10, this, "int", bIsPreroll, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getactualdatalength
     */
    GetActualDataLength() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IMediaSample0000 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setactualdatalength
     */
    SetActualDataLength(__MIDL__IMediaSample0000) {
        result := ComCall(12, this, "int", __MIDL__IMediaSample0000, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<AM_MEDIA_TYPE>} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getmediatype
     */
    GetMediaType() {
        result := ComCall(13, this, "ptr*", &ppMediaType := 0, "HRESULT")
        return ppMediaType
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setmediatype
     */
    SetMediaType(pMediaType) {
        result := ComCall(14, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-isdiscontinuity
     */
    IsDiscontinuity() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bDiscontinuity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setdiscontinuity
     */
    SetDiscontinuity(bDiscontinuity) {
        result := ComCall(16, this, "int", bDiscontinuity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getmediatime
     */
    GetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(17, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setmediatime
     */
    SetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(18, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }
}

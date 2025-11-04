#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStreamSample.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammediatypesample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaTypeSample extends IStreamSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMediaTypeSample
     * @type {Guid}
     */
    static IID => Guid("{ab6b4afb-f6e4-11d0-900d-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPointer", "GetPointer", "GetSize", "GetTime", "SetTime", "IsSyncPoint", "SetSyncPoint", "IsPreroll", "SetPreroll", "GetActualDataLength", "SetActualDataLength", "GetMediaType", "SetMediaType", "IsDiscontinuity", "SetDiscontinuity", "GetMediaTime", "SetMediaTime"]

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setpointer
     */
    SetPointer(pBuffer, lSize) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pBufferMarshal, pBuffer, "int", lSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-getpointer
     */
    GetPointer(ppBuffer) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, ppBufferMarshal, ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-getsize
     */
    GetSize() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-gettime
     */
    GetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(11, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-settime
     */
    SetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(12, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-issyncpoint
     */
    IsSyncPoint() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bIsSyncPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setsyncpoint
     */
    SetSyncPoint(bIsSyncPoint) {
        result := ComCall(14, this, "int", bIsSyncPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-ispreroll
     */
    IsPreroll() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bIsPreroll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setpreroll
     */
    SetPreroll(bIsPreroll) {
        result := ComCall(16, this, "int", bIsPreroll, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-getactualdatalength
     */
    GetActualDataLength() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IAMMediaTypeSample0000 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setactualdatalength
     */
    SetActualDataLength(__MIDL__IAMMediaTypeSample0000) {
        result := ComCall(18, this, "int", __MIDL__IAMMediaTypeSample0000, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-getmediatype
     */
    GetMediaType(ppMediaType) {
        ppMediaTypeMarshal := ppMediaType is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, ppMediaTypeMarshal, ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setmediatype
     */
    SetMediaType(pMediaType) {
        result := ComCall(20, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-isdiscontinuity
     */
    IsDiscontinuity() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bDiscontinuity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setdiscontinuity
     */
    SetDiscontinuity(bDiscontinuity) {
        result := ComCall(22, this, "int", bDiscontinuity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-getmediatime
     */
    GetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(23, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediatypesample-setmediatime
     */
    SetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(24, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }
}

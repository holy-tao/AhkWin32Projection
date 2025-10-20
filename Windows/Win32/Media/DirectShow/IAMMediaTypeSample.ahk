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
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    SetPointer(pBuffer, lSize) {
        result := ComCall(8, this, "char*", pBuffer, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetPointer(ppBuffer) {
        result := ComCall(9, this, "char*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSize() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    GetTime(pTimeStart, pTimeEnd) {
        result := ComCall(11, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
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
        result := ComCall(12, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSyncPoint() {
        result := ComCall(13, this, "int")
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
        result := ComCall(14, this, "int", bIsSyncPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPreroll() {
        result := ComCall(15, this, "int")
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
        result := ComCall(16, this, "int", bIsPreroll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetActualDataLength() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IAMMediaTypeSample0000 
     * @returns {HRESULT} 
     */
    SetActualDataLength(__MIDL__IAMMediaTypeSample0000) {
        result := ComCall(18, this, "int", __MIDL__IAMMediaTypeSample0000, "int")
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
        result := ComCall(19, this, "ptr", ppMediaType, "int")
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
        result := ComCall(20, this, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDiscontinuity() {
        result := ComCall(21, this, "int")
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
        result := ComCall(22, this, "int", bDiscontinuity, "int")
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
        result := ComCall(23, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
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
        result := ComCall(24, this, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

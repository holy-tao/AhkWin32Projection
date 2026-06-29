#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFByteStreamCacheControl.ahk" { IMFByteStreamCacheControl }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MF_BYTE_STREAM_CACHE_RANGE.ahk" { MF_BYTE_STREAM_CACHE_RANGE }

/**
 * Controls how a network byte stream transfers data to a local cache. (IMFByteStreamCacheControl2)
 * @remarks
 * Byte streams object in Microsoft Media Foundation can optionally implement this interface. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the byte stream object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfbytestreamcachecontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFByteStreamCacheControl2 extends IMFByteStreamCacheControl {
    /**
     * The interface identifier for IMFByteStreamCacheControl2
     * @type {Guid}
     */
    static IID := Guid("{71ce469c-f34b-49ea-a56b-2d2a10e51149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFByteStreamCacheControl2 interfaces
    */
    struct Vtbl extends IMFByteStreamCacheControl.Vtbl {
        GetByteRanges              : IntPtr
        SetCacheLimit              : IntPtr
        IsBackgroundTransferActive : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFByteStreamCacheControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ranges of bytes that are currently stored in the cache.
     * @param {Pointer<Integer>} pcRanges Receives the number of ranges returned in the <i>ppRanges</i> array.
     * @param {Pointer<Pointer<MF_BYTE_STREAM_CACHE_RANGE>>} ppRanges Receives an array of <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_byte_stream_cache_range">MF_BYTE_STREAM_CACHE_RANGE</a> structures. Each structure specifies a range of bytes stored in the cache. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-getbyteranges
     */
    GetByteRanges(pcRanges, ppRanges) {
        pcRangesMarshal := pcRanges is VarRef ? "uint*" : "ptr"
        ppRangesMarshal := ppRanges is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcRangesMarshal, pcRanges, ppRangesMarshal, ppRanges, "HRESULT")
        return result
    }

    /**
     * Limits the cache size.
     * @param {Integer} qwBytes The maximum number of bytes to store in the cache, or <b>ULONGLONG_MAX </b> for no limit.  The default value is no limit.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-setcachelimit
     */
    SetCacheLimit(qwBytes) {
        result := ComCall(5, this, "uint", qwBytes, "HRESULT")
        return result
    }

    /**
     * Queries whether background transfer is active.
     * @remarks
     * Background transfer might stop because the cache limit was reached (see <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-setcachelimit">IMFByteStreamCacheControl2::SetCacheLimit</a>) or because the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamcachecontrol-stopbackgroundtransfer">IMFByteStreamCacheControl::StopBackgroundTransfer</a> method was called.
     * @returns {BOOL} Receives the value <b>TRUE</b> if background transfer is currently active, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-isbackgroundtransferactive
     */
    IsBackgroundTransferActive() {
        result := ComCall(6, this, BOOL.Ptr, &pfActive := 0, "HRESULT")
        return pfActive
    }

    Query(iid) {
        if (IMFByteStreamCacheControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetByteRanges := CallbackCreate(GetMethod(implObj, "GetByteRanges"), flags, 3)
        this.vtbl.SetCacheLimit := CallbackCreate(GetMethod(implObj, "SetCacheLimit"), flags, 2)
        this.vtbl.IsBackgroundTransferActive := CallbackCreate(GetMethod(implObj, "IsBackgroundTransferActive"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetByteRanges)
        CallbackFree(this.vtbl.SetCacheLimit)
        CallbackFree(this.vtbl.IsBackgroundTransferActive)
    }
}

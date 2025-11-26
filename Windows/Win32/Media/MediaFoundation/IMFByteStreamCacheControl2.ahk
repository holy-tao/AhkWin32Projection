#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFByteStreamCacheControl.ahk

/**
 * Controls how a network byte stream transfers data to a local cache.
 * @remarks
 * 
 * Byte streams object in Microsoft Media Foundation can optionally implement this interface. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the byte stream object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfbytestreamcachecontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamCacheControl2 extends IMFByteStreamCacheControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStreamCacheControl2
     * @type {Guid}
     */
    static IID => Guid("{71ce469c-f34b-49ea-a56b-2d2a10e51149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetByteRanges", "SetCacheLimit", "IsBackgroundTransferActive"]

    /**
     * Gets the ranges of bytes that are currently stored in the cache.
     * @param {Pointer<Integer>} pcRanges Receives the number of ranges returned in the <i>ppRanges</i> array.
     * @param {Pointer<Pointer<MF_BYTE_STREAM_CACHE_RANGE>>} ppRanges Receives an array of <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_byte_stream_cache_range">MF_BYTE_STREAM_CACHE_RANGE</a> structures. Each structure specifies a range of bytes stored in the cache. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamcachecontrol2-getbyteranges
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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamcachecontrol2-setcachelimit
     */
    SetCacheLimit(qwBytes) {
        result := ComCall(5, this, "uint", qwBytes, "HRESULT")
        return result
    }

    /**
     * Queries whether background transfer is active.
     * @returns {BOOL} Receives the value <b>TRUE</b> if background transfer is currently active, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamcachecontrol2-isbackgroundtransferactive
     */
    IsBackgroundTransferActive() {
        result := ComCall(6, this, "int*", &pfActive := 0, "HRESULT")
        return pfActive
    }
}

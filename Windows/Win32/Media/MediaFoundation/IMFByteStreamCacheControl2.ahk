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
     * 
     * @param {Pointer<Integer>} pcRanges 
     * @param {Pointer<Pointer<MF_BYTE_STREAM_CACHE_RANGE>>} ppRanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-getbyteranges
     */
    GetByteRanges(pcRanges, ppRanges) {
        pcRangesMarshal := pcRanges is VarRef ? "uint*" : "ptr"
        ppRangesMarshal := ppRanges is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcRangesMarshal, pcRanges, ppRangesMarshal, ppRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} qwBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-setcachelimit
     */
    SetCacheLimit(qwBytes) {
        result := ComCall(5, this, "uint", qwBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-isbackgroundtransferactive
     */
    IsBackgroundTransferActive() {
        result := ComCall(6, this, "int*", &pfActive := 0, "HRESULT")
        return pfActive
    }
}

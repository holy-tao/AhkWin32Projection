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
     * 
     * @param {Pointer<UInt32>} pcRanges 
     * @param {Pointer<MF_BYTE_STREAM_CACHE_RANGE>} ppRanges 
     * @returns {HRESULT} 
     */
    GetByteRanges(pcRanges, ppRanges) {
        result := ComCall(4, this, "uint*", pcRanges, "ptr", ppRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwBytes 
     * @returns {HRESULT} 
     */
    SetCacheLimit(qwBytes) {
        result := ComCall(5, this, "uint", qwBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfActive 
     * @returns {HRESULT} 
     */
    IsBackgroundTransferActive(pfActive) {
        result := ComCall(6, this, "ptr", pfActive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

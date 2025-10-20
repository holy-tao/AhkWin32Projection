#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupIterateChunksHash32 extends IUnknown{
    /**
     * The interface identifier for IDedupIterateChunksHash32
     * @type {Guid}
     */
    static IID => Guid("{90b584d3-72aa-400f-9767-cad866a5a2d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} ulBufferLength 
     * @returns {HRESULT} 
     */
    PushBuffer(pBuffer, ulBufferLength) {
        result := ComCall(3, this, "char*", pBuffer, "uint", ulBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulMaxChunks 
     * @param {Pointer<DEDUP_CHUNK_INFO_HASH32>} pArrChunks 
     * @param {Pointer<UInt32>} pulFetched 
     * @returns {HRESULT} 
     */
    Next(ulMaxChunks, pArrChunks, pulFetched) {
        result := ComCall(4, this, "uint", ulMaxChunks, "ptr", pArrChunks, "uint*", pulFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Drain() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

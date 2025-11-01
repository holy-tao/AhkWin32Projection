#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupIterateChunksHash32 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PushBuffer", "Next", "Drain", "Reset"]

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} ulBufferLength 
     * @returns {HRESULT} 
     */
    PushBuffer(pBuffer, ulBufferLength) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", ulBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulMaxChunks 
     * @param {Pointer<DEDUP_CHUNK_INFO_HASH32>} pArrChunks 
     * @param {Pointer<Integer>} pulFetched 
     * @returns {HRESULT} 
     */
    Next(ulMaxChunks, pArrChunks, pulFetched) {
        pulFetchedMarshal := pulFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulMaxChunks, "ptr", pArrChunks, pulFetchedMarshal, pulFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Drain() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

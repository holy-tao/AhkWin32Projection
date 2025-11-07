#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is no longer supported by the AVI Splitter. Note  This interface was defined to support older hardware decoders that required AVI files to be read into directly hardware memory.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdevmemoryallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDevMemoryAllocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMDevMemoryAllocator
     * @type {Guid}
     */
    static IID => Guid("{c6545bf0-e76b-11d0-bd52-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "CheckMemory", "Alloc", "Free", "GetDevMemoryObject"]

    /**
     * 
     * @param {Pointer<Integer>} pdwcbTotalFree 
     * @param {Pointer<Integer>} pdwcbLargestFree 
     * @param {Pointer<Integer>} pdwcbTotalMemory 
     * @param {Pointer<Integer>} pdwcbMinimumChunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-getinfo
     */
    GetInfo(pdwcbTotalFree, pdwcbLargestFree, pdwcbTotalMemory, pdwcbMinimumChunk) {
        pdwcbTotalFreeMarshal := pdwcbTotalFree is VarRef ? "uint*" : "ptr"
        pdwcbLargestFreeMarshal := pdwcbLargestFree is VarRef ? "uint*" : "ptr"
        pdwcbTotalMemoryMarshal := pdwcbTotalMemory is VarRef ? "uint*" : "ptr"
        pdwcbMinimumChunkMarshal := pdwcbMinimumChunk is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwcbTotalFreeMarshal, pdwcbTotalFree, pdwcbLargestFreeMarshal, pdwcbLargestFree, pdwcbTotalMemoryMarshal, pdwcbTotalMemory, pdwcbMinimumChunkMarshal, pdwcbMinimumChunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-checkmemory
     */
    CheckMemory(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwcbBuffer 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-alloc
     */
    Alloc(pdwcbBuffer) {
        pdwcbBufferMarshal := pdwcbBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppBuffer := 0, pdwcbBufferMarshal, pdwcbBuffer, "HRESULT")
        return ppBuffer
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-free
     */
    Free(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-getdevmemoryobject
     */
    GetDevMemoryObject(pUnkOuter) {
        result := ComCall(7, this, "ptr*", &ppUnkInnner := 0, "ptr", pUnkOuter, "HRESULT")
        return IUnknown(ppUnkInnner)
    }
}

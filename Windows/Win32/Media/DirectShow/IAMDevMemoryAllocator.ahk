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
        result := ComCall(3, this, "uint*", pdwcbTotalFree, "uint*", pdwcbLargestFree, "uint*", pdwcbTotalMemory, "uint*", pdwcbMinimumChunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-checkmemory
     */
    CheckMemory(pBuffer) {
        result := ComCall(4, this, "char*", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
     * @param {Pointer<Integer>} pdwcbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-alloc
     */
    Alloc(ppBuffer, pdwcbBuffer) {
        result := ComCall(5, this, "ptr*", ppBuffer, "uint*", pdwcbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-free
     */
    Free(pBuffer) {
        result := ComCall(6, this, "char*", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnkInnner 
     * @param {IUnknown} pUnkOuter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemoryallocator-getdevmemoryobject
     */
    GetDevMemoryObject(ppUnkInnner, pUnkOuter) {
        result := ComCall(7, this, "ptr*", ppUnkInnner, "ptr", pUnkOuter, "HRESULT")
        return result
    }
}

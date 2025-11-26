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
     * Note  The IAMDevMemoryAllocator interface is deprecated. Retrieves information about the memory capabilities.
     * @param {Pointer<Integer>} pdwcbTotalFree Pointer to the total free memory size.
     * @param {Pointer<Integer>} pdwcbLargestFree Pointer to the returned largest free memory size.
     * @param {Pointer<Integer>} pdwcbTotalMemory Pointer to the returned total memory size.
     * @param {Pointer<Integer>} pdwcbMinimumChunk Pointer to the returned minimum chunk size, giving granularity and alignment rules.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemoryallocator-getinfo
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
     * Note  The IAMDevMemoryAllocator interface is deprecated. Tests whether the specific instance (device) of the allocator allocated a memory pointer.
     * @param {Pointer<Integer>} pBuffer Pointer to the allocated memory buffer's address.
     * @returns {HRESULT} Returns S_OK if the on-board allocator allocated the memory, or S_FALSE if not. Memory that is on the particular device but not allocated will also return S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemoryallocator-checkmemory
     */
    CheckMemory(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Note  The IAMDevMemoryAllocator interface is deprecated. Allocates a memory buffer.
     * @param {Pointer<Integer>} pdwcbBuffer Pointer to a <b>DWORD</b> whose input value is the number of bytes to allocate and whose output value is the actual number of bytes allocated.
     * @returns {Pointer<Integer>} Pointer that will receive the address of the allocated memory buffer.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemoryallocator-alloc
     */
    Alloc(pdwcbBuffer) {
        pdwcbBufferMarshal := pdwcbBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppBuffer := 0, pdwcbBufferMarshal, pdwcbBuffer, "HRESULT")
        return ppBuffer
    }

    /**
     * Note  The IAMDevMemoryAllocator interface is deprecated. Frees the previously allocated memory.
     * @param {Pointer<Integer>} pBuffer Pointer to the allocated memory.
     * @returns {HRESULT} Returns E_INVALIDARG if the specified allocator didn't allocate the memory (that is, <a href="/windows/desktop/api/strmif/nf-strmif-iamdevmemoryallocator-checkmemory">CheckMemory</a> fails).
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemoryallocator-free
     */
    Free(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Note  The IAMDevMemoryAllocator interface is deprecated. Retrieves an IUnknown interface pointer to a device memory control object that can be aggregated with a custom allocator.
     * @param {IUnknown} pUnkOuter Pointer to the custom allocator's own <b>IUnknown</b> interface. This interface aggregates the device memory control object inside the custom allocator.
     * @returns {IUnknown} Address of a pointer to the newly created control object's own <b>IUnknown</b>. This inner <b>IUnknown</b> interface should be released when the outer object is destroyed. The custom allocator should call the <b>QueryInterface</b> method on this pointer to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamdevmemorycontrol">IAMDevMemoryControl</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemoryallocator-getdevmemoryobject
     */
    GetDevMemoryObject(pUnkOuter) {
        result := ComCall(7, this, "ptr*", &ppUnkInnner := 0, "ptr", pUnkOuter, "HRESULT")
        return IUnknown(ppUnkInnner)
    }
}

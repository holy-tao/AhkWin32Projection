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
     * 
     * @param {Pointer<UInt32>} pdwcbTotalFree 
     * @param {Pointer<UInt32>} pdwcbLargestFree 
     * @param {Pointer<UInt32>} pdwcbTotalMemory 
     * @param {Pointer<UInt32>} pdwcbMinimumChunk 
     * @returns {HRESULT} 
     */
    GetInfo(pdwcbTotalFree, pdwcbLargestFree, pdwcbTotalMemory, pdwcbMinimumChunk) {
        result := ComCall(3, this, "uint*", pdwcbTotalFree, "uint*", pdwcbLargestFree, "uint*", pdwcbTotalMemory, "uint*", pdwcbMinimumChunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @returns {HRESULT} 
     */
    CheckMemory(pBuffer) {
        result := ComCall(4, this, "char*", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppBuffer 
     * @param {Pointer<UInt32>} pdwcbBuffer 
     * @returns {HRESULT} 
     */
    Alloc(ppBuffer, pdwcbBuffer) {
        result := ComCall(5, this, "char*", ppBuffer, "uint*", pdwcbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @returns {HRESULT} 
     */
    Free(pBuffer) {
        result := ComCall(6, this, "char*", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnkInnner 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    GetDevMemoryObject(ppUnkInnner, pUnkOuter) {
        result := ComCall(7, this, "ptr", ppUnkInnner, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

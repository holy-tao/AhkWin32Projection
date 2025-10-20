#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMemAllocator interface allocates media samples, for moving data between pins.This interface is used by pins that share allocators, when the input pin exposes the IMemInputPin interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imemallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemAllocator extends IUnknown{
    /**
     * The interface identifier for IMemAllocator
     * @type {Guid}
     */
    static IID => Guid("{56a8689c-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pRequest 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pActual 
     * @returns {HRESULT} 
     */
    SetProperties(pRequest, pActual) {
        result := ComCall(3, this, "ptr", pRequest, "ptr", pActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @returns {HRESULT} 
     */
    GetProperties(pProps) {
        result := ComCall(4, this, "ptr", pProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Decommit() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} ppBuffer 
     * @param {Pointer<Int64>} pStartTime 
     * @param {Pointer<Int64>} pEndTime 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetBuffer(ppBuffer, pStartTime, pEndTime, dwFlags) {
        result := ComCall(7, this, "ptr", ppBuffer, "int64*", pStartTime, "int64*", pEndTime, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} pBuffer 
     * @returns {HRESULT} 
     */
    ReleaseBuffer(pBuffer) {
        result := ComCall(8, this, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

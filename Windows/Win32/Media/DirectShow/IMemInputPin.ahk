#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMemInputPin interface delivers media data to an input pin.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imeminputpin
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemInputPin extends IUnknown{
    /**
     * The interface identifier for IMemInputPin
     * @type {Guid}
     */
    static IID => Guid("{56a8689d-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMemAllocator>} ppAllocator 
     * @returns {HRESULT} 
     */
    GetAllocator(ppAllocator) {
        result := ComCall(3, this, "ptr", ppAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMemAllocator>} pAllocator 
     * @param {BOOL} bReadOnly 
     * @returns {HRESULT} 
     */
    NotifyAllocator(pAllocator, bReadOnly) {
        result := ComCall(4, this, "ptr", pAllocator, "int", bReadOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @returns {HRESULT} 
     */
    GetAllocatorRequirements(pProps) {
        result := ComCall(5, this, "ptr", pProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} pSample 
     * @returns {HRESULT} 
     */
    Receive(pSample) {
        result := ComCall(6, this, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} pSamples 
     * @param {Integer} nSamples 
     * @param {Pointer<Int32>} nSamplesProcessed 
     * @returns {HRESULT} 
     */
    ReceiveMultiple(pSamples, nSamples, nSamplesProcessed) {
        result := ComCall(7, this, "ptr", pSamples, "int", nSamples, "int*", nSamplesProcessed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReceiveCanBlock() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

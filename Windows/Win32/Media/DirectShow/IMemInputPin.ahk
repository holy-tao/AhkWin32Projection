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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllocator", "NotifyAllocator", "GetAllocatorRequirements", "Receive", "ReceiveMultiple", "ReceiveCanBlock"]

    /**
     * 
     * @param {Pointer<IMemAllocator>} ppAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imeminputpin-getallocator
     */
    GetAllocator(ppAllocator) {
        result := ComCall(3, this, "ptr*", ppAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMemAllocator} pAllocator 
     * @param {BOOL} bReadOnly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imeminputpin-notifyallocator
     */
    NotifyAllocator(pAllocator, bReadOnly) {
        result := ComCall(4, this, "ptr", pAllocator, "int", bReadOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imeminputpin-getallocatorrequirements
     */
    GetAllocatorRequirements(pProps) {
        result := ComCall(5, this, "ptr", pProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imeminputpin-receive
     */
    Receive(pSample) {
        result := ComCall(6, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} pSamples 
     * @param {Integer} nSamples 
     * @param {Pointer<Integer>} nSamplesProcessed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imeminputpin-receivemultiple
     */
    ReceiveMultiple(pSamples, nSamples, nSamplesProcessed) {
        result := ComCall(7, this, "ptr*", pSamples, "int", nSamples, "int*", nSamplesProcessed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imeminputpin-receivecanblock
     */
    ReceiveCanBlock() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}

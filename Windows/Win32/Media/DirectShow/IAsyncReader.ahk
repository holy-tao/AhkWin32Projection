#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAsyncReader interface performs an asynchronous data request on a filter.This interface is exposed by output pins that perform asynchronous read operations.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iasyncreader
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAsyncReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncReader
     * @type {Guid}
     */
    static IID => Guid("{56a868aa-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAllocator", "Request", "WaitForNext", "SyncReadAligned", "SyncRead", "Length", "BeginFlush", "EndFlush"]

    /**
     * 
     * @param {IMemAllocator} pPreferred 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @param {Pointer<IMemAllocator>} ppActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-requestallocator
     */
    RequestAllocator(pPreferred, pProps, ppActual) {
        result := ComCall(3, this, "ptr", pPreferred, "ptr", pProps, "ptr*", ppActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} pSample 
     * @param {Pointer} dwUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-request
     */
    Request(pSample, dwUser) {
        result := ComCall(4, this, "ptr", pSample, "ptr", dwUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IMediaSample>} ppSample 
     * @param {Pointer<Pointer>} pdwUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-waitfornext
     */
    WaitForNext(dwTimeout, ppSample, pdwUser) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr*", ppSample, "ptr*", pdwUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-syncreadaligned
     */
    SyncReadAligned(pSample) {
        result := ComCall(6, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llPosition 
     * @param {Integer} lLength 
     * @param {Pointer} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-syncread
     */
    SyncRead(llPosition, lLength, pBuffer) {
        result := ComCall(7, this, "int64", llPosition, "int", lLength, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTotal 
     * @param {Pointer<Integer>} pAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-length
     */
    Length(pTotal, pAvailable) {
        result := ComCall(8, this, "int64*", pTotal, "int64*", pAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-beginflush
     */
    BeginFlush() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iasyncreader-endflush
     */
    EndFlush() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}

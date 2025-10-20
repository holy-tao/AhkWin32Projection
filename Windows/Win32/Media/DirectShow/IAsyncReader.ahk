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
     * 
     * @param {Pointer<IMemAllocator>} pPreferred 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pProps 
     * @param {Pointer<IMemAllocator>} ppActual 
     * @returns {HRESULT} 
     */
    RequestAllocator(pPreferred, pProps, ppActual) {
        result := ComCall(3, this, "ptr", pPreferred, "ptr", pProps, "ptr", ppActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} pSample 
     * @param {Pointer} dwUser 
     * @returns {HRESULT} 
     */
    Request(pSample, dwUser) {
        result := ComCall(4, this, "ptr", pSample, "ptr", dwUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IMediaSample>} ppSample 
     * @param {Pointer<UIntPtr>} pdwUser 
     * @returns {HRESULT} 
     */
    WaitForNext(dwTimeout, ppSample, pdwUser) {
        result := ComCall(5, this, "uint", dwTimeout, "ptr", ppSample, "ptr*", pdwUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} pSample 
     * @returns {HRESULT} 
     */
    SyncReadAligned(pSample) {
        result := ComCall(6, this, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} llPosition 
     * @param {Integer} lLength 
     * @param {Pointer} pBuffer 
     * @returns {HRESULT} 
     */
    SyncRead(llPosition, lLength, pBuffer) {
        result := ComCall(7, this, "int64", llPosition, "int", lLength, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTotal 
     * @param {Pointer<Int64>} pAvailable 
     * @returns {HRESULT} 
     */
    Length(pTotal, pAvailable) {
        result := ComCall(8, this, "int64*", pTotal, "int64*", pAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginFlush() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndFlush() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

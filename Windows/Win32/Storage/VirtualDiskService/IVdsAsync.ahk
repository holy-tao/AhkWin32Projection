#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages asynchronous operations. Methods that initiate asynchronous operations return a pointer to an IVdsAsync interface, allowing the caller to optionally cancel, wait for, or query the status of the asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsasync
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAsync extends IUnknown{
    /**
     * The interface identifier for IVdsAsync
     * @type {Guid}
     */
    static IID => Guid("{d5d23b6d-5a55-4492-9889-397a3c2d2dbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pHrResult 
     * @param {Pointer<VDS_ASYNC_OUTPUT>} pAsyncOut 
     * @returns {HRESULT} 
     */
    Wait(pHrResult, pAsyncOut) {
        result := ComCall(4, this, "ptr", pHrResult, "ptr", pAsyncOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pHrResult 
     * @param {Pointer<UInt32>} pulPercentCompleted 
     * @returns {HRESULT} 
     */
    QueryStatus(pHrResult, pulPercentCompleted) {
        result := ComCall(5, this, "ptr", pHrResult, "uint*", pulPercentCompleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

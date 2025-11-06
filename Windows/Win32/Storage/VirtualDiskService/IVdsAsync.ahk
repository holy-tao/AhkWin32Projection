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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Wait", "QueryStatus"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pHrResult 
     * @param {Pointer<VDS_ASYNC_OUTPUT>} pAsyncOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsasync-wait
     */
    Wait(pHrResult, pAsyncOut) {
        pHrResultMarshal := pHrResult is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pHrResultMarshal, pHrResult, "ptr", pAsyncOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pHrResult 
     * @param {Pointer<Integer>} pulPercentCompleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsasync-querystatus
     */
    QueryStatus(pHrResult, pulPercentCompleted) {
        pHrResultMarshal := pHrResult is VarRef ? "int*" : "ptr"
        pulPercentCompletedMarshal := pulPercentCompleted is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pHrResultMarshal, pHrResult, pulPercentCompletedMarshal, pulPercentCompleted, "HRESULT")
        return result
    }
}

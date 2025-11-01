#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents the mechanism by which the destination provider asynchronously retrieves item data from the source provider.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iasynchronousdataretriever
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IAsynchronousDataRetriever extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsynchronousDataRetriever
     * @type {Guid}
     */
    static IID => Guid("{9fc7e470-61ea-4a88-9be4-df56a27cfef2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdParameters", "RegisterCallback", "RevokeCallback", "LoadChangeData"]

    /**
     * 
     * @param {Pointer<ID_PARAMETERS>} pIdParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, "ptr", pIdParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataRetrieverCallback} pDataRetrieverCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-registercallback
     */
    RegisterCallback(pDataRetrieverCallback) {
        result := ComCall(4, this, "ptr", pDataRetrieverCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataRetrieverCallback} pDataRetrieverCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-revokecallback
     */
    RevokeCallback(pDataRetrieverCallback) {
        result := ComCall(5, this, "ptr", pDataRetrieverCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ILoadChangeContext} pLoadChangeContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-loadchangedata
     */
    LoadChangeData(pLoadChangeContext) {
        result := ComCall(6, this, "ptr", pLoadChangeContext, "HRESULT")
        return result
    }
}

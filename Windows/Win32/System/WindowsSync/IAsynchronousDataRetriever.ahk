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
     * 
     * @param {Pointer<ID_PARAMETERS>} pIdParameters 
     * @returns {HRESULT} 
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, "ptr", pIdParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataRetrieverCallback>} pDataRetrieverCallback 
     * @returns {HRESULT} 
     */
    RegisterCallback(pDataRetrieverCallback) {
        result := ComCall(4, this, "ptr", pDataRetrieverCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataRetrieverCallback>} pDataRetrieverCallback 
     * @returns {HRESULT} 
     */
    RevokeCallback(pDataRetrieverCallback) {
        result := ComCall(5, this, "ptr", pDataRetrieverCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILoadChangeContext>} pLoadChangeContext 
     * @returns {HRESULT} 
     */
    LoadChangeData(pLoadChangeContext) {
        result := ComCall(6, this, "ptr", pLoadChangeContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

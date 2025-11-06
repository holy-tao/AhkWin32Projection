#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncDataConverter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncDataConverter
     * @type {Guid}
     */
    static IID => Guid("{435d4861-68d5-44aa-a0f9-72a0b00ef9cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertDataRetrieverFromProviderFormat", "ConvertDataRetrieverToProviderFormat", "ConvertDataFromProviderFormat", "ConvertDataToProviderFormat"]

    /**
     * 
     * @param {IUnknown} pUnkDataRetrieverIn 
     * @param {IEnumSyncChanges} pEnumSyncChanges 
     * @returns {IUnknown} 
     */
    ConvertDataRetrieverFromProviderFormat(pUnkDataRetrieverIn, pEnumSyncChanges) {
        result := ComCall(3, this, "ptr", pUnkDataRetrieverIn, "ptr", pEnumSyncChanges, "ptr*", &ppUnkDataOut := 0, "HRESULT")
        return IUnknown(ppUnkDataOut)
    }

    /**
     * 
     * @param {IUnknown} pUnkDataRetrieverIn 
     * @param {IEnumSyncChanges} pEnumSyncChanges 
     * @returns {IUnknown} 
     */
    ConvertDataRetrieverToProviderFormat(pUnkDataRetrieverIn, pEnumSyncChanges) {
        result := ComCall(4, this, "ptr", pUnkDataRetrieverIn, "ptr", pEnumSyncChanges, "ptr*", &ppUnkDataOut := 0, "HRESULT")
        return IUnknown(ppUnkDataOut)
    }

    /**
     * 
     * @param {ILoadChangeContext} pDataContext 
     * @param {IUnknown} pUnkDataIn 
     * @returns {IUnknown} 
     */
    ConvertDataFromProviderFormat(pDataContext, pUnkDataIn) {
        result := ComCall(5, this, "ptr", pDataContext, "ptr", pUnkDataIn, "ptr*", &ppUnkDataOut := 0, "HRESULT")
        return IUnknown(ppUnkDataOut)
    }

    /**
     * 
     * @param {ILoadChangeContext} pDataContext 
     * @param {IUnknown} pUnkDataOut 
     * @returns {IUnknown} 
     */
    ConvertDataToProviderFormat(pDataContext, pUnkDataOut) {
        result := ComCall(6, this, "ptr", pDataContext, "ptr", pUnkDataOut, "ptr*", &ppUnkDataout := 0, "HRESULT")
        return IUnknown(ppUnkDataout)
    }
}

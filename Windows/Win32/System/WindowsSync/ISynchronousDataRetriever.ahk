#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents the mechanism by which the destination provider retrieves item data from the source provider.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isynchronousdataretriever
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISynchronousDataRetriever extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronousDataRetriever
     * @type {Guid}
     */
    static IID => Guid("{9b22f2a9-a4cd-4648-9d8e-3a510d4da04b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdParameters", "LoadChangeData"]

    /**
     * 
     * @param {Pointer<ID_PARAMETERS>} pIdParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynchronousdataretriever-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, "ptr", pIdParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ILoadChangeContext} pLoadChangeContext 
     * @param {Pointer<IUnknown>} ppUnkData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynchronousdataretriever-loadchangedata
     */
    LoadChangeData(pLoadChangeContext, ppUnkData) {
        result := ComCall(4, this, "ptr", pLoadChangeContext, "ptr*", ppUnkData, "HRESULT")
        return result
    }
}

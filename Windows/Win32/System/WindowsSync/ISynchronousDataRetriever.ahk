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
     * @param {Pointer<ILoadChangeContext>} pLoadChangeContext 
     * @param {Pointer<IUnknown>} ppUnkData 
     * @returns {HRESULT} 
     */
    LoadChangeData(pLoadChangeContext, ppUnkData) {
        result := ComCall(4, this, "ptr", pLoadChangeContext, "ptr", ppUnkData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

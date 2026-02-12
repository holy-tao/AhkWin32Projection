#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents the mechanism by which the destination provider retrieves item data from the source provider.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nn-winsync-isynchronousdataretriever
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
     * Gets the ID format schema of the provider. (ISynchronousDataRetriever.GetIdParameters)
     * @param {Pointer<ID_PARAMETERS>} pIdParameters Returns the ID format schema of the provider.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nf-winsync-isynchronousdataretriever-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, "ptr", pIdParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves item data for a change. (ISynchronousDataRetriever.LoadChangeData)
     * @remarks
     * The source provider determines the data retrieval interface that is implemented by the object that is returned in <i>ppUnkData</i>. The destination provider can acquire this interface by using the <b>QueryInterface</b> method of <i>ppUnkData</i>.
     * @param {ILoadChangeContext} pLoadChangeContext Metadata that describes the change for which data should be retrieved.
     * @returns {IUnknown} Returns the item data for the change specified in <i>pLoadChangeContext</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nf-winsync-isynchronousdataretriever-loadchangedata
     */
    LoadChangeData(pLoadChangeContext) {
        result := ComCall(4, this, "ptr", pLoadChangeContext, "ptr*", &ppUnkData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppUnkData)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Failover Cluster Administrator calls your implementation of the IWEInvokeCommand interface when users select context menu items that you created with the IWEExtendContextMenu interface.
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iweinvokecommand
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWEInvokeCommand extends IUnknown{
    /**
     * The interface identifier for IWEInvokeCommand
     * @type {Guid}
     */
    static IID => Guid("{97dede66-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} nCommandID 
     * @param {Pointer<IUnknown>} piData 
     * @returns {HRESULT} 
     */
    InvokeCommand(nCommandID, piData) {
        result := ComCall(3, this, "uint", nCommandID, "ptr", piData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

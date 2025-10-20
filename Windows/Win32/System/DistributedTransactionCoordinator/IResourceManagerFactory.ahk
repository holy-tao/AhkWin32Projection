#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManagerFactory extends IUnknown{
    /**
     * The interface identifier for IResourceManagerFactory
     * @type {Guid}
     */
    static IID => Guid("{13741d20-87eb-11ce-8081-0080c758527e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidRM 
     * @param {PSTR} pszRMName 
     * @param {Pointer<IResourceManagerSink>} pIResMgrSink 
     * @param {Pointer<IResourceManager>} ppResMgr 
     * @returns {HRESULT} 
     */
    Create(pguidRM, pszRMName, pIResMgrSink, ppResMgr) {
        result := ComCall(3, this, "ptr", pguidRM, "ptr", pszRMName, "ptr", pIResMgrSink, "ptr", ppResMgr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

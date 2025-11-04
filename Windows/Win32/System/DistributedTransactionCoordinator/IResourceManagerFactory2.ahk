#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IResourceManagerFactory.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManagerFactory2 extends IResourceManagerFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManagerFactory2
     * @type {Guid}
     */
    static IID => Guid("{6b369c21-fbd2-11d1-8f47-00c04f8ee57d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEx"]

    /**
     * 
     * @param {Pointer<Guid>} pguidRM 
     * @param {PSTR} pszRMName 
     * @param {IResourceManagerSink} pIResMgrSink 
     * @param {Pointer<Guid>} riidRequested 
     * @param {Pointer<Pointer<Void>>} ppvResMgr 
     * @returns {HRESULT} 
     */
    CreateEx(pguidRM, pszRMName, pIResMgrSink, riidRequested, ppvResMgr) {
        pszRMName := pszRMName is String ? StrPtr(pszRMName) : pszRMName

        ppvResMgrMarshal := ppvResMgr is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pguidRM, "ptr", pszRMName, "ptr", pIResMgrSink, "ptr", riidRequested, ppvResMgrMarshal, ppvResMgr, "HRESULT")
        return result
    }
}

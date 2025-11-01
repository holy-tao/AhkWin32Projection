#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IResourceManager2.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManagerRejoinable extends IResourceManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManagerRejoinable
     * @type {Guid}
     */
    static IID => Guid("{6f6de620-b5df-4f3e-9cfa-c8aebd05172b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Rejoin"]

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @param {Integer} lTimeout 
     * @param {Pointer<Integer>} pXactStat 
     * @returns {HRESULT} 
     */
    Rejoin(pPrepInfo, cbPrepInfo, lTimeout, pXactStat) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"
        pXactStatMarshal := pXactStat is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pPrepInfoMarshal, pPrepInfo, "uint", cbPrepInfo, "uint", lTimeout, pXactStatMarshal, pXactStat, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IResourceManager2.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManagerRejoinable extends IResourceManager2{
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
     * 
     * @param {Pointer<Byte>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @param {Integer} lTimeout 
     * @param {Pointer<Int32>} pXactStat 
     * @returns {HRESULT} 
     */
    Rejoin(pPrepInfo, cbPrepInfo, lTimeout, pXactStat) {
        result := ComCall(9, this, "char*", pPrepInfo, "uint", cbPrepInfo, "uint", lTimeout, "int*", pXactStat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

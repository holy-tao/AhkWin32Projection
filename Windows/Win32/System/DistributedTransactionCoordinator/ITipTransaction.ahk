#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITipTransaction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipTransaction
     * @type {Guid}
     */
    static IID => Guid("{17cf72d0-bac5-11d1-b1bf-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Push", "GetTransactionUrl"]

    /**
     * 
     * @param {Pointer<Integer>} i_pszRemoteTmUrl 
     * @returns {PSTR} 
     */
    Push(i_pszRemoteTmUrl) {
        i_pszRemoteTmUrlMarshal := i_pszRemoteTmUrl is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, i_pszRemoteTmUrlMarshal, i_pszRemoteTmUrl, "ptr*", &o_ppszRemoteTxUrl := 0, "HRESULT")
        return o_ppszRemoteTxUrl
    }

    /**
     * 
     * @returns {PSTR} 
     */
    GetTransactionUrl() {
        result := ComCall(4, this, "ptr*", &o_ppszLocalTxUrl := 0, "HRESULT")
        return o_ppszLocalTxUrl
    }
}

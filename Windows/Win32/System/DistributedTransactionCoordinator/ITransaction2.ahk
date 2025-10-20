#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransactionCloner.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransaction2 extends ITransactionCloner{
    /**
     * The interface identifier for ITransaction2
     * @type {Guid}
     */
    static IID => Guid("{34021548-0065-11d3-bac1-00c04f797be2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<XACTTRANSINFO>} pinfo 
     * @returns {HRESULT} 
     */
    GetTransactionInfo2(pinfo) {
        result := ComCall(7, this, "ptr", pinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

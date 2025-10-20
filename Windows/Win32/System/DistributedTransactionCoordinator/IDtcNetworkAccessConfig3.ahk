#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDtcNetworkAccessConfig2.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcNetworkAccessConfig3 extends IDtcNetworkAccessConfig2{
    /**
     * The interface identifier for IDtcNetworkAccessConfig3
     * @type {Guid}
     */
    static IID => Guid("{76e4b4f3-2ca5-466b-89d5-fd218ee75b49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<BOOL>} pbLUAccess 
     * @returns {HRESULT} 
     */
    GetLUAccess(pbLUAccess) {
        result := ComCall(22, this, "ptr", pbLUAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bLUAccess 
     * @returns {HRESULT} 
     */
    SetLUAccess(bLUAccess) {
        result := ComCall(23, this, "int", bLUAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

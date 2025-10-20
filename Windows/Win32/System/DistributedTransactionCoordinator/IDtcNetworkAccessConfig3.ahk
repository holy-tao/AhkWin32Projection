#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDtcNetworkAccessConfig2.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcNetworkAccessConfig3 extends IDtcNetworkAccessConfig2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLUAccess", "SetLUAccess"]

    /**
     * 
     * @param {Pointer<BOOL>} pbLUAccess 
     * @returns {HRESULT} 
     */
    GetLUAccess(pbLUAccess) {
        result := ComCall(22, this, "ptr", pbLUAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bLUAccess 
     * @returns {HRESULT} 
     */
    SetLUAccess(bLUAccess) {
        result := ComCall(23, this, "int", bLUAccess, "HRESULT")
        return result
    }
}

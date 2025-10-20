#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IXAObtainRMInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXAObtainRMInfo
     * @type {Guid}
     */
    static IID => Guid("{e793f6d2-f53d-11cf-a60d-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ObtainRMInfo"]

    /**
     * 
     * @param {IRMHelper} pIRMHelper 
     * @returns {HRESULT} 
     */
    ObtainRMInfo(pIRMHelper) {
        result := ComCall(3, this, "ptr", pIRMHelper, "HRESULT")
        return result
    }
}

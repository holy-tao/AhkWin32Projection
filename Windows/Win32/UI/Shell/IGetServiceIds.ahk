#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IGetServiceIds extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetServiceIds
     * @type {Guid}
     */
    static IID => Guid("{4a073526-6103-4e21-b7bc-f519d1524e5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetServiceIds"]

    /**
     * 
     * @param {Pointer<Integer>} serviceIdCount 
     * @param {Pointer<Pointer<Guid>>} serviceIds 
     * @returns {HRESULT} 
     */
    GetServiceIds(serviceIdCount, serviceIds) {
        serviceIdCountMarshal := serviceIdCount is VarRef ? "uint*" : "ptr"
        serviceIdsMarshal := serviceIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, serviceIdCountMarshal, serviceIdCount, serviceIdsMarshal, serviceIds, "HRESULT")
        return result
    }
}

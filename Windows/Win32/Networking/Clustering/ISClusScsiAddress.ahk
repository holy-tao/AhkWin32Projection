#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusScsiAddress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusScsiAddress
     * @type {Guid}
     */
    static IID => Guid("{f2e60728-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PortNumber", "get_PathId", "get_TargetId", "get_Lun"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPortNumber 
     * @returns {HRESULT} 
     */
    get_PortNumber(pvarPortNumber) {
        result := ComCall(7, this, "ptr", pvarPortNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPathId 
     * @returns {HRESULT} 
     */
    get_PathId(pvarPathId) {
        result := ComCall(8, this, "ptr", pvarPathId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarTargetId 
     * @returns {HRESULT} 
     */
    get_TargetId(pvarTargetId) {
        result := ComCall(9, this, "ptr", pvarTargetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarLun 
     * @returns {HRESULT} 
     */
    get_Lun(pvarLun) {
        result := ComCall(10, this, "ptr", pvarLun, "HRESULT")
        return result
    }
}

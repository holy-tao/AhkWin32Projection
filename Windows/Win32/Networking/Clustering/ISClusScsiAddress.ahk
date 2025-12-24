#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {VARIANT} 
     */
    PortNumber {
        get => this.get_PortNumber()
    }

    /**
     * @type {VARIANT} 
     */
    PathId {
        get => this.get_PathId()
    }

    /**
     * @type {VARIANT} 
     */
    TargetId {
        get => this.get_TargetId()
    }

    /**
     * @type {VARIANT} 
     */
    Lun {
        get => this.get_Lun()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PortNumber() {
        pvarPortNumber := VARIANT()
        result := ComCall(7, this, "ptr", pvarPortNumber, "HRESULT")
        return pvarPortNumber
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PathId() {
        pvarPathId := VARIANT()
        result := ComCall(8, this, "ptr", pvarPathId, "HRESULT")
        return pvarPathId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TargetId() {
        pvarTargetId := VARIANT()
        result := ComCall(9, this, "ptr", pvarTargetId, "HRESULT")
        return pvarTargetId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Lun() {
        pvarLun := VARIANT()
        result := ComCall(10, this, "ptr", pvarLun, "HRESULT")
        return pvarLun
    }
}

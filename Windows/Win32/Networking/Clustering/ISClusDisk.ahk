#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISClusScsiAddress.ahk
#Include .\ISClusPartitions.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusDisk extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusDisk
     * @type {Guid}
     */
    static IID => Guid("{f2e60724-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Signature", "get_ScsiAddress", "get_DiskNumber", "get_Partitions"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Signature() {
        result := ComCall(7, this, "int*", &plSignature := 0, "HRESULT")
        return plSignature
    }

    /**
     * 
     * @returns {ISClusScsiAddress} 
     */
    get_ScsiAddress() {
        result := ComCall(8, this, "ptr*", &ppScsiAddress := 0, "HRESULT")
        return ISClusScsiAddress(ppScsiAddress)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DiskNumber() {
        result := ComCall(9, this, "int*", &plDiskNumber := 0, "HRESULT")
        return plDiskNumber
    }

    /**
     * 
     * @returns {ISClusPartitions} 
     */
    get_Partitions() {
        result := ComCall(10, this, "ptr*", &ppPartitions := 0, "HRESULT")
        return ISClusPartitions(ppPartitions)
    }
}

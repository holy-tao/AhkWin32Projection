#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} plSignature 
     * @returns {HRESULT} 
     */
    get_Signature(plSignature) {
        result := ComCall(7, this, "int*", plSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusScsiAddress>} ppScsiAddress 
     * @returns {HRESULT} 
     */
    get_ScsiAddress(ppScsiAddress) {
        result := ComCall(8, this, "ptr*", ppScsiAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDiskNumber 
     * @returns {HRESULT} 
     */
    get_DiskNumber(plDiskNumber) {
        result := ComCall(9, this, "int*", plDiskNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusPartitions>} ppPartitions 
     * @returns {HRESULT} 
     */
    get_Partitions(ppPartitions) {
        result := ComCall(10, this, "ptr*", ppPartitions, "HRESULT")
        return result
    }
}

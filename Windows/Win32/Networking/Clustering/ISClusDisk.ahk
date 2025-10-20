#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusDisk extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} plSignature 
     * @returns {HRESULT} 
     */
    get_Signature(plSignature) {
        result := ComCall(7, this, "int*", plSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusScsiAddress>} ppScsiAddress 
     * @returns {HRESULT} 
     */
    get_ScsiAddress(ppScsiAddress) {
        result := ComCall(8, this, "ptr", ppScsiAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDiskNumber 
     * @returns {HRESULT} 
     */
    get_DiskNumber(plDiskNumber) {
        result := ComCall(9, this, "int*", plDiskNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusPartitions>} ppPartitions 
     * @returns {HRESULT} 
     */
    get_Partitions(ppPartitions) {
        result := ComCall(10, this, "ptr", ppPartitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

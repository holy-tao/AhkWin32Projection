#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISClusPartition.ahk

/**
 * Provides extended information about a partition on a Physical Disk resource.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/nn-msclus-iscluspartitionex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPartitionEx extends ISClusPartition{
    /**
     * The interface identifier for ISClusPartitionEx
     * @type {Guid}
     */
    static IID => Guid("{8802d4fe-b32e-4ad1-9dbd-64f18e1166ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<Int32>} plTotalSize 
     * @returns {HRESULT} 
     */
    get_TotalSize(plTotalSize) {
        result := ComCall(14, this, "int*", plTotalSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFreeSpace 
     * @returns {HRESULT} 
     */
    get_FreeSpace(plFreeSpace) {
        result := ComCall(15, this, "int*", plFreeSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDeviceNumber 
     * @returns {HRESULT} 
     */
    get_DeviceNumber(plDeviceNumber) {
        result := ComCall(16, this, "int*", plDeviceNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPartitionNumber 
     * @returns {HRESULT} 
     */
    get_PartitionNumber(plPartitionNumber) {
        result := ComCall(17, this, "int*", plPartitionNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVolumeGuid 
     * @returns {HRESULT} 
     */
    get_VolumeGuid(pbstrVolumeGuid) {
        result := ComCall(18, this, "ptr", pbstrVolumeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

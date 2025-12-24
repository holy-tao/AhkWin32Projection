#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusPartition.ahk

/**
 * Provides extended information about a partition on a Physical Disk resource.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/nn-msclus-iscluspartitionex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPartitionEx extends ISClusPartition{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TotalSize", "get_FreeSpace", "get_DeviceNumber", "get_PartitionNumber", "get_VolumeGuid"]

    /**
     * @type {Integer} 
     */
    TotalSize {
        get => this.get_TotalSize()
    }

    /**
     * @type {Integer} 
     */
    FreeSpace {
        get => this.get_FreeSpace()
    }

    /**
     * @type {Integer} 
     */
    DeviceNumber {
        get => this.get_DeviceNumber()
    }

    /**
     * @type {Integer} 
     */
    PartitionNumber {
        get => this.get_PartitionNumber()
    }

    /**
     * @type {BSTR} 
     */
    VolumeGuid {
        get => this.get_VolumeGuid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSize() {
        result := ComCall(14, this, "int*", &plTotalSize := 0, "HRESULT")
        return plTotalSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FreeSpace() {
        result := ComCall(15, this, "int*", &plFreeSpace := 0, "HRESULT")
        return plFreeSpace
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceNumber() {
        result := ComCall(16, this, "int*", &plDeviceNumber := 0, "HRESULT")
        return plDeviceNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartitionNumber() {
        result := ComCall(17, this, "int*", &plPartitionNumber := 0, "HRESULT")
        return plPartitionNumber
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VolumeGuid() {
        pbstrVolumeGuid := BSTR()
        result := ComCall(18, this, "ptr", pbstrVolumeGuid, "HRESULT")
        return pbstrVolumeGuid
    }
}

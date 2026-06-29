#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a set of valid flags for a partition.
 * @remarks
 * This enumeration provides the values for the <i>ulFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> structure.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PARTITION_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PARTITION_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_partition_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PARTITION_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If set, the partition is a system partition.
     * @type {Integer (Int32)}
     */
    static VDS_PTF_SYSTEM => 1
}

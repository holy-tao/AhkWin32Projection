#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of valid formatting options for the IVdsDiskPartitionMF2::FormatPartitionEx2 method.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_FORMAT_OPTION_FLAGS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_FORMAT_OPTION_FLAGS</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_format_option_flags
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_FORMAT_OPTION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No options are specified.
     * @type {Integer (Int32)}
     */
    static VDS_FSOF_NONE => 0

    /**
     * The format operation should be forced, even if the partition is in use.
     * @type {Integer (Int32)}
     */
    static VDS_FSOF_FORCE => 1

    /**
     * Perform a quick format operation. A quick format does not verify each sector on the volume.
     * @type {Integer (Int32)}
     */
    static VDS_FSOF_QUICK => 2

    /**
     * Enable compression on the newly formatted file system volume. Compression is a feature of the NTFS file system; it cannot be set for other file systems such as FAT or FAT32.
     * @type {Integer (Int32)}
     */
    static VDS_FSOF_COMPRESSION => 4

    /**
     * Forces duplication of metadata for UDF 2.5 and above.
     * @type {Integer (Int32)}
     */
    static VDS_FSOF_DUPLICATE_METADATA => 8
}

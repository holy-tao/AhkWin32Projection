#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This enumeration is not for explicit use.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>tag_VDS_PARTITION_STYLE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>tag_VDS_PARTITION_STYLE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-__vds_partition_style
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct __VDS_PARTITION_STYLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This value is not intended for use.
     * @type {Integer (Int32)}
     */
    static VDS_PARTITION_STYLE_MBR => 0

    /**
     * This value is not intended for use.
     * @type {Integer (Int32)}
     */
    static VDS_PARTITION_STYLE_GPT => 1

    /**
     * This value is not intended for use.
     * @type {Integer (Int32)}
     */
    static VDS_PARTITION_STYLE_RAW => 2
}

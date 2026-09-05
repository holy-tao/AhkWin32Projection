#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration is not for explicit use.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>tag_VDS_PARTITION_STYLE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>tag_VDS_PARTITION_STYLE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-__vds_partition_style
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class __VDS_PARTITION_STYLE extends Win32Enum {

    /**
     * This value is not intended for use.
     * Native name: VDS_PARTITION_STYLE_MBR
     * @type {Integer (Int32)}
     */
    static MBR => 0

    /**
     * This value is not intended for use.
     * Native name: VDS_PARTITION_STYLE_GPT
     * @type {Integer (Int32)}
     */
    static GPT => 1

    /**
     * This value is not intended for use.
     * Native name: VDS_PARTITION_STYLE_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 2
}

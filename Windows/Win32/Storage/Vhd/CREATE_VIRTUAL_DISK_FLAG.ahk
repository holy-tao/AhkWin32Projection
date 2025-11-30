#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual hard disk (VHD) creation flags.
 * @remarks
 * 
 * The <b>CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION</b> flag is used for the creation of a fixed VHD.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-create_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class CREATE_VIRTUAL_DISK_FLAG extends Win32BitflagEnum{

    /**
     * No special creation conditions; system defaults are used.
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * Pre-allocate all physical space necessary for the size of the virtual disk.
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION => 1

    /**
     * Take ownership of the source disk during create from source disk, to insure the source disk does not change 
     *        during the create operation. The source disk must also already be offline or read-only (or both). Ownership is 
     *        released when create is done. This also has a side-effect of disallowing concurrent create from same source 
     *        disk. Create will fail if ownership cannot be obtained or if the source disk is not already offline or 
     *        read-only. This flag is optional, but highly recommended for creates from source disk. No effect for other 
     *        types of create (no effect for create from source VHD; no effect for create without SourcePath).
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_PREVENT_WRITES_TO_SOURCE_DISK => 2

    /**
     * Do not copy initial virtual disk metadata or block states from the parent VHD; this is useful if the parent 
     *        VHD is a stand-in file and the real parent will be explicitly set later.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_DO_NOT_COPY_METADATA_FROM_PARENT => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_CREATE_BACKING_STORAGE => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_USE_CHANGE_TRACKING_SOURCE_LIMIT => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_PRESERVE_PARENT_CHANGE_TRACKING_STATE => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_VHD_SET_USE_ORIGINAL_BACKING_STORAGE => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_SPARSE_FILE => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_PMEM_COMPATIBLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES => 512

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS => 1024
}

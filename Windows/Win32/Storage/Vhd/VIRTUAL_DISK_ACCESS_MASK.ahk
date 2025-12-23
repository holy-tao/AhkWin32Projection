#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * VIRTUAL_DISK_ACCESS_MASK contains the bitmask for specifying access rights to a virtual hard disk (VHD) or CD or DVD image file (ISO).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask~r1
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class VIRTUAL_DISK_ACCESS_MASK extends Win32BitflagEnum{

    /**
     * Open the virtual disk with no access. This is the only supported value when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdssys/nf-vdssys-createvirtualdisk">CreateVirtualDisk</a> and specifying  
     *        <b>CREATE_VIRTUAL_DISK_VERSION_2</b> in the 
     *        <i>VirtualDiskAccessMask</i> parameter.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_NONE => 0

    /**
     * Open the virtual disk for read-only attach access. The caller must have <b>READ</b> 
     *        access to the virtual disk image file.
     * 
     * If used in a request to open a virtual disk that is already open, the 
     *        other handles must be limited to either <b>VIRTUAL_DISK_ACCESS_DETACH</b> or 
     *        <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> access, otherwise the open request with this flag will 
     *        fail.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This access right is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_ATTACH_RO => 65536

    /**
     * Open the virtual disk for read/write attaching access. The caller must have 
     *        <c>(READ | WRITE)</c> access to the virtual disk image file.
     * 
     * If used in a request to open a virtual disk that is already open, the other handles must be limited to either 
     *        <b>VIRTUAL_DISK_ACCESS_DETACH</b> or <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> 
     *        access, otherwise the open request with this flag will fail.
     * 
     * If the virtual disk is part of a differencing chain, the disk for this request cannot be less than the 
     *        <b>RWDepth</b> specified during the prior open request for that differencing chain.
     * 
     * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_ATTACH_RW => 131072

    /**
     * Open the virtual disk to allow detaching of an attached virtual disk. The caller must have 
     *        <c>(FILE_READ_ATTRIBUTES | FILE_READ_DATA)</c> access to the 
     *        virtual disk image file.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This access right is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_DETACH => 262144

    /**
     * Information retrieval access to the virtual disk. The caller must have <b>READ</b> 
     *        access to the virtual disk image file.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This access right is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_GET_INFO => 524288

    /**
     * Virtual disk creation access.
     * 
     * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_CREATE => 1048576

    /**
     * Open the virtual disk to perform offline meta-operations. The caller must have 
     *        <c>(READ | WRITE)</c> access to the virtual disk image file, up 
     *        to  <b>RWDepth</b> if working with a differencing chain.
     * 
     * If the virtual disk is part of a differencing chain, the backing store (host volume) is opened in RW 
     *        exclusive mode up to <b>RWDepth</b>.
     * 
     * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_METAOPS => 2097152

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_READ => 851968

    /**
     * Allows unrestricted access to the virtual disk. The caller must have unrestricted access rights to the 
     *        virtual disk image file.
     * 
     * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_ALL => 4128768

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static VIRTUAL_DISK_ACCESS_WRITABLE => 3276800
}

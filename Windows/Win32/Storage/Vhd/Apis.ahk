#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class Vhd {

;@region Constants

    /**
     * @type {String}
     */
    static VIRTUAL_STORAGE_TYPE_VENDOR_UNKNOWN => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static VIRTUAL_STORAGE_TYPE_VENDOR_MICROSOFT => "{ec984aec-a0f9-47e9-901f-71415a66345b}"

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_STORAGE_TYPE_DEVICE_ISO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_STORAGE_TYPE_DEVICE_VHD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_STORAGE_TYPE_DEVICE_VHDX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_STORAGE_TYPE_DEVICE_VHDSET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_VIRTUAL_DISK_RW_DEPTH_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_SECTOR_SIZE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_DISK_MAXIMUM_CHANGE_TRACKING_ID_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MERGE_VIRTUAL_DISK_DEFAULT_MERGE_DEPTH => 1
;@endregion Constants

;@region Methods
    /**
     * Opens a virtual hard disk (VHD) or CD or DVD image file (ISO) for use.
     * @remarks
     * To prevent an open request failure when attempting to open a handle to a permanently attached virtual disk, 
     *     the following requirements apply: 
     * 
     * <ul>
     * <li>The <i>VirtualDiskAccessMask</i> parameter must include the 
     *       <b>VIRTUAL_DISK_ACCESS_DETACH</b> (0x00040000) flag.</li>
     * <li>Write access to the file must not be requested if the original open operation that created the permanently 
     *       attached virtual disk only requested read access.</li>
     * </ul>
     * If the <b>OpenVirtualDisk</b> function fails with an error 
     *     code value of <b>ERROR_INVALID_PARAMETER</b> (87), the cause may be due to any of the following 
     *     conditions:
     * 
     * <ul>
     * <li>The <i>VirtualStorageType</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>Path</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>VirtualDiskAccessMask</i> parameter is set to a value of 
     *       <c>(VirtualDiskAccessMask &amp; ~VIRTUAL_DISK_ACCESS_ALL)</c>.</li>
     * <li>The <i>Flags</i> parameter is set to a value of 
     *       <c>(Flags &amp; ~(OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS | OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE))</c>.</li>
     * <li>The <b>Version</b> member of the <i>Parameters</i> parameter is not 
     *       set to <b>OPEN_VIRTUAL_DISK_VERSION_1</b> or <b>OPEN_VIRTUAL_DISK_VERSION_2</b>.</li>
     * </ul>
     * The host volume that contains the virtual disk image file cannot be compressed or EFS encrypted. This function 
     *     will fail with error <b>ERROR_UNSUPPORTED_COMPRESSION</b> (618) if the host volume has been 
     *     compressed or with error <b>ERROR_FILE_ENCRYPTED</b> (6002) if the host volume has been EFS 
     *     encrypted after the initial virtual disk creation.
     * 
     * The path pointed to by the <i>Path</i> parameter cannot be on a local network share (that 
     *     is a network share via loopback). This function will fail with error 
     *     <b>ERROR_FILE_SYSTEM_LIMITATION</b> (665) if the path is on a local network share. This 
     *     function will fail with error <b>ERROR_FILE_CORRUPT</b> (1392) if an ISO virtual disk is being 
     *     opened and the file size is not an even multiple of 2 KB (2,048 bytes), is at least 34 KB (34,816 bytes), or the 
     *     volume structure descriptor does not contain a known CDFS or UDFS volume identifier.
     * 
     * When an application is finished using the object handle returned in the <i>Handle</i> 
     *     parameter, use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the 
     *     handle.
     * 
     * CD and DVD image files (ISO) are not supported before Windows 8 and 
     *     Windows Server 2012.
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualStorageType A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> 
     *      structure.
     * @param {Pointer<Char>} Path A pointer to a valid path to the virtual disk image to open.
     * @param {Integer} VirtualDiskAccessMask A valid value of the 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask-r1">VIRTUAL_DISK_ACCESS_MASK</a> enumeration.
     * @param {Integer} Flags A valid combination of values of the 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-open_virtual_disk_flag">OPEN_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<OPEN_VIRTUAL_DISK_PARAMETERS>} Parameters An optional pointer to a valid 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-open_virtual_disk_parameters">OPEN_VIRTUAL_DISK_PARAMETERS</a> structure. Can 
     *      be <b>NULL</b>.
     * @param {Pointer<Void>} Handle A pointer to the handle object that represents the open virtual disk.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> (0) and the 
     *       <i>Handle</i> parameter contains a valid pointer to the new virtual disk object.
     * 
     * If the function fails, the return value is an error code and the value of the <i>Handle</i> 
     *       parameter is undefined. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk
     * @since windows6.1
     */
    static OpenVirtualDisk(VirtualStorageType, Path, VirtualDiskAccessMask, Flags, Parameters, Handle) {
        Path := Path is String? StrPtr(Path) : Path

        result := DllCall("VirtDisk.dll\OpenVirtualDisk", "ptr", VirtualStorageType, "ptr", Path, "int", VirtualDiskAccessMask, "int", Flags, "ptr", Parameters, "ptr", Handle, "uint")
        return result
    }

    /**
     * Creates a virtual hard disk (VHD) image file, either using default parameters or using an existing virtual disk or physical disk.
     * @remarks
     * If the <b>CreateVirtualDisk</b> function fails with an 
     *     error code value of <b>ERROR_INVALID_PARAMETER</b>, the cause may be due to any of the 
     *     following conditions:
     * 
     * <ul>
     * <li>The <i>VirtualStorageType</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>Parameters</i> parameter is <b>NULL</b>.</li>
     * <li>The <b>Version</b> member of the <i>Parameters</i> parameter is not 
     *       set to <b>CREATE_VIRTUAL_DISK_VERSION_1</b> or 
     *       <b>CREATE_VIRTUAL_DISK_VERSION_2</b>.</li>
     * <li>The <b>Version</b> member of the <i>Parameters</i> parameter is set 
     *       to <b>CREATE_VIRTUAL_DISK_VERSION_2</b> but the 
     *       <i>VirtualDiskAccessMask</i> parameter is not set to 
     *       <b>VIRTUAL_DISK_ACCESS_NONE</b>.</li>
     * <li>The <b>BlockSizeInBytes</b> member of the  <i>Parameters</i> 
     *       parameter is not set to  <b>CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE</b> (0), 
     *       0x80000 (512 KB), or 0x200000 (2 MB).</li>
     * <li>The <b>MaximumSize</b> member of the <i>Parameters</i> parameter is 
     *       less than 3 MB.</li>
     * <li>The <b>MaximumSize</b> member of the <i>Parameters</i> parameter is 
     *       not aligned with the value of the <b>SectorSizeInBytes</b> member.</li>
     * <li>The <i>VirtualDiskAccessMask</i> parameter is set to a value of 
     *       <c>(VirtualDiskAccessMask &amp; ~VIRTUAL_DISK_ACCESS_ALL)</c>.</li>
     * <li>The <i>Flags</i> parameter is larger than 
     *       <b>CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION</b>.</li>
     * </ul>
     * The host volume containing the new virtual disk image file cannot be compressed or EFS encrypted.
     * 
     * When creating the various types of virtual disks, the following combinations of creation parameters are 
     *       recommended:
     * 
     * <ul>
     * <li>The <b>CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION</b> flag should be 
     *         specified.</li>
     * <li><b>ParentPath</b> should not be specified.</li>
     * <li><b>SourcePath</b> can be specified if desired.</li>
     * </ul>
     * <ul>
     * <li>The <b>CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION</b> flag should not be 
     *         specified.</li>
     * <li><b>ParentPath</b> should not be specified.</li>
     * <li><b>SourcePath</b> can be specified if desired.</li>
     * </ul>
     * <ul>
     * <li>The <b>CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION</b> flag should not be 
     *         specified.</li>
     * <li><b>ParentPath</b> should be specified.</li>
     * <li><b>SourcePath</b> should not be specified.</li>
     * </ul>
     * The <b>CreateVirtualDisk</b> function can also be used 
     *     as a mechanism for converting one type of virtual disk to another, or a physical disk to a virtual disk. This is 
     *     accomplished through the use of the <b>SourcePath</b> member of the 
     *     <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-create_virtual_disk_parameters">CREATE_VIRTUAL_DISK_PARAMETERS</a> structure 
     *     to pre-populate the new virtual disk with block data from the source disk.
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualStorageType A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure 
     *      that contains the desired disk type and vendor information.
     * @param {Pointer<Char>} Path A pointer to a valid string that represents the path to the new virtual disk image file.
     * @param {Integer} VirtualDiskAccessMask The <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask-r1">VIRTUAL_DISK_ACCESS_MASK</a> value to use 
     *      when opening the newly created virtual disk file. If the <b>Version</b> member of the 
     *      <i>Parameters</i> parameter is set to 
     *      <b>CREATE_VIRTUAL_DISK_VERSION_2</b> then only the 
     *      <b>VIRTUAL_DISK_ACCESS_NONE</b> (0) value may be specified.
     * @param {Pointer<Void>} SecurityDescriptor An optional pointer to a 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> to apply to the virtual 
     *      disk image file. If this parameter is <b>NULL</b>, the parent directory's security descriptor 
     *      will be used.
     * @param {Integer} Flags Creation flags, which must be a valid combination of the 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-create_virtual_disk_flag">CREATE_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Integer} ProviderSpecificFlags Flags specific to the type of virtual disk being created. May be zero if none are required.
     * @param {Pointer<CREATE_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-create_virtual_disk_parameters">CREATE_VIRTUAL_DISK_PARAMETERS</a> structure 
     *      that contains creation parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure 
     *      if <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> operation 
     *      is desired.
     * @param {Pointer<Void>} Handle A pointer to the handle object that represents the newly created virtual disk.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>Handle</i> parameter contains a valid pointer to the new virtual disk object.
     * 
     * If the function fails, the return value is an error code and the value of the <i>Handle</i> 
     *       parameter is undefined. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-createvirtualdisk
     * @since windows6.1
     */
    static CreateVirtualDisk(VirtualStorageType, Path, VirtualDiskAccessMask, SecurityDescriptor, Flags, ProviderSpecificFlags, Parameters, Overlapped, Handle) {
        Path := Path is String? StrPtr(Path) : Path

        result := DllCall("VirtDisk.dll\CreateVirtualDisk", "ptr", VirtualStorageType, "ptr", Path, "int", VirtualDiskAccessMask, "ptr", SecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "ptr", Parameters, "ptr", Overlapped, "ptr", Handle, "uint")
        return result
    }

    /**
     * Attaches a virtual hard disk (VHD) or CD or DVD image file (ISO) by locating an appropriate VHD provider to accomplish the attachment.
     * @remarks
     * The <b>AttachVirtualDisk</b> function is not supported 
     *     for VHDs or ISOs hosted on Secure Digital (SD) media plugged into an SD controller in native mode (for which 
     *     sffdisk.sys, sffp_sd.sys, and sdbus.sys drivers would be loaded) and will 
     *     fail with the error <b>ERROR_FILE_NOT_FOUND</b>. VHDs and ISOs hosted on SD media connected to 
     *     a USB reader are supported.
     * 
     * If the <b>AttachVirtualDisk</b> function fails with an 
     *     error code value of <b>ERROR_INVALID_PARAMETER</b>, the cause may be due to any of the 
     *     following conditions:
     * 
     * <ul>
     * <li>The <i>VirtualDiskHandle</i> parameter is not a valid handle created by the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.</li>
     * <li>The <i>Flags</i> parameter is set to a value larger than 
     *       <c>0x020</c>.</li>
     * <li>The <b>Version</b> member of the <i>Parameters</i> parameter is not 
     *       set to <b>ATTACH_VIRTUAL_DISK_VERSION_1</b>.</li>
     * </ul>
     * The host volume that contains the virtual disk image file cannot be compressed or EFS encrypted.
     * 
     * This function will fail if a provider cannot be found, if the VHD or ISO image file is not valid, if the VHD 
     *     image is already attached, or if the caller does not have <b>SE_MANAGE_VOLUME_PRIVILEGE</b> 
     *     access rights. For more information about file security, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * The intended access mode of the virtual disk must be considered when opening the virtual disk handle. For 
     *     example, if the virtual disk is being attached for read/write access, the 
     *     <i>VirtualDiskHandle</i> parameter must have been opened using the 
     *     <b>VIRTUAL_DISK_ACCESS_ATTACH_RW</b> access flag. For more information, see 
     *     <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-vds/4fa2f54d-00b3-4cd9-b673-a6b8d64ed57f">VIRTUAL_DISK_ACCESS_MASK</a> and 
     *     <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a>.
     * 
     * CD and DVD image files (ISO) are not supported before Windows 8 and 
     *     Windows Server 2012.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to an open virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<Void>} SecurityDescriptor An optional pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> to apply to the attached 
     *       virtual disk. If this parameter is <b>NULL</b>, the security descriptor of the virtual disk 
     *       image file is used.
     * 
     * Ensure that the security descriptor that <b>AttachVirtualDisk</b> applies to the attached virtual disk grants the write attributes permission for the user, or that the security descriptor of the virtual disk 
     *       image file grants the write attributes permission for the user  if you specify NULL for this parameter. If the security descriptor does not grant write attributes permission for a user, Shell displays the following error when the user accesses the attached virtual disk: <b>The Recycle Bin is corrupted. Do you want to empty the Recycle Bin for this drive?</b>
     * @param {Integer} Flags A valid combination of values of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-attach_virtual_disk_flag">ATTACH_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Integer} ProviderSpecificFlags Flags specific to the type of virtual disk being attached. May be zero if none are required.
     * @param {Pointer<ATTACH_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-attach_virtual_disk_parameters">ATTACH_VIRTUAL_DISK_PARAMETERS</a> 
     *       structure that contains attachment parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> 
     *       structure if 
     *       <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> operation is 
     *       desired.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-attachvirtualdisk
     * @since windows6.1
     */
    static AttachVirtualDisk(VirtualDiskHandle, SecurityDescriptor, Flags, ProviderSpecificFlags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\AttachVirtualDisk", "ptr", VirtualDiskHandle, "ptr", SecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Detaches a virtual hard disk (VHD) or CD or DVD image file (ISO) by locating an appropriate virtual disk provider to accomplish the operation.
     * @remarks
     * If the <b>DetachVirtualDisk</b> function fails with an 
     *     error code value of <b>ERROR_INVALID_PARAMETER</b>, the cause may be due to any of the 
     *     following conditions:
     * 
     * <ul>
     * <li>The <i>VirtualDiskHandle</i> parameter is not a valid handle created by the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.</li>
     * <li>The <i>Flags</i> parameter is set to a value other than 
     *       <b>DETACH_VIRTUAL_DISK_FLAG_NONE</b> (0).</li>
     * </ul>
     * The host volume that contains the virtual disk image file cannot be compressed or EFS encrypted.
     * 
     * All other open handles to the virtual disk must be closed before the 
     *     <b>DetachVirtualDisk</b> function can succeed.
     * 
     * If the virtual disk is attached and another handle that was used to attach it has 
     *     been closed, this is because the <b>ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME</b> flag was 
     *     specified. In this case, the <b>DetachVirtualDisk</b> 
     *     function can succeed but the VHD will remain attached. If the 
     *     <b>ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME</b> was not specified, the virtual disk will be 
     *     automatically detached when the last open handle is closed.
     * 
     * This function will fail if a provider cannot be found, if the image file is not valid, if the image is not 
     *     attached, or if the caller does not have <b>SE_MANAGE_VOLUME_PRIVILEGE</b> access rights on a 
     *     Windows Server operating system. For more information about file security, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * 
     * CD and DVD image files (ISO) are not supported before Windows 8 and 
     *     Windows Server 2012.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to an open virtual disk, which must have been opened using the 
     *       <b>VIRTUAL_DISK_ACCESS_DETACH</b> flag set in the 
     *       <i>VirtualDiskAccessMask</i> parameter to the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       open a virtual disk, see the <b>OpenVirtualDisk</b> 
     *       function.
     * @param {Integer} Flags A valid combination of values of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-detach_virtual_disk_flag">DETACH_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Integer} ProviderSpecificFlags Flags specific to the type of virtual disk being detached. May be zero if none are required.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-detachvirtualdisk
     * @since windows6.1
     */
    static DetachVirtualDisk(VirtualDiskHandle, Flags, ProviderSpecificFlags) {
        result := DllCall("VirtDisk.dll\DetachVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "uint", ProviderSpecificFlags, "uint")
        return result
    }

    /**
     * Retrieves the path to the physical device object that contains a virtual hard disk (VHD) or CD or DVD image file (ISO).
     * @remarks
     * For the <b>GetVirtualDiskPhysicalPath</b> 
     *     function to succeed, the virtual disk referred to by the <i>VirtualDiskHandle</i> parameter 
     *     must be attached, the physical disk object must be to be located by the system, and the 
     *     <i>DiskPath</i> parameter must refer to a buffer large enough to hold the resulting path. This 
     *     path is in the form \\.&#92;<i>PhysicalDriveX</i> where <i>X</i> 
     *     is an integer that represents the particular enumeration of the physical disk on the caller's system.
     * 
     * CD and DVD image files (ISO) are not supported before Windows 8 and 
     *     Windows Server 2012.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the 
     *      <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag. For information on how to open a virtual disk, see 
     *      the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<UInt32>} DiskPathSizeInBytes The size, in bytes, of the buffer pointed to by the <i>DiskPath</i> parameter.
     * @param {Pointer} DiskPath A target buffer to receive the path of the physical disk device that contains the virtual disk.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>DiskPath</i> parameter contains a pointer to a populated string.
     * 
     * If the function fails, the return value is an error code and the value of the contents of the buffer referred 
     *       to by the  <i>DiskPath</i> parameter is undefined. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getvirtualdiskphysicalpath
     * @since windows6.1
     */
    static GetVirtualDiskPhysicalPath(VirtualDiskHandle, DiskPathSizeInBytes, DiskPath) {
        result := DllCall("VirtDisk.dll\GetVirtualDiskPhysicalPath", "ptr", VirtualDiskHandle, "uint*", DiskPathSizeInBytes, "ptr", DiskPath, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PathsBufferSizeInBytes 
     * @param {Pointer} PathsBuffer 
     * @returns {Integer} 
     */
    static GetAllAttachedVirtualDiskPhysicalPaths(PathsBufferSizeInBytes, PathsBuffer) {
        result := DllCall("VirtDisk.dll\GetAllAttachedVirtualDiskPhysicalPaths", "uint*", PathsBufferSizeInBytes, "ptr", PathsBuffer, "uint")
        return result
    }

    /**
     * Returns the relationships between virtual hard disks (VHDs) or CD or DVD image file (ISO) or the volumes contained within those disks and their parent disk or volume.
     * @remarks
     * CD and DVD image files (ISO) are not supported before Windows 8 and 
     *     Windows Server 2012.
     * @param {Pointer<Void>} ObjectHandle A handle to a volume or root directory if  the <i>Flags</i> parameter does not specify 
     *       the <b>GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE</b> flag. For information on how to open a 
     *       volume or root directory, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * 
     * If the <i>Flags</i> parameter specifies the 
     *       <b>GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE</b> flag, this handle should be a handle to a 
     *       disk.
     * @param {Integer} Flags A valid combination of 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-get_storage_dependency_flag">GET_STORAGE_DEPENDENCY_FLAG</a> values.
     * @param {Integer} StorageDependencyInfoSize Size, in bytes, of the buffer that the <i>StorageDependencyInfo</i> parameter refers 
     *      to.
     * @param {Pointer<STORAGE_DEPENDENCY_INFO>} StorageDependencyInfo A pointer to a buffer to receive the populated 
     *      [STORAGE_DEPENDENCY_INFO](./ns-virtdisk-storage_dependency_info.md) structure, which is a 
     *      variable-length structure.
     * @param {Pointer<UInt32>} SizeUsed An optional pointer to a <b>ULONG</b> that receives the size used.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>StorageDependencyInfo</i> parameter contains the requested dependency information.
     * 
     * If the function fails, the return value is an error code and the 
     *       <i>StorageDependencyInfo</i> parameter is undefined. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getstoragedependencyinformation
     * @since windows6.1
     */
    static GetStorageDependencyInformation(ObjectHandle, Flags, StorageDependencyInfoSize, StorageDependencyInfo, SizeUsed) {
        result := DllCall("VirtDisk.dll\GetStorageDependencyInformation", "ptr", ObjectHandle, "int", Flags, "uint", StorageDependencyInfoSize, "ptr", StorageDependencyInfo, "uint*", SizeUsed, "uint")
        return result
    }

    /**
     * Retrieves information about a VHD.
     * @remarks
     * The <b>GetVirtualDiskInformation</b> function 
     *     can be called on any valid <i>VirtualDiskHandle</i>, provided the handle was opened using the 
     *     <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag. The VHD is not required to be an attached disk.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open VHD, which must have been opened using the 
     *       <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag set in the 
     *       <i>VirtualDiskAccessMask</i> parameter to the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       open a VHD, see the <b>OpenVirtualDisk</b> function.
     * @param {Pointer<UInt32>} VirtualDiskInfoSize A pointer to a <b>ULONG</b> that contains the size of the 
     *       <i>VirtualDiskInfo</i> parameter.
     * @param {Pointer} VirtualDiskInfo A pointer to a valid [GET_VIRTUAL_DISK_INFO](./ns-virtdisk-get_virtual_disk_info.md) 
     *       structure. The format of the data returned is dependent on the value passed in the 
     *       <b>Version</b> member by the caller.
     * @param {Pointer<UInt32>} SizeUsed A pointer to a <b>ULONG</b> that contains the size used.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *        <i>VirtualDiskInfo</i> parameter contains the requested information.
     * 
     * If the function fails, the return value is an error code and the <i>VirtualDiskInfo</i> 
     *        parameter is undefined. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getvirtualdiskinformation
     * @since windows6.1
     */
    static GetVirtualDiskInformation(VirtualDiskHandle, VirtualDiskInfoSize, VirtualDiskInfo, SizeUsed) {
        result := DllCall("VirtDisk.dll\GetVirtualDiskInformation", "ptr", VirtualDiskHandle, "uint*", VirtualDiskInfoSize, "ptr", VirtualDiskInfo, "uint*", SizeUsed, "uint")
        return result
    }

    /**
     * Sets information about a virtual hard disk (VHD).
     * @remarks
     * The <b>SetVirtualDiskInformation</b> function 
     *     will fail if the <b>ParentFilePath</b> member is requested to be set but the system cannot 
     *     resolve the path provided.
     * 
     * Setting the parent information will also cause the child's parent 
     *     <b>GUID</b> and Timestamp fields to be updated.
     * 
     * The virtual disk cannot be attached while this operation is in progress.
     * 
     * The caller must have READ|WRITE access to the backing store for the virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the 
     *      <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag. For information on how to open a virtual disk, see 
     *      the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<SET_VIRTUAL_DISK_INFO>} VirtualDiskInfo A pointer to a valid [SET_VIRTUAL_DISK_INFO](./ns-virtdisk-set_virtual_disk_info.md) 
     *      structure.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-setvirtualdiskinformation
     * @since windows6.1
     */
    static SetVirtualDiskInformation(VirtualDiskHandle, VirtualDiskInfo) {
        result := DllCall("VirtDisk.dll\SetVirtualDiskInformation", "ptr", VirtualDiskHandle, "ptr", VirtualDiskInfo, "uint")
        return result
    }

    /**
     * Enumerates the metadata associated with a virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Pointer<UInt32>} NumberOfItems Address of a <b>ULONG</b>. On input, the value indicates the number of elements in 
     *       the buffer pointed to by the <i>Items</i> parameter. On output, the value contains the number 
     *       of items retrieved. If the buffer was too small, the API will fail and return 
     *       <b>ERROR_INSUFFICIENT_BUFFER</b> and the <b>ULONG</b> will contain the 
     *       required buffer size.
     * @param {Pointer<Guid>} Items Address of a buffer to be filled with the <b>GUID</b>s representing the metadata. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/nf-virtdisk-getvirtualdiskmetadata">GetVirtualDiskMetadata</a> function can be used 
     *       to retrieve the data represented by each <b>GUID</b>.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the buffer pointed to by the <i>Items</i> parameter was too small, the return value is 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-enumeratevirtualdiskmetadata
     * @since windows8.0
     */
    static EnumerateVirtualDiskMetadata(VirtualDiskHandle, NumberOfItems, Items) {
        result := DllCall("VirtDisk.dll\EnumerateVirtualDiskMetadata", "ptr", VirtualDiskHandle, "uint*", NumberOfItems, "ptr", Items, "uint")
        return result
    }

    /**
     * Retrieves the specified metadata from the virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Pointer<Guid>} Item Address of a <b>GUID</b> identifying the metadata to retrieve.
     * @param {Pointer<UInt32>} MetaDataSize Address of a <b>ULONG</b>. On input, the value indicates the size, in bytes, of 
     *       the buffer pointed to by the <i>MetaData</i> parameter. On output, the value contains size, 
     *       in bytes, of the retrieved metadata. If the buffer was too small, the API will fail and return 
     *       <b>ERROR_INSUFFICIENT_BUFFER</b>, putting the required size in the 
     *       <b>ULONG</b> and the buffer will contain the start of the metadata.
     * @param {Pointer} MetaData Address of the buffer where the metadata is to be stored.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the buffer pointed to by the <i>Items</i> parameter was too small, the return value is 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getvirtualdiskmetadata
     * @since windows8.0
     */
    static GetVirtualDiskMetadata(VirtualDiskHandle, Item, MetaDataSize, MetaData) {
        result := DllCall("VirtDisk.dll\GetVirtualDiskMetadata", "ptr", VirtualDiskHandle, "ptr", Item, "uint*", MetaDataSize, "ptr", MetaData, "uint")
        return result
    }

    /**
     * Sets a metadata item for a virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Pointer<Guid>} Item Address of a <b>GUID</b> identifying the metadata to set. This cannot be the NULL GUID (a GUID of all zeroes).
     * @param {Integer} MetaDataSize Address of a <b>ULONG</b> containing the size, in bytes, of 
     *       the buffer pointed to by the <i>MetaData</i> parameter.
     *       Specific VHD file types have a maximum size per metadata element. Specific VHD files also have a maximum number of total metadata entries and total metadata size.
     * @param {Pointer} MetaData Address of the buffer containing the metadata to be stored.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-setvirtualdiskmetadata
     * @since windows8.0
     */
    static SetVirtualDiskMetadata(VirtualDiskHandle, Item, MetaDataSize, MetaData) {
        result := DllCall("VirtDisk.dll\SetVirtualDiskMetadata", "ptr", VirtualDiskHandle, "ptr", Item, "uint", MetaDataSize, "ptr", MetaData, "uint")
        return result
    }

    /**
     * Deletes metadata from a virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk.
     * @param {Pointer<Guid>} Item The item to be deleted.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-deletevirtualdiskmetadata
     * @since windows8.0
     */
    static DeleteVirtualDiskMetadata(VirtualDiskHandle, Item) {
        result := DllCall("VirtDisk.dll\DeleteVirtualDiskMetadata", "ptr", VirtualDiskHandle, "ptr", Item, "uint")
        return result
    }

    /**
     * Checks the progress of an asynchronous virtual hard disk (VHD) operation.
     * @param {Pointer<Void>} VirtualDiskHandle A valid handle to a virtual disk with a pending asynchronous operation.
     * @param {Pointer<OVERLAPPED>} Overlapped A pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This 
     *      parameter must reference the same structure previously sent to the virtual disk operation being checked for 
     *      progress.
     * @param {Pointer<VIRTUAL_DISK_PROGRESS>} Progress A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_disk_progress">VIRTUAL_DISK_PROGRESS</a> 
     *      structure that receives the current virtual disk operation progress.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>Progress</i> parameter will be populated with the current virtual disk operation 
     *       progress.
     * 
     * If the function fails, the return value is an error code and the value of the 
     *       <i>Progress</i> parameter is undefined. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getvirtualdiskoperationprogress
     * @since windows6.1
     */
    static GetVirtualDiskOperationProgress(VirtualDiskHandle, Overlapped, Progress) {
        result := DllCall("VirtDisk.dll\GetVirtualDiskOperationProgress", "ptr", VirtualDiskHandle, "ptr", Overlapped, "ptr", Progress, "uint")
        return result
    }

    /**
     * Reduces the size of a virtual hard disk (VHD) backing store file.
     * @remarks
     * Compaction can be run only on a virtual disk that is dynamically expandable or differencing.
     * 
     * There are two different types of compaction.
     * 
     * <ul>
     * <li>The first type, file-system-aware compaction, uses the NTFS file system to determine free space. This is 
     *       done by attaching the VHD as a read-only device by including the 
     *       <b>VIRTUAL_DISK_ACCESS_METAOPS</b> and 
     *       <b>VIRTUAL_DISK_ACCESS_ATTACH_RO</b> flags in the 
     *       <i>VirtualDiskAccessMask</i> parameter passed to 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a>, attaching the VHD by calling 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-attachvirtualdisk">AttachVirtualDisk</a>, and while the VHD is attached 
     *       calling <b>CompactVirtualDisk</b>. Detaching the VHD 
     *       before compaction is done can cause compaction to return failure before it is done (similar to cancellation of 
     *       compaction).</li>
     * <li>The second type, file-system-agnostic compaction, does not involve the file system but only looks for VHD 
     *       blocks filled entirely with zeros (0). This is done by including the 
     *       <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag in the 
     *       <i>VirtualDiskAccessMask</i> parameter passed to 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a>, and calling 
     *       <b>CompactVirtualDisk</b>.</li>
     * </ul>
     * File-system-aware compaction is the most efficient compaction type but using first the file-system-aware 
     *     compaction followed by the file-system-agnostic compaction will produce the smallest VHD.
     * 
     * A compaction operation on a virtual disk can be safely interrupted and re-run later. Re-opening a virtual disk 
     *     file that has been interrupted may result in the reduction of a virtual disk file's size at the time of 
     *     opening.
     * 
     * Compaction can be CPU-intensive and/or I/O-intensive, depending on how large the virtual disk is and how many 
     *     blocks require movement.
     * 
     * The <b>CompactVirtualDisk</b> function runs on the 
     *     virtual disk in the same security context as the caller.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the 
     *       <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag in the 
     *       <i>VirtualDiskAccessMask</i> parameter passed to 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a>. For information on how to open a 
     *       virtual disk, see the <b>OpenVirtualDisk</b> function.
     * @param {Integer} Flags Must be the <b>COMPACT_VIRTUAL_DISK_FLAG_NONE</b> value (0) of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-compact_virtual_disk_flag">COMPACT_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<COMPACT_VIRTUAL_DISK_PARAMETERS>} Parameters A optional pointer to a valid 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-compact_virtual_disk_parameters">COMPACT_VIRTUAL_DISK_PARAMETERS</a> 
     *       structure that contains compaction parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> 
     *       structure if <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> 
     *       operation is desired.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-compactvirtualdisk
     * @since windows6.1
     */
    static CompactVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\CompactVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Merges a child virtual hard disk (VHD) in a differencing chain with one or more parent virtual disks in the chain.
     * @remarks
     * <div class="alert"><b>Note</b>  All occurrences of the term <i>disk</i> in this section refer to virtual disks. The term <i>backing store</i> refers to the physical disk storage where the VHD image file or files reside.</div>
     * <div> </div>
     * The <b>MergeVirtualDisk</b> function updates all data blocks in one or more parent disks with the data blocks from the child disk referred to by the <i>VirtualDiskHandle</i> parameter. This is essentially a copy operation.
     * 
     * Merging a disk requires that the affected disks be detached during the operation.
     * 
     * The caller must have READ|WRITE access to the backing store for the affected disks.
     * 
     * The RWDepth of the disk must be greater than the merge depth  specified by the [OPEN_VIRTUAL_DISK_PARAMETERS](./ns-virtdisk-open_virtual_disk_parameters.md).
     * 
     * Merge modifies the parent disk being merged into, therefore any other differencing disks dependent on that parent will no longer be valid.
     * 
     * The parent disk being merged into is changed to represent the same data as was held in the child differencing disk on which the merge is performed.
     * 
     * Any pre-existing data in the parent disk being merged into is overwritten.
     * 
     * If a merge operation is interrupted, the child disk is still usable.  The <b>MergeVirtualDisk</b> function can be rerun to finish the merge.
     * 
     * The depth of a merge request is  the number of  parent VHD image files in the differencing chain to be merged. For example, if the <b>MergeDepth</b> member  has a value of 1, the data blocks from the specified differencing disk are moved into its parent. If the <i>MergeDepth</i> member has a value of 2 and the specified differencing disk's parent is also a differencing disk (meaning there is a third disk in the chain),  then the data blocks from both the first and second disks are moved into the third disk (with blocks from the first disk taking precedence over blocks from the second during the final operation).
     * 
     * Upon completion, the affected child disks are no longer considered valid, and any future operations on them will have unsupported results. In the previous example, upon successful completion of the merge, the third disk is valid and the first and second are not. The <b>MergeVirtualDisk</b> function will not delete any disks that are not valid, or perform any automatic differencing relationship reconnections. This must be explicitly done by the caller.
     * 
     * If a merge operation is performed on a nonleaf node of a differencing disk, it is the responsibility of the caller to fix up the parent information for the child nodes of the disk that is being merged.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag. For information on how to open a virtual disk, see the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Integer} Flags Must be the <b>MERGE_VIRTUAL_DISK_FLAG_NONE</b> value of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-merge_virtual_disk_flag">MERGE_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<MERGE_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-merge_virtual_disk_parameters">MERGE_VIRTUAL_DISK_PARAMETERS</a> structure that contains merge parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure if <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> operation is desired.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-mergevirtualdisk
     * @since windows6.1
     */
    static MergeVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\MergeVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Increases the size of a fixed or dynamically expandable virtual hard disk (VHD).
     * @remarks
     * The <b>ExpandVirtualDisk</b> function performs the operation in-place, and therefore does not create a virtual disk.
     * 
     * The expand operation is valid only for fixed and expandable virtual disks and will invalidate a differencing virtual disk chain.
     * 
     * Expanding a virtual disk requires that the virtual disk be detached during the operation.
     * 
     * The caller must have READ|WRITE access to the backing store for the virtual disk.
     * 
     * For an expandable virtual disk, the <b>ExpandVirtualDisk</b> function may not result in a larger file because the size is virtual and would not actually grow physically until used.
     * 
     * If the virtual disk is expandable and the host volume does not have enough space for the new size, the <b>ExpandVirtualDisk</b> function can succeed anyway. Future writes to the virtual disk may fail if the host volume runs out of space as the virtual disk expands.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag. For information on how to open a virtual disk, see the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Integer} Flags Must be the <b>EXPAND_VIRTUAL_DISK_FLAG_NONE</b> value of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_flag">EXPAND_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<EXPAND_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-expand_virtual_disk_parameters">EXPAND_VIRTUAL_DISK_PARAMETERS</a> structure that contains expansion parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure if <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> operation is desired.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-expandvirtualdisk
     * @since windows6.1
     */
    static ExpandVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\ExpandVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Resizes a virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Integer} Flags Zero or more flags enumerated from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/ne-virtdisk-resize_virtual_disk_flag">RESIZE_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<RESIZE_VIRTUAL_DISK_PARAMETERS>} Parameters Address of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/ns-virtdisk-resize_virtual_disk_parameters">RESIZE_VIRTUAL_DISK_PARAMETERS</a> 
     *       structure containing the new size of the virtual disk.
     * @param {Pointer<OVERLAPPED>} Overlapped If this is to be an asynchronous operation, the address of a valid 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-resizevirtualdisk
     * @since windows8.0
     */
    static ResizeVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\ResizeVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Initiates a mirror operation for a virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Integer} Flags A valid combination of values from the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-mirror_virtual_disk_flag">MIRROR_VIRTUAL_DISK_FLAG</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIRROR_VIRTUAL_DISK_FLAG_NONE"></a><a id="mirror_virtual_disk_flag_none"></a><dl>
     * <dt><b>MIRROR_VIRTUAL_DISK_FLAG_NONE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mirror virtual disk file does not exist, and needs to be created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE"></a><a id="mirror_virtual_disk_flag_existing_file"></a><dl>
     * <dt><b>MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create the mirror using an existing file.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIRROR_VIRTUAL_DISK_PARAMETERS>} Parameters Address of a 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-mirror_virtual_disk_parameters">MIRROR_VIRTUAL_DISK_PARAMETERS</a> structure 
     *       containing mirror parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped Address of an 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This parameter is required.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-mirrorvirtualdisk
     * @since windows8.0
     */
    static MirrorVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\MirrorVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Breaks a previously initiated mirror operation and sets the mirror to be the active virtual disk.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open mirrored virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       mirror a virtual disk, see the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-breakmirrorvirtualdisk">MirrorVirtualDisk</a> 
     *       function.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-breakmirrorvirtualdisk
     * @since windows8.0
     */
    static BreakMirrorVirtualDisk(VirtualDiskHandle) {
        result := DllCall("VirtDisk.dll\BreakMirrorVirtualDisk", "ptr", VirtualDiskHandle, "uint")
        return result
    }

    /**
     * Attaches a parent to a virtual disk opened with the OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN flag.
     * @remarks
     * This adds the specified parent virtual hard disk to the head of the differencing chain of the specified 
     *     virtual hard disk. If the differencing chain extends beyond the parent, this function can be called repeatedly to 
     *     add additional parents to the differencing chain.
     * @param {Pointer<Void>} VirtualDiskHandle Handle to a virtual disk.
     * @param {Pointer<Char>} ParentPath Address of a string containing a valid path to the virtual hard disk image to add as a parent.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-addvirtualdiskparent
     * @since windows8.0
     */
    static AddVirtualDiskParent(VirtualDiskHandle, ParentPath) {
        ParentPath := ParentPath is String? StrPtr(ParentPath) : ParentPath

        result := DllCall("VirtDisk.dll\AddVirtualDiskParent", "ptr", VirtualDiskHandle, "ptr", ParentPath, "uint")
        return result
    }

    /**
     * Retrieves information about changes to the specified areas of a virtual hard disk (VHD) that are tracked by resilient change tracking (RCT).
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open VHD, which must have been opened using the 
     *       <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag set in the 
     *       <i>VirtualDiskAccessMask</i> parameter to the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       open a VHD, see the <b>OpenVirtualDisk</b> function.
     * @param {Pointer<Char>} ChangeTrackingId A pointer to a string that specifies the change tracking identifier for the change that identifies the state of the virtual disk that you want to use as the basis of comparison to determine whether the specified area of the VHD has changed.
     * @param {Integer} ByteOffset An unsigned long integer that specifies the distance from the start of the VHD to the beginning of  the area of the VHD that you want to check for changes, in bytes.
     * @param {Integer} ByteLength An unsigned long integer that specifies the length of the area of the VHD that you want to check for changes, in bytes.
     * @param {Integer} Flags Reserved. Set to <b>QUERY_CHANGES_VIRTUAL_DISK_FLAG_NONE</b>.
     * @param {Pointer<QUERY_CHANGES_VIRTUAL_DISK_RANGE>} Ranges An array of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-query_changes_virtual_disk_range">QUERY_CHANGES_VIRTUAL_DISK_RANGE</a> structures that indicates the areas of the virtual disk within the area that the <i>ByteOffset</i> and <i>ByteLength</i> parameters specify that have changed since the change tracking identifier that the <i>ChangeTrackingId</i>  parameter specifies was sealed.
     * @param {Pointer<UInt32>} RangeCount An address of an unsigned long integer. On input, the value indicates the number of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-query_changes_virtual_disk_range">QUERY_CHANGES_VIRTUAL_DISK_RANGE</a> structures that the array that the <i>Ranges</i> parameter points to can hold. On output, the value contains the number of <b>QUERY_CHANGES_VIRTUAL_DISK_RANGE</b> structures that the method placed in the array.
     * @param {Pointer<UInt64>} ProcessedLength A pointer to an unsigned long integer that indicates the total number of bytes that the method processed, which indicates for how much of the area that the <i>BytesLength</i> parameter specifies that changes were captured in the available space of the array that the <i>Ranges</i> parameter specifies.
     * @returns {Integer} The status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *        <i>Ranges</i> parameter contains the requested information.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-querychangesvirtualdisk
     * @since windows10.0.10240
     */
    static QueryChangesVirtualDisk(VirtualDiskHandle, ChangeTrackingId, ByteOffset, ByteLength, Flags, Ranges, RangeCount, ProcessedLength) {
        ChangeTrackingId := ChangeTrackingId is String? StrPtr(ChangeTrackingId) : ChangeTrackingId

        result := DllCall("VirtDisk.dll\QueryChangesVirtualDisk", "ptr", VirtualDiskHandle, "ptr", ChangeTrackingId, "uint", ByteOffset, "uint", ByteLength, "int", Flags, "ptr", Ranges, "uint*", RangeCount, "uint*", ProcessedLength, "uint")
        return result
    }

    /**
     * Creates a snapshot of the current virtual disk for VHD Set files.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk. This must be a VHD Set file.
     * @param {Pointer<TAKE_SNAPSHOT_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-take_snapshot_vhdset_parameters">TAKE_SNAPSHOT_VHDSET_PARAMETERS</a> structure that contains snapshot data.
     * @param {Integer} Flags Snapshot flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_flag">TAKE_SNAPSHOT_VHDSET_FLAG</a> enumeration
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-takesnapshotvhdset
     * @since windows10.0.10240
     */
    static TakeSnapshotVhdSet(VirtualDiskHandle, Parameters, Flags) {
        result := DllCall("VirtDisk.dll\TakeSnapshotVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Deletes a snapshot from a VHD Set file.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk. This must be a VHD Set file.
     * @param {Pointer<DELETE_SNAPSHOT_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-delete_snapshot_vhdset_parameters">DELETE_SNAPSHOT_VHDSET_PARAMETERS</a> structure that contains snapshot deletion data.
     * @param {Integer} Flags Snapshot deletion flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_flag">DELETE_SNAPSHOT_VHDSET_FLAG</a> enumeration.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-deletesnapshotvhdset
     * @since windows10.0.10240
     */
    static DeleteSnapshotVhdSet(VirtualDiskHandle, Parameters, Flags) {
        result := DllCall("VirtDisk.dll\DeleteSnapshotVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Modifies the internal contents of a virtual disk file. Can be used to set the active leaf, or to fix up snapshot entries.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to the open virtual disk. This must be a VHD Set file.
     * @param {Pointer<MODIFY_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-modify_vhdset_parameters">MODIFY_VHDSET_PARAMETERS</a> structure that contains modification data.
     * @param {Integer} Flags Modification flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-modify_vhdset_flag">MODIFY_VHDSET_FLAG</a> enumeration.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-modifyvhdset
     * @since windows10.0.10240
     */
    static ModifyVhdSet(VirtualDiskHandle, Parameters, Flags) {
        result := DllCall("VirtDisk.dll\ModifyVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Applies a snapshot of the current virtual disk for VHD Set files.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to an open virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<APPLY_SNAPSHOT_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-apply_snapshot_vhdset_parameters">APPLY_SNAPSHOT_VHDSET_PARAMETERS</a> structure that contains snapshot data.
     * @param {Integer} Flags A valid combination of values of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_flag">APPLY_SNAPSHOT_VHDSET_FLAG</a> enumeration.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-applysnapshotvhdset
     * @since windows10.0.10240
     */
    static ApplySnapshotVhdSet(VirtualDiskHandle, Parameters, Flags) {
        result := DllCall("VirtDisk.dll\ApplySnapshotVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Issues an embedded SCSI request directly to a virtual hard disk.
     * @param {Pointer<Void>} VirtualDiskHandle A handle to an open virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. This handle may also be a handle to a Remote Shared Virtual Disk. For information on how to open a Remote Shared Virtual Disk, see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rsvd/c865c326-47d6-4a91-a62d-0e8f26007d15">Remote Shared Virtual Disk Protocol</a> documentation.
     * @param {Pointer<RAW_SCSI_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-raw_scsi_virtual_disk_parameters">RAW_SCSI_VIRTUAL_DISK_PARAMETERS</a> structure that contains snapshot deletion data.
     * @param {Integer} Flags SCSI virtual disk flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-raw_scsi_virtual_disk_flag">RAW_SCSI_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<RAW_SCSI_VIRTUAL_DISK_RESPONSE>} Response A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-raw_scsi_virtual_disk_response">RAW_SCSI_VIRTUAL_DISK_RESPONSE</a> structure that contains the results of processing the SCSI command.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. 
     * 
     * A return of <b>ERROR_SUCCESS</b> only means the request was received by the virtual disk. The SCSI command itself could have failed due to an invalid device state, an unsupported SCSI command, or another error.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-rawscsivirtualdisk
     * @since windows10.0.10240
     */
    static RawSCSIVirtualDisk(VirtualDiskHandle, Parameters, Flags, Response) {
        result := DllCall("VirtDisk.dll\RawSCSIVirtualDisk", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "ptr", Response, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualDiskHandle 
     * @param {Integer} Flags 
     * @param {Pointer<FORK_VIRTUAL_DISK_PARAMETERS>} Parameters 
     * @param {Pointer<OVERLAPPED>} Overlapped 
     * @returns {Integer} 
     */
    static ForkVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        result := DllCall("VirtDisk.dll\ForkVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualDiskHandle 
     * @returns {Integer} 
     */
    static CompleteForkVirtualDisk(VirtualDiskHandle) {
        result := DllCall("VirtDisk.dll\CompleteForkVirtualDisk", "ptr", VirtualDiskHandle, "uint")
        return result
    }

;@endregion Methods
}

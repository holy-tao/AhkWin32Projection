#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualStorageType A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> 
     *      structure.
     * @param {PWSTR} Path A pointer to a valid path to the virtual disk image to open.
     * @param {Integer} VirtualDiskAccessMask A valid value of the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vdssys/ne-vdssys-_virtual_disk_access_mask">VIRTUAL_DISK_ACCESS_MASK</a> enumeration.
     * @param {Integer} Flags A valid combination of values of the 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-open_virtual_disk_flag">OPEN_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<OPEN_VIRTUAL_DISK_PARAMETERS>} Parameters An optional pointer to a valid 
     *      <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-open_virtual_disk_parameters">OPEN_VIRTUAL_DISK_PARAMETERS</a> structure. Can 
     *      be <b>NULL</b>.
     * @param {Pointer<HANDLE>} Handle A pointer to the handle object that represents the open virtual disk.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> (0) and the 
     *       <i>Handle</i> parameter contains a valid pointer to the new virtual disk object.
     * 
     * If the function fails, the return value is an error code and the value of the <i>Handle</i> 
     *       parameter is undefined. For more information, see 
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-openvirtualdisk
     * @since windows6.1
     */
    static OpenVirtualDisk(VirtualStorageType, Path, VirtualDiskAccessMask, Flags, Parameters, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := DllCall("VirtDisk.dll\OpenVirtualDisk", "ptr", VirtualStorageType, "ptr", Path, "int", VirtualDiskAccessMask, "int", Flags, "ptr", Parameters, "ptr", Handle, "uint")
        return result
    }

    /**
     * Creates a virtual hard disk (VHD) image file, either using default parameters or using an existing virtual disk or physical disk.
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualStorageType A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure 
     *      that contains the desired disk type and vendor information.
     * @param {PWSTR} Path A pointer to a valid string that represents the path to the new virtual disk image file.
     * @param {Integer} VirtualDiskAccessMask The <a href="https://docs.microsoft.com/windows/desktop/api/vdssys/ne-vdssys-_virtual_disk_access_mask">VIRTUAL_DISK_ACCESS_MASK</a> value to use 
     *      when opening the newly created virtual disk file. If the <b>Version</b> member of the 
     *      <i>Parameters</i> parameter is set to 
     *      <b>CREATE_VIRTUAL_DISK_VERSION_2</b> then only the 
     *      <b>VIRTUAL_DISK_ACCESS_NONE</b> (0) value may be specified.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor An optional pointer to a 
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
     * @param {Pointer<HANDLE>} Handle A pointer to the handle object that represents the newly created virtual disk.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>Handle</i> parameter contains a valid pointer to the new virtual disk object.
     * 
     * If the function fails, the return value is an error code and the value of the <i>Handle</i> 
     *       parameter is undefined. For more information, see 
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-createvirtualdisk
     * @since windows6.1
     */
    static CreateVirtualDisk(VirtualStorageType, Path, VirtualDiskAccessMask, SecurityDescriptor, Flags, ProviderSpecificFlags, Parameters, Overlapped, Handle) {
        Path := Path is String ? StrPtr(Path) : Path
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("VirtDisk.dll\CreateVirtualDisk", "ptr", VirtualStorageType, "ptr", Path, "int", VirtualDiskAccessMask, "ptr", SecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "ptr", Parameters, "ptr", Overlapped, "ptr", Handle, "uint")
        return result
    }

    /**
     * Attaches a virtual hard disk (VHD) or CD or DVD image file (ISO) by locating an appropriate VHD provider to accomplish the attachment.
     * @param {HANDLE} VirtualDiskHandle A handle to an open virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor An optional pointer to a 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-attachvirtualdisk
     * @since windows6.1
     */
    static AttachVirtualDisk(VirtualDiskHandle, SecurityDescriptor, Flags, ProviderSpecificFlags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("VirtDisk.dll\AttachVirtualDisk", "ptr", VirtualDiskHandle, "ptr", SecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Detaches a virtual hard disk (VHD) or CD or DVD image file (ISO) by locating an appropriate virtual disk provider to accomplish the operation.
     * @param {HANDLE} VirtualDiskHandle A handle to an open virtual disk, which must have been opened using the 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-detachvirtualdisk
     * @since windows6.1
     */
    static DetachVirtualDisk(VirtualDiskHandle, Flags, ProviderSpecificFlags) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\DetachVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "uint", ProviderSpecificFlags, "uint")
        return result
    }

    /**
     * Retrieves the path to the physical device object that contains a virtual hard disk (VHD) or CD or DVD image file (ISO).
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the 
     *      <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag. For information on how to open a virtual disk, see 
     *      the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<Integer>} DiskPathSizeInBytes The size, in bytes, of the buffer pointed to by the <i>DiskPath</i> parameter.
     * @param {Pointer} DiskPath A target buffer to receive the path of the physical disk device that contains the virtual disk.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>DiskPath</i> parameter contains a pointer to a populated string.
     * 
     * If the function fails, the return value is an error code and the value of the contents of the buffer referred 
     *       to by the  <i>DiskPath</i> parameter is undefined. For more information, see 
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-getvirtualdiskphysicalpath
     * @since windows6.1
     */
    static GetVirtualDiskPhysicalPath(VirtualDiskHandle, DiskPathSizeInBytes, DiskPath) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        DiskPathSizeInBytesMarshal := DiskPathSizeInBytes is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\GetVirtualDiskPhysicalPath", "ptr", VirtualDiskHandle, DiskPathSizeInBytesMarshal, DiskPathSizeInBytes, "ptr", DiskPath, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PathsBufferSizeInBytes 
     * @param {Pointer} PathsBuffer 
     * @returns {Integer} 
     */
    static GetAllAttachedVirtualDiskPhysicalPaths(PathsBufferSizeInBytes, PathsBuffer) {
        PathsBufferSizeInBytesMarshal := PathsBufferSizeInBytes is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\GetAllAttachedVirtualDiskPhysicalPaths", PathsBufferSizeInBytesMarshal, PathsBufferSizeInBytes, "ptr", PathsBuffer, "uint")
        return result
    }

    /**
     * Returns the relationships between virtual hard disks (VHDs) or CD or DVD image file (ISO) or the volumes contained within those disks and their parent disk or volume.
     * @param {HANDLE} ObjectHandle A handle to a volume or root directory if  the <i>Flags</i> parameter does not specify 
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
     * @param {Pointer<Integer>} SizeUsed An optional pointer to a <b>ULONG</b> that receives the size used.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *       <i>StorageDependencyInfo</i> parameter contains the requested dependency information.
     * 
     * If the function fails, the return value is an error code and the 
     *       <i>StorageDependencyInfo</i> parameter is undefined. For more information, see 
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-getstoragedependencyinformation
     * @since windows6.1
     */
    static GetStorageDependencyInformation(ObjectHandle, Flags, StorageDependencyInfoSize, StorageDependencyInfo, SizeUsed) {
        ObjectHandle := ObjectHandle is Win32Handle ? NumGet(ObjectHandle, "ptr") : ObjectHandle

        SizeUsedMarshal := SizeUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\GetStorageDependencyInformation", "ptr", ObjectHandle, "int", Flags, "uint", StorageDependencyInfoSize, "ptr", StorageDependencyInfo, SizeUsedMarshal, SizeUsed, "uint")
        return result
    }

    /**
     * Retrieves information about a VHD.
     * @param {HANDLE} VirtualDiskHandle A handle to the open VHD, which must have been opened using the 
     *       <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag set in the 
     *       <i>VirtualDiskAccessMask</i> parameter to the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       open a VHD, see the <b>OpenVirtualDisk</b> function.
     * @param {Pointer<Integer>} VirtualDiskInfoSize A pointer to a <b>ULONG</b> that contains the size of the 
     *       <i>VirtualDiskInfo</i> parameter.
     * @param {Pointer} VirtualDiskInfo A pointer to a valid [GET_VIRTUAL_DISK_INFO](./ns-virtdisk-get_virtual_disk_info.md) 
     *       structure. The format of the data returned is dependent on the value passed in the 
     *       <b>Version</b> member by the caller.
     * @param {Pointer<Integer>} SizeUsed A pointer to a <b>ULONG</b> that contains the size used.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *        <i>VirtualDiskInfo</i> parameter contains the requested information.
     * 
     * If the function fails, the return value is an error code and the <i>VirtualDiskInfo</i> 
     *        parameter is undefined. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-getvirtualdiskinformation
     * @since windows6.1
     */
    static GetVirtualDiskInformation(VirtualDiskHandle, VirtualDiskInfoSize, VirtualDiskInfo, SizeUsed) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        VirtualDiskInfoSizeMarshal := VirtualDiskInfoSize is VarRef ? "uint*" : "ptr"
        SizeUsedMarshal := SizeUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\GetVirtualDiskInformation", "ptr", VirtualDiskHandle, VirtualDiskInfoSizeMarshal, VirtualDiskInfoSize, "ptr", VirtualDiskInfo, SizeUsedMarshal, SizeUsed, "uint")
        return result
    }

    /**
     * Sets information about a virtual hard disk (VHD).
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the 
     *      <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag. For information on how to open a virtual disk, see 
     *      the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<SET_VIRTUAL_DISK_INFO>} VirtualDiskInfo A pointer to a valid [SET_VIRTUAL_DISK_INFO](./ns-virtdisk-set_virtual_disk_info.md) 
     *      structure.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-setvirtualdiskinformation
     * @since windows6.1
     */
    static SetVirtualDiskInformation(VirtualDiskHandle, VirtualDiskInfo) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\SetVirtualDiskInformation", "ptr", VirtualDiskHandle, "ptr", VirtualDiskInfo, "uint")
        return result
    }

    /**
     * Enumerates the metadata associated with a virtual disk.
     * @param {HANDLE} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Pointer<Integer>} NumberOfItems Address of a <b>ULONG</b>. On input, the value indicates the number of elements in 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-enumeratevirtualdiskmetadata
     * @since windows8.0
     */
    static EnumerateVirtualDiskMetadata(VirtualDiskHandle, NumberOfItems, Items) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        NumberOfItemsMarshal := NumberOfItems is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\EnumerateVirtualDiskMetadata", "ptr", VirtualDiskHandle, NumberOfItemsMarshal, NumberOfItems, "ptr", Items, "uint")
        return result
    }

    /**
     * Retrieves the specified metadata from the virtual disk.
     * @param {HANDLE} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Pointer<Guid>} Item Address of a <b>GUID</b> identifying the metadata to retrieve.
     * @param {Pointer<Integer>} MetaDataSize Address of a <b>ULONG</b>. On input, the value indicates the size, in bytes, of 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-getvirtualdiskmetadata
     * @since windows8.0
     */
    static GetVirtualDiskMetadata(VirtualDiskHandle, Item, MetaDataSize, MetaData) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        MetaDataSizeMarshal := MetaDataSize is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\GetVirtualDiskMetadata", "ptr", VirtualDiskHandle, "ptr", Item, MetaDataSizeMarshal, MetaDataSize, "ptr", MetaData, "uint")
        return result
    }

    /**
     * Sets a metadata item for a virtual disk.
     * @param {HANDLE} VirtualDiskHandle Handle to an open virtual disk.
     * @param {Pointer<Guid>} Item Address of a <b>GUID</b> identifying the metadata to retrieve.
     * @param {Integer} MetaDataSize Address of a <b>ULONG</b> containing the size, in bytes, of 
     *       the buffer pointed to by the <i>MetaData</i> parameter.
     * @param {Pointer} MetaData Address of the buffer containing the metadata to be stored.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-setvirtualdiskmetadata
     * @since windows8.0
     */
    static SetVirtualDiskMetadata(VirtualDiskHandle, Item, MetaDataSize, MetaData) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\SetVirtualDiskMetadata", "ptr", VirtualDiskHandle, "ptr", Item, "uint", MetaDataSize, "ptr", MetaData, "uint")
        return result
    }

    /**
     * Deletes metadata from a virtual disk.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk.
     * @param {Pointer<Guid>} Item The item to be deleted.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-deletevirtualdiskmetadata
     * @since windows8.0
     */
    static DeleteVirtualDiskMetadata(VirtualDiskHandle, Item) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\DeleteVirtualDiskMetadata", "ptr", VirtualDiskHandle, "ptr", Item, "uint")
        return result
    }

    /**
     * Checks the progress of an asynchronous virtual hard disk (VHD) operation.
     * @param {HANDLE} VirtualDiskHandle A valid handle to a virtual disk with a pending asynchronous operation.
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
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-getvirtualdiskoperationprogress
     * @since windows6.1
     */
    static GetVirtualDiskOperationProgress(VirtualDiskHandle, Overlapped, Progress) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\GetVirtualDiskOperationProgress", "ptr", VirtualDiskHandle, "ptr", Overlapped, "ptr", Progress, "uint")
        return result
    }

    /**
     * Reduces the size of a virtual hard disk (VHD) backing store file.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-compactvirtualdisk
     * @since windows6.1
     */
    static CompactVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\CompactVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Merges a child virtual hard disk (VHD) in a differencing chain with one or more parent virtual disks in the chain.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag. For information on how to open a virtual disk, see the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Integer} Flags Must be the <b>MERGE_VIRTUAL_DISK_FLAG_NONE</b> value of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-merge_virtual_disk_flag">MERGE_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<MERGE_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-merge_virtual_disk_parameters">MERGE_VIRTUAL_DISK_PARAMETERS</a> structure that contains merge parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure if <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> operation is desired.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-mergevirtualdisk
     * @since windows6.1
     */
    static MergeVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\MergeVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Increases the size of a fixed or dynamically expandable virtual hard disk (VHD).
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk, which must have been opened using the <b>VIRTUAL_DISK_ACCESS_METAOPS</b> flag. For information on how to open a virtual disk, see the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Integer} Flags Must be the <b>EXPAND_VIRTUAL_DISK_FLAG_NONE</b> value of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_flag">EXPAND_VIRTUAL_DISK_FLAG</a> enumeration.
     * @param {Pointer<EXPAND_VIRTUAL_DISK_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-expand_virtual_disk_parameters">EXPAND_VIRTUAL_DISK_PARAMETERS</a> structure that contains expansion parameter data.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure if <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">asynchronous</a> operation is desired.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-expandvirtualdisk
     * @since windows6.1
     */
    static ExpandVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\ExpandVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Resizes a virtual disk.
     * @param {HANDLE} VirtualDiskHandle Handle to an open virtual disk.
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-resizevirtualdisk
     * @since windows8.0
     */
    static ResizeVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\ResizeVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Initiates a mirror operation for a virtual disk.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk. For information on how to open a virtual disk, see the 
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
     *      <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a>structure. This parameter is required.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-mirrorvirtualdisk
     * @since windows8.0
     */
    static MirrorVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\MirrorVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Breaks a previously initiated mirror operation and sets the mirror to be the active virtual disk.
     * @param {HANDLE} VirtualDiskHandle A handle to the open mirrored virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       mirror a virtual disk, see the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-breakmirrorvirtualdisk">MirrorVirtualDisk</a> 
     *       function.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-breakmirrorvirtualdisk
     * @since windows8.0
     */
    static BreakMirrorVirtualDisk(VirtualDiskHandle) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\BreakMirrorVirtualDisk", "ptr", VirtualDiskHandle, "uint")
        return result
    }

    /**
     * Attaches a parent to a virtual disk opened with the OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN flag.
     * @param {HANDLE} VirtualDiskHandle Handle to a virtual disk.
     * @param {PWSTR} ParentPath Address of a string containing a valid path to the virtual hard disk image to add as a parent.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-addvirtualdiskparent
     * @since windows8.0
     */
    static AddVirtualDiskParent(VirtualDiskHandle, ParentPath) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle
        ParentPath := ParentPath is String ? StrPtr(ParentPath) : ParentPath

        result := DllCall("VirtDisk.dll\AddVirtualDiskParent", "ptr", VirtualDiskHandle, "ptr", ParentPath, "uint")
        return result
    }

    /**
     * Retrieves information about changes to the specified areas of a virtual hard disk (VHD) that are tracked by resilient change tracking (RCT).
     * @param {HANDLE} VirtualDiskHandle A handle to the open VHD, which must have been opened using the 
     *       <b>VIRTUAL_DISK_ACCESS_GET_INFO</b> flag set in the 
     *       <i>VirtualDiskAccessMask</i> parameter to the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function. For information on how to 
     *       open a VHD, see the <b>OpenVirtualDisk</b> function.
     * @param {PWSTR} ChangeTrackingId A pointer to a string that specifies the change tracking identifier for the change that identifies the state of the virtual disk that you want to use as the basis of comparison to determine whether the specified area of the VHD has changed.
     * @param {Integer} ByteOffset An unsigned long integer that specifies the distance from the start of the VHD to the beginning of  the area of the VHD that you want to check for changes, in bytes.
     * @param {Integer} ByteLength An unsigned long integer that specifies the length of the area of the VHD that you want to check for changes, in bytes.
     * @param {Integer} Flags Reserved. Set to <b>QUERY_CHANGES_VIRTUAL_DISK_FLAG_NONE</b>.
     * @param {Pointer<QUERY_CHANGES_VIRTUAL_DISK_RANGE>} Ranges An array of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-query_changes_virtual_disk_range">QUERY_CHANGES_VIRTUAL_DISK_RANGE</a> structures that indicates the areas of the virtual disk within the area that the <i>ByteOffset</i> and <i>ByteLength</i> parameters specify that have changed since the change tracking identifier that the <i>ChangeTrackingId</i>  parameter specifies was sealed.
     * @param {Pointer<Integer>} RangeCount An address of an unsigned long integer. On input, the value indicates the number of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-query_changes_virtual_disk_range">QUERY_CHANGES_VIRTUAL_DISK_RANGE</a> structures that the array that the <i>Ranges</i> parameter points to can hold. On output, the value contains the number of <b>QUERY_CHANGES_VIRTUAL_DISK_RANGE</b> structures that the method placed in the array.
     * @param {Pointer<Integer>} ProcessedLength A pointer to an unsigned long integer that indicates the total number of bytes that the method processed, which indicates for how much of the area that the <i>BytesLength</i> parameter specifies that changes were captured in the available space of the array that the <i>Ranges</i> parameter specifies.
     * @returns {Integer} The status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *        <i>Ranges</i> parameter contains the requested information.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-querychangesvirtualdisk
     * @since windows10.0.10240
     */
    static QueryChangesVirtualDisk(VirtualDiskHandle, ChangeTrackingId, ByteOffset, ByteLength, Flags, Ranges, RangeCount, ProcessedLength) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle
        ChangeTrackingId := ChangeTrackingId is String ? StrPtr(ChangeTrackingId) : ChangeTrackingId

        RangeCountMarshal := RangeCount is VarRef ? "uint*" : "ptr"
        ProcessedLengthMarshal := ProcessedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("VirtDisk.dll\QueryChangesVirtualDisk", "ptr", VirtualDiskHandle, "ptr", ChangeTrackingId, "uint", ByteOffset, "uint", ByteLength, "int", Flags, "ptr", Ranges, RangeCountMarshal, RangeCount, ProcessedLengthMarshal, ProcessedLength, "uint")
        return result
    }

    /**
     * Creates a snapshot of the current virtual disk for VHD Set files.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk. This must be a VHD Set file.
     * @param {Pointer<TAKE_SNAPSHOT_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-take_snapshot_vhdset_parameters">TAKE_SNAPSHOT_VHDSET_PARAMETERS</a> structure that contains snapshot data.
     * @param {Integer} Flags Snapshot flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_flag">TAKE_SNAPSHOT_VHDSET_FLAG</a> enumeration
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-takesnapshotvhdset
     * @since windows10.0.10240
     */
    static TakeSnapshotVhdSet(VirtualDiskHandle, Parameters, Flags) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\TakeSnapshotVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Deletes a snapshot from a VHD Set file.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk. This must be a VHD Set file.
     * @param {Pointer<DELETE_SNAPSHOT_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-delete_snapshot_vhdset_parameters">DELETE_SNAPSHOT_VHDSET_PARAMETERS</a> structure that contains snapshot deletion data.
     * @param {Integer} Flags Snapshot deletion flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_flag">DELETE_SNAPSHOT_VHDSET_FLAG</a> enumeration.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-deletesnapshotvhdset
     * @since windows10.0.10240
     */
    static DeleteSnapshotVhdSet(VirtualDiskHandle, Parameters, Flags) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\DeleteSnapshotVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Modifies the internal contents of a virtual disk file. Can be used to set the active leaf, or to fix up snapshot entries.
     * @param {HANDLE} VirtualDiskHandle A handle to the open virtual disk. This must be a VHD Set file.
     * @param {Pointer<MODIFY_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-modify_vhdset_parameters">MODIFY_VHDSET_PARAMETERS</a> structure that contains modification data.
     * @param {Integer} Flags Modification flags, which must be a valid combination of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-modify_vhdset_flag">MODIFY_VHDSET_FLAG</a> enumeration.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-modifyvhdset
     * @since windows10.0.10240
     */
    static ModifyVhdSet(VirtualDiskHandle, Parameters, Flags) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\ModifyVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Applies a snapshot of the current virtual disk for VHD Set files.
     * @param {HANDLE} VirtualDiskHandle A handle to an open virtual disk. For information on how to open a virtual disk, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-openvirtualdisk">OpenVirtualDisk</a> function.
     * @param {Pointer<APPLY_SNAPSHOT_VHDSET_PARAMETERS>} Parameters A pointer to a valid <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-apply_snapshot_vhdset_parameters">APPLY_SNAPSHOT_VHDSET_PARAMETERS</a> structure that contains snapshot data.
     * @param {Integer} Flags A valid combination of values of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_flag">APPLY_SNAPSHOT_VHDSET_FLAG</a> enumeration.
     * @returns {Integer} Status of the request.
     * 
     * If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is an error code. For more information, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-applysnapshotvhdset
     * @since windows10.0.10240
     */
    static ApplySnapshotVhdSet(VirtualDiskHandle, Parameters, Flags) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\ApplySnapshotVhdSet", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "uint")
        return result
    }

    /**
     * Issues an embedded SCSI request directly to a virtual hard disk.
     * @param {HANDLE} VirtualDiskHandle A handle to an open virtual disk. For information on how to open a virtual disk, see the 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//virtdisk/nf-virtdisk-rawscsivirtualdisk
     * @since windows10.0.10240
     */
    static RawSCSIVirtualDisk(VirtualDiskHandle, Parameters, Flags, Response) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\RawSCSIVirtualDisk", "ptr", VirtualDiskHandle, "ptr", Parameters, "int", Flags, "ptr", Response, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} VirtualDiskHandle 
     * @param {Integer} Flags 
     * @param {Pointer<FORK_VIRTUAL_DISK_PARAMETERS>} Parameters 
     * @param {Pointer<OVERLAPPED>} Overlapped 
     * @returns {Integer} 
     */
    static ForkVirtualDisk(VirtualDiskHandle, Flags, Parameters, Overlapped) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\ForkVirtualDisk", "ptr", VirtualDiskHandle, "int", Flags, "ptr", Parameters, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} VirtualDiskHandle 
     * @returns {Integer} 
     */
    static CompleteForkVirtualDisk(VirtualDiskHandle) {
        VirtualDiskHandle := VirtualDiskHandle is Win32Handle ? NumGet(VirtualDiskHandle, "ptr") : VirtualDiskHandle

        result := DllCall("VirtDisk.dll\CompleteForkVirtualDisk", "ptr", VirtualDiskHandle, "uint")
        return result
    }

;@endregion Methods
}

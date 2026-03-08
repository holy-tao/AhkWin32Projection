#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for managing a virtual disk. (IVdsOpenVDisk)
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsopenvdisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsOpenVDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsOpenVDisk
     * @type {Guid}
     */
    static IID => Guid("{75c8f324-f715-4fe3-a28e-f9011b61a4a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Attach", "Detach", "DetachAndDelete", "Compact", "Merge", "Expand"]

    /**
     * Attaches a virtual disk.
     * @remarks
     * When a virtual disk is attached, the caller can receive one or all of the following notifications:
     * 
     * <ul>
     * <li>If the caller is registered for VDS notifications, the caller receives a disk arrival notification. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-notification-model">VDS Notifications</a>.</li>
     * <li>If the caller is registered for PnP notifications, the caller receives a PnP disk arrival notification. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerdevicenotificationa">RegisterDeviceNotification</a>.</li>
     * </ul>
     * Applications must initialize process-wide security by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> function. The <i>dwImpLevel</i> parameter should be set to <b>RPC_C_IMP_LEVEL_IMPERSONATE</b>.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>These actions are not required until Windows 7 and Windows Server 2008 R2.
     * @param {PWSTR} pStringSecurityDescriptor A string that contains the security descriptor for the virtual disk. If not specified, the security descriptor in use is: "D:P(A;;GA;;;WD)" on Windows 7, and "D:P(A;;GA;;;WD)(A;;GA;;;AC)" on Windows 8.1 and later.
     * @param {Integer} Flags A bitmask  of  [ATTACH_VIRTUAL_DISK_FLAG](../virtdisk/ne-virtdisk-attach_virtual_disk_flag.md) enumeration values specifying how the virtual disk is to be attached. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATTACH_VIRTUAL_DISK_FLAG_NONE"></a><a id="attach_virtual_disk_flag_none"></a><dl>
     * <dt><b>ATTACH_VIRTUAL_DISK_FLAG_NONE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No flags are specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY"></a><a id="attach_virtual_disk_flag_read_only"></a><dl>
     * <dt><b>ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attach the virtual disk as read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER"></a><a id="attach_virtual_disk_flag_no_drive_letter"></a><dl>
     * <dt><b>ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Mount all volumes on the attached virtual disk without assigning drive letters to them.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME"></a><a id="attach_virtual_disk_flag_permanent_lifetime"></a><dl>
     * <dt><b>ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VDS service automatically  sets this flag so that the VHD remains attached until the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsopenvdisk-detach">IVdsOpenVDisk::Detach</a> method is called to detach it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST"></a><a id="attach_virtual_disk_flag_no_local_host"></a><dl>
     * <dt><b>ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved. Do not use.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ProviderSpecificFlags A bitmask of flags that are specific to the type of virtual disk that is being attached. These flags are provider-specific. For the Microsoft virtual disk provider, this parameter must be zero.
     * @param {Integer} TimeoutInMs This parameter is reserved for future use.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they have finished with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-attach
     */
    Attach(pStringSecurityDescriptor, Flags, ProviderSpecificFlags, TimeoutInMs) {
        pStringSecurityDescriptor := pStringSecurityDescriptor is String ? StrPtr(pStringSecurityDescriptor) : pStringSecurityDescriptor

        result := ComCall(3, this, "ptr", pStringSecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "uint", TimeoutInMs, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Detaches a virtual disk.
     * @param {Integer} Flags An <b>DETACH_VIRTUAL_DISK_FLAG</b> enumeration value that specifies how the virtual disk is to be detached. Must be set to DETACH_VIRTUAL_DISK_FLAG_NONE.
     * @param {Integer} ProviderSpecificFlags Flags specific to the type of virtual disk being detached. For the Microsoft provider, this must be 0. This value must match the value that was specified for the <i>ProviderSpecificFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvdprovider-createvdisk">IVdsVdProvider::CreateVDisk</a> method when the virtual disk was created.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-detach
     */
    Detach(Flags, ProviderSpecificFlags) {
        result := ComCall(4, this, "int", Flags, "uint", ProviderSpecificFlags, "HRESULT")
        return result
    }

    /**
     * Detaches a virtual disk and deletes the backing files.
     * @param {Integer} Flags An <b>DETACH_VIRTUAL_DISK_FLAG</b> enumeration value that specifies how the virtual disk is to be detached. Must be set to DETACH_VIRTUAL_DISK_FLAG_NONE.
     * @param {Integer} ProviderSpecificFlags Flags specific to the type of virtual disk being detached and deleted. For the Microsoft provider, this must be 0. This value must match the value that was specified for the <i>ProviderSpecificFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvdprovider-createvdisk">IVdsVdProvider::CreateVDisk</a> method when the virtual disk was created.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-detachanddelete
     */
    DetachAndDelete(Flags, ProviderSpecificFlags) {
        result := ComCall(5, this, "int", Flags, "uint", ProviderSpecificFlags, "HRESULT")
        return result
    }

    /**
     * Compacts the virtual disk to reduce the physical size of the backing file.
     * @remarks
     * A virtual disk can be compacted only if it is in one of the following states:
     * 
     * <ul>
     * <li>Detached (offline mode)</li>
     * <li>Attached and opened with read-only access (online mode)</li>
     * </ul>
     * If it is in any other state, the compact operation fails.
     * 
     * The virtual disk must be an expandable (also called dynamic) or differencing virtual disk.
     * 
     * The operation can be safely interrupted and re-run later. If the operation is interrupted and the backing file is reopened, the file's size may be reduced when the file is opened.
     * 
     * The operation can be CPU-intensive or I/O-intensive, or both, depending on how large the virtual disk is and how many unused blocks require manipulation.
     * 
     * This method reduces the size of the virtual disk's backing store file by reclaiming unused space. If this method is called for a virtual disk that is detached, it can only reclaim space in the file that was never used to write data. If it is called for a virtual disk that is attached and opened with read-only access, it is able to reclaim space that was once used, but was later freed. Calling this method for a virtual disk that is attached and opened with read-only access reclaims the maximum amount of free space in the backing store file.
     * @param {Integer} Flags A <b>COMPACT_VIRTUAL_DISK_FLAG</b> enumeration value that specifies how the virtual disk is to be compacted. Must be set to COMPACT_VIRTUAL_DISK_FLAG_NONE.
     * @param {Integer} Reserved This parameter is reserved for system use.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they have finished with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-compact
     */
    Compact(Flags, Reserved) {
        result := ComCall(6, this, "int", Flags, "uint", Reserved, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Merges a child virtual disk with its parents in the differencing chain.
     * @remarks
     * A virtual disk can be merged only if it is detached.
     * 
     * This method moves all data blocks from the child disk to the parent. However, it will not delete the invalidated child disks at the end of the operation.
     * 
     * The virtual disk must have been opened with read/write access.
     * @param {Integer} Flags A <b>MERGE_VIRTUAL_DISK_FLAG</b> enumeration value that specifies how the virtual disk is to be merged. Must be set to MERGE_VIRTUAL_DISK_FLAG_NONE.
     * @param {Integer} MergeDepth The number of parent disks in the differencing chain to merge together. The disk must have been open with a ReadWriteDepth at least equal to this value.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they have finished with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-merge
     */
    Merge(Flags, MergeDepth) {
        result := ComCall(7, this, "int", Flags, "uint", MergeDepth, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Increases the size of a virtual disk to the maximum size available on a fixed or expandable disk.
     * @remarks
     * A virtual disk can be expanded only if it is detached.
     * 
     * The virtual disk must have been opened with access to perform metadata operations. This corresponds to the <b>VIRTUAL_DISK_ACCESS_METAOPS</b> value of the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask-r1">VIRTUAL_DISK_ACCESS_MASK</a> enumeration.
     * @param {Integer} Flags An <b>EXPAND_VIRTUAL_DISK_FLAG</b> enumeration value that specifies how the virtual disk is to be expanded. Must be set to EXPAND_VIRTUAL_DISK_FLAG_NONE.
     * @param {Integer} NewSize The desired size in bytes of the expanded virtual disk.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they have finished with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-expand
     */
    Expand(Flags, NewSize) {
        result := ComCall(8, this, "int", Flags, "uint", NewSize, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}

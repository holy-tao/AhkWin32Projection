#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsDisk.ahk
#Include .\IVdsVDisk.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for creating and managing virtual disks.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvdprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVdProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVdProvider
     * @type {Guid}
     */
    static IID => Guid("{b481498c-8354-45f9-84a0-0bdd2832a91f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryVDisks", "CreateVDisk", "AddVDisk", "GetDiskFromVDisk", "GetVDiskFromDisk"]

    /**
     * Returns a list of all virtual disks that are managed by the provider.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the virtual disk objects. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the virtual disk  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     *      This parameter is required and cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdprovider-queryvdisks
     */
    QueryVDisks() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Creates a virtual disk.
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualDeviceType A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure that specifies the type of virtual disk to be created.
     * @param {PWSTR} pPath A <b>NULL</b>-terminated wide-character string containing the name and directory path for the backing file to be created for the virtual disk.
     * @param {PWSTR} pStringSecurityDescriptor A <b>NULL</b>-terminated wide-character string containing the security descriptor to be applied to
     *     the virtual disk. If this parameter is <b>NULL</b>, the security descriptor in the caller's access token will be used.
     * @param {Integer} Flags A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-create_virtual_disk_flag">CREATE_VIRTUAL_DISK_FLAG</a> enumeration values specifying how the virtual disk is to be created.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_VIRTUAL_DISK_FLAG_NONE"></a><a id="create_virtual_disk_flag_none"></a><dl>
     * <dt><b>CREATE_VIRTUAL_DISK_FLAG_NONE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No flags are specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION"></a><a id="create_virtual_disk_flag_full_physical_allocation"></a><dl>
     * <dt><b>CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pre-allocate all physical space necessary for the virtual size of the virtual disk. This flag is valid only for a fixed-size virtual disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ProviderSpecificFlags A bitmask of flags that are specific to the type of virtual disk that is being created. These flags are provider-specific. For the Microsoft virtual disk provider, this parameter must be zero.
     * @param {Integer} Reserved The parameter is reserved and must be zero.
     * @param {Pointer<VDS_CREATE_VDISK_PARAMETERS>} pCreateDiskParameters A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_create_vdisk_parameters">VDS_CREATE_VDISK_PARAMETERS</a> structure that contains the virtual disk creation parameters.
     * @param {Pointer<IVdsAsync>} ppAsync A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they are done with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdprovider-createvdisk
     */
    CreateVDisk(VirtualDeviceType, pPath, pStringSecurityDescriptor, Flags, ProviderSpecificFlags, Reserved, pCreateDiskParameters, ppAsync) {
        pPath := pPath is String ? StrPtr(pPath) : pPath
        pStringSecurityDescriptor := pStringSecurityDescriptor is String ? StrPtr(pStringSecurityDescriptor) : pStringSecurityDescriptor

        result := ComCall(4, this, "ptr", VirtualDeviceType, "ptr", pPath, "ptr", pStringSecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "uint", Reserved, "ptr", pCreateDiskParameters, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * Creates a virtual disk object for an existing virtual disk file.
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualDeviceType The address of  a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure
     * @param {PWSTR} pPath A <b>NULL</b>-terminated wide-character string containing the name and directory path for the backing file for the virtual disk.
     * @param {Pointer<IVdsVDisk>} ppVDisk A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvdisk">IVdsVDisk</a> interface pointer to the newly created virtual disk object. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdprovider-addvdisk
     */
    AddVDisk(VirtualDeviceType, pPath, ppVDisk) {
        pPath := pPath is String ? StrPtr(pPath) : pPath

        result := ComCall(5, this, "ptr", VirtualDeviceType, "ptr", pPath, "ptr*", ppVDisk, "HRESULT")
        return result
    }

    /**
     * Returns an IVdsDisk interface pointer for a virtual disk given an IVdsVDisk interface pointer.
     * @param {IVdsVDisk} pVDisk The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvdisk">IVdsVDisk</a> interface pointer for the virtual disk.
     * @returns {IVdsDisk} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsdisk">IVdsDisk</a> interface pointer. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdprovider-getdiskfromvdisk
     */
    GetDiskFromVDisk(pVDisk) {
        result := ComCall(6, this, "ptr", pVDisk, "ptr*", &ppDisk := 0, "HRESULT")
        return IVdsDisk(ppDisk)
    }

    /**
     * Returns an IVdsVDisk interface pointer for the virtual disk given an IVdsDisk interface pointer.
     * @param {IVdsDisk} pDisk The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvdisk">IVdsVDisk</a> interface pointer for the virtual disk.
     * @returns {IVdsVDisk} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvdisk">IVdsVDisk</a> interface pointer. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdprovider-getvdiskfromdisk
     */
    GetVDiskFromDisk(pDisk) {
        result := ComCall(7, this, "ptr", pDisk, "ptr*", &ppVDisk := 0, "HRESULT")
        return IVdsVDisk(ppVDisk)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains the methods used by VSS to map volumes to LUNs, discover LUNs created during the shadow copy process, and transport LUNs on a SAN.
 * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nn-vsprov-ivsshardwaresnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssHardwareSnapshotProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssHardwareSnapshotProvider
     * @type {Guid}
     */
    static IID => Guid("{9593a157-44e9-4344-bbeb-44fbf9b06b10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AreLunsSupported", "FillInLunInfo", "BeginPrepareSnapshot", "GetTargetLuns", "LocateLuns", "OnLunEmpty"]

    /**
     * Determines whether the hardware provider supports shadow copy creation for all LUNs that contribute to the volume.
     * @remarks
     * If the hardware subsystem supports the SCSI Inquiry Data and Vital Product Data 
     *     page  80 (device serial number) and page 83 (device identity) guidelines, the provider should not need to modify the structures in the <i>pLunInformation</i> array.
     * 
     * In any case, the <b>AreLunsSupported</b> method should not modify the value of the <b>m_rgInterconnects</b> member of any <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure in the <i>pLunInformation</i> array.
     * 
     * If the provider supports hardware shadow copy creation for all of the LUNs in the <i>pLunInformation</i> array, it should return <b>TRUE</b> in the <b>BOOL</b> value that the <i>pbIsSupported</i> parameter points to. If the provider does not support hardware shadow copies for one or more LUNs, it must set this <b>BOOL</b> value to <b>FALSE</b>. 
     * 
     * The provider must never agree to create shadow copies if it cannot, even if the problem is only temporary. If a transient condition, such as low resources, makes it impossible for the provider to create a shadow copy using one or more LUNs   when <b>AreLunsSupported</b> is called, the provider must set the <b>BOOL</b> value to <b>FALSE</b>.
     * @param {Integer} lLunCount Count of LUNs contributing to this shadow copy volume.
     * @param {Integer} lContext Shadow copy context for the current shadow copy set as enumerated by 
     *       a bitmask of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> enumeration. If the <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b> flag is set, the shadow copy set is transportable.
     * @param {Pointer<Pointer<Integer>>} rgwszDevices List of devices corresponding to the LUNs to be shadow copied.
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInformation Array of <i>lLunCount</i><a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures, one for each LUN 
     *       contributing to this shadow copy volume.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value. If all devices are supported for shadow copy, the 
     *       provider should store a <b>TRUE</b> value at the location pointed to by 
     *       <i>pbIsSupported</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-arelunssupported
     */
    AreLunsSupported(lLunCount, lContext, rgwszDevices, pLunInformation) {
        rgwszDevicesMarshal := rgwszDevices is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", lLunCount, "int", lContext, rgwszDevicesMarshal, rgwszDevices, "ptr", pLunInformation, "int*", &pbIsSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsSupported
    }

    /**
     * Prompts the hardware provider to indicate whether it supports the corresponding disk device and correct any omissions in the VDS_LUN_INFORMATION structure.
     * @remarks
     * VSS calls the <b>FillInLunInfo</b> method for each <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure that the provider previously initialized in its <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-gettargetluns">GetTargetLuns</a> method. VSS also calls the <b>FillInLunInfo</b> method for each new disk device that arrives in the system during the import process. 
     * 
     * The provider can correct any omissions in the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure received in the <i>pLunInfo</i>  parameter. However, the provider should not modify the value of the <b>m_rgInterconnects</b> member of this structure.
     * 
     * The members of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure correspond to the SCSI Inquiry Data and Vital Product Data page 80 (device serial number) information, with the following exceptions:
     * 
     * <ul>
     * <li>The <b>m_version</b> member must be set to <b>VER_VDS_LUN_INFORMATION</b>.</li>
     * <li>The <b>m_BusType</b> member is ignored in comparisons during import. This value depends on the PnP storage stack on the corresponding disk device. Usually this is <b>VDSBusTypeScsi</b>.</li>
     * <li>The <b>m_diskSignature</b> member is ignored in comparisons during import. The provider must set this member to GUID_NULL.</li>
     * </ul>
     * The members of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor">VDS_STORAGE_DEVICE_ID_DESCRIPTOR</a> 
     *       structure (in the <b>m_deviceIdDescriptor</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> 
     *     structure) correspond to the page 83 information. In this structure, each <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> 
     *       structure corresponds to the STORAGE_IDENTIFIER structure for a device identifier (that is, a storage identifier with an association type of zero). For more information about the STORAGE_IDENTIFIER structure, see the Windows Driver Kit (WDK) documentation.
     * 
     * If the <b>FillInLunInfo</b> method is 
     *     called for a LUN that is unknown to the provider, the provider should not return an error. Instead, it 
     *     should return <b>FALSE</b>  in the <b>BOOL</b> value that the <i>pbIsSupported</i> parameter points to and 
     *     return success. If the provider recognizes the LUN, it should set the <b>BOOL</b> value to 
     *     <b>TRUE</b>.
     * @param {Pointer<Integer>} wszDeviceName Device corresponding to the shadow copy LUN.
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure for the 
     *       shadow copy LUN.
     * @returns {BOOL} The provider must return <b>TRUE</b> in the location pointed to by the 
     *       <i>pbIsSupported</i> parameter if the device is supported.
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-fillinluninfo
     */
    FillInLunInfo(wszDeviceName, pLunInfo) {
        wszDeviceNameMarshal := wszDeviceName is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, wszDeviceNameMarshal, wszDeviceName, "ptr", pLunInfo, "int*", &pbIsSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsSupported
    }

    /**
     * Called for each shadow copy that is added to the shadow copy set.
     * @remarks
     * This method cannot be called for a virtual hard disk (VHD) that is nested inside another VHD.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>VHDs are not supported.
     * @param {Guid} SnapshotSetId Shadow copy set identifier.
     * @param {Guid} SnapshotId Identifier of the shadow copy to be created.
     * @param {Integer} lContext Shadow copy context for current shadow copy set as enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a>.
     * @param {Integer} lLunCount Count of LUNs contributing to this shadow copy volume.
     * @param {Pointer<Pointer<Integer>>} rgDeviceNames Pointer to array of <i>lLunCount</i> pointers to strings, each string containing 
     *       the name of a LUN to be shadow copied.
     * @param {Pointer<VDS_LUN_INFORMATION>} rgLunInformation Pointer to array of <i>lLunCount</i><a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures, one for each LUN 
     *        contributing to this shadow copy volume.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED</b></b></dt>
     * <dt>0x80042312L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider has reached the maximum number of volumes it can support.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_NESTED_VOLUME_LIMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume is nested too deeply to participate in the VSS operation.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This return code is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. The provider must report an event in the application event log 
     *         providing the user with information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER</b></b></dt>
     * <dt>0x8004230EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support this volume.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_UNSUPPORTED_CONTEXT</b></b></dt>
     * <dt>0x8004231BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context specified by <i>lContext</i> is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, lContext, lLunCount, rgDeviceNames, rgLunInformation) {
        rgDeviceNamesMarshal := rgDeviceNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", SnapshotSetId, "ptr", SnapshotId, "int", lContext, "int", lLunCount, rgDeviceNamesMarshal, rgDeviceNames, "ptr", rgLunInformation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prompts the hardware provider to initialize the VDS_LUN_INFORMATION structures for the newly created shadow copy LUNs.
     * @remarks
     * In the <i>rgDestinationLuns</i> parameter, VSS supplies an empty <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> 
     *     structure for each newly created shadow copy LUN. The shadow copy LUNs are not surfaced or visible to the system. 
     *     The provider should initialize the members of the 
     *     <b>VDS_LUN_INFORMATION</b> structure with the appropriate SCSI 
     *     Inquiry Data and Vital Product Data page  80 (device serial number) and page 83 (device identity) information. The 
     *     structure should contain correct member values such that the shadow copy LUNs can be located by Windows from the 
     *     original computer or any other computer connected to the SAN.
     * 
     * The members of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure correspond to the page 80 information, with the following exceptions:
     * 
     * <ul>
     * <li>The <b>m_version</b> member must be set to <b>VER_VDS_LUN_INFORMATION</b>.</li>
     * <li>The <b>m_BusType</b> member is ignored in comparisons during import. This value depends on the PnP storage stack on the corresponding disk device. Usually this is <b>VDSBusTypeScsi</b>.</li>
     * <li>The <b>m_diskSignature</b> member is ignored in comparisons during import. The provider must set this member to GUID_NULL.</li>
     * </ul>
     * The members of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor">VDS_STORAGE_DEVICE_ID_DESCRIPTOR</a> 
     *       structure (in the <b>m_deviceIdDescriptor</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> 
     *     structure) correspond to the page 83 information. In this structure, each <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> 
     *       structure corresponds to the STORAGE_IDENTIFIER structure for a device identifier (that is, a storage identifier with an association type of zero). For more information about the STORAGE_IDENTIFIER structure, see the Windows Driver Kit (WDK) documentation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures returned here 
     *     must be the same as the structures provided in 
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-fillinluninfo">IVssHardwareSnapshotProvider::FillInLunInfo</a> method during import so 
     *     that VSS can use this information to identify the newly arriving shadow copy LUNs at import. These same structures 
     *     will be passed to the provider in the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-locateluns">IVssHardwareSnapshotProvider::LocateLuns</a> method.
     * @param {Integer} lLunCount Count of LUNs that contribute to the original volume.
     * @param {Pointer<Pointer<Integer>>} rgDeviceNames Pointer to an array of <i>lLunCount</i> pointers to strings. Each string contains 
     *       the name of an original LUN to be shadow copied.
     * @param {Pointer<VDS_LUN_INFORMATION>} rgSourceLuns Pointer to an array of <i>lLunCount</i><a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures, one for each LUN 
     *       that contributes to the original volume.
     * @param {Pointer<VDS_LUN_INFORMATION>} rgDestinationLuns Pointer to an array of <i>lLunCount</i><a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures, one for each new 
     *       shadow copy LUN created during shadow copy processing. There should be a one-to-one correspondence between the elements of 
     *       the <i>rgSourceLuns</i> and <i>rgDestinationLuns</i> arrays.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. The provider must report an event in the application event log 
     *         providing the user with information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-gettargetluns
     */
    GetTargetLuns(lLunCount, rgDeviceNames, rgSourceLuns, rgDestinationLuns) {
        rgDeviceNamesMarshal := rgDeviceNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "int", lLunCount, rgDeviceNamesMarshal, rgDeviceNames, "ptr", rgSourceLuns, "ptr", rgDestinationLuns, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prompts the hardware provider to make the shadow copy LUNs visible to the computer.
     * @remarks
     * In the  <i>rgSourceLuns</i> parameter, VSS supplies the same array of <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> 
     *     structures that the provider previously initialized in its <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-gettargetluns">IVssHardwareSnapshotProvider::GetTargetLuns</a> method. For each <b>VDS_LUN_INFORMATION</b> 
     *     structure in the array, the provider should unmask (or "surface") the corresponding shadow copy LUN to the computer.
     * 
     * Immediately after this method returns, VSS will perform a rescan and enumeration to detect any arrived 
     *     devices. This causes any exposed LUNs to be discovered by the PnP manager. In parallel with listening for disk arrivals, VSS 
     *     will also listen for hidden volume arrivals. VSS will stop listening after all volumes that contribute to a shadow copy set 
     *     appear in the system or a time-out occurs. If some disk or volume devices fail to appear in this window, the 
     *     requester will be told that only some of the shadow copies were imported by VSS returning 
     *     <b>VSS_S_SOME_SNAPSHOTS_NOT_IMPORTED</b> to the requester. The requester will also receive the 
     *     same error from VSS if the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> 
     *     structures received from the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-gettargetluns">GetTargetLuns</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-fillinluninfo">IVssHardwareSnapshotProvider::FillInLunInfo</a> methods do not match.
     * 
     * This method cannot be used to map shadow copy LUNs as read-only.
     * @param {Integer} lLunCount Number of LUNs that contribute to this shadow copy set.
     * @param {Pointer<VDS_LUN_INFORMATION>} rgSourceLuns Pointer to an array of <i>iLunCount</i><a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures, one for each LUN 
     *       that is part of the shadow copy set to be imported.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. The provider must report an event in the application event log 
     *         providing the user with information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-locateluns
     */
    LocateLuns(lLunCount, rgSourceLuns) {
        result := ComCall(7, this, "int", lLunCount, "ptr", rgSourceLuns, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called whenever VSS determines that a shadow copy LUN contains no interesting data.
     * @remarks
     * Hardware providers should delete a shadow copy and reclaim the LUN if and only if  
     *     <b>OnLunEmpty</b> is being called. A 
     *     hardware shadow copy may be used as the backup media itself, therefore the LUNs should be treated with the same 
     *     care the storage array treats LUNs used for regular disks. Reclaiming LUNs outside of processing for 
     *     <b>OnLunEmpty</b> should be limited to 
     *     emergency or an administrator performing explicit action manually.
     * 
     * In the case of persistent shadow copies, the requester deletes the shadow copy when it is no longer needed. In the case of 
     *     nonpersistent auto-release shadow copies, the VSS service deletes the shadow copy when the requester calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> object. In the case of nonpersistent non-auto-release shadow copies, the VSS service deletes the shadow copy when the computer is restarted. In all cases, the VSS service calls the provider's  <b>OnLunEmpty</b> method as needed for each shadow copy 
     *     LUN.
     * 
     * Note that <b>OnLunEmpty</b> is 
     *     called on a best effort basis. VSS invokes the method only when the LUN is guaranteed to be empty. There may be 
     *     many cases where the LUN is empty but VSS is unable to detect this due to errors or external circumstances. In 
     *     this case, the user should use storage management software to clear this state.
     * 
     * Some examples:
     * 
     * <ul>
     * <li>When a shadow copy LUN is moved to a different host but not actually transported or imported through VSS, 
     *       then that LUN appears as any other LUN, and volumes can be simply deleted without any  notification of VSS.</li>
     * <li>A crash or unexpected reboot in the middle of a shadow copy creation.</li>
     * <li>A canceled import.</li>
     * </ul>
     * @param {Pointer<Integer>} wszDeviceName Device corresponding to the LUN that contains the shadow copy to be deleted.
     * @param {Pointer<VDS_LUN_INFORMATION>} pInformation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure 
     *       containing information about the LUN containing the shadow copy to be deleted.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. The provider must report an event in the application event log 
     *         providing the user with information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-onlunempty
     */
    OnLunEmpty(wszDeviceName, pInformation) {
        wszDeviceNameMarshal := wszDeviceName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, wszDeviceNameMarshal, wszDeviceName, "ptr", pInformation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

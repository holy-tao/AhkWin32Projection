#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains the methods used by VSS to map volumes to LUNs, discover LUNs created during the shadow copy process, and transport LUNs on a SAN.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivsshardwaresnapshotprovider
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
     * @param {Integer} lLunCount Count of LUNs contributing to this shadow copy volume.
     * @param {Integer} lContext Shadow copy context for the current shadow copy set as enumerated by 
     *       a bitmask of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> enumeration. If the <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b> flag is set, the shadow copy set is transportable.
     * @param {Pointer<Pointer<Integer>>} rgwszDevices List of devices corresponding to the LUNs to be shadow copied.
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInformation Array of <i>lLunCount</i><a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures, one for each LUN 
     *       contributing to this shadow copy volume.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value. If all devices are supported for shadow copy, the 
     *       provider should store a <b>TRUE</b> value at the location pointed to by 
     *       <i>pbIsSupported</i>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotprovider-arelunssupported
     */
    AreLunsSupported(lLunCount, lContext, rgwszDevices, pLunInformation) {
        rgwszDevicesMarshal := rgwszDevices is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", lLunCount, "int", lContext, rgwszDevicesMarshal, rgwszDevices, "ptr", pLunInformation, "int*", &pbIsSupported := 0, "HRESULT")
        return pbIsSupported
    }

    /**
     * Prompts the hardware provider to indicate whether it supports the corresponding disk device and correct any omissions in the VDS_LUN_INFORMATION structure.
     * @param {Pointer<Integer>} wszDeviceName Device corresponding to the shadow copy LUN.
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure for the 
     *       shadow copy LUN.
     * @returns {BOOL} The provider must return <b>TRUE</b> in the location pointed to by the 
     *       <i>pbIsSupported</i> parameter if the device is supported.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotprovider-fillinluninfo
     */
    FillInLunInfo(wszDeviceName, pLunInfo) {
        wszDeviceNameMarshal := wszDeviceName is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, wszDeviceNameMarshal, wszDeviceName, "ptr", pLunInfo, "int*", &pbIsSupported := 0, "HRESULT")
        return pbIsSupported
    }

    /**
     * Called for each shadow copy that is added to the shadow copy set.
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
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, lContext, lLunCount, rgDeviceNames, rgLunInformation) {
        rgDeviceNamesMarshal := rgDeviceNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", SnapshotSetId, "ptr", SnapshotId, "int", lContext, "int", lLunCount, rgDeviceNamesMarshal, rgDeviceNames, "ptr", rgLunInformation, "HRESULT")
        return result
    }

    /**
     * Prompts the hardware provider to initialize the VDS_LUN_INFORMATION structures for the newly created shadow copy LUNs.
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
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotprovider-gettargetluns
     */
    GetTargetLuns(lLunCount, rgDeviceNames, rgSourceLuns, rgDestinationLuns) {
        rgDeviceNamesMarshal := rgDeviceNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "int", lLunCount, rgDeviceNamesMarshal, rgDeviceNames, "ptr", rgSourceLuns, "ptr", rgDestinationLuns, "HRESULT")
        return result
    }

    /**
     * Prompts the hardware provider to make the shadow copy LUNs visible to the computer.
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
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotprovider-locateluns
     */
    LocateLuns(lLunCount, rgSourceLuns) {
        result := ComCall(7, this, "int", lLunCount, "ptr", rgSourceLuns, "HRESULT")
        return result
    }

    /**
     * Called whenever VSS determines that a shadow copy LUN contains no interesting data.
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
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotprovider-onlunempty
     */
    OnLunEmpty(wszDeviceName, pInformation) {
        wszDeviceNameMarshal := wszDeviceName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, wszDeviceNameMarshal, wszDeviceName, "ptr", pInformation, "HRESULT")
        return result
    }
}

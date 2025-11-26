#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssAsync.ahk
#Include .\IVssHardwareSnapshotProvider.ahk

/**
 * Provides an additional method used by VSS to notify hardware providers of LUN state changes.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivsshardwaresnapshotproviderex
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssHardwareSnapshotProviderEx extends IVssHardwareSnapshotProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssHardwareSnapshotProviderEx
     * @type {Guid}
     */
    static IID => Guid("{7f5ba925-cdb1-4d11-a71f-339eb7e709fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProviderCapabilities", "OnLunStateChange", "ResyncLuns", "OnReuseLuns"]

    /**
     * This method is reserved for future use.
     * @returns {Integer} This parameter is reserved for future use.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-getprovidercapabilities
     */
    GetProviderCapabilities() {
        result := ComCall(9, this, "uint*", &pllOriginalCapabilityMask := 0, "HRESULT")
        return pllOriginalCapabilityMask
    }

    /**
     * The VSS service calls this method to notify hardware providers of a LUN state change.
     * @param {Pointer<VDS_LUN_INFORMATION>} pSnapshotLuns A pointer to an array of <i>dwCount</i> <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures,  one for each LUN that contributes to the shadow copy volume.
     * @param {Pointer<VDS_LUN_INFORMATION>} pOriginalLuns A pointer to an array of <i>dwCount</i> <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures,  one for each LUN that contributes to the original volume.
     * @param {Integer} dwCount Number of elements in the <i>pSnapshotLuns</i> array. This is also the number of elements in the <i>pOriginalLuns</i> array.
     * @param {Integer} dwFlags A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_hardware_options">_VSS_HARDWARE_OPTIONS</a> flags that provide information about the state change that the shadow copy LUNs have undergone. The following table describes how each flag is used in this parameter.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_ONLUNSTATECHANGE_NOTIFY_READ_WRITE"></a><a id="vss_onlunstatechange_notify_read_write"></a><dl>
     * <dt><b>VSS_ONLUNSTATECHANGE_NOTIFY_READ_WRITE</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy LUN will be converted permanently to read-write.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_ONLUNSTATECHANGE_NOTIFY_LUN_PRE_RECOVERY"></a><a id="vss_onlunstatechange_notify_lun_pre_recovery"></a><dl>
     * <dt><b>VSS_ONLUNSTATECHANGE_NOTIFY_LUN_PRE_RECOVERY</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy LUNs will be converted temporarily to read-write and are about to undergo TxF recovery or VSS auto-recovery.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_ONLUNSTATECHANGE_NOTIFY_LUN_POST_RECOVERY"></a><a id="vss_onlunstatechange_notify_lun_post_recovery"></a><dl>
     * <dt><b>VSS_ONLUNSTATECHANGE_NOTIFY_LUN_POST_RECOVERY</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy LUNs have just undergone TxF recovery or VSS auto-recovery and have been converted back to read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_ONLUNSTATECHANGE_DO_MASK_LUNS"></a><a id="vss_onlunstatechange_do_mask_luns"></a><dl>
     * <dt><b>VSS_ONLUNSTATECHANGE_DO_MASK_LUNS</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy LUNs must be masked from the current machine but not deleted.
     * 
     * </td>
     * </tr>
     * </table>
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
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onlunstatechange
     */
    OnLunStateChange(pSnapshotLuns, pOriginalLuns, dwCount, dwFlags) {
        result := ComCall(10, this, "ptr", pSnapshotLuns, "ptr", pOriginalLuns, "uint", dwCount, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The VSS service calls this method to notify hardware providers that a LUN resynchronization is needed.
     * @param {Pointer<VDS_LUN_INFORMATION>} pSourceLuns A pointer to an array of <i>dwCount</i> <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures,  one for each LUN that contributes to the shadow copy volume.
     * @param {Pointer<VDS_LUN_INFORMATION>} pTargetLuns A pointer to an array of <i>dwCount</i> <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structures,  one for each LUN that contributes to the destination volume where the contents of the shadow copy volume are to be copied.
     * @param {Integer} dwCount The number of elements in the <i>pSourceLuns</i> array. This is also the number of elements in the <i>pTargetLuns</i> array.
     * @returns {IVssAsync} A pointer to a location that will receive an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface pointer that can be used to retrieve the status of the resynchronization operation. When the operation is complete, the caller must release the interface pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-resyncluns
     */
    ResyncLuns(pSourceLuns, pTargetLuns, dwCount) {
        result := ComCall(11, this, "ptr", pSourceLuns, "ptr", pTargetLuns, "uint", dwCount, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * This method is reserved for future use.
     * @param {Pointer<VDS_LUN_INFORMATION>} pSnapshotLuns This parameter is reserved for future use.
     * @param {Pointer<VDS_LUN_INFORMATION>} pOriginalLuns This parameter is reserved for future use.
     * @param {Integer} dwCount This parameter is reserved for future use.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onreuseluns
     */
    OnReuseLuns(pSnapshotLuns, pOriginalLuns, dwCount) {
        result := ComCall(12, this, "ptr", pSnapshotLuns, "ptr", pOriginalLuns, "uint", dwCount, "HRESULT")
        return result
    }
}

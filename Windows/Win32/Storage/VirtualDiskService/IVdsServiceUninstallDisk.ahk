#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to uninstall basic and dynamic disks.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsserviceuninstalldisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceUninstallDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsServiceUninstallDisk
     * @type {Guid}
     */
    static IID => Guid("{b6b22da8-f903-4be7-b492-c09d875ac9da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDiskIdFromLunInfo", "UninstallDisks"]

    /**
     * Retrieves the VDS object ID for the disk that corresponds to a specified LUN.
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure that has been initialized by a VDS hardware provider.
     * @returns {Guid} The address of a VDS object ID variable passed in by the caller. This variable receives the GUID for the disk that corresponds to the LUN.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceuninstalldisk-getdiskidfromluninfo
     */
    GetDiskIdFromLunInfo(pLunInfo) {
        pDiskId := Guid()
        result := ComCall(3, this, "ptr", pLunInfo, "ptr", pDiskId, "HRESULT")
        return pDiskId
    }

    /**
     * Uninstalls a set of disks.
     * @param {Pointer<Guid>} pDiskIdArray Address of a buffer containing an array of VDS object IDs, one for each disk to be uninstalled. Each ID in 
     *       the array must be unique.
     * @param {Integer} ulCount Number of VDS object IDs in the buffer that the <i>pDiskIdArray</i> parameter points 
     *       to.
     * @param {BOOLEAN} bForce If <b>TRUE</b>, VDS uninstalls the disks even if the volumes cannot be locked or 
     *       dismounted.
     * @param {Pointer<Integer>} pbReboot Address of a <b>BOOLEAN</b> variable that receives <b>TRUE</b> if 
     *       the user must restart the computer to complete the uninstall process.
     * @param {Pointer<HRESULT>} pResults The address of a caller-allocated array of <b>HRESULT</b> values. The number of elements in the array is pointed to by the 
     *       <i>pDiskIdArray</i> parameter. The first element of this array corresponds to the 
     *       first element in the <i>pDiskIdArray</i>, and so on. If any of the disks fails to initialize 
     *       properly, the specific error code for the failure is returned in the corresponding element of this array.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as 
     *       <b>E_INVALIDARG</b> or <b>E_OUTOFMEMORY</b>, and 
     *       <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It 
     *       can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a> using 
     *       the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate 
     *       from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is 
     *       being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disks were successfully uninstalled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method returned a warning or error code for one or more disks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_S_UNABLE_TO_GET_GPT_ATTRIBUTES</b></dt>
     * <dt>0x0004245BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disks were successfully uninstalled, but the GUID partition table (GPT) attributes could not be 
     *         retrieved for one or more disks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INTERNAL_ERROR</b></dt>
     * <dt>0x80042448L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS encountered an internal error. Check the event log for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_MISSING_DISK</b></dt>
     * <dt>0x80042454L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more disks were missing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NO_DISK_PATHNAME</b></dt>
     * <dt>0x8004270FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path could not be retrieved for one or more disks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NO_VOLUME_PATHNAME</b></dt>
     * <dt>0x80042711L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path could not be retrieved for one or more volumes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified VDS object IDs correspond to disks that are no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042405L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified VDS object IDs correspond to disks that do not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_OUTOFSYNC</b></dt>
     * <dt>0x80042712L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider's cache is not in sync with the driver cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceuninstalldisk-uninstalldisks
     */
    UninstallDisks(pDiskIdArray, ulCount, bForce, pbReboot, pResults) {
        pbRebootMarshal := pbReboot is VarRef ? "char*" : "ptr"
        pResultsMarshal := pResults is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pDiskIdArray, "uint", ulCount, "char", bForce, pbRebootMarshal, pbReboot, pResultsMarshal, pResults, "HRESULT")
        return result
    }
}

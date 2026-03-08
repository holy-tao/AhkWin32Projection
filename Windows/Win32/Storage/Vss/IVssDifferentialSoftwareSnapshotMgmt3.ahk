#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VSS_VOLUME_PROTECTION_INFO.ahk
#Include .\IVssDifferentialSoftwareSnapshotMgmt2.ahk

/**
 * Defines methods that allow applications to use the shadow copy protection feature of VSS.
 * @remarks
 * An application with administrator privilege can use the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-setvolumeprotectlevel">SetVolumeProtectLevel</a> method to specify a shadow copy protection level for a volume and the separate volume that contains its shadow copy storage area. The same protection level should be set for both volumes. The possible protection levels are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_level">VSS_PROTECTION_LEVEL</a> enumeration.
 * 
 * When a volume protection fault occurs, the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-getvolumeprotectlevel">GetVolumeProtectLevel</a> method for the volume to identify the cause of the fault.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nn-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssDifferentialSoftwareSnapshotMgmt3 extends IVssDifferentialSoftwareSnapshotMgmt2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssDifferentialSoftwareSnapshotMgmt3
     * @type {Guid}
     */
    static IID => Guid("{383f7e71-a4c5-401f-b27f-f826289f8458}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVolumeProtectLevel", "GetVolumeProtectLevel", "ClearVolumeProtectFault", "DeleteUnusedDiffAreas", "QuerySnapshotDeltaBitmap"]

    /**
     * Sets the shadow copy protection level for an original volume or a shadow copy storage area volume.
     * @remarks
     * The <b>SetVolumeProtectLevel</b> method checks the current shadow copy protection level of the volume. If the volume is in a faulted state and VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME is specified for the <i>protectionLevel</i> parameter, <b>SetVolumeProtectLevel</b> dismounts the volume before setting the protection level.
     * 
     * If the current protection level of the volume is the same as the value of the <i>protectionLevel</i> parameter, <b>SetVolumeProtectLevel</b> does nothing.
     * 
     * If the value of the <i>protectionLevel</i> parameter is <b>VSS_PROTECTION_LEVEL_SNAPSHOT</b>, requesters must set shadow copy storage area (diff area) associations using the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-adddiffarea">IVssDifferentialSoftwareSnapshotMgmt::AddDiffArea</a> method.
     * @param {Pointer<Integer>} pwszVolumeName The name of the volume.
     *       This parameter is required and cannot be <b>NULL</b>.
     * 
     * The name must be in one of the following formats and must include a trailing backslash (\\):
     *        <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\ 
     *          </li>
     * <li>A volume GUID path in the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @param {Integer} protectionLevel A value from the  <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_level">VSS_PROTECTION_LEVEL</a> enumeration that specifies the shadow copy protection level.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy protection level was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not an administrator.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * <dt>0x80000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider for the volume does not support shadow copy protection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An expected provider error has occurred. The error code is logged in the event log. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-setvolumeprotectlevel
     */
    SetVolumeProtectLevel(pwszVolumeName, protectionLevel) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, pwszVolumeNameMarshal, pwszVolumeName, "int", protectionLevel, "HRESULT")
        return result
    }

    /**
     * Gets the shadow copy protection level and status for the specified volume.
     * @remarks
     * The <b>GetVolumeProtectLevel</b> method gets information about the volume's current protection level. If the volume is in a faulted state, the <b>m_protectionFault</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_volume_protection_info">VSS_VOLUME_PROTECTION_INFO</a> structure contains the current protection fault, and the <b>m_failureStatus</b> member contains  the reason why the volume is in a faulted state. If the volume is not in a faulted state, the <b>m_protectionFault</b> and <b>m_failureStatus</b> members will be zero.
     * 
     * If the value of the <i>protectionLevel</i> parameter is <b>VSS_PROTECTION_LEVEL_SNAPSHOT</b>, requesters must set shadow copy storage area (diff area) associations using the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-adddiffarea">IVssDifferentialSoftwareSnapshotMgmt::AddDiffArea</a> method.
     * @param {Pointer<Integer>} pwszVolumeName The name of the volume.
     *       This parameter is required and cannot be <b>NULL</b>.
     * 
     * The name must be in one of the following formats and must include a trailing backslash (\\):
     *        <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example,   D:\ 
     *          </li>
     * <li>A volume GUID path in the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @returns {VSS_VOLUME_PROTECTION_INFO} The address of a caller-allocated buffer that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_volume_protection_info">VSS_VOLUME_PROTECTION_INFO</a> structure containing information about the volume's shadow copy protection level.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-getvolumeprotectlevel
     */
    GetVolumeProtectLevel(pwszVolumeName) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        protectionLevel := VSS_VOLUME_PROTECTION_INFO()
        result := ComCall(14, this, pwszVolumeNameMarshal, pwszVolumeName, "ptr", protectionLevel, "HRESULT")
        return protectionLevel
    }

    /**
     * Clears the protection fault state for the specified volume.
     * @remarks
     * The <b>ClearVolumeProtectFault</b> method dismounts the volume and resets the volume's protection fault member to <b>FALSE</b> to allow normal I/O to continue on the volume. If the volume is not in a faulted state, this method does nothing.
     * @param {Pointer<Integer>} pwszVolumeName The name of the volume.
     *       This parameter is required and cannot be <b>NULL</b>.
     * 
     * The name must be in one of the following formats and must include a trailing backslash (\\):
     *        <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\ 
     *          </li>
     * <li>A volume GUID path in the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protection fault state was cleared successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not an administrator.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * <dt>0x80000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider for the volume does not support shadow copy protection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An expected provider error has occurred. The error code is logged in the event log. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-clearvolumeprotectfault
     */
    ClearVolumeProtectFault(pwszVolumeName) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, pwszVolumeNameMarshal, pwszVolumeName, "HRESULT")
        return result
    }

    /**
     * Deletes all shadow copy storage areas (also called diff areas) on the specified volume that are not in use.
     * @remarks
     * Unused shadow copy storage area files are found on storage area volumes when the associated original volume is offline due to a protection fault. In certain cases, the original volume may be permanently lost, and calling the <b>DeleteUnusedDiffAreas</b> method is the only way to recover the abandoned storage area space.
     * @param {Pointer<Integer>} pwszDiffAreaVolumeName The name of the volume.
     *       This parameter is required and cannot be <b>NULL</b>.
     * 
     * The name must be in one of the following formats and must include a trailing backslash (\\):
     *        <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example,  D:\ 
     *          </li>
     * <li>A volume GUID path in the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy storage areas were successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not an administrator.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * <dt>0x80000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider for the volume does not support shadow copy protection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An expected provider error has occurred. The error code is logged in the event log. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-deleteunuseddiffareas
     */
    DeleteUnusedDiffAreas(pwszDiffAreaVolumeName) {
        pwszDiffAreaVolumeNameMarshal := pwszDiffAreaVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(16, this, pwszDiffAreaVolumeNameMarshal, pwszDiffAreaVolumeName, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use. (IVssDifferentialSoftwareSnapshotMgmt3.QuerySnapshotDeltaBitmap)
     * @param {Guid} idSnapshotOlder 
     * @param {Guid} idSnapshotYounger 
     * @param {Pointer<Integer>} pcBlockSizePerBit 
     * @param {Pointer<Integer>} pcBitmapLength 
     * @param {Pointer<Pointer<Integer>>} ppbBitmap 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-querysnapshotdeltabitmap
     */
    QuerySnapshotDeltaBitmap(idSnapshotOlder, idSnapshotYounger, pcBlockSizePerBit, pcBitmapLength, ppbBitmap) {
        pcBlockSizePerBitMarshal := pcBlockSizePerBit is VarRef ? "uint*" : "ptr"
        pcBitmapLengthMarshal := pcBitmapLength is VarRef ? "uint*" : "ptr"
        ppbBitmapMarshal := ppbBitmap is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", idSnapshotOlder, "ptr", idSnapshotYounger, pcBlockSizePerBitMarshal, pcBlockSizePerBit, pcBitmapLengthMarshal, pcBitmapLength, ppbBitmapMarshal, ppbBitmap, "HRESULT")
        return result
    }
}

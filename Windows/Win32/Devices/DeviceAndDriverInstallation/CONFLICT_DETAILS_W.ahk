#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CM_CDFLAGS.ahk" { CM_CDFLAGS }
#Import ".\CM_CDMASK.ahk" { CM_CDMASK }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CONFLICT_DETAILS structure is used as a parameter to the CM_Get_Resource_Conflict_Details function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The cfgmgr32.h header defines CONFLICT_DETAILS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-conflict_details_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 */
export default struct CONFLICT_DETAILS_W {
    #StructPack 8

    /**
     * Size, in bytes, of the CONFLICT_DETAILS structure.
     */
    CD_ulSize : UInt32

    /**
     * One or more bit flags supplied by the caller of <b>CM_Get_Resource_Conflict_Details</b>. The bit flags are described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * CM_CDMASK_DEVINST
     * 
     * </td>
     * <td>
     * If set, <b>CM_Get_Resource_Conflict_Details</b> supplies a value for the <b>CD_dnDevInst</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CM_CDMASK_RESDES
     * 
     * </td>
     * <td>
     * <i>Not used.</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CM_CDMASK_FLAGS
     * 
     * </td>
     * <td>
     * If set, <b>CM_Get_Resource_Conflict_Details</b> supplies a value for the <b>CD_ulFlags</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CM_CDMASK_DESCRIPTION
     * 
     * </td>
     * <td>
     * If set, <b>CM_Get_Resource_Conflict_Details</b> supplies a value for the <b>CD_szDescription</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     */
    CD_ulMask : CM_CDMASK

    /**
     * If CM_CDMASK_DEVINST is set in <b>CD_ulMask</b>, this member will receive a handle to a device instance that has conflicting resources. If a handle is not obtainable, the member receives -1.
     */
    CD_dnDevInst : UInt32

    /**
     * <i>Not used.</i>
     */
    CD_rdResDes : IntPtr

    /**
     * If CM_CDMASK_FLAGS is set in <b>CD_ulMask</b>, this member can receive bit flags listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * CM_CDFLAGS_DRIVER
     * 
     * </td>
     * <td>
     * If set, the string contained in the <b>CD_szDescription</b> member represents a driver name instead of a device name, and <b>CD_dnDevInst</b> is -1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CM_CDFLAGS_ROOT_OWNED
     * 
     * </td>
     * <td>
     * If set, the conflicting resources are owned by the root device (that is, the HAL), and <b>CD_dnDevInst</b> is -1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CM_CDFLAGS_RESERVED
     * 
     * </td>
     * <td>
     * If set, the owner of the conflicting resources cannot be determined, and <b>CD_dnDevInst</b> is -1.
     * 
     * </td>
     * </tr>
     * </table>
     */
    CD_ulFlags : CM_CDFLAGS

    /**
     * If CM_CDMASK_DESCRIPTION is set in <b>CD_ulMask</b>, this member will receive a NULL-terminated text string representing a description of the device that owns the resources. If CM_CDFLAGS_DRIVER is set in <b>CD_ulFlags</b>, this string represents a driver name. If CM_CDFLAGS_ROOT_OWNED or CM_CDFLAGS_RESERVED is set, the string value is <b>NULL</b>.
     */
    CD_szDescription : WCHAR[260]

}

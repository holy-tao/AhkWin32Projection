#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CONFLICT_DETAILS structure is used as a parameter to the CM_Get_Resource_Conflict_Details function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The cfgmgr32.h header defines CONFLICT_DETAILS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-conflict_details_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class CONFLICT_DETAILS_A extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * Size, in bytes, of the CONFLICT_DETAILS structure.
     * @type {Integer}
     */
    CD_ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    CD_ulMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If CM_CDMASK_DEVINST is set in <b>CD_ulMask</b>, this member will receive a handle to a device instance that has conflicting resources. If a handle is not obtainable, the member receives -1.
     * @type {Integer}
     */
    CD_dnDevInst {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <i>Not used.</i>
     * @type {Pointer}
     */
    CD_rdResDes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    CD_ulFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If CM_CDMASK_DESCRIPTION is set in <b>CD_ulMask</b>, this member will receive a NULL-terminated text string representing a description of the device that owns the resources. If CM_CDFLAGS_DRIVER is set in <b>CD_ulFlags</b>, this string represents a driver name. If CM_CDFLAGS_ROOT_OWNED or CM_CDFLAGS_RESERVED is set, the string value is <b>NULL</b>.
     * @type {String}
     */
    CD_szDescription {
        get => StrGet(this.ptr + 28, 259, "UTF-8")
        set => StrPut(value, this.ptr + 28, 259, "UTF-8")
    }
}

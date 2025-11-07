#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains status information used by the SRSetRestorePoint function.
 * @remarks
 * 
 * The following table lists the status codes returned in the <b>nStatus</b> member. Note that all the status codes indicate failure except ERROR_SUCCESS.
 * 
 * <table>
 * <tr>
 * <th>Status Code</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>ERROR_SUCCESS</td>
 * <td>The call succeeded.</td>
 * </tr>
 * <tr>
 * <td>ERROR_BAD_ENVIRONMENT</td>
 * <td>The function was called in safe mode.</td>
 * </tr>
 * <tr>
 * <td>ERROR_DISK_FULL</td>
 * <td>System Restore is in standby mode because disk space is low.</td>
 * </tr>
 * <tr>
 * <td>ERROR_INTERNAL_ERROR</td>
 * <td>An internal error occurred.</td>
 * </tr>
 * <tr>
 * <td>ERROR_INVALID_DATA</td>
 * <td>The sequence number is invalid.</td>
 * </tr>
 * <tr>
 * <td>ERROR_SERVICE_DISABLED</td>
 * <td>System Restore is disabled.</td>
 * </tr>
 * <tr>
 * <td>ERROR_TIMEOUT</td>
 * <td>The call timed out due to a wait on a mutex for setting restore points.</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//srrestoreptapi/ns-srrestoreptapi-statemgrstatus
 * @namespace Windows.Win32.System.Restore
 * @version v4.0.30319
 */
class STATEMGRSTATUS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The status code. For a list of values, see the Remarks section.
     * @type {Integer}
     */
    nStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The sequence number of the restore point.
     * @type {Integer}
     */
    llSequenceNumber {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}

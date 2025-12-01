#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Input buffer passed with the FSCTL_SET_INTEGRITY_INFORMATION control code.
 * @remarks
 * If <b>FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF</b> is specified and the file is opened 
 *     with sharing permissions such that subsequent opens can succeed, it's possible for corrupt data to be read by an 
 *     application that did not specify <b>FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_set_integrity_information_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FSCTL_SET_INTEGRITY_INFORMATION_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the checksum algorithm.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKSUM_TYPE_NONE"></a><a id="checksum_type_none"></a><dl>
     * <dt><b>CHECKSUM_TYPE_NONE</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is not configured to use integrity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKSUM_TYPE_CRC64"></a><a id="checksum_type_crc64"></a><dl>
     * <dt><b>CHECKSUM_TYPE_CRC64</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory uses a CRC64 checksum to provide integrity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3–0xfffe</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for future use. Must not be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKSUM_TYPE_UNCHANGED"></a><a id="checksum_type_unchanged"></a><dl>
     * <dt><b>CHECKSUM_TYPE_UNCHANGED</b></dt>
     * <dt>0xffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The checksum algorithm is to remain the same.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ChecksumAlgorithm {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Must be 0
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Contains zero or more flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF"></a><a id="fsctl_integrity_flag_checksum_enforcement_off"></a><dl>
     * <dt><b>FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the checksum enforcement is disabled and reads will succeed even if the checksums do not match. 
     *         This flag is valid only if the file has an integrity algorithm  set. If there is no algorithm set or the 
     *         <b>CheckSum</b> member is set to <b>CHECKSUM_TYPE_NONE</b>, then the 
     *         operation fails with <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

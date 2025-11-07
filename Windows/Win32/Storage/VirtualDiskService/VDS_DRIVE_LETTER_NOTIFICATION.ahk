#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the details of drive-letter events.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive drive-letter events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_drive_letter_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_LETTER_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Determines the drive-letter event for which an application will be notified, as one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_DRIVE_LETTER_FREE"></a><a id="vds_nf_drive_letter_free"></a><dl>
     * <dt><b>VDS_NF_DRIVE_LETTER_FREE</b></dt>
     * <dt>201</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive letter of an uninitialized disk is free.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_NF_DRIVE_LETTER_ASSIGN"></a><a id="vds_nf_drive_letter_assign"></a><dl>
     * <dt><b>VDS_NF_DRIVE_LETTER_ASSIGN</b></dt>
     * <dt>202</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive letter of an uninitialized disk is assigned.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The drive letter that triggered the event.
     * @type {Integer}
     */
    wcLetter {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * The GUID of the volume to which the drive letter is assigned. If the drive letter is freed, the volume 
     *       identifier is GUID_NULL.
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

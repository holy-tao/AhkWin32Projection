#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains file remote protocol information.
 * @remarks
 * The <b>FILE_REMOTE_PROTOCOL_INFO</b> 
  *     structure is valid only for use with the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_remote_protocol_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_REMOTE_PROTOCOL_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Version of this structure. This member should be set to 2 if the communication is between 
     *      computers running Windows 8, Windows Server 2012, or later and 1 otherwise.
     * @type {Integer}
     */
    StructureVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Size of this structure. This member should be set to 
     *      <c>sizeof(FILE_REMOTE_PROTOCOL_INFO)</c>.
     * @type {Integer}
     */
    StructureSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Remote protocol (<b>WNNC_NET_*</b>) defined in Wnnc.h or 
     *      Ntifs.h.
     * @type {Integer}
     */
    Protocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Major version of the remote protocol.
     * @type {Integer}
     */
    ProtocolMajorVersion {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Minor version of the remote protocol.
     * @type {Integer}
     */
    ProtocolMinorVersion {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Revision of the remote protocol.
     * @type {Integer}
     */
    ProtocolRevision {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Should be set to zero. Do not use this member.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Remote protocol information. This member can be set to zero or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REMOTE_PROTOCOL_FLAG_LOOPBACK"></a><a id="remote_protocol_flag_loopback"></a><dl>
     * <dt><b>REMOTE_PROTOCOL_FLAG_LOOPBACK</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote protocol is using a loopback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REMOTE_PROTOCOL_FLAG_OFFLINE"></a><a id="remote_protocol_flag_offline"></a><dl>
     * <dt><b>REMOTE_PROTOCOL_FLAG_OFFLINE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote protocol is using an offline cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE"></a><a id="remote_protocol_info_flag_persistent_handle"></a><dl>
     * <dt><b>REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote protocol is using a persistent handle.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REMOTE_PROTOCOL_INFO_FLAG_PRIVACY"></a><a id="remote_protocol_info_flag_privacy"></a><dl>
     * <dt><b>REMOTE_PROTOCOL_INFO_FLAG_PRIVACY</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote protocol is using privacy. This is only supported if the 
     *         <b>StructureVersion</b> member is 2 or higher.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REMOTE_PROTOCOL_INFO_FLAG_INTEGRITY"></a><a id="remote_protocol_info_flag_integrity"></a><dl>
     * <dt><b>REMOTE_PROTOCOL_INFO_FLAG_INTEGRITY</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote protocol is using integrity so the data is signed. This is only supported if the 
     *         <b>StructureVersion</b> member is 2 or higher.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REMOTE_PROTOCOL_INFO_FLAG_MUTUAL_AUTH"></a><a id="remote_protocol_info_flag_mutual_auth"></a><dl>
     * <dt><b>REMOTE_PROTOCOL_INFO_FLAG_MUTUAL_AUTH</b></dt>
     * <dt>0x20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote protocol is using mutual authentication using Kerberos. This is only supported if the 
     *         <b>StructureVersion</b> member is 2 or higher.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Server {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ShareFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved12{
        get {
            if(!this.HasProp("__Reserved12ProxyArray"))
                this.__Reserved12ProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "uint")
            return this.__Reserved12ProxyArray
        }
    }
}

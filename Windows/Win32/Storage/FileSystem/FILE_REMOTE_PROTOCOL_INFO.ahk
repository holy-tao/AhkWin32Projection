#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains file remote protocol information.
 * @remarks
 * The <b>FILE_REMOTE_PROTOCOL_INFO</b> 
 *     structure is valid only for use with the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_remote_protocol_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_REMOTE_PROTOCOL_INFO {
    #StructPack 4


    struct _GenericReserved {
        Reserved : UInt32[8]

    }

    struct _ProtocolSpecific {

        struct _Smb2 {

            struct _Server {
                Capabilities : UInt32

            }

            struct _Share {
                Capabilities : UInt32

                ShareFlags : UInt32

            }

            Server : FILE_REMOTE_PROTOCOL_INFO._ProtocolSpecific._Smb2._Server

            Share : FILE_REMOTE_PROTOCOL_INFO._ProtocolSpecific._Smb2._Share

        }

        Smb2 : FILE_REMOTE_PROTOCOL_INFO._ProtocolSpecific._Smb2

        static __New() {
            DefineProp(this.Prototype, 'Reserved', { type: UInt32[16], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Version of this structure. This member should be set to 2 if the communication is between 
     *      computers running Windows 8, Windows Server 2012, or later and 1 otherwise.
     */
    StructureVersion : UInt16

    /**
     * Size of this structure. This member should be set to 
     *      <c>sizeof(FILE_REMOTE_PROTOCOL_INFO)</c>.
     */
    StructureSize : UInt16

    /**
     * Remote protocol (<b>WNNC_NET_*</b>) defined in Wnnc.h or 
     *      Ntifs.h.
     */
    Protocol : UInt32

    /**
     * Major version of the remote protocol.
     */
    ProtocolMajorVersion : UInt16

    /**
     * Minor version of the remote protocol.
     */
    ProtocolMinorVersion : UInt16

    /**
     * Revision of the remote protocol.
     */
    ProtocolRevision : UInt16

    /**
     * Should be set to zero. Do not use this member.
     */
    Reserved : UInt16

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
     */
    Flags : UInt32

    /**
     * Protocol-generic information structure.
     */
    GenericReserved : FILE_REMOTE_PROTOCOL_INFO._GenericReserved

    ProtocolSpecific : FILE_REMOTE_PROTOCOL_INFO._ProtocolSpecific

}

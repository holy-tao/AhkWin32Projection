#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the information about the base and latest versions of the specified file.
 * @remarks
 * The base version number remains the same for the lifetime of a handle. The latest version number increases as 
 *     long as a handle is still open to a file and a change is committed.  When the handle is closed, the version number 
 *     is reset to zero.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_get_transacted_version
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_GET_TRANSACTED_VERSION {
    #StructPack 4

    /**
     * The version of the file that this handle is opened with. This member can be one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_TRANSACTED_VERSION_NONTRANSACTED"></a><a id="txfs_transacted_version_nontransacted"></a><dl>
     * <dt><b>TXFS_TRANSACTED_VERSION_NONTRANSACTED</b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is not a transacted file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_TRANSACTED_VERSION_UNCOMMITTED"></a><a id="txfs_transacted_version_uncommitted"></a><dl>
     * <dt><b>TXFS_TRANSACTED_VERSION_UNCOMMITTED</b></dt>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file has been opened as a transacted writer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the handle has been opened as a transacted reader, the value returned for this member is a positive 
     *       integer that represents the version number of the file the handle is associated with.
     */
    ThisBaseVersion : UInt32

    /**
     * The most recently committed version of the file.
     */
    LatestVersion : UInt32

    /**
     * If the handle to a miniversion is open, this member contains the ID of the miniversion. If the handle is 
     *       not open, this member is zero (0).
     */
    ThisMiniVersion : UInt16

    /**
     * The first available miniversion for this file. If there are no miniversions, or they are not visible to 
     *       the transaction bound to the file handle, this field is zero (0).
     */
    FirstMiniVersion : UInt16

    /**
     * The latest available miniversion for this file. If there are no miniversions, or they are not visible to 
     *       the transaction bound to the file handle, this field is zero (0).
     */
    LatestMiniVersion : UInt16

}

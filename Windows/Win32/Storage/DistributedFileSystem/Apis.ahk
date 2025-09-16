#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DistributedFileSystem {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DFS_BASE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_INCONSISTENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_OFFLINE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_ONLINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_RESYNCHRONIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_STANDBY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_STATE_FORCE_SYNC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_FLAVORS => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_FLAVOR_UNUSED1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_FLAVOR_STANDALONE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_VOLUME_FLAVOR_AD_BLOB => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_STORAGE_FLAVOR_UNUSED2 => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_STORAGE_STATES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_STORAGE_STATE_OFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_STORAGE_STATE_ONLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_STORAGE_STATE_ACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_PROPERTY_FLAG_INSITE_REFERRALS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_PROPERTY_FLAG_ROOT_SCALABILITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_PROPERTY_FLAG_SITE_COSTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_PROPERTY_FLAG_TARGET_FAILBACK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_PROPERTY_FLAG_CLUSTER_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_PROPERTY_FLAG_ABDE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_ADD_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_RESTORE_VOLUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_DFS_SETDC_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NET_DFS_SETDC_TIMEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_DFS_SETDC_INITPKT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_SITE_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_MOVE_FLAG_REPLACE_IF_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_FORCE_REMOVE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DFS_GET_PKT_ENTRY_STATE => 401340
;@endregion Constants

;@region Methods
    /**
     * Creates a new Distributed File System (DFS) link or adds targets to an existing link in a DFS namespace.
     * @remarks
     * The DFS namespace must already exist. This function does not create a new DFS namespace.
     * 
     * The caller must have Administrator privilege on the DFS server. For more information about calling functions that require administrator privileges, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Use of the <b>DFS_ADD_VOLUME</b> flag is optional. If you specify 
     *     <b>DFS_ADD_VOLUME</b> and the link already exists, <b>NetDfsAdd</b> 
     *     fails. If you do not specify <b>DFS_ADD_VOLUME</b>, 
     *     <b>NetDfsAdd</b> creates the link, if required, and adds the target to the link. You 
     *     should specify this value when you need to determine when new links are created.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS link in a DFS namespace.
     * 
     * The string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts a stand-alone DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts a domain-based DFS namespace; <i>DomDfsname</i> is the name of 
     *        the domain-based DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * This parameter is required.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the link target server name. This parameter 
     *       is required.
     * @param {Pointer<PWSTR>} ShareName Pointer to a string that specifies the link target share name. This can also be a share name with a path relative to the share. For example, <i>share1\mydir1\mydir2</i>. This parameter is required.
     * @param {Pointer<PWSTR>} Comment Pointer to a string that specifies an optional comment associated with the DFS link. This parameter is 
     *       ignored when the function adds a target to an existing link.
     * @param {Integer} Flags This parameter can specify the following value, or you can specify zero for no flags.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsadd
     * @since windows6.0.6000
     */
    static NetDfsAdd(DfsEntryPath, ServerName, ShareName, Comment, Flags) {
        result := DllCall("NETAPI32.dll\NetDfsAdd", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "ptr", Comment, "uint", Flags, "uint")
        return result
    }

    /**
     * Creates a new stand-alone Distributed File System (DFS) namespace.
     * @remarks
     * The share specified by the <i>RootShare</i> parameter must already exist on the server that will host the new DFS root target. This function does not create a new share.
     * 
     * The caller must have Administrator privilege on the DFS server.  For more information about calling functions that require administrator privileges, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the name of the server that will host the new stand-alone DFS namespace. This parameter is required.
     * @param {Pointer<PWSTR>} RootShare Pointer to a string that specifies the name of the shared folder for the new stand-alone DFS namespace on the server that will host the namespace. This parameter is required.
     * @param {Pointer<PWSTR>} Comment Pointer to a string that contains an optional comment associated with the DFS namespace.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsaddstdroot
     * @since windows6.0.6000
     */
    static NetDfsAddStdRoot(ServerName, RootShare, Comment, Flags) {
        result := DllCall("NETAPI32.dll\NetDfsAddStdRoot", "ptr", ServerName, "ptr", RootShare, "ptr", Comment, "uint", Flags, "uint")
        return result
    }

    /**
     * Deletes a stand-alone Distributed File System (DFS) namespace.
     * @remarks
     * The caller must have Administrator privilege on the DFS server. For more information about calling functions that require administrator privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the DFS root target server name of the stand-alone DFS namespace to be removed. This parameter is required.
     * @param {Pointer<PWSTR>} RootShare Pointer to a string that specifies the DFS root target share name of the stand-alone DFS namespace to be removed. This parameter is required.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsremovestdroot
     * @since windows6.0.6000
     */
    static NetDfsRemoveStdRoot(ServerName, RootShare) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("NETAPI32.dll\NetDfsRemoveStdRoot", "ptr", ServerName, "ptr", RootShare, "uint", Flags, "uint")
        return result
    }

    /**
     * Creates a new domain-based Distributed File System (DFS) namespace. If the namespace already exists, the function adds the specified root target to it.
     * @remarks
     * The share specified by the <i>RootShare</i> parameter must already exist on the server that will host the new DFS root target. This function does not create a new share.
     * 
     * The caller must have permission to update the DFS container in the directory service and must have Administrator privilege on the DFS host (root) server.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the name of the server that will host the new DFS root target. This value cannot be an IP address. This parameter is required.
     * @param {Pointer<PWSTR>} RootShare Pointer to a string that specifies the name of the shared folder on the server that will host the new DFS root target. This parameter is required.
     * @param {Pointer<PWSTR>} FtDfsName Pointer to a string that specifies the name of the new or existing domain-based DFS namespace. This parameter is required. For compatibility reasons, it should specify the same string as the <i>RootShare</i> parameter.
     * @param {Pointer<PWSTR>} Comment Pointer to a string that contains an optional comment associated with the DFS namespace.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsaddftroot
     * @since windows6.0.6000
     */
    static NetDfsAddFtRoot(ServerName, RootShare, FtDfsName, Comment, Flags) {
        result := DllCall("NETAPI32.dll\NetDfsAddFtRoot", "ptr", ServerName, "ptr", RootShare, "ptr", FtDfsName, "ptr", Comment, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes the specified root target from a domain-based Distributed File System (DFS) namespace.
     * @remarks
     * The root target server must be available and accessible; otherwise, the call to the <b>NetDfsRemoveFtRoot</b> function will fail.
     * 
     * The caller must have permission to update the DFS container in the directory service and must have Administrator privilege on the DFS host (root) server.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the server name of the root target to be removed. The server must host the root of a domain-based DFS namespace. This parameter is required.
     * @param {Pointer<PWSTR>} RootShare Pointer to a string that specifies the name of the DFS root target share to be removed. This parameter is required.
     * @param {Pointer<PWSTR>} FtDfsName Pointer to a string that specifies the name of the domain-based DFS namespace from which to remove the root target. This parameter is required. Typically, it is the same as the <i>RootShare</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsremoveftroot
     * @since windows6.0.6000
     */
    static NetDfsRemoveFtRoot(ServerName, RootShare, FtDfsName) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("NETAPI32.dll\NetDfsRemoveFtRoot", "ptr", ServerName, "ptr", RootShare, "ptr", FtDfsName, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes the specified root target from a domain-based Distributed File System (DFS) namespace, even if the root target server is offline.
     * @remarks
     * The caller must have permission to update the DFS container in the directory service and must have Administrator privilege on the DFS host (root) server.
     * 
     * The <b>NetDfsRemoveFtRootForced</b> function forcibly removes a domain-based DFS root target from a DFS namespace.  It is used to delete a domain-based DFS namespace when the root target servers of the namespace are no longer available (for example, because they have been decommissioned).
     * 
     * Because  the DFS root target is removed by contacting the primary domain controller (PDC) and not by removing the DFS root target server, <b>NetDfsRemoveFtRootForced</b> does not update the registry of the root target server. Under normal circumstances, you can remove the root target from a DFS domain root by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/nf-lmdfs-netdfsremoveftroot">NetDfsRemoveFtRoot</a> function.
     * @param {Pointer<PWSTR>} DomainName Pointer to a string that specifies the name of the Active Directory domain that contains the domain-based DFS namespace to be removed. This parameter is required.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the name of the DFS root target server to be removed. The server must host a root of the domain-based DFS namespace. This parameter is required.
     * @param {Pointer<PWSTR>} RootShare Pointer to a string that specifies the name of the DFS root target share to be removed. This parameter is required.
     * @param {Pointer<PWSTR>} FtDfsName Pointer to a string that specifies the name of the domain-based DFS namespace from which to remove the root target. This parameter is required. Typically, it is the same as the <i>RootShare</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsremoveftrootforced
     * @since windows6.0.6000
     */
    static NetDfsRemoveFtRootForced(DomainName, ServerName, RootShare, FtDfsName) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("NETAPI32.dll\NetDfsRemoveFtRootForced", "ptr", DomainName, "ptr", ServerName, "ptr", RootShare, "ptr", FtDfsName, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes a Distributed File System (DFS) link or a specific link target of a DFS link in a DFS namespace. When removing a specific link target, the link itself is removed if the last link target of the link is removed.
     * @remarks
     * The caller must have Administrator privilege on the DFS server. For more information about calling functions 
     *     that require administrator privileges, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * When you call <b>NetDfsRemove</b> to remove a target from a 
     *     link, you must specify the same target server name in the <i>ServerName</i> parameter that you 
     *     specified when you created the link. For example, if you specified the target server's DNS name when you added the 
     *     target to the link, you must specify the same DNS name when you remove the link. You cannot specify the NetBIOS 
     *     name.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of the DFS link.
     * 
     * The string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ShareName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ShareName</i> is the name of the root target server that hosts the stand-alone 
     *        DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS 
     *        namespace; <i>DomDfsname</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * This parameter is required.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the server name of the link target. For more information, see the 
     *       following Remarks section. Set this parameter to <b>NULL</b> if the link and all link targets 
     *       are to be removed.
     * @param {Pointer<PWSTR>} ShareName Pointer to a string that specifies the share name of the link target. Set this parameter to 
     *       <b>NULL</b> if the link and all link targets are to be removed.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsremove
     * @since windows6.0.6000
     */
    static NetDfsRemove(DfsEntryPath, ServerName, ShareName) {
        result := DllCall("NETAPI32.dll\NetDfsRemove", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint")
        return result
    }

    /**
     * Enumerates the Distributed File System (DFS) namespaces hosted on a server or DFS links of a namespace hosted by a server.
     * @remarks
     * No special group membership is required for using the 
     * <b>NetDfsEnum</b> function.
     * 
     * Call the 
     * <b>NetDfsEnum</b> function with the <i>ResumeHandle</i> parameter set to zero to begin the enumeration. To continue the enumeration operation, call this function with the <i>ResumeHandle</i> returned by the previous call to 
     * <b>NetDfsEnum</b>. If this function does not return <b>ERROR_NO_MORE_ITEMS</b>, subsequent calls to this API will return the remaining links. Once <b>ERROR_NO_MORE_ITEMS</b> is returned, all available DFS links have been retrieved.
     * 
     * The 
     * <b>NetDfsEnum</b> function allocates the memory required for the information structure buffer. If you specify an amount in the <i>PrefMaxLen</i> parameter, it restricts the memory that the function returns. However, the actual size of the memory that the 
     * <b>NetDfsEnum</b> function allocates can be greater than the amount you specify. For additional information see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * 
     * Due to the possibility of concurrent updates to the DFS namespace, the caller should not assume completeness or uniqueness of the results returned when resuming an enumeration operation.
     * @param {Pointer<PWSTR>} DfsName Pointer to a string that specifies the Universal Naming Convention (UNC) path of the DFS root or link.
     * 
     * When you specify information level 200 
     *        (<a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_200">DFS_INFO_200</a>), this parameter is the name of a 
     *        domain. When you specify information level 300 
     *        (<a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_300">DFS_INFO_300</a>), this parameter is the name of a 
     *        server.
     * 
     * For all other levels, the string can be in one of the following four forms:
     * 
     * <i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * <i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone 
     *        DFS namespace; <i>Dfsname</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The string can also be of the following forms:
     * 
     * <i>DomainName</i>&#92;<i>DomainName\DomDfsName</i>
     * 
     * or
     * 
     * <i>DomainName</i>&#92;<i>DomDfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS root; 
     *        <i>DomDfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * You can precede the string with backslashes (\\), but they are not required. This parameter is required.
     * @param {Integer} Level 
     * @param {Integer} PrefMaxLen Specifies the number of bytes that should be returned by this function in the information structure buffer. 
     *       If this parameter is <b>MAX_PREFERRED_LENGTH</b>, the function allocates the amount of memory required for the data. 
     *       For more information, see the following Remarks section. This parameter is ignored if you specify level 200 or 
     *       level 300.
     * @param {Pointer<Byte>} Buffer Pointer to a buffer that receives the requested information structures. The format of this data depends on the value of the <i>Level</i> parameter. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @param {Pointer<UInt32>} EntriesRead Pointer to a value that receives the actual number of entries returned in the response.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a value that contains a handle to be used for continuing an enumeration when more data is available than can be returned in a single call to this function. The handle should be zero on the first call and left unchanged for subsequent calls.  For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If no more entries are available to be enumerated, the return value is <b>ERROR_NO_MORE_ITEMS</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsenum
     * @since windows6.0.6000
     */
    static NetDfsEnum(DfsName, Level, PrefMaxLen, Buffer, EntriesRead, ResumeHandle) {
        result := DllCall("NETAPI32.dll\NetDfsEnum", "ptr", DfsName, "uint", Level, "uint", PrefMaxLen, "ptr", Buffer, "ptr", EntriesRead, "ptr", ResumeHandle, "uint")
        return result
    }

    /**
     * Retrieves information about a specified Distributed File System (DFS) root or link in a DFS namespace.
     * @remarks
     * No special group membership is required for using the 
     *     <b>NetDfsGetInfo</b> function.
     * 
     * An application calling the <b>NetDfsGetInfo</b> function may 
     *     indirectly cause the local DFS Namespace server servicing the function call to perform a full synchronization of 
     *     the related namespace metadata from the PDC emulator master for that domain. This full synchronization could 
     *     happen even when root scalability mode is configured for that namespace. In order to avoid this side-effect, if 
     *     the intent is to only retrieve the physical UNC pathname used by a specific DFSN client machine corresponding a 
     *     given DFS namespace path, then one alternative is to use the WDK API 
     *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/nf-ntifs-ntqueryinformationfile">ZwQueryInformationFile</a>, passing 
     *     <b>FileNetworkPhysicalNameInformation</b> as the 
     *     <i>FileInformationClass</i> parameter and passing the address of a caller-allocated 
     *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntifs/ns-ntifs-_file_network_physical_name_information">FILE_NETWORK_PHYSICAL_NAME_INFORMATION</a> 
     *     structure as the <i>FileInformation</i> parameter. Please see the WDK for more information on 
     *     calling WDK APIs.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone 
     *        DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS 
     *        namespace; <i>DomDfsname</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * For a root, the string can be in one of two forms:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>
     * 
     * where the values of the names are the same as those described previously.
     * 
     * This parameter is required.
     * @param {Pointer<PWSTR>} ServerName This parameter is currently ignored and should be <b>NULL</b>.
     * @param {Pointer<PWSTR>} ShareName This parameter is currently ignored and should be <b>NULL</b>.
     * @param {Integer} Level 
     * @param {Pointer<Byte>} Buffer Pointer to the address of a buffer that receives the requested information structures. The format of this 
     *       data depends on the value of the <i>Level</i> parameter. This buffer is allocated by the 
     *       system and must be freed using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, 
     *       see 
     *       <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> 
     *       and 
     *       <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsgetinfo
     * @since windows6.0.6000
     */
    static NetDfsGetInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer) {
        result := DllCall("NETAPI32.dll\NetDfsGetInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Sets or modifies information about a specific Distributed File System (DFS) root, root target, link, or link target.
     * @remarks
     * The caller must have Administrator privilege on the DFS server. For more information about calling functions 
     *     that require administrator privileges, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * If you specify both the <i>ServerName</i> and <i>ShareName</i> 
     *     parameters, the <b>NetDfsSetInfo</b> function sets or modifies information specific to 
     *     that root target or link target. If the parameters are <b>NULL</b>, the function sets or 
     *     modifies information that is specific to the DFS namespace root or the DFS link instead of a specific DFS root 
     *     target or link target.
     * 
     * Because only one comment and one time-out can be set for a DFS root or link, the 
     *     <i>ServerName</i> and <i>ShareName</i>  parameters are ignored for 
     *     information levels 100 and 102. These parameters are required for level 101.
     * 
     * For information level 101, the <b>DFS_VOLUME_STATE_RESYNCHRONIZE</b> and <b>DFS_VOLUME_STATE_STANDBY</b> state values can be 
     *      set as follows for a specific domain-based DFS root when there is more than one DFS root target for the DFS 
     *      namespace:
     * 
     * The <i>DfsEntryPath</i> parameter specifies the domain-based DFS namespace, and the 
     *       <i>ServerName</i> and <i>ShareName</i> parameters taken together specify 
     *       the DFS root target on which the set-information operation is to be performed.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone 
     *        DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS 
     *        namespace; <i>DomDfsname</i> is the name of the DFS namespace; and 
     *        <i>link_path</i>  is a DFS link.
     * 
     * For a root, the string can be in one of two forms:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>
     * 
     * where the values of the names are the same as those described previously.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the DFS link target server name. This parameter is optional. For more 
     *       information, see the Remarks section.
     * @param {Pointer<PWSTR>} ShareName Pointer to a string that specifies the DFS link target share name. This may also be a share name with a 
     *       path relative to the share.  For example, "share1\mydir1\mydir2". This parameter is optional. For more 
     *       information, see the Remarks section.
     * @param {Integer} Level 
     * @param {Pointer<Byte>} Buffer Pointer to a buffer that specifies the data. The format of this data depends on the value of the 
     *       <i>Level</i> parameter. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfssetinfo
     * @since windows6.0.6000
     */
    static NetDfsSetInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer) {
        result := DllCall("NETAPI32.dll\NetDfsSetInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Retrieves information about a Distributed File System (DFS) root or link from the cache maintained by the DFS client.
     * @remarks
     * No special group membership is required for using the 
     * <b>NetDfsGetClientInfo</b> function.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace; <i>DomDfsname</i> is the name of the DFS namespace; and <i>link_path</i> is a DFS link.
     * 
     * For a root, the string can be in one of two forms:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>
     * 
     * where the values of the names are the same as those described previously.
     * 
     * This parameter is required.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the name of the DFS root target or link target server. This parameter is optional.
     * @param {Pointer<PWSTR>} ShareName Pointer to a string that specifies the name of the share corresponding to the DFS root target or link target. This parameter is optional.
     * @param {Integer} Level 
     * @param {Pointer<Byte>} Buffer Pointer to the address of a buffer that receives the requested information. This buffer is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffer-lengths">Network Management Function Buffer Lengths</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsgetclientinfo
     * @since windows6.0.6000
     */
    static NetDfsGetClientInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer) {
        result := DllCall("NETAPI32.dll\NetDfsGetClientInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Modifies information about a Distributed File System (DFS) root or link in the cache maintained by the DFS client.
     * @remarks
     * The caller must have Administrator privilege on the DFS server. For more information about calling functions that require administrator privileges, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Setting the time-out to zero may not immediately delete the local cached copy of the DFS link, because threads may be referencing the entry.
     * 
     * Because there is only one time-out on a DFS link, the <i>ServerName</i> and <i>ShareName</i> parameters are ignored for level 102.
     * 
     * The <b>DFS_STORAGE_STATE_ONLINE</b> and <b>DFS_STORAGE_STATE_OFFLINE</b> bits will be ignored. The <b>DFS_STORAGE_STATE_ACTIVE</b> bit is valid only if no files are open to the active computer.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace; <i>DomDfsname</i> is the name of the DFS namespace; and <i>link_path</i> is a DFS link.
     * 
     * For a root, the string can be in one of two forms:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>
     * 
     * where the values of the names are the same as those described previously.
     * 
     * This parameter is required.
     * @param {Pointer<PWSTR>} ServerName Pointer to a string that specifies the DFS link target server name. This parameter is optional. For more information, see the Remarks section.
     * @param {Pointer<PWSTR>} ShareName Pointer to a string that specifies the DFS link target share name. This parameter is optional. For additional information, see the following Remarks section.
     * @param {Integer} Level 
     * @param {Pointer<Byte>} Buffer Pointer to a buffer that contains the information to be set. The format of this information depends on the value of the <i>Level</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/NetMgmt/network-management-function-buffers">Network Management Function Buffers</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfssetclientinfo
     * @since windows6.0.6000
     */
    static NetDfsSetClientInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer) {
        result := DllCall("NETAPI32.dll\NetDfsSetClientInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Renames or moves a DFS link.
     * @remarks
     * The <b>NetDfsMove</b> function conveniently moves a link from an 
     *      old name to a new one. In the past, it has been necessary to perform the non-trivial action of deleting an 
     *      incorrect or old link and creating a new one, which becomes cumbersome when the link has a significant number of 
     *      targets or has per-target properties (like priority) set. It is also common for administrators to regularly 
     *      rename or move links.
     * 
     * DFS paths supplied to <b>NetDfsMove</b> can be either an actual 
     *      DFS link or just a DFS link path prefix. Wildcards are not allowed and only absolute paths can be specified. 
     *      Relative paths and special path name syntax (such as "." or "..") are not allowed.
     * 
     * When a DFS link path prefix is specified instead of a complete DFS path, the move operation is performed on all 
     *      DFS links which contain that prefix. Therefore, a single call to 
     *      <b>NetDfsMove</b> can "move" multiple links. However, the path 
     *      prefix must resolve to at least one valid DFS link or the move operation will fail.
     * 
     * The following examples demonstrate different move operations and the results.
     * 
     * <ol>
     * <li>
     * <ul>
     * <li>Old path: \\MyDfsServer\MyDfsShare\dir1\dir2\link1</li>
     * <li>New path: \\MyDfsServer\MyDfsShare\dir1\dir2\link2</li>
     * </ul>
     * After the move, \\MyDfsServer\MyDfsShare\dir1\dir2\link1 is replaced with 
     *        \\MyDfsServer\MyDfsShare\dir1\dir2\link2.
     * 
     * </li>
     * <li>
     * <ul>
     * <li>Old path: \\MyDfsServer\MyDfsShare\dir1\dir2\link1</li>
     * <li>New path: \\MyDfsServer\MyDfsShare\dir3\dir4\dir5\link2</li>
     * </ul>
     * After the move, \\MyDfsServer\MyDfsShare\dir1\dir2\link1 is replaced with 
     *        \\MyDfsServer\MyDfsShare\dir3\dir4\dir5\link2. Note that both the leaf and non-leaf components 
     *        have been renamed, and that the number of components in the new path has changed.
     * 
     * </li>
     * <li>
     * <ul>
     * <li>Old path: \\MyDfsServer\MyDfsShare\dir1</li>
     * <li>New path: \\MyDfsServer\MyDfsShare\dir3</li>
     * </ul>
     * After the move, all links prefixed with \\MyDfsServer\MyDfsShare\dir1 have that prefix replaced 
     *        with \\MyDfsServer\MyDfsShare\dir3. Therefore, 
     *        \\MyDfsServer\MyDfsShare\dir1\dir2\link1 and \\MyDfsServer\MyDfsShare\dir1\dir2\link2 
     *        are now \\MyDfsServer\MyDfsShare\dir3\dir2\link1 and 
     *        \\MyDfsServer\MyDfsShare\dir3\dir2\link1, respectively.
     * 
     * </li>
     * <li>
     * <ul>
     * <li>Old path: \\MyDfsServer\MyDfsShare\dir1</li>
     * <li>New path: \\MyDfsServer\MyDfsShare</li>
     * </ul>
     * After the move, all links prefixed with \\MyDfsServer\MyDfsShare\dir1 have that prefix replaced 
     *        with \\MyDfsServer\MyDfsShare. Therefore, \\MyDfsServer\MyDfsShare\dir1\dir2\link1 
     *        and \\MyDfsServer\MyDfsShare\dir1\dir2\link2 are now 
     *        \\MyDfsServer\MyDfsShare\dir2\link1 and \\MyDfsServer\MyDfsShare\dir2\link1, 
     *        respectively.
     * 
     * </li>
     * </ol>
     * If the new path already has an existing entry, <b>DFS_MOVE_FLAG_REPLACE_IF_EXISTS</b> must 
     *      be specified if the new path should overwrite the old one. When this flag is set, the collided path is deleted 
     *      and replaced by the new link. Note that any operation which can potentially result in DFS links that completely 
     *      overlap will fail, whether or not <b>DFS_MOVE_FLAG_REPLACE_IF_EXISTS</b> is specified. For 
     *      example:
     * 
     * <ul>
     * <li>Existing links: \\MyDfsServer\MyDfsShare\dir1\link1, 
     *       \\MyDfsServer\MyDfsShare\link3</li>
     * <li>Old path:\\MyDfsServer\MyDfsShare\dir1</li>
     * <li>New path: \\MyDfsServer\MyDfsShare\link3</li>
     * </ul>
     * If the move operation were allowed to succeed, the result would be two completely overlapping links: 
     *      \\MyDfsServer\MyDfsShare\link3\link1 and \\MyDfsServer\MyDfsShare\link3. Therefore, the 
     *      move operation must fail.
     * 
     * With domain-based DFS servers, the move operation is atomic; that is, either the whole operation is performed 
     *      or it fails. However, with stand-alone DFS servers, the move operation is not guaranteed to be atomic. In this 
     *      situation, a failure may result in a partially completed move operation and will require cleanup on behalf of the 
     *      calling application.
     * 
     * When the move operation succeeds, it is guaranteed that the DFS metadata was successfully modified. This does 
     *      not guarantee that the DFS links were actually created on the root targets or that DFS links can be created on 
     *      the root targets' storage.
     * @param {Pointer<PWSTR>} OldDfsEntryPath Pointer to a string that specifies the source path for the move operation. This value must be a DFS link or 
     *      the path prefix of any DFS link in the DFS namespace.
     * @param {Pointer<PWSTR>} NewDfsEntryPath Pointer to a string that specifies the destination path for the move operation. This value must be a path or 
     *      a DFS link in the same DFS namespace.
     * @param {Integer} Flags A set of flags that describe actions to take when moving the link.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsmove
     * @since windows6.0.6000
     */
    static NetDfsMove(OldDfsEntryPath, NewDfsEntryPath, Flags) {
        result := DllCall("NETAPI32.dll\NetDfsMove", "ptr", OldDfsEntryPath, "ptr", NewDfsEntryPath, "uint", Flags, "uint")
        return result
    }

    /**
     * Creates a domain-based or stand-alone DFS namespace or adds a new root target to an existing domain-based namespace.
     * @remarks
     * The caller must have Administrator privilege on the DFS server.
     * 
     * To determine the DFS metadata version that can be specified in the <i>MajorVersion</i> parameter, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/nf-lmdfs-netdfsgetsupportednamespaceversion">NetDfsGetSupportedNamespaceVersion</a> function.
     * 
     * The following table shows which parameter values you should specify, according to the desired result.
     * 
     * <table>
     * <tr>
     * <th><i>pDfsPath</i> parameter</th>
     * <th><i>pTargetPath</i> parameter</th>
     * <th><i>MajorVersion</i> parameter</th>
     * <th>Result</th>
     * </tr>
     * <tr>
     * <td>&#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i></td>
     * <td>&#92;&#92;<i>ServerName</i>&#92;<i>RootShare</i></td>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * Create a Windows 2000 mode domain-based DFS namespace or add a new root target to an existing one.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>&#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i></td>
     * <td>&#92;&#92;<i>ServerName</i>&#92;<i>RootShare</i></td>
     * <td>
     * 2
     * 
     * </td>
     * <td>
     * Create a  Windows Server 2008 mode domain-based DFS namespace or add a new root target to an existing one.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>&#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i></td>
     * <td>&#92;&#92;<i>ServerName</i>&#92;<i>RootShare</i></td>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Add a new root target to an existing Windows 2000 mode or Windows Server 2008 mode domain-based DFS namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>&#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i></td>
     * <td><b>NULL</b></td>
     * <td>
     * Must be 1.
     * 
     * </td>
     * <td>
     * Create a stand-alone DFS namespace.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} pDfsPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace.
     * 
     * For a stand-alone DFS namespace, this string should be in the following format:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * where <i>ServerName</i> is the name of the server that will host the new DFS root target and <i>DfsName</i> is the name of the DFS namespace.
     * 
     * For a domain-based DFS namespace, this string should be in the following format:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace and <i>DomDfsName</i> is the name of the new or existing domain-based DFS namespace. For compatibility reasons, <i>DomDfsName</i> should be the same as the name of the shared folder on the server that will host the new DFS root target.
     * @param {Pointer<PWSTR>} pTargetPath Pointer to a null-terminated Unicode string that specifies the UNC path of a DFS root target for the DFS namespace that is specified in the <i>pDfsPath</i> parameter.
     * 
     * For a stand-alone DFS namespace, this parameter must be <b>NULL</b>. For a domain-based DFS namespace, the string should be in the following format:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>RootShare</i>
     * 
     * where <i>ServerName</i> is the name of the server that will host the new DFS root target and <i>RootShare</i> is the name of the shared folder on the server. The share specified by <i>RootShare</i> must already exist on the server that will host the new DFS root target. This function does not create a new share.
     * @param {Integer} MajorVersion Specifies the DFS metadata version for the namespace.
     * 
     * <div class="alert"><b>Note</b>  This parameter is only for use when creating a new namespace.</div>
     * <div> </div>
     * If a stand-alone DFS namespace is being created, this parameter must be set to 1.
     * 
     * If a domain-based namespace is being created, this parameter should be set as follows:
     * 
     * <ul>
     * <li>Set it to 1 to specify Windows 2000 mode.</li>
     * <li>Set it to 2 or higher to specify  Windows Server 2008 mode.</li>
     * </ul>
     * If a new root target is being added to an existing domain-based DFS namespace, this parameter must be set to zero.
     * @param {Pointer<PWSTR>} pComment Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the domain is not at the required functional level for the specified <i>MajorVersion</i>, the return value is <b>ERROR_DS_INCOMPATIBLE</b>. This return value applies only to domain roots and a <i>MajorVersion</i> of 2.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsaddroottarget
     * @since windows6.0.6000
     */
    static NetDfsAddRootTarget(pDfsPath, pTargetPath, MajorVersion, pComment, Flags) {
        result := DllCall("NETAPI32.dll\NetDfsAddRootTarget", "ptr", pDfsPath, "ptr", pTargetPath, "uint", MajorVersion, "ptr", pComment, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes a DFS root target from a domain-based DFS namespace. If the root target is the last root target in the DFS namespace, this function removes the DFS namespace. This function can also be used to remove a stand-alone DFS namespace.
     * @remarks
     * The caller must have Administrator privileges on the DFS server.
     * 
     * The following list shows which parameter values you should specify, according to the desired result.
     * 
     * <table>
     * <tr>
     * <th><i>pDfsPath</i> parameter</th>
     * <th><i>pTargetPath</i> parameter</th>
     * <th>Result</th>
     * </tr>
     * <tr>
     * <td>&#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i></td>
     * <td>&#92;&#92;<i>ServerName</i>&#92;<i>RootShare</i></td>
     * <td>Delete a Windows 2000 mode or Windows Server 2008 mode domain-based DFS root target. If the 
     *        target is the last root target for the DFS namespace, the function also deletes the DFS namespace.</td>
     * </tr>
     * <tr>
     * <td>&#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i></td>
     * <td><b>NULL</b></td>
     * <td>Delete a stand-alone DFS namespace.</td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} pDfsPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace.
     * 
     * For a stand-alone DFS namespace, this string should be in the following form:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * where <i>ServerName</i> is the name of the server that hosts the DFS root target and 
     *        <i>DfsName</i> is the name of the DFS namespace.
     * 
     * For a domain-based DFS namespace, this string should be in the following form:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS 
     *        namespace and <i>DomDfsName</i> is the name of the DFS namespace.
     * @param {Pointer<PWSTR>} pTargetPath Pointer to a null-terminated Unicode string that specifies the UNC path of a DFS root target for the DFS 
     *        namespace that is specified in the <i>pDfsPath</i> parameter.
     * 
     * For a stand-alone DFS namespace, this parameter must be <b>NULL</b>. For a domain-based 
     *        DFS namespace, the string should be in the following form:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>RootShare</i>
     * 
     * where <i>ServerName</i> is the name of the server that hosts the DFS root target and 
     *        <i>RootShare</i> is the name of the folder on the server.
     * @param {Integer} Flags A flag that specifies the type of removal operation. For a stand-alone DFS namespace, this parameter must 
     *       be zero. For a domain-based DFS namespace, it can be zero or the following value. If it is zero, this indicates 
     *       a normal removal operation.
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsremoveroottarget
     * @since windows6.0.6000
     */
    static NetDfsRemoveRootTarget(pDfsPath, pTargetPath, Flags) {
        result := DllCall("NETAPI32.dll\NetDfsRemoveRootTarget", "ptr", pDfsPath, "ptr", pTargetPath, "uint", Flags, "uint")
        return result
    }

    /**
     * Retrieves the security descriptor for the root object of the specified DFS namespace.
     * @remarks
     * For domain-based DFS namespaces, the security descriptor is retrieved from the "CN=<i>DomDfsName</i>,CN=DFS-Configuration,CN=System,DC=<i>domain</i>" object in Active Directory from the primary domain controller (PDC) of the domain that hosts the DFS namespace, where <i>DomDfsName</i> is the name of the domain-based DFS namespace and &lt;domain&gt; is the distinguished name of the Active Directory domain that hosts the namespace.
     * 
     * For stand-alone roots, the security descriptor is retrieved from the object specified by the <b>HKLM</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Dfs</b>&#92;<b>Standalone</b>&#92;<b>&lt;root-name&gt;</b> registry entry.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace root.
     * 
     * The string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone DFS namespace and <i>Dfsname</i> is the name of the DFS namespace.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace and <i>DomDfsName</i> is the name of the DFS namespace.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to retrieve from the root object.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures that contain the security items requested in the <i>SecurityInformation</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This buffer must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor The size of the buffer that <i>ppSecurityDescriptor</i> points to, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsgetsecurity
     * @since windows6.0.6000
     */
    static NetDfsGetSecurity(DfsEntryPath, SecurityInformation, ppSecurityDescriptor, lpcbSecurityDescriptor) {
        result := DllCall("NETAPI32.dll\NetDfsGetSecurity", "ptr", DfsEntryPath, "uint", SecurityInformation, "ptr", ppSecurityDescriptor, "ptr", lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security descriptor for the root object of the specified DFS namespace.
     * @remarks
     * For domain-based DFS namespaces, the security descriptor is set on the  "CN=<i>DomDfsName</i>,CN=DFS-Configuration,CN=System,DC=<i>domain</i>" object in Active Directory at the primary domain controller (PDC) of the domain that hosts the DFS namespace, where &lt;<i>DomDfsName</i>&gt; is the name of the domain-based DFS namespace and &lt;domain&gt; is the distinguished name of the Active Directory domain that hosts the namespace.
     * 
     * For stand-alone roots, the security descriptor is set on the object specified by the <b>HKLM</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Dfs</b>&#92;<b>Standalone</b>&#92;<b>&lt;root-name&gt;</b> registry entry.
     * @param {Pointer<PWSTR>} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace root.
     * 
     * The string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone DFS namespace and <i>Dfsname</i> is the name of the DFS namespace.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsName</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace and <i>DomDfsName</i> is the name of the DFS namespace.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to set on the root object.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} pSecurityDescriptor <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security descriptor to set as specified in the <i>SecurityInformation</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfssetsecurity
     * @since windows6.0.6000
     */
    static NetDfsSetSecurity(DfsEntryPath, SecurityInformation, pSecurityDescriptor) {
        result := DllCall("NETAPI32.dll\NetDfsSetSecurity", "ptr", DfsEntryPath, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves the security descriptor for the container object of the specified stand-alone DFS namespace.
     * @remarks
     * The security descriptor is retrieved from the object specified by the <b>HKLM</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Dfs</b>&#92;<b>Standalone</b> key in the registry of the server specified in the <i>MachineName</i> parameter.
     * @param {Pointer<PWSTR>} MachineName Pointer to a string that specifies the name of the server that hosts the stand-alone DFS namespace.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to retrieve.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures that contain the security items requested in the <i>SecurityInformation</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This buffer must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor The size of the buffer that <i>ppSecurityDescriptor</i> points to, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsgetstdcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsGetStdContainerSecurity(MachineName, SecurityInformation, ppSecurityDescriptor, lpcbSecurityDescriptor) {
        result := DllCall("NETAPI32.dll\NetDfsGetStdContainerSecurity", "ptr", MachineName, "uint", SecurityInformation, "ptr", ppSecurityDescriptor, "ptr", lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security descriptor for the container object of the specified stand-alone DFS namespace.
     * @remarks
     * The security descriptor is set for the object specified by the <b>HKLM</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Dfs</b>&#92;<b>Standalone</b> key in the registry of the server specified in the <i>MachineName</i> parameter.
     * @param {Pointer<PWSTR>} MachineName The name of the stand-alone DFS root's host machine. Pointer to a string that specifies the name of the server that hosts the stand-alone DFS namespace.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to set on the root object.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} pSecurityDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security attributes to set as specified in the <i>SecurityInformation</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfssetstdcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsSetStdContainerSecurity(MachineName, SecurityInformation, pSecurityDescriptor) {
        result := DllCall("NETAPI32.dll\NetDfsSetStdContainerSecurity", "ptr", MachineName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves the security descriptor of the container object for the domain-based DFS namespaces in the specified Active Directory domain.
     * @remarks
     * The security descriptor is retrieved from the "CN=DFS-Configuration,CN=System,DC=<i>domain</i>" object in Active Directory from the primary domain controller (PDC) of the domain specified in the <i>DomainName</i> parameter, where <i>domain</i> is the distinguished name of the domain specified in the <i>DomainName</i> parameter.
     * @param {Pointer<PWSTR>} DomainName Pointer to a string that specifies the Active Directory domain name.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to retrieve.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Pointer to a list <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures that contain the security items requested in the <i>SecurityInformation</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This buffer must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor The size of <i>ppSecurityDescriptor</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsgetftcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsGetFtContainerSecurity(DomainName, SecurityInformation, ppSecurityDescriptor, lpcbSecurityDescriptor) {
        result := DllCall("NETAPI32.dll\NetDfsGetFtContainerSecurity", "ptr", DomainName, "uint", SecurityInformation, "ptr", ppSecurityDescriptor, "ptr", lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security descriptor of the container object for the domain-based DFS namespaces in the specified Active Directory domain.
     * @remarks
     * The security descriptor is set on the "CN=DFS-Configuration,CN=System,DC=<i>domain</i>" object in Active Directory from the primary domain controller (PDC) of the domain specified in the <i>DomainName</i> parameter, where &lt;domain&gt; is the distinguished name of the domain specified in the <i>DomainName</i> parameter.
     * @param {Pointer<PWSTR>} DomainName Pointer to a string that specifies the Active Directory domain name.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to set.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} pSecurityDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security attributes to set as specified in the <i>SecurityInformation</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfssetftcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsSetFtContainerSecurity(DomainName, SecurityInformation, pSecurityDescriptor) {
        result := DllCall("NETAPI32.dll\NetDfsSetFtContainerSecurity", "ptr", DomainName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Determines the supported metadata version number.
     * @remarks
     * This function is useful in determining an appropriate version number to pass to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/nf-lmdfs-netdfsaddroottarget">NetDfsAddRootTarget</a> function.
     * 
     * The version number of the DFS metadata that can be used for a new DFS namespace depends on the following:
     * 
     * <ul>
     * <li>For domain-based DFS namespaces, the version supported by the DFS metadata schema that is being used in the AD DS domain.</li>
     * <li>The version supported by the server that is to host the DFS root target.</li>
     * </ul>
     * Thus, the maximum DFS metadata version number that can be used for a new DFS namespace is the minimum of the version supported by the AD DS domain and the version supported by the server. This maximum can be determined by calling the <b>NetDfsGetSupportedNamespaceVersion</b> function with the <i>pName</i> parameter set to the name of the server that is to host the new DFS root target and the <i>Origin</i> parameter set to <b>DFS_NAMESPACE_VERSION_ORIGIN_COMBINED</b>.
     * @param {Integer} Origin A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/ne-lmdfs-dfs_namespace_version_origin">DFS_NAMESPACE_VERSION_ORIGIN</a> enumeration value that specifies the origin of the DFS namespace version.
     * @param {Pointer<PWSTR>} pName A string that specifies the server name or domain name. If the value of the <i>Origin</i> parameter is <b>DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN</b>, this string must be an AD DS domain name. Otherwise, it must be a server name. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<DFS_SUPPORTED_NAMESPACE_VERSION_INFO>} ppVersionInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_supported_namespace_version_info">DFS_SUPPORTED_NAMESPACE_VERSION_INFO</a> structure that receives the DFS metadata version number.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmdfs/nf-lmdfs-netdfsgetsupportednamespaceversion
     * @since windows6.0.6000
     */
    static NetDfsGetSupportedNamespaceVersion(Origin, pName, ppVersionInfo) {
        result := DllCall("NETAPI32.dll\NetDfsGetSupportedNamespaceVersion", "int", Origin, "ptr", pName, "ptr", ppVersionInfo, "uint")
        return result
    }

;@endregion Methods
}

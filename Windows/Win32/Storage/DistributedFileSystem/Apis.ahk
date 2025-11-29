#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS link in a DFS namespace.
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
     * @param {PWSTR} ServerName Pointer to a string that specifies the link target server name. This parameter 
     *       is required.
     * @param {PWSTR} ShareName Pointer to a string that specifies the link target share name. This can also be a share name with a path relative to the share. For example, <i>share1\mydir1\mydir2</i>. This parameter is required.
     * @param {PWSTR} Comment Pointer to a string that specifies an optional comment associated with the DFS link. This parameter is 
     *       ignored when the function adds a target to an existing link.
     * @param {Integer} Flags This parameter can specify the following value, or you can specify zero for no flags.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *       <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsadd
     * @since windows6.0.6000
     */
    static NetDfsAdd(DfsEntryPath, ServerName, ShareName, Comment, Flags) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ShareName := ShareName is String ? StrPtr(ShareName) : ShareName
        Comment := Comment is String ? StrPtr(Comment) : Comment

        result := DllCall("NETAPI32.dll\NetDfsAdd", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "ptr", Comment, "uint", Flags, "uint")
        return result
    }

    /**
     * Creates a new stand-alone Distributed File System (DFS) namespace.
     * @param {PWSTR} ServerName Pointer to a string that specifies the name of the server that will host the new stand-alone DFS namespace. This parameter is required.
     * @param {PWSTR} RootShare Pointer to a string that specifies the name of the shared folder for the new stand-alone DFS namespace on the server that will host the namespace. This parameter is required.
     * @param {PWSTR} Comment Pointer to a string that contains an optional comment associated with the DFS namespace.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsaddstdroot
     * @since windows6.0.6000
     */
    static NetDfsAddStdRoot(ServerName, RootShare, Comment, Flags) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        RootShare := RootShare is String ? StrPtr(RootShare) : RootShare
        Comment := Comment is String ? StrPtr(Comment) : Comment

        result := DllCall("NETAPI32.dll\NetDfsAddStdRoot", "ptr", ServerName, "ptr", RootShare, "ptr", Comment, "uint", Flags, "uint")
        return result
    }

    /**
     * Deletes a stand-alone Distributed File System (DFS) namespace.
     * @param {PWSTR} ServerName Pointer to a string that specifies the DFS root target server name of the stand-alone DFS namespace to be removed. This parameter is required.
     * @param {PWSTR} RootShare Pointer to a string that specifies the DFS root target share name of the stand-alone DFS namespace to be removed. This parameter is required.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsremovestdroot
     * @since windows6.0.6000
     */
    static NetDfsRemoveStdRoot(ServerName, RootShare) {
        static Flags := 0 ;Reserved parameters must always be NULL

        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        RootShare := RootShare is String ? StrPtr(RootShare) : RootShare

        result := DllCall("NETAPI32.dll\NetDfsRemoveStdRoot", "ptr", ServerName, "ptr", RootShare, "uint", Flags, "uint")
        return result
    }

    /**
     * Creates a new domain-based Distributed File System (DFS) namespace. If the namespace already exists, the function adds the specified root target to it.
     * @param {PWSTR} ServerName Pointer to a string that specifies the name of the server that will host the new DFS root target. This value cannot be an IP address. This parameter is required.
     * @param {PWSTR} RootShare Pointer to a string that specifies the name of the shared folder on the server that will host the new DFS root target. This parameter is required.
     * @param {PWSTR} FtDfsName Pointer to a string that specifies the name of the new or existing domain-based DFS namespace. This parameter is required. For compatibility reasons, it should specify the same string as the <i>RootShare</i> parameter.
     * @param {PWSTR} Comment Pointer to a string that contains an optional comment associated with the DFS namespace.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsaddftroot
     * @since windows6.0.6000
     */
    static NetDfsAddFtRoot(ServerName, RootShare, FtDfsName, Comment, Flags) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        RootShare := RootShare is String ? StrPtr(RootShare) : RootShare
        FtDfsName := FtDfsName is String ? StrPtr(FtDfsName) : FtDfsName
        Comment := Comment is String ? StrPtr(Comment) : Comment

        result := DllCall("NETAPI32.dll\NetDfsAddFtRoot", "ptr", ServerName, "ptr", RootShare, "ptr", FtDfsName, "ptr", Comment, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes the specified root target from a domain-based Distributed File System (DFS) namespace.
     * @param {PWSTR} ServerName Pointer to a string that specifies the server name of the root target to be removed. The server must host the root of a domain-based DFS namespace. This parameter is required.
     * @param {PWSTR} RootShare Pointer to a string that specifies the name of the DFS root target share to be removed. This parameter is required.
     * @param {PWSTR} FtDfsName Pointer to a string that specifies the name of the domain-based DFS namespace from which to remove the root target. This parameter is required. Typically, it is the same as the <i>RootShare</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsremoveftroot
     * @since windows6.0.6000
     */
    static NetDfsRemoveFtRoot(ServerName, RootShare, FtDfsName) {
        static Flags := 0 ;Reserved parameters must always be NULL

        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        RootShare := RootShare is String ? StrPtr(RootShare) : RootShare
        FtDfsName := FtDfsName is String ? StrPtr(FtDfsName) : FtDfsName

        result := DllCall("NETAPI32.dll\NetDfsRemoveFtRoot", "ptr", ServerName, "ptr", RootShare, "ptr", FtDfsName, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes the specified root target from a domain-based Distributed File System (DFS) namespace, even if the root target server is offline.
     * @param {PWSTR} DomainName Pointer to a string that specifies the name of the Active Directory domain that contains the domain-based DFS namespace to be removed. This parameter is required.
     * @param {PWSTR} ServerName Pointer to a string that specifies the name of the DFS root target server to be removed. The server must host a root of the domain-based DFS namespace. This parameter is required.
     * @param {PWSTR} RootShare Pointer to a string that specifies the name of the DFS root target share to be removed. This parameter is required.
     * @param {PWSTR} FtDfsName Pointer to a string that specifies the name of the domain-based DFS namespace from which to remove the root target. This parameter is required. Typically, it is the same as the <i>RootShare</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsremoveftrootforced
     * @since windows6.0.6000
     */
    static NetDfsRemoveFtRootForced(DomainName, ServerName, RootShare, FtDfsName) {
        static Flags := 0 ;Reserved parameters must always be NULL

        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        RootShare := RootShare is String ? StrPtr(RootShare) : RootShare
        FtDfsName := FtDfsName is String ? StrPtr(FtDfsName) : FtDfsName

        result := DllCall("NETAPI32.dll\NetDfsRemoveFtRootForced", "ptr", DomainName, "ptr", ServerName, "ptr", RootShare, "ptr", FtDfsName, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes a Distributed File System (DFS) link or a specific link target of a DFS link in a DFS namespace. When removing a specific link target, the link itself is removed if the last link target of the link is removed.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of the DFS link.
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
     * @param {PWSTR} ServerName Pointer to a string that specifies the server name of the link target. For more information, see the 
     *       following Remarks section. Set this parameter to <b>NULL</b> if the link and all link targets 
     *       are to be removed.
     * @param {PWSTR} ShareName Pointer to a string that specifies the share name of the link target. Set this parameter to 
     *       <b>NULL</b> if the link and all link targets are to be removed.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsremove
     * @since windows6.0.6000
     */
    static NetDfsRemove(DfsEntryPath, ServerName, ShareName) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ShareName := ShareName is String ? StrPtr(ShareName) : ShareName

        result := DllCall("NETAPI32.dll\NetDfsRemove", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint")
        return result
    }

    /**
     * Enumerates the Distributed File System (DFS) namespaces hosted on a server or DFS links of a namespace hosted by a server.
     * @param {PWSTR} DfsName Pointer to a string that specifies the Universal Naming Convention (UNC) path of the DFS root or link.
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
     * @param {Pointer<Pointer<Integer>>} Buffer_R 
     * @param {Pointer<Integer>} EntriesRead Pointer to a value that receives the actual number of entries returned in the response.
     * @param {Pointer<Integer>} ResumeHandle Pointer to a value that contains a handle to be used for continuing an enumeration when more data is available than can be returned in a single call to this function. The handle should be zero on the first call and left unchanged for subsequent calls.  For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If no more entries are available to be enumerated, the return value is <b>ERROR_NO_MORE_ITEMS</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsenum
     * @since windows6.0.6000
     */
    static NetDfsEnum(DfsName, Level, PrefMaxLen, Buffer_R, EntriesRead, ResumeHandle) {
        DfsName := DfsName is String ? StrPtr(DfsName) : DfsName

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"
        EntriesReadMarshal := EntriesRead is VarRef ? "uint*" : "ptr"
        ResumeHandleMarshal := ResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsEnum", "ptr", DfsName, "uint", Level, "uint", PrefMaxLen, Buffer_RMarshal, Buffer_R, EntriesReadMarshal, EntriesRead, ResumeHandleMarshal, ResumeHandle, "uint")
        return result
    }

    /**
     * Retrieves information about a specified Distributed File System (DFS) root or link in a DFS namespace.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
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
     * @param {PWSTR} ServerName This parameter is currently ignored and should be <b>NULL</b>.
     * @param {PWSTR} ShareName This parameter is currently ignored and should be <b>NULL</b>.
     * @param {Integer} Level 
     * @param {Pointer<Pointer<Integer>>} Buffer_R 
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsgetinfo
     * @since windows6.0.6000
     */
    static NetDfsGetInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer_R) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ShareName := ShareName is String ? StrPtr(ShareName) : ShareName

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsGetInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, Buffer_RMarshal, Buffer_R, "uint")
        return result
    }

    /**
     * Sets or modifies information about a specific Distributed File System (DFS) root, root target, link, or link target.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
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
     * @param {PWSTR} ServerName Pointer to a string that specifies the DFS link target server name. This parameter is optional. For more 
     *       information, see the Remarks section.
     * @param {PWSTR} ShareName Pointer to a string that specifies the DFS link target share name. This may also be a share name with a 
     *       path relative to the share.  For example, "share1\mydir1\mydir2". This parameter is optional. For more 
     *       information, see the Remarks section.
     * @param {Integer} Level 
     * @param {Pointer<Integer>} Buffer_R 
     * @returns {Integer} If the function succeeds, the return value is NERR_Success.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfssetinfo
     * @since windows6.0.6000
     */
    static NetDfsSetInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer_R) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ShareName := ShareName is String ? StrPtr(ShareName) : ShareName

        Buffer_RMarshal := Buffer_R is VarRef ? "char*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsSetInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, Buffer_RMarshal, Buffer_R, "uint")
        return result
    }

    /**
     * Retrieves information about a Distributed File System (DFS) root or link from the cache maintained by the DFS client.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
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
     * @param {PWSTR} ServerName Pointer to a string that specifies the name of the DFS root target or link target server. This parameter is optional.
     * @param {PWSTR} ShareName Pointer to a string that specifies the name of the share corresponding to the DFS root target or link target. This parameter is optional.
     * @param {Integer} Level 
     * @param {Pointer<Pointer<Integer>>} Buffer_R 
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsgetclientinfo
     * @since windows6.0.6000
     */
    static NetDfsGetClientInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer_R) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ShareName := ShareName is String ? StrPtr(ShareName) : ShareName

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsGetClientInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, Buffer_RMarshal, Buffer_R, "uint")
        return result
    }

    /**
     * Modifies information about a Distributed File System (DFS) root or link in the cache maintained by the DFS client.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
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
     * @param {PWSTR} ServerName Pointer to a string that specifies the DFS link target server name. This parameter is optional. For more information, see the Remarks section.
     * @param {PWSTR} ShareName Pointer to a string that specifies the DFS link target share name. This parameter is optional. For additional information, see the following Remarks section.
     * @param {Integer} Level 
     * @param {Pointer<Integer>} Buffer_R 
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfssetclientinfo
     * @since windows6.0.6000
     */
    static NetDfsSetClientInfo(DfsEntryPath, ServerName, ShareName, Level, Buffer_R) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ShareName := ShareName is String ? StrPtr(ShareName) : ShareName

        Buffer_RMarshal := Buffer_R is VarRef ? "char*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsSetClientInfo", "ptr", DfsEntryPath, "ptr", ServerName, "ptr", ShareName, "uint", Level, Buffer_RMarshal, Buffer_R, "uint")
        return result
    }

    /**
     * Renames or moves a DFS link.
     * @param {PWSTR} OldDfsEntryPath Pointer to a string that specifies the source path for the move operation. This value must be a DFS link or 
     *      the path prefix of any DFS link in the DFS namespace.
     * @param {PWSTR} NewDfsEntryPath Pointer to a string that specifies the destination path for the move operation. This value must be a path or 
     *      a DFS link in the same DFS namespace.
     * @param {Integer} Flags A set of flags that describe actions to take when moving the link.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsmove
     * @since windows6.0.6000
     */
    static NetDfsMove(OldDfsEntryPath, NewDfsEntryPath, Flags) {
        OldDfsEntryPath := OldDfsEntryPath is String ? StrPtr(OldDfsEntryPath) : OldDfsEntryPath
        NewDfsEntryPath := NewDfsEntryPath is String ? StrPtr(NewDfsEntryPath) : NewDfsEntryPath

        result := DllCall("NETAPI32.dll\NetDfsMove", "ptr", OldDfsEntryPath, "ptr", NewDfsEntryPath, "uint", Flags, "uint")
        return result
    }

    /**
     * Creates a domain-based or stand-alone DFS namespace or adds a new root target to an existing domain-based namespace.
     * @param {PWSTR} pDfsPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace.
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
     * @param {PWSTR} pTargetPath Pointer to a null-terminated Unicode string that specifies the UNC path of a DFS root target for the DFS namespace that is specified in the <i>pDfsPath</i> parameter.
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
     * @param {PWSTR} pComment Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the domain is not at the required functional level for the specified <i>MajorVersion</i>, the return value is <b>ERROR_DS_INCOMPATIBLE</b>. This return value applies only to domain roots and a <i>MajorVersion</i> of 2.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsaddroottarget
     * @since windows6.0.6000
     */
    static NetDfsAddRootTarget(pDfsPath, pTargetPath, MajorVersion, pComment, Flags) {
        pDfsPath := pDfsPath is String ? StrPtr(pDfsPath) : pDfsPath
        pTargetPath := pTargetPath is String ? StrPtr(pTargetPath) : pTargetPath
        pComment := pComment is String ? StrPtr(pComment) : pComment

        result := DllCall("NETAPI32.dll\NetDfsAddRootTarget", "ptr", pDfsPath, "ptr", pTargetPath, "uint", MajorVersion, "ptr", pComment, "uint", Flags, "uint")
        return result
    }

    /**
     * Removes a DFS root target from a domain-based DFS namespace. If the root target is the last root target in the DFS namespace, this function removes the DFS namespace. This function can also be used to remove a stand-alone DFS namespace.
     * @param {PWSTR} pDfsPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace.
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
     * @param {PWSTR} pTargetPath Pointer to a null-terminated Unicode string that specifies the UNC path of a DFS root target for the DFS 
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
     *        <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsremoveroottarget
     * @since windows6.0.6000
     */
    static NetDfsRemoveRootTarget(pDfsPath, pTargetPath, Flags) {
        pDfsPath := pDfsPath is String ? StrPtr(pDfsPath) : pDfsPath
        pTargetPath := pTargetPath is String ? StrPtr(pTargetPath) : pTargetPath

        result := DllCall("NETAPI32.dll\NetDfsRemoveRootTarget", "ptr", pDfsPath, "ptr", pTargetPath, "uint", Flags, "uint")
        return result
    }

    /**
     * Retrieves the security descriptor for the root object of the specified DFS namespace.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace root.
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
     * @param {Pointer<Integer>} lpcbSecurityDescriptor The size of the buffer that <i>ppSecurityDescriptor</i> points to, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsgetsecurity
     * @since windows6.0.6000
     */
    static NetDfsGetSecurity(DfsEntryPath, SecurityInformation, ppSecurityDescriptor, lpcbSecurityDescriptor) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath

        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsGetSecurity", "ptr", DfsEntryPath, "uint", SecurityInformation, "ptr", ppSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security descriptor for the root object of the specified DFS namespace.
     * @param {PWSTR} DfsEntryPath Pointer to a string that specifies the Universal Naming Convention (UNC) path of a DFS namespace root.
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
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security descriptor to set as specified in the <i>SecurityInformation</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfssetsecurity
     * @since windows6.0.6000
     */
    static NetDfsSetSecurity(DfsEntryPath, SecurityInformation, pSecurityDescriptor) {
        DfsEntryPath := DfsEntryPath is String ? StrPtr(DfsEntryPath) : DfsEntryPath
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("NETAPI32.dll\NetDfsSetSecurity", "ptr", DfsEntryPath, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves the security descriptor for the container object of the specified stand-alone DFS namespace.
     * @param {PWSTR} MachineName Pointer to a string that specifies the name of the server that hosts the stand-alone DFS namespace.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to retrieve.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures that contain the security items requested in the <i>SecurityInformation</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This buffer must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.</div>
     * <div> </div>
     * @param {Pointer<Integer>} lpcbSecurityDescriptor The size of the buffer that <i>ppSecurityDescriptor</i> points to, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsgetstdcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsGetStdContainerSecurity(MachineName, SecurityInformation, ppSecurityDescriptor, lpcbSecurityDescriptor) {
        MachineName := MachineName is String ? StrPtr(MachineName) : MachineName

        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsGetStdContainerSecurity", "ptr", MachineName, "uint", SecurityInformation, "ptr", ppSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security descriptor for the container object of the specified stand-alone DFS namespace.
     * @param {PWSTR} MachineName The name of the stand-alone DFS root's host machine. Pointer to a string that specifies the name of the server that hosts the stand-alone DFS namespace.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to set on the root object.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security attributes to set as specified in the <i>SecurityInformation</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfssetstdcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsSetStdContainerSecurity(MachineName, SecurityInformation, pSecurityDescriptor) {
        MachineName := MachineName is String ? StrPtr(MachineName) : MachineName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("NETAPI32.dll\NetDfsSetStdContainerSecurity", "ptr", MachineName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves the security descriptor of the container object for the domain-based DFS namespaces in the specified Active Directory domain.
     * @param {PWSTR} DomainName Pointer to a string that specifies the Active Directory domain name.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to retrieve.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Pointer to a list <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structures that contain the security items requested in the <i>SecurityInformation</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This buffer must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.</div>
     * <div> </div>
     * @param {Pointer<Integer>} lpcbSecurityDescriptor The size of <i>ppSecurityDescriptor</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsgetftcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsGetFtContainerSecurity(DomainName, SecurityInformation, ppSecurityDescriptor, lpcbSecurityDescriptor) {
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsGetFtContainerSecurity", "ptr", DomainName, "uint", SecurityInformation, "ptr", ppSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security descriptor of the container object for the domain-based DFS namespaces in the specified Active Directory domain.
     * @param {PWSTR} DomainName Pointer to a string that specifies the Active Directory domain name.
     * @param {Integer} SecurityInformation <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that contains bit flags that indicate the type of security information to set.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security attributes to set as specified in the <i>SecurityInformation</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfssetftcontainersecurity
     * @since windows6.0.6000
     */
    static NetDfsSetFtContainerSecurity(DomainName, SecurityInformation, pSecurityDescriptor) {
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("NETAPI32.dll\NetDfsSetFtContainerSecurity", "ptr", DomainName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Determines the supported metadata version number.
     * @param {Integer} Origin A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/ne-lmdfs-dfs_namespace_version_origin">DFS_NAMESPACE_VERSION_ORIGIN</a> enumeration value that specifies the origin of the DFS namespace version.
     * @param {PWSTR} pName A string that specifies the server name or domain name. If the value of the <i>Origin</i> parameter is <b>DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN</b>, this string must be an AD DS domain name. Otherwise, it must be a server name. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Pointer<DFS_SUPPORTED_NAMESPACE_VERSION_INFO>>} ppVersionInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_supported_namespace_version_info">DFS_SUPPORTED_NAMESPACE_VERSION_INFO</a> structure that receives the DFS metadata version number.
     * @returns {Integer} If the function succeeds, the return value is <b>NERR_Success</b>.
     * 
     * If the function fails, the return value is a system error code. For a list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmdfs/nf-lmdfs-netdfsgetsupportednamespaceversion
     * @since windows6.0.6000
     */
    static NetDfsGetSupportedNamespaceVersion(Origin, pName, ppVersionInfo) {
        pName := pName is String ? StrPtr(pName) : pName

        ppVersionInfoMarshal := ppVersionInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("NETAPI32.dll\NetDfsGetSupportedNamespaceVersion", "int", Origin, "ptr", pName, ppVersionInfoMarshal, ppVersionInfo, "uint")
        return result
    }

;@endregion Methods
}

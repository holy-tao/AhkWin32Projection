#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains optional extended parameters for CreateFile2.
 * @remarks
 * To compile an application that uses the **CREATEFILE2_EXTENDED_PARAMETERS** structure, define the **_WIN32_WINNT** macro as `0x0602` or later. For more information, see [Using the Windows Headers](/windows/win32/WinProg/using-the-windows-headers).
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-createfile2_extended_parameters
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CREATEFILE2_EXTENDED_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the size of this structure, `sizeof(CREATEFILE2_EXTENDED_PARAMETERS)`.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The file or device attributes and flags, **FILE_ATTRIBUTE_NORMAL** being the most common default value for files.
     * 
     * This parameter can include any combination of the available file attributes (**FILE_ATTRIBUTE_\***). All other file attributes override **FILE_ATTRIBUTE_NORMAL**.
     * 
     * > [!NOTE]
     * > When [CreateFile2](/windows/win32/api/fileapi/nf-fileapi-createfile2) opens an existing file, it generally combines the file flags with the file attributes of the existing file, and ignores any file attributes supplied as part of _dwFlagsAndAttributes_. Special cases are detailed in [Creating and Opening Files](/windows/win32/FileIO/creating-and-opening-files).
     * 
     * Some of the following file attributes and flags may only apply to files and not necessarily all other types of devices that [CreateFile2](/windows/win32/api/fileapi/nf-fileapi-createfile2) can open. For additional information, see the **Remarks** section of the `CreateFile2` reference page and [Creating and Opening Files](/windows/win32/FileIO/creating-and-opening-files).
     * 
     * For more advanced access to file attributes, see [SetFileAttributes](/windows/win32/api/fileapi/nf-fileapi-setfileattributesa). For a complete list of all file attributes with their values and descriptions, see [File Attribute Constants](/windows/win32/FileIO/file-attribute-constants).
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_ARCHIVE"></a><a id="file_attribute_archive"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_ARCHIVE</b></dt>
     * <dt>32 (0x20)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file should be archived. Applications use this attribute to mark files for backup or removal.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_ENCRYPTED"></a><a id="file_attribute_encrypted"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_ENCRYPTED</b></dt>
     * <dt>16384 (0x4000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is encrypted. For a file, this means that all data in the file is encrypted. For a directory, this means that encryption is the default for newly created files and subdirectories. For more information, see <a href="https://docs.microsoft.com/windows/win32/FileIO/file-encryption">File Encryption</a>.
     * 
     * This flag has no effect if **FILE_ATTRIBUTE_SYSTEM** is also specified.
     * 
     * This flag is not supported on Home, Home Premium, Starter, or ARM editions of Windows.
     * 
     * This flag is not supported when called from a Windows Store app.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_HIDDEN"></a><a id="file_attribute_hidden"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_HIDDEN</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is hidden. Do not include it in an ordinary directory listing.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_INTEGRITY_STREAM"></a><a id="file_attribute_integrity_stream"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_INTEGRITY_STREAM</b></dt>
     * <dt>32768 (0x8000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory that is configured with integrity. For a file, all data streams in the file have integrity. For a directory, integrity is the default for newly created files and subdirectories, unless the caller specifies otherwise.
     * 
     * This flag is only supported on the ReFS file system.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_NORMAL"></a><a id="file_attribute_normal"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_NORMAL</b></dt>
     * <dt>128 (0x80)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file does not have other attributes set. This attribute is valid only if used alone.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_OFFLINE"></a><a id="file_attribute_offline"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_OFFLINE</b></dt>
     * <dt>4096 (0x1000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data of a file is not immediately available. This attribute indicates that file data is physically moved to offline storage. This attribute is used by Remote Storage, the hierarchical storage management software. Applications should not arbitrarily change this attribute.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_READONLY"></a><a id="file_attribute_readonly"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_READONLY</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is read only. Applications can read the file, but cannot write to or delete it.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_SYSTEM"></a><a id="file_attribute_system"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_SYSTEM</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is part of or used exclusively by an operating system.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_TEMPORARY"></a><a id="file_attribute_temporary"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_TEMPORARY</b></dt>
     * <dt>256 (0x100)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is being used for temporary storage.
     * 
     * For more information, see the **Caching Behavior** section of this topic.
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFileAttributes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This parameter can contain combinations of flags (<b>FILE_FLAG_*</b>) for control of file or device caching behavior, access modes, and other special-purpose flags.
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_BACKUP_SEMANTICS"></a><a id="file_flag_backup_semantics"></a><dl>
     * <dt><b>FILE_FLAG_BACKUP_SEMANTICS</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is being opened or created for a backup or restore operation. The system ensures that the calling process overrides file security checks when the process has <b>SE_BACKUP_NAME</b> and <b>SE_RESTORE_NAME</b> privileges. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/changing-privileges-in-a-token">Changing Privileges in a Token</a>.
     * 
     * You must set this flag to obtain a handle to a directory. A directory handle can be passed to some functions instead of a file handle. For more information, see the Remarks section.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_DELETE_ON_CLOSE"></a><a id="file_flag_delete_on_close"></a><dl>
     * <dt><b>FILE_FLAG_DELETE_ON_CLOSE</b></dt>
     * <dt>0x04000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is to be deleted immediately after all of its handles are closed, which includes the specified handle and any other open or duplicated handles.
     * 
     * If there are existing open handles to a file, the call fails unless they were all opened with the <b>FILE_SHARE_DELETE</b> share mode.
     * 
     * Subsequent open requests for the file fail, unless the <b>FILE_SHARE_DELETE</b> share mode is specified.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_IGNORE_IMPERSONATED_DEVICEMAP"></a><a id="file_flag_ignore_impersonated_devicemap"></a><dl>
     * <dt><b>FILE_FLAG_IGNORE_IMPERSONATED_DEVICEMAP</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A device map is a mapping between DOS device names and devices in the system, and is used when resolving DOS names. Separate device maps exists for each user in the system, and users can manage their own device maps. Typically during impersonation, the impersonated user's device map would be used. However, when this flag is set, the process user's device map is used instead.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_NO_BUFFERING"></a><a id="file_flag_no_buffering"></a><dl>
     * <dt><b>FILE_FLAG_NO_BUFFERING</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or device is being opened with no system caching for data reads and writes. This flag does not affect hard disk caching or memory mapped files.
     * 
     * There are strict requirements for successfully working with files opened with <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfile2">CreateFile2</a> using the <b>FILE_FLAG_NO_BUFFERING</b> flag, for details see <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">File Buffering</a>.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OPEN_NO_RECALL"></a><a id="file_flag_open_no_recall"></a><dl>
     * <dt><b>FILE_FLAG_OPEN_NO_RECALL</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file data is requested, but it should continue to be located in remote storage. It should not be transported back to local storage. This flag is for use by remote storage systems.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OPEN_REPARSE_POINT"></a><a id="file_flag_open_reparse_point"></a><dl>
     * <dt><b>FILE_FLAG_OPEN_REPARSE_POINT</b></dt>
     * <dt>0x00200000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal <a href="https://docs.microsoft.com/windows/desktop/FileIO/reparse-points">reparse point</a> processing will not occur; <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfile2">CreateFile2</a> will attempt to open the reparse point. When a file is opened, a file handle is returned, whether or not the filter that controls the reparse point is operational.
     * 
     * This flag cannot be used with the <b>CREATE_ALWAYS</b> flag.
     * 
     * If the file is not a reparse point, then this flag is ignored.
     * 
     * For more information, see the Remarks section.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OPEN_REQUIRING_OPLOCK"></a><a id="file_flag_open_requiring_oplock"></a><dl>
     * <dt><b>FILE_FLAG_OPEN_REQUIRING_OPLOCK</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is being opened and an opportunistic lock (oplock) on the file is being requested as a single atomic operation. The file system checks for oplocks before it performs the create operation, and will fail the create with a last error code of <b>ERROR_CANNOT_BREAK_OPLOCK</b> if the result would be to break an existing oplock.
     * 
     * If you use this flag  and your call to the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfile2">CreateFile2</a> function successfully returns, the first operation you should perform on the file handle is to request an oplock by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIOControl</a> function and then pass in <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_request_oplock">FSCTL_REQUEST_OPLOCK</a> or one of the other <a href="https://docs.microsoft.com/windows/desktop/FileIO/opportunistic-lock-operations">Opportunistic Lock Operations</a>.  If you perform other file system operations with the file handle before requesting an oplock, a deadlock might occur.<div class="alert"><b>Note</b>  You can safely call the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function on the file handle without first requesting an oplock.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OVERLAPPED"></a><a id="file_flag_overlapped"></a><dl>
     * <dt><b>FILE_FLAG_OVERLAPPED</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or device is being opened or created for asynchronous I/O.
     * 
     * When subsequent I/O operations are completed on this handle, the event specified in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure will be set to the signaled state.
     * 
     * If this flag is specified, the file can be used for simultaneous read and write operations.
     * 
     * If this flag is not specified, then I/O operations are serialized, even if the calls to the read and write functions specify an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * 
     * For information about considerations when using a file handle created with this flag, see the **Synchronous and Asynchronous I/O Handles** section of this topic.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_POSIX_SEMANTICS"></a><a id="file_flag_posix_semantics"></a><dl>
     * <dt><b>FILE_FLAG_POSIX_SEMANTICS</b></dt>
     * <dt>0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access will occur according to POSIX rules. This includes allowing multiple files with names, differing only in case, for file systems that support that naming. Use care when using this option, because files created with this flag may not be accessible by applications that are written for MS-DOS or 16-bit Windows.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_RANDOM_ACCESS"></a><a id="file_flag_random_access"></a><dl>
     * <dt><b>FILE_FLAG_RANDOM_ACCESS</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is intended to be random. The system can use this as a hint to optimize file caching.
     * 
     * This flag has no effect if the file system does not support cached I/O and **FILE_FLAG_NO_BUFFERING**.
     * 
     * For more information, see the **Caching Behavior** section of this topic.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_SESSION_AWARE"></a><a id="file_flag_session_aware"></a><dl>
     * <dt><b>FILE_FLAG_SESSION_AWARE</b></dt>
     * <dt>0x00800000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or device is being opened with session awareness. If this flag is not specified, then per-session devices (such as a device using RemoteFX USB Redirection) cannot be opened by processes running in session 0. This flag has no effect for callers not in session 0. This flag is supported only on server editions of Windows.
     * 
     * **Windows Server 2008 R2 and Windows Server 2008:** This flag is not supported before Windows Server 2012.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_SEQUENTIAL_SCAN"></a><a id="file_flag_sequential_scan"></a><dl>
     * <dt><b>FILE_FLAG_SEQUENTIAL_SCAN</b></dt>
     * <dt>0x08000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is intended to be sequential from beginning to end. The system can use this as a hint to optimize file caching.
     * 
     * This flag should not be used if read-behind (that is, backwards scans) will be used.
     * 
     * This flag has no effect if the file system does not support cached I/O and **FILE_FLAG_NO_BUFFERING**.
     * 
     * For more information, see the **Caching Behavior** section of this topic.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_WRITE_THROUGH"></a><a id="file_flag_write_through"></a><dl>
     * <dt><b>FILE_FLAG_WRITE_THROUGH</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write operations will not go through any intermediate cache, they will go directly to disk.
     * 
     * For additional information, see the **Caching Behavior** section of this topic.
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFileFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The _dwSecurityQosFlags_ parameter specifies SQOS information. For more information, see [Impersonation Levels](/windows/win32/SecAuthZ/impersonation-levels).
     * 
     * <table>
     * <tr>
     * <th>Security flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_ANONYMOUS"></a><a id="security_anonymous"></a><dl>
     * <dt><b>SECURITY_ANONYMOUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Impersonates a client at the Anonymous impersonation level.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_CONTEXT_TRACKING"></a><a id="security_context_tracking"></a><dl>
     * <dt><b>SECURITY_CONTEXT_TRACKING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security tracking mode is dynamic. If this flag is not specified, the security tracking mode is static.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_DELEGATION"></a><a id="security_delegation"></a><dl>
     * <dt><b>SECURITY_DELEGATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Impersonates a client at the Delegation impersonation level.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_EFFECTIVE_ONLY"></a><a id="security_effective_only"></a><dl>
     * <dt><b>SECURITY_EFFECTIVE_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only the enabled aspects of the client's security context are available to the server. If you do not specify this flag, all aspects of the client's security context are available.
     * 
     * This allows the client to limit the groups and privileges that a server can use while impersonating the client.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_IDENTIFICATION"></a><a id="security_identification"></a><dl>
     * <dt><b>SECURITY_IDENTIFICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Impersonates a client at the Identification impersonation level.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_IMPERSONATION"></a><a id="security_impersonation"></a><dl>
     * <dt><b>SECURITY_IMPERSONATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Impersonate a client at the impersonation level. This is the default behavior if no other flags are specified.
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSecurityQosFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A pointer to a [SECURITY_ATTRIBUTES](/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)) structure that contains two separate but related data members: an optional security descriptor, and a Boolean value that determines whether the returned handle can be inherited by child processes.
     * 
     * This parameter can be **NULL**.
     * 
     * If this parameter is **NULL**, the handle returned by [CreateFile2](/windows/win32/api/fileapi/nf-fileapi-createfile2) cannot be inherited by any child processes the application may create and the file or device associated with the returned handle gets a default security descriptor.
     * 
     * The **lpSecurityDescriptor** member of the structure specifies a [SECURITY_DESCRIPTOR](/windows/win32/api/winnt/ns-winnt-security_descriptor) for a file or device. If this member is **NULL**, the file or device associated with the returned handle is assigned a default security descriptor.
     * 
     * [CreateFile2](/windows/win32/api/fileapi/nf-fileapi-createfile2) ignores the **lpSecurityDescriptor** member when opening an existing file or device, but continues to use the **bInheritHandle** member.
     * 
     * The **bInheritHandle** member of the structure specifies whether the returned handle can be inherited.
     * 
     * For more information, see the Remarks section of the [CreateFile2](/windows/win32/api/fileapi/nf-fileapi-createfile2) topic.
     * @type {Pointer<SECURITY_ATTRIBUTES>}
     */
    lpSecurityAttributes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A valid handle to a template file with the **GENERIC_READ** access right. The template file supplies file attributes and extended attributes for the file that is being created.
     * 
     * This parameter can be **NULL**.
     * 
     * When opening an existing file, [CreateFile2](/windows/win32/api/fileapi/nf-fileapi-createfile2) ignores this parameter.
     * 
     * When opening a new encrypted file, the file inherits the discretionary access control list from its parent directory. For additional information, see [File Encryption](/windows/win32/FileIO/file-encryption).
     * @type {Pointer<HANDLE>}
     */
    hTemplateFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

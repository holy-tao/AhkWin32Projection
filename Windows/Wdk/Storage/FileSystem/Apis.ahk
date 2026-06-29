#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }
#Import ".\VIRTUAL_MEMORY_INFORMATION_CLASS.ahk" { VIRTUAL_MEMORY_INFORMATION_CLASS }
#Import ".\FILE_LOCK.ahk" { FILE_LOCK }
#Import ".\MMFLUSH_TYPE.ahk" { MMFLUSH_TYPE }
#Import ".\PREFIX_TABLE_ENTRY.ahk" { PREFIX_TABLE_ENTRY }
#Import ".\FILE_FULL_EA_INFORMATION.ahk" { FILE_FULL_EA_INFORMATION }
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import "..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }
#Import "..\..\..\Win32\Security\GENERIC_MAPPING.ahk" { GENERIC_MAPPING }
#Import ".\REPARSE_DATA_BUFFER.ahk" { REPARSE_DATA_BUFFER }
#Import ".\NTCREATEFILE_CREATE_OPTIONS.ahk" { NTCREATEFILE_CREATE_OPTIONS }
#Import "..\..\Foundation\KEVENT.ahk" { KEVENT }
#Import "..\..\..\Win32\Foundation\PSTR.ahk" { PSTR }
#Import ".\PREFIX_TABLE.ahk" { PREFIX_TABLE }
#Import "..\..\..\Win32\Security\SID_NAME_USE.ahk" { SID_NAME_USE }
#Import ".\FS_FILTER_CALLBACKS.ahk" { FS_FILTER_CALLBACKS }
#Import ".\MCB.ahk" { MCB }
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\Foundation\OBJECT_NAME_INFORMATION.ahk" { OBJECT_NAME_INFORMATION }
#Import "..\..\Foundation\WORK_QUEUE_ITEM.ahk" { WORK_QUEUE_ITEM }
#Import "..\..\Foundation\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import "..\..\Foundation\KMUTANT.ahk" { KMUTANT }
#Import ".\READ_LIST.ahk" { READ_LIST }
#Import "..\..\..\Win32\Storage\FileSystem\FILE_SHARE_MODE.ahk" { FILE_SHARE_MODE }
#Import "..\..\..\Win32\System\Kernel\STRING.ahk" { STRING }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PETHREAD.ahk" { PETHREAD }
#Import ".\OPLOCK_KEY_ECP_CONTEXT.ahk" { OPLOCK_KEY_ECP_CONTEXT }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\ECP_LIST.ahk" { ECP_LIST }
#Import "..\..\..\Win32\System\Kernel\EVENT_TYPE.ahk" { EVENT_TYPE }
#Import "..\..\Foundation\IRP.ahk" { IRP }
#Import ".\SecHandle.ahk" { SecHandle }
#Import ".\FSRTL_UNC_PROVIDER_REGISTRATION.ahk" { FSRTL_UNC_PROVIDER_REGISTRATION }
#Import "..\..\..\Win32\Storage\FileSystem\FILE_ACCESS_RIGHTS.ahk" { FILE_ACCESS_RIGHTS }
#Import ".\IO_CREATE_STREAM_FILE_OPTIONS.ahk" { IO_CREATE_STREAM_FILE_OPTIONS }
#Import ".\FSRTL_PER_FILE_CONTEXT.ahk" { FSRTL_PER_FILE_CONTEXT }
#Import ".\MEMORY_RANGE_ENTRY.ahk" { MEMORY_RANGE_ENTRY }
#Import ".\FS_INFORMATION_CLASS.ahk" { FS_INFORMATION_CLASS }
#Import ".\UNICODE_PREFIX_TABLE_ENTRY.ahk" { UNICODE_PREFIX_TABLE_ENTRY }
#Import "..\..\..\Win32\Storage\FileSystem\FILE_FLAGS_AND_ATTRIBUTES.ahk" { FILE_FLAGS_AND_ATTRIBUTES }
#Import "..\..\Foundation\ACCESS_STATE.ahk" { ACCESS_STATE }
#Import ".\KAPC_STATE.ahk" { KAPC_STATE }
#Import ".\FSRTL_PER_STREAM_CONTEXT.ahk" { FSRTL_PER_STREAM_CONTEXT }
#Import "..\..\Foundation\IO_STACK_LOCATION.ahk" { IO_STACK_LOCATION }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import ".\FSRTL_ADVANCED_FCB_HEADER.ahk" { FSRTL_ADVANCED_FCB_HEADER }
#Import "..\..\..\Win32\Security\TOKEN_TYPE.ahk" { TOKEN_TYPE }
#Import ".\CACHE_MANAGER_CALLBACKS.ahk" { CACHE_MANAGER_CALLBACKS }
#Import ".\FILE_LOCK_INFO.ahk" { FILE_LOCK_INFO }
#Import ".\LARGE_MCB.ahk" { LARGE_MCB }
#Import ".\CC_ASYNC_READ_CONTEXT.ahk" { CC_ASYNC_READ_CONTEXT }
#Import "..\..\..\Win32\System\Ioctl\IO_IRP_EXT_TRACK_OFFSET_HEADER.ahk" { IO_IRP_EXT_TRACK_OFFSET_HEADER }
#Import "..\..\..\Win32\Security\WELL_KNOWN_SID_TYPE.ahk" { WELL_KNOWN_SID_TYPE }
#Import "..\..\..\Win32\Security\Authentication\Identity\SE_ADT_PARAMETER_ARRAY.ahk" { SE_ADT_PARAMETER_ARRAY }
#Import "..\..\..\Win32\Security\PRIVILEGE_SET.ahk" { PRIVILEGE_SET }
#Import "..\..\Foundation\PKTHREAD.ahk" { PKTHREAD }
#Import "..\..\Foundation\ERESOURCE.ahk" { ERESOURCE }
#Import ".\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }
#Import ".\GENERATE_NAME_CONTEXT.ahk" { GENERATE_NAME_CONTEXT }
#Import "..\..\Foundation\TARGET_DEVICE_CUSTOM_NOTIFICATION.ahk" { TARGET_DEVICE_CUSTOM_NOTIFICATION }
#Import "..\..\..\Win32\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }
#Import "..\..\Foundation\KQUEUE.ahk" { KQUEUE }
#Import "..\..\..\Win32\Security\PSID.ahk" { PSID }
#Import "..\..\Foundation\POOL_TYPE.ahk" { POOL_TYPE }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }
#Import ".\OPLOCK_KEY_CONTEXT.ahk" { OPLOCK_KEY_CONTEXT }
#Import "..\..\Foundation\PNOTIFY_SYNC.ahk" { PNOTIFY_SYNC }
#Import "..\..\..\Win32\Security\AUDIT_EVENT_TYPE.ahk" { AUDIT_EVENT_TYPE }
#Import "..\..\..\Win32\Security\OBJECT_TYPE_LIST.ahk" { OBJECT_TYPE_LIST }
#Import "..\..\Foundation\PESILO.ahk" { PESILO }
#Import "..\..\Foundation\VPB.ahk" { VPB }
#Import "..\..\Foundation\SspiAsyncContext.ahk" { SspiAsyncContext }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\..\Win32\Security\SID_IDENTIFIER_AUTHORITY.ahk" { SID_IDENTIFIER_AUTHORITY }
#Import ".\RTL_HEAP_PARAMETERS.ahk" { RTL_HEAP_PARAMETERS }
#Import "..\..\..\Win32\Security\TOKEN_GROUPS.ahk" { TOKEN_GROUPS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\TUNNEL.ahk" { TUNNEL }
#Import ".\FILE_QUOTA_INFORMATION.ahk" { FILE_QUOTA_INFORMATION }
#Import "..\..\Foundation\SECURITY_SUBJECT_CONTEXT.ahk" { SECURITY_SUBJECT_CONTEXT }
#Import "..\..\Foundation\PRKPROCESS.ahk" { PRKPROCESS }
#Import "..\..\Foundation\SECTION_OBJECT_POINTERS.ahk" { SECTION_OBJECT_POINTERS }
#Import "..\..\..\Win32\Security\TOKEN_INFORMATION_CLASS.ahk" { TOKEN_INFORMATION_CLASS }
#Import ".\BASE_MCB.ahk" { BASE_MCB }
#Import "..\..\..\Win32\Security\TOKEN_ACCESS_INFORMATION.ahk" { TOKEN_ACCESS_INFORMATION }
#Import "..\..\Foundation\POBJECT_TYPE.ahk" { POBJECT_TYPE }
#Import ".\CC_FILE_SIZES.ahk" { CC_FILE_SIZES }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\KSPIN_LOCK_QUEUE_NUMBER.ahk" { KSPIN_LOCK_QUEUE_NUMBER }
#Import ".\COMPRESSED_DATA_INFO.ahk" { COMPRESSED_DATA_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\Security\Authentication\Identity\SECURITY_USER_DATA.ahk" { SECURITY_USER_DATA }
#Import ".\FSRTL_PER_FILEOBJECT_CONTEXT.ahk" { FSRTL_PER_FILEOBJECT_CONTEXT }
#Import ".\IO_PRIORITY_INFO.ahk" { IO_PRIORITY_INFO }
#Import ".\MEMORY_INFORMATION_CLASS.ahk" { MEMORY_INFORMATION_CLASS }
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }
#Import ".\CPTABLEINFO.ahk" { CPTABLEINFO }
#Import ".\CC_ERROR_CALLBACK_CONTEXT.ahk" { CC_ERROR_CALLBACK_CONTEXT }
#Import "..\..\..\Win32\Security\TOKEN_PRIVILEGES.ahk" { TOKEN_PRIVILEGES }
#Import ".\CACHE_UNINITIALIZE_EVENT.ahk" { CACHE_UNINITIALIZE_EVENT }
#Import "..\..\Foundation\KWAIT_BLOCK.ahk" { KWAIT_BLOCK }
#Import ".\UNICODE_PREFIX_TABLE.ahk" { UNICODE_PREFIX_TABLE }
#Import "..\..\..\Win32\System\Memory\MEM_EXTENDED_PARAMETER.ahk" { MEM_EXTENDED_PARAMETER }
#Import ".\NTCREATEFILE_CREATE_DISPOSITION.ahk" { NTCREATEFILE_CREATE_DISPOSITION }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_FS_SECTOR_SIZE_INFORMATION.ahk" { FILE_FS_SECTOR_SIZE_INFORMATION }
#Import "..\..\..\Win32\System\Kernel\WAIT_TYPE.ahk" { WAIT_TYPE }
#Import "..\..\Foundation\OBJECT_INFORMATION_CLASS.ahk" { OBJECT_INFORMATION_CLASS }
#Import ".\SECURITY_CLIENT_CONTEXT.ahk" { SECURITY_CLIENT_CONTEXT }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FSRTL_CHANGE_BACKING_TYPE.ahk" { FSRTL_CHANGE_BACKING_TYPE }
#Import "..\..\..\Win32\Security\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }
#Import "..\..\..\Win32\Security\ACL.ahk" { ACL }
#Import "..\..\Foundation\ECP_HEADER.ahk" { ECP_HEADER }
#Import ".\FILE_NETWORK_OPEN_INFORMATION.ahk" { FILE_NETWORK_OPEN_INFORMATION }
#Import "..\..\..\Win32\Security\SE_IMPERSONATION_STATE.ahk" { SE_IMPERSONATION_STATE }
#Import "..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */

;@region Functions
/**
 * User-mode API - Marks any outstanding I/O operations for the specified file handle. The function only cancels I/O operations in the current process, regardless of which thread created the I/O operation.
 * @remarks
 * The **NTCancelIoFileEx** function allows you to cancel requests in threads other than the calling thread. The [**NtCancelIoFile**](nt-cancel-io-file.md) function only cancels requests in the same thread that called the **NtCancelIoFile** function. **NtCancelIoFileEx** cancels only outstanding I/O on the handle, it does not change the state of the handle; this means that you cannot rely on the state of the handle because you cannot know whether the operation was completed successfully or canceled.
 * 
 * If there are any pending I/O operations in progress for the specified file handle, the **NtCancelIoFileEx** function marks them for cancellation. Most types of operations can be canceled immediately; other operations can continue toward completion before they are actually canceled and the caller is notified. The **NtCancelIoFileEx** function does not wait for all canceled operations to complete.
 * 
 * If the file handle is associated with a completion port, an I/O completion packet is not queued to the port if a synchronous operation is successfully canceled. For asynchronous operations still pending, the cancel operation will queue an I/O completion packet.
 * 
 * The operation being canceled is completed with one of three statuses; you must check the completion status to determine the completion state. The three statuses are:
 * 
 * -   The operation completed normally. This can occur even if the operation was canceled, because the cancel request might not have been submitted in time to cancel the operation.
 * -   The operation was canceled. The [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns **ERROR\_OPERATION\_ABORTED**.
 * -   The operation failed with another error. The [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns the relevant error code.
 * 
 * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
 * 
 * 
 * 
 * | Technology                                           | Supported      |
 * |------------------------------------------------------|----------------|
 * | Server Message Block (SMB) 3.0 protocol<br/>   | Yes<br/> |
 * | SMB 3.0 Transparent Failover (TFO)<br/>        | Yes<br/> |
 * | SMB 3.0 with Scale-out File Shares (SO)<br/>   | Yes<br/> |
 * | Cluster Shared Volume File System (CsvFS)<br/> | Yes<br/> |
 * | Resilient File System (ReFS)<br/>              | Yes<br/> |
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoRequestToCancel 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} If the function succeeds, the return value is nonzero. The cancel operation for all pending I/O operations issued by the calling process for the specified file handle was successfully requested. The application must not free or reuse the [**OVERLAPPED**](/windows/desktop/api/minwinbase/ns-minwinbase-overlapped) structure associated with the canceled I/O operations until they have completed. The thread can use the [**GetOverlappedResult**](/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult) function to determine when the I/O operations themselves have been completed.
 * 
 * If the function fails, the return value is 0 (zero). To get extended error information, call the [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function.
 * 
 * If this function cannot find a request to cancel, the return value is 0 (zero), and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **ERROR\_NOT\_FOUND**.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/nt-cancel-io-file-ex
 */
export NtCancelIoFileEx(FileHandle, IoRequestToCancel, IoStatusBlock) {
    result := DllCall("ntdll.dll\NtCancelIoFileEx", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoRequestToCancel, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoRequestToCancel 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export ZwCancelIoFileEx(FileHandle, IoRequestToCancel, IoStatusBlock) {
    result := DllCall("ntdll.dll\ZwCancelIoFileEx", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoRequestToCancel, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} CompletionFilter 
 * @param {BOOLEAN} WatchTree 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {BOOLEAN} Asynchronous 
 * @returns {NTSTATUS} 
 */
export NtNotifyChangeKey(KeyHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, _Buffer, BufferSize, Asynchronous) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtNotifyChangeKey", HANDLE, KeyHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", CompletionFilter, BOOLEAN, WatchTree, "ptr", _Buffer, "uint", BufferSize, BOOLEAN, Asynchronous, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EventHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {EVENT_TYPE} EventType 
 * @param {BOOLEAN} InitialState 
 * @returns {NTSTATUS} 
 */
export NtCreateEvent(EventHandle, DesiredAccess, ObjectAttributes, EventType, InitialState) {
    result := DllCall("ntdll.dll\NtCreateEvent", HANDLE.Ptr, EventHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, EVENT_TYPE, EventType, BOOLEAN, InitialState, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtDeleteFile(ObjectAttributes) {
    result := DllCall("ntdll.dll\NtDeleteFile", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {BOOLEAN} RestartScan 
 * @returns {NTSTATUS} 
 */
export NtQueryDirectoryFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, ReturnSingleEntry, FileName, RestartScan) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtQueryDirectoryFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, BOOLEAN, ReturnSingleEntry, UNICODE_STRING.Ptr, FileName, BOOLEAN, RestartScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} QueryFlags 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @returns {NTSTATUS} 
 */
export NtQueryDirectoryFileEx(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, QueryFlags, FileName) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtQueryDirectoryFileEx", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, "uint", QueryFlags, UNICODE_STRING.Ptr, FileName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @returns {NTSTATUS} 
 */
export NtQueryVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
    result := DllCall("ntdll.dll\NtQueryVolumeInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @returns {NTSTATUS} 
 */
export NtSetVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
    result := DllCall("ntdll.dll\NtSetVolumeInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FsControlCode 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @returns {NTSTATUS} 
 */
export NtFsControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtFsControlFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} SourceProcessHandle 
 * @param {HANDLE} SourceHandle 
 * @param {HANDLE} TargetProcessHandle 
 * @param {Pointer<HANDLE>} TargetHandle 
 * @param {Integer} DesiredAccess 
 * @param {Integer} HandleAttributes 
 * @param {Integer} Options 
 * @returns {NTSTATUS} 
 */
export NtDuplicateObject(SourceProcessHandle, SourceHandle, TargetProcessHandle, TargetHandle, DesiredAccess, HandleAttributes, Options) {
    result := DllCall("ntdll.dll\NtDuplicateObject", HANDLE, SourceProcessHandle, HANDLE, SourceHandle, HANDLE, TargetProcessHandle, HANDLE.Ptr, TargetHandle, "uint", DesiredAccess, "uint", HandleAttributes, "uint", Options, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Opens an existing directory object.
 * @remarks
 * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
 * @param {Pointer<HANDLE>} DirectoryHandle A handle to the newly opened directory object.
 * @param {Integer} DesiredAccess An [**ACCESS\_MASK**](../secauthz/access-mask.md) that specifies the requested access to the directory object. This parameter can be one or more of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                                                                                      | Meaning                                                                     |
 * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
 * | <span id="DIRECTORY_QUERY"></span><span id="directory_query"></span><dl> <dt>**DIRECTORY\_QUERY**</dt> <dt>0x0001</dt> </dl>                                            | Query access to the directory object.<br/>                            |
 * | <span id="DIRECTORY_TRAVERSE"></span><span id="directory_traverse"></span><dl> <dt>**DIRECTORY\_TRAVERSE**</dt> <dt>0x0002</dt> </dl>                                   | Name-lookup access to the directory object.<br/>                      |
 * | <span id="DIRECTORY_CREATE_OBJECT"></span><span id="directory_create_object"></span><dl> <dt>**DIRECTORY\_CREATE\_OBJECT**</dt> <dt>0x0004</dt> </dl>                   | Name-creation access to the directory object.<br/>                    |
 * | <span id="DIRECTORY_CREATE_SUBDIRECTORY"></span><span id="directory_create_subdirectory"></span><dl> <dt>**DIRECTORY\_CREATE\_SUBDIRECTORY**</dt> <dt>0x0008</dt> </dl> | Subdirectory-creation access to the directory object.<br/>            |
 * | <span id="DIRECTORY_ALL_ACCESS"></span><span id="directory_all_access"></span><dl> <dt>**DIRECTORY\_ALL\_ACCESS**</dt> <dt>STANDARD\_RIGHTS\_REQUIRED \| 0xF</dt> </dl> | All of the preceding rights plus **STANDARD\_RIGHTS\_REQUIRED**.<br/> |
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes The attributes for the directory object. To initialize the **OBJECT\_ATTRIBUTES** structure, use the **InitializeObjectAttributes** macro. For more information, see the documentation for these items in the documentation for the WDK.
 * @returns {NTSTATUS} The function returns STATUS\_SUCCESS or an error status. The possible status codes include the following.
 * 
 * 
 * 
 * | Return code                                                                                                       | Description                                                                                                                                                                                                                                                                                               |
 * |-------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <dl> <dt>**STATUS\_INSUFFICIENT\_RESOURCES**</dt> </dl>    | A temporary buffer required by this function could not be allocated.<br/>                                                                                                                                                                                                                           |
 * | <dl> <dt>**STATUS\_INVALID\_PARAMETER**</dt> </dl>         | The specified ObjectAttributes parameter was a **NULL** pointer, not a valid pointer to an **OBJECT\_ATTRIBUTES** structure, or some of the members specified in the **OBJECT\_ATTRIBUTES** structure were not valid.<br/>                                                                          |
 * | <dl> <dt>**STATUS\_OBJECT\_NAME\_INVALID**</dt> </dl>      | The *ObjectAttributes* parameter contained an **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure that was not valid because an empty string was found after the **OBJECT\_NAME\_PATH\_SEPARATOR** character.<br/>                                                                        |
 * | <dl> <dt>**STATUS\_OBJECT\_NAME\_NOT\_FOUND**</dt> </dl>   | The *ObjectAttributes* parameter contained an **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure that could not be found.<br/>                                                                                                                                                           |
 * | <dl> <dt>**STATUS\_OBJECT\_PATH\_NOT\_FOUND**</dt> </dl>   | The *ObjectAttributes* parameter contained an **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure with an object path that could not be found. <br/>                                                                                                                                      |
 * | <dl> <dt>**STATUS\_OBJECT\_PATH\_SYNTAX\_BAD** </dt> </dl> | The *ObjectAttributes* parameter did not contain a **RootDirectory** member, but the **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure was an empty string or did not contain an **OBJECT\_NAME\_PATH\_SEPARATOR** character. This indicates incorrect syntax for the object path.<br/> |
 * @see https://learn.microsoft.com/windows/win32/DevNotes/ntopendirectoryobject
 */
export NtOpenDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenDirectoryObject", HANDLE.Ptr, DirectoryHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} BaseAddress 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Integer} AllocationType 
 * @param {Integer} PageProtection 
 * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
 * @param {Integer} ExtendedParameterCount 
 * @returns {NTSTATUS} 
 */
export NtAllocateVirtualMemoryEx(ProcessHandle, BaseAddress, RegionSize, AllocationType, PageProtection, ExtendedParameters, ExtendedParameterCount) {
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\NtAllocateVirtualMemoryEx", HANDLE, ProcessHandle, "ptr", BaseAddress, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", PageProtection, MEM_EXTENDED_PARAMETER.Ptr, ExtendedParameters, "uint", ExtendedParameterCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Pointer<Void>>} BaseAddress 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Integer} FreeType 
 * @returns {NTSTATUS} 
 */
export NtFreeVirtualMemory(ProcessHandle, BaseAddress, RegionSize, FreeType) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\NtFreeVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, "uint", FreeType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Void>} BaseAddress 
 * @param {MEMORY_INFORMATION_CLASS} MemoryInformationClass 
 * @param {Integer} MemoryInformation 
 * @param {Pointer} MemoryInformationLength 
 * @param {Pointer<Pointer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtQueryVirtualMemory(ProcessHandle, BaseAddress, MemoryInformationClass, MemoryInformation, MemoryInformationLength, ReturnLength) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, MEMORY_INFORMATION_CLASS, MemoryInformationClass, "ptr", MemoryInformation, "ptr", MemoryInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {VIRTUAL_MEMORY_INFORMATION_CLASS} VmInformationClass 
 * @param {Pointer} NumberOfEntries 
 * @param {Pointer<MEMORY_RANGE_ENTRY>} VirtualAddresses 
 * @param {Integer} VmInformation 
 * @param {Integer} VmInformationLength 
 * @returns {NTSTATUS} 
 */
export NtSetInformationVirtualMemory(ProcessHandle, VmInformationClass, NumberOfEntries, VirtualAddresses, VmInformation, VmInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationVirtualMemory", HANDLE, ProcessHandle, VIRTUAL_MEMORY_INFORMATION_CLASS, VmInformationClass, "ptr", NumberOfEntries, MEMORY_RANGE_ENTRY.Ptr, VirtualAddresses, "ptr", VmInformation, "uint", VmInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EventHandle 
 * @param {Pointer<Integer>} PreviousState 
 * @returns {NTSTATUS} 
 */
export NtSetEvent(EventHandle, PreviousState) {
    PreviousStateMarshal := PreviousState is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\NtSetEvent", HANDLE, EventHandle, PreviousStateMarshal, PreviousState, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Pointer<Void>>} BaseAddress 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {NTSTATUS} 
 */
export NtFlushVirtualMemory(ProcessHandle, BaseAddress, RegionSize, IoStatus) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\NtFlushVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, IO_STATUS_BLOCK.Ptr, IoStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} DesiredAccess 
 * @param {Integer} HandleAttributes 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenProcessTokenEx(ProcessHandle, DesiredAccess, HandleAttributes, TokenHandle) {
    result := DllCall("ntdll.dll\NtOpenProcessTokenEx", HANDLE, ProcessHandle, "uint", DesiredAccess, "uint", HandleAttributes, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenProcessToken(ProcessHandle, DesiredAccess, TokenHandle) {
    result := DllCall("ntdll.dll\ZwOpenProcessToken", HANDLE, ProcessHandle, "uint", DesiredAccess, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadHandle 
 * @param {Integer} DesiredAccess 
 * @param {BOOLEAN} OpenAsSelf 
 * @param {Integer} HandleAttributes 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenThreadTokenEx(ThreadHandle, DesiredAccess, OpenAsSelf, HandleAttributes, TokenHandle) {
    result := DllCall("ntdll.dll\NtOpenThreadTokenEx", HANDLE, ThreadHandle, "uint", DesiredAccess, BOOLEAN, OpenAsSelf, "uint", HandleAttributes, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadHandle 
 * @param {Integer} DesiredAccess 
 * @param {BOOLEAN} OpenAsSelf 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenThreadToken(ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle) {
    result := DllCall("ntdll.dll\ZwOpenThreadToken", HANDLE, ThreadHandle, "uint", DesiredAccess, BOOLEAN, OpenAsSelf, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {TOKEN_INFORMATION_CLASS} TokenInformationClass 
 * @param {Integer} TokenInformation 
 * @param {Integer} TokenInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryInformationToken", HANDLE, TokenHandle, TOKEN_INFORMATION_CLASS, TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {TOKEN_INFORMATION_CLASS} TokenInformationClass 
 * @param {Integer} TokenInformation 
 * @param {Integer} TokenInformationLength 
 * @returns {NTSTATUS} 
 */
export NtSetInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationToken", HANDLE, TokenHandle, TOKEN_INFORMATION_CLASS, TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} SecurityInformation 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {NTSTATUS} 
 */
export NtSetSecurityObject(_Handle, SecurityInformation, _SecurityDescriptor) {
    result := DllCall("ntdll.dll\NtSetSecurityObject", HANDLE, _Handle, "uint", SecurityInformation, PSECURITY_DESCRIPTOR, _SecurityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Length 
 * @param {Integer} Key 
 * @param {BOOLEAN} FailImmediately 
 * @param {BOOLEAN} ExclusiveLock 
 * @returns {NTSTATUS} 
 */
export NtLockFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, ByteOffset, Length, Key, FailImmediately, ExclusiveLock) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtLockFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, BOOLEAN, FailImmediately, BOOLEAN, ExclusiveLock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Length 
 * @param {Integer} Key 
 * @returns {NTSTATUS} 
 */
export NtUnlockFile(FileHandle, IoStatusBlock, ByteOffset, Length, Key) {
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtUnlockFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} SidList 
 * @param {Integer} SidListLength 
 * @param {PSID} StartSid 
 * @param {BOOLEAN} RestartScan 
 * @returns {NTSTATUS} 
 */
export NtQueryQuotaInformationFile(FileHandle, IoStatusBlock, _Buffer, Length, ReturnSingleEntry, SidList, SidListLength, StartSid, RestartScan) {
    result := DllCall("ntdll.dll\NtQueryQuotaInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", SidList, "uint", SidListLength, PSID, StartSid, BOOLEAN, RestartScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export NtSetQuotaInformationFile(FileHandle, IoStatusBlock, _Buffer, Length) {
    result := DllCall("ntdll.dll\NtSetQuotaInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export NtFlushBuffersFile(FileHandle, IoStatusBlock) {
    result := DllCall("ntdll.dll\NtFlushBuffersFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} EaList 
 * @param {Integer} EaListLength 
 * @param {Pointer<Integer>} EaIndex 
 * @param {BOOLEAN} RestartScan 
 * @returns {NTSTATUS} 
 */
export NtQueryEaFile(FileHandle, IoStatusBlock, _Buffer, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan) {
    EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryEaFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, BOOLEAN, RestartScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export NtSetEaFile(FileHandle, IoStatusBlock, _Buffer, Length) {
    result := DllCall("ntdll.dll\NtSetEaFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ExistingTokenHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {BOOLEAN} EffectiveOnly 
 * @param {TOKEN_TYPE} TokenType 
 * @param {Pointer<HANDLE>} NewTokenHandle 
 * @returns {NTSTATUS} 
 */
export NtDuplicateToken(ExistingTokenHandle, DesiredAccess, ObjectAttributes, EffectiveOnly, TokenType, NewTokenHandle) {
    result := DllCall("ntdll.dll\NtDuplicateToken", HANDLE, ExistingTokenHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, BOOLEAN, EffectiveOnly, TOKEN_TYPE, TokenType, HANDLE.Ptr, NewTokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} DirectoryHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtCreateDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtCreateDirectoryObject", HANDLE.Ptr, DirectoryHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} FileInformation 
 * @returns {NTSTATUS} 
 */
export NtQueryFullAttributesFile(ObjectAttributes, FileInformation) {
    result := DllCall("ntdll.dll\NtQueryFullAttributesFile", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, FILE_NETWORK_OPEN_INFORMATION.Ptr, FileInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Opens an existing symbolic link.
 * @remarks
 * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
 * @param {Pointer<HANDLE>} LinkHandle A handle to the newly opened symbolic link object.
 * @param {Integer} DesiredAccess An [**ACCESS\_MASK**](../secauthz/access-mask.md) that specifies the requested access to the directory object. It is typical to use GENERIC\_READ so the handle can be passed to the [**NtQueryDirectoryObject**](ntquerydirectoryobject.md) function.
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes The attributes for the directory object. To initialize the **OBJECT\_ATTRIBUTES** structure, use the **InitializeObjectAttributes** macro. If the caller is not running in a system thread context, it must specify the **OBJ\_KERNEL\_HANDLE** flag when initializing the structure. For more information, see the documentation for these items in the documentation for the WDK.
 * @returns {NTSTATUS} The function returns **STATUS\_SUCCESS** or an error status.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/ntopensymboliclinkobject
 */
export NtOpenSymbolicLinkObject(LinkHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenSymbolicLinkObject", HANDLE.Ptr, LinkHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the target of a symbolic link.
 * @remarks
 * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
 * @param {HANDLE} LinkHandle A handle to the symbolic link object.
 * @param {Pointer<UNICODE_STRING>} LinkTarget A pointer to an initialized Unicode string that receives the target of the symbolic link. The **MaximumLength** and **Buffer** members must be set if the call fails.
 * @param {Pointer<Integer>} ReturnedLength A pointer to a variable that receives the length of the Unicode string returned in the *LinkTarget* parameter. If the function returns **STATUS\_BUFFER\_TOO\_SMALL**, this variable receives the required buffer size.
 * @returns {NTSTATUS} The function returns **STATUS\_SUCCESS** or an error status.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/ntquerysymboliclinkobject
 */
export NtQuerySymbolicLinkObject(LinkHandle, LinkTarget, ReturnedLength) {
    ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQuerySymbolicLinkObject", HANDLE, LinkHandle, UNICODE_STRING.Ptr, LinkTarget, ReturnedLengthMarshal, ReturnedLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves information about the specified directory object.
 * @remarks
 * The following is the definition of the **OBJECT\_DIRECTORY\_INFORMATION** structure.
 * 
 * ``` syntax
 * typedef struct _OBJECT_DIRECTORY_INFORMATION {
 *     UNICODE_STRING Name;
 *     UNICODE_STRING TypeName;
 * } OBJECT_DIRECTORY_INFORMATION, *POBJECT_DIRECTORY_INFORMATION;
 * ```
 * 
 * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
 * @param {HANDLE} DirectoryHandle A handle to the directory object.
 * @param {Pointer<Void>} _Buffer A pointer to a buffer that receives the directory information. This buffer receives one or more **OBJECT\_DIRECTORY\_INFORMATION** structures, the last one being **NULL**, followed by strings that contain the names of the directory entries. For more information, see Remarks.
 * @param {Integer} Length The size of the user-supplied output buffer, in bytes.
 * @param {BOOLEAN} ReturnSingleEntry Indicates whether the function should return only a single entry.
 * @param {BOOLEAN} RestartScan Indicates whether to restart the scan or continue the enumeration using the information passed in the *Context* parameter.
 * @param {Pointer<Integer>} _Context The enumeration context.
 * @param {Pointer<Integer>} ReturnLength A pointer to a variable that receives the length of the directory information returned in the output buffer, in bytes.
 * @returns {NTSTATUS} The function returns **STATUS\_SUCCESS** or an error status.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/ntquerydirectoryobject
 */
export NtQueryDirectoryObject(DirectoryHandle, _Buffer, Length, ReturnSingleEntry, RestartScan, _Context, ReturnLength) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "uint*" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryDirectoryObject", HANDLE, DirectoryHandle, _BufferMarshal, _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, BOOLEAN, RestartScan, _ContextMarshal, _Context, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} DirectoryHandle 
 * @param {Pointer<Void>} _Buffer 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {BOOLEAN} RestartScan 
 * @param {Pointer<Integer>} _Context 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryDirectoryObject(DirectoryHandle, _Buffer, Length, ReturnSingleEntry, RestartScan, _Context, ReturnLength) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "uint*" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryDirectoryObject", HANDLE, DirectoryHandle, _BufferMarshal, _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, BOOLEAN, RestartScan, _ContextMarshal, _Context, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {BOOLEAN} DisableAllPrivileges 
 * @param {Pointer<TOKEN_PRIVILEGES>} NewState 
 * @param {Integer} BufferLength 
 * @param {Integer} PreviousState 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwAdjustPrivilegesToken(TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwAdjustPrivilegesToken", HANDLE, TokenHandle, BOOLEAN, DisableAllPrivileges, TOKEN_PRIVILEGES.Ptr, NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {BOOLEAN} ResetToDefault 
 * @param {Pointer<TOKEN_GROUPS>} NewState 
 * @param {Integer} BufferLength 
 * @param {Integer} PreviousState 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwAdjustGroupsToken(TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwAdjustGroupsToken", HANDLE, TokenHandle, BOOLEAN, ResetToDefault, TOKEN_GROUPS.Ptr, NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ClientToken 
 * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges 
 * @param {Pointer<BOOLEAN>} Result 
 * @returns {NTSTATUS} 
 */
export ZwPrivilegeCheck(ClientToken, RequiredPrivileges, Result) {
    ResultMarshal := Result is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\ZwPrivilegeCheck", HANDLE, ClientToken, PRIVILEGE_SET.Ptr, RequiredPrivileges, ResultMarshal, Result, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwAccessCheckAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\ZwAccessCheckAndAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, "uint", DesiredAccess, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} PrincipalSelfSid 
 * @param {Integer} DesiredAccess 
 * @param {AUDIT_EVENT_TYPE} AuditType 
 * @param {Integer} Flags 
 * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
 * @param {Integer} ObjectTypeListLength 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwAccessCheckByTypeAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\ZwAccessCheckByTypeAndAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, PrincipalSelfSid, "uint", DesiredAccess, AUDIT_EVENT_TYPE, AuditType, "uint", Flags, OBJECT_TYPE_LIST.Ptr, ObjectTypeList, "uint", ObjectTypeListLength, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} PrincipalSelfSid 
 * @param {Integer} DesiredAccess 
 * @param {AUDIT_EVENT_TYPE} AuditType 
 * @param {Integer} Flags 
 * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
 * @param {Integer} ObjectTypeListLength 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwAccessCheckByTypeResultListAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\ZwAccessCheckByTypeResultListAndAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, PrincipalSelfSid, "uint", DesiredAccess, AUDIT_EVENT_TYPE, AuditType, "uint", Flags, OBJECT_TYPE_LIST.Ptr, ObjectTypeList, "uint", ObjectTypeListLength, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {HANDLE} ClientToken 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} PrincipalSelfSid 
 * @param {Integer} DesiredAccess 
 * @param {AUDIT_EVENT_TYPE} AuditType 
 * @param {Integer} Flags 
 * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
 * @param {Integer} ObjectTypeListLength 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwAccessCheckByTypeResultListAndAuditAlarmByHandle(SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, _SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\ZwAccessCheckByTypeResultListAndAuditAlarmByHandle", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, HANDLE, ClientToken, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, PrincipalSelfSid, "uint", DesiredAccess, AUDIT_EVENT_TYPE, AuditType, "uint", Flags, OBJECT_TYPE_LIST.Ptr, ObjectTypeList, "uint", ObjectTypeListLength, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {HANDLE} ClientToken 
 * @param {Integer} DesiredAccess 
 * @param {Integer} GrantedAccess 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @param {BOOLEAN} ObjectCreation 
 * @param {BOOLEAN} AccessGranted 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwOpenObjectAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\ZwOpenObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, HANDLE, ClientToken, "uint", DesiredAccess, "uint", GrantedAccess, PRIVILEGE_SET.Ptr, Privileges, BOOLEAN, ObjectCreation, BOOLEAN, AccessGranted, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {HANDLE} ClientToken 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @param {BOOLEAN} AccessGranted 
 * @returns {NTSTATUS} 
 */
export ZwPrivilegeObjectAuditAlarm(SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwPrivilegeObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, HANDLE, ClientToken, "uint", DesiredAccess, PRIVILEGE_SET.Ptr, Privileges, BOOLEAN, AccessGranted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {BOOLEAN} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwCloseObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwCloseObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, BOOLEAN, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {BOOLEAN} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ZwDeleteObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwDeleteObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, BOOLEAN, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<UNICODE_STRING>} ServiceName 
 * @param {HANDLE} ClientToken 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @param {BOOLEAN} AccessGranted 
 * @returns {NTSTATUS} 
 */
export ZwPrivilegedServiceAuditAlarm(SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted) {
    result := DllCall("ntdll.dll\ZwPrivilegedServiceAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, UNICODE_STRING.Ptr, ServiceName, HANDLE, ClientToken, PRIVILEGE_SET.Ptr, Privileges, BOOLEAN, AccessGranted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ExistingTokenHandle 
 * @param {Integer} Flags 
 * @param {Pointer<TOKEN_GROUPS>} SidsToDisable 
 * @param {Pointer<TOKEN_PRIVILEGES>} PrivilegesToDelete 
 * @param {Pointer<TOKEN_GROUPS>} RestrictedSids 
 * @param {Pointer<HANDLE>} NewTokenHandle 
 * @returns {NTSTATUS} 
 */
export ZwFilterToken(ExistingTokenHandle, Flags, SidsToDisable, PrivilegesToDelete, RestrictedSids, NewTokenHandle) {
    result := DllCall("ntdll.dll\ZwFilterToken", HANDLE, ExistingTokenHandle, "uint", Flags, TOKEN_GROUPS.Ptr, SidsToDisable, TOKEN_PRIVILEGES.Ptr, PrivilegesToDelete, TOKEN_GROUPS.Ptr, RestrictedSids, HANDLE.Ptr, NewTokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadHandle 
 * @returns {NTSTATUS} 
 */
export ZwImpersonateAnonymousToken(ThreadHandle) {
    result := DllCall("ntdll.dll\ZwImpersonateAnonymousToken", HANDLE, ThreadHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Integer>} MaximumSize 
 * @param {Integer} SectionPageProtection 
 * @param {Integer} AllocationAttributes 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
 * @param {Integer} ExtendedParameterCount 
 * @returns {NTSTATUS} 
 */
export ZwCreateSectionEx(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle, ExtendedParameters, ExtendedParameterCount) {
    MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateSectionEx", HANDLE.Ptr, SectionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, HANDLE, FileHandle, MEM_EXTENDED_PARAMETER.Ptr, ExtendedParameters, "uint", ExtendedParameterCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadHandle 
 * @param {Integer} DesiredAccess 
 * @param {BOOLEAN} OpenAsSelf 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenThreadToken(ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle) {
    result := DllCall("ntdll.dll\NtOpenThreadToken", HANDLE, ThreadHandle, "uint", DesiredAccess, BOOLEAN, OpenAsSelf, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenProcessToken(ProcessHandle, DesiredAccess, TokenHandle) {
    result := DllCall("ntdll.dll\NtOpenProcessToken", HANDLE, ProcessHandle, "uint", DesiredAccess, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ExistingTokenHandle 
 * @param {Integer} Flags 
 * @param {Pointer<TOKEN_GROUPS>} SidsToDisable 
 * @param {Pointer<TOKEN_PRIVILEGES>} PrivilegesToDelete 
 * @param {Pointer<TOKEN_GROUPS>} RestrictedSids 
 * @param {Pointer<HANDLE>} NewTokenHandle 
 * @returns {NTSTATUS} 
 */
export NtFilterToken(ExistingTokenHandle, Flags, SidsToDisable, PrivilegesToDelete, RestrictedSids, NewTokenHandle) {
    result := DllCall("ntdll.dll\NtFilterToken", HANDLE, ExistingTokenHandle, "uint", Flags, TOKEN_GROUPS.Ptr, SidsToDisable, TOKEN_PRIVILEGES.Ptr, PrivilegesToDelete, TOKEN_GROUPS.Ptr, RestrictedSids, HANDLE.Ptr, NewTokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadHandle 
 * @returns {NTSTATUS} 
 */
export NtImpersonateAnonymousToken(ThreadHandle) {
    result := DllCall("ntdll.dll\NtImpersonateAnonymousToken", HANDLE, ThreadHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {BOOLEAN} DisableAllPrivileges 
 * @param {Pointer<TOKEN_PRIVILEGES>} NewState 
 * @param {Integer} BufferLength 
 * @param {Integer} PreviousState 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtAdjustPrivilegesToken(TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtAdjustPrivilegesToken", HANDLE, TokenHandle, BOOLEAN, DisableAllPrivileges, TOKEN_PRIVILEGES.Ptr, NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {BOOLEAN} ResetToDefault 
 * @param {Pointer<TOKEN_GROUPS>} NewState 
 * @param {Integer} BufferLength 
 * @param {Integer} PreviousState 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtAdjustGroupsToken(TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtAdjustGroupsToken", HANDLE, TokenHandle, BOOLEAN, ResetToDefault, TOKEN_GROUPS.Ptr, NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ClientToken 
 * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges 
 * @param {Pointer<BOOLEAN>} Result 
 * @returns {NTSTATUS} 
 */
export NtPrivilegeCheck(ClientToken, RequiredPrivileges, Result) {
    ResultMarshal := Result is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\NtPrivilegeCheck", HANDLE, ClientToken, PRIVILEGE_SET.Ptr, RequiredPrivileges, ResultMarshal, Result, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtAccessCheckAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\NtAccessCheckAndAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, "uint", DesiredAccess, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} PrincipalSelfSid 
 * @param {Integer} DesiredAccess 
 * @param {AUDIT_EVENT_TYPE} AuditType 
 * @param {Integer} Flags 
 * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
 * @param {Integer} ObjectTypeListLength 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtAccessCheckByTypeAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\NtAccessCheckByTypeAndAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, PrincipalSelfSid, "uint", DesiredAccess, AUDIT_EVENT_TYPE, AuditType, "uint", Flags, OBJECT_TYPE_LIST.Ptr, ObjectTypeList, "uint", ObjectTypeListLength, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} PrincipalSelfSid 
 * @param {Integer} DesiredAccess 
 * @param {AUDIT_EVENT_TYPE} AuditType 
 * @param {Integer} Flags 
 * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
 * @param {Integer} ObjectTypeListLength 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtAccessCheckByTypeResultListAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\NtAccessCheckByTypeResultListAndAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, PrincipalSelfSid, "uint", DesiredAccess, AUDIT_EVENT_TYPE, AuditType, "uint", Flags, OBJECT_TYPE_LIST.Ptr, ObjectTypeList, "uint", ObjectTypeListLength, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {HANDLE} ClientToken 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} PrincipalSelfSid 
 * @param {Integer} DesiredAccess 
 * @param {AUDIT_EVENT_TYPE} AuditType 
 * @param {Integer} Flags 
 * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
 * @param {Integer} ObjectTypeListLength 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {BOOLEAN} ObjectCreation 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtAccessCheckByTypeResultListAndAuditAlarmByHandle(SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, _SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\NtAccessCheckByTypeResultListAndAuditAlarmByHandle", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, HANDLE, ClientToken, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, PrincipalSelfSid, "uint", DesiredAccess, AUDIT_EVENT_TYPE, AuditType, "uint", Flags, OBJECT_TYPE_LIST.Ptr, ObjectTypeList, "uint", ObjectTypeListLength, GENERIC_MAPPING.Ptr, GenericMapping, BOOLEAN, ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {HANDLE} ClientToken 
 * @param {Integer} DesiredAccess 
 * @param {Integer} GrantedAccess 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @param {BOOLEAN} ObjectCreation 
 * @param {BOOLEAN} AccessGranted 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtOpenObjectAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, _SecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\NtOpenObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, UNICODE_STRING.Ptr, ObjectTypeName, UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, HANDLE, ClientToken, "uint", DesiredAccess, "uint", GrantedAccess, PRIVILEGE_SET.Ptr, Privileges, BOOLEAN, ObjectCreation, BOOLEAN, AccessGranted, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {HANDLE} ClientToken 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @param {BOOLEAN} AccessGranted 
 * @returns {NTSTATUS} 
 */
export NtPrivilegeObjectAuditAlarm(SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtPrivilegeObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, HANDLE, ClientToken, "uint", DesiredAccess, PRIVILEGE_SET.Ptr, Privileges, BOOLEAN, AccessGranted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {BOOLEAN} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtCloseObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtCloseObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, BOOLEAN, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<Void>} HandleId 
 * @param {BOOLEAN} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export NtDeleteObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
    HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtDeleteObjectAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, HandleIdMarshal, HandleId, BOOLEAN, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SubsystemName 
 * @param {Pointer<UNICODE_STRING>} ServiceName 
 * @param {HANDLE} ClientToken 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @param {BOOLEAN} AccessGranted 
 * @returns {NTSTATUS} 
 */
export NtPrivilegedServiceAuditAlarm(SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted) {
    result := DllCall("ntdll.dll\NtPrivilegedServiceAuditAlarm", UNICODE_STRING.Ptr, SubsystemName, UNICODE_STRING.Ptr, ServiceName, HANDLE, ClientToken, PRIVILEGE_SET.Ptr, Privileges, BOOLEAN, AccessGranted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} HeapBase 
 * @param {Pointer} ReserveSize 
 * @param {Pointer} CommitSize 
 * @param {Pointer<Void>} Lock 
 * @param {Pointer<RTL_HEAP_PARAMETERS>} Parameters 
 * @returns {Pointer<Void>} 
 */
export RtlCreateHeap(Flags, HeapBase, ReserveSize, CommitSize, Lock, Parameters) {
    HeapBaseMarshal := HeapBase is VarRef ? "ptr" : "ptr"
    LockMarshal := Lock is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlCreateHeap", "uint", Flags, HeapBaseMarshal, HeapBase, "ptr", ReserveSize, "ptr", CommitSize, LockMarshal, Lock, RTL_HEAP_PARAMETERS.Ptr, Parameters, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} HeapHandle 
 * @returns {Pointer<Void>} 
 */
export RtlDestroyHeap(HeapHandle) {
    HeapHandleMarshal := HeapHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlDestroyHeap", HeapHandleMarshal, HeapHandle, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} HeapHandle 
 * @param {Integer} Flags 
 * @param {Pointer} _Size 
 * @returns {Pointer<Void>} 
 */
export RtlAllocateHeap(HeapHandle, Flags, _Size) {
    HeapHandleMarshal := HeapHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlAllocateHeap", HeapHandleMarshal, HeapHandle, "uint", Flags, "ptr", _Size, IntPtr)
    return result
}

/**
 * Frees a memory block that was allocated from a heap by RtlAllocateHeap.
 * @param {Pointer<Void>} HeapHandle A handle for the heap whose memory block is to be freed. This parameter is a handle returned by [**RtlCreateHeap**](/windows-hardware/drivers/ddi/ntifs/nf-ntifs-rtlcreateheap).
 * @param {Integer} Flags A set of flags that controls aspects of freeing a memory block. Specifying the following value overrides the corresponding value that was specified in the *Flags* parameter when the heap was created by [**RtlCreateHeap**](/windows-hardware/drivers/ddi/ntifs/nf-ntifs-rtlcreateheap).
 * 
 * 
 * 
 * | Flag                           | Meaning                                                                                   |
 * |--------------------------------|-------------------------------------------------------------------------------------------|
 * | HEAP\_NO\_SERIALIZE<br/> | Mutual exclusion will not be used when **RtlFreeHeap** is accessing the heap. <br/> |
 * @param {Pointer<Void>} BaseAddress 
 * @returns {Integer} Returns **TRUE** if the block was freed successfully; **FALSE** otherwise.
 * 
 * > [!Note]  
 * > Starting with Windows 8 the return value is typed as **LOGICAL**, which has a different size than **BOOLEAN**.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlfreeheap
 */
export RtlFreeHeap(HeapHandle, Flags, BaseAddress) {
    HeapHandleMarshal := HeapHandle is VarRef ? "ptr" : "ptr"
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlFreeHeap", HeapHandleMarshal, HeapHandle, "uint", Flags, BaseAddressMarshal, BaseAddress, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Seed 
 * @returns {Integer} 
 */
export RtlRandom(Seed) {
    SeedMarshal := Seed is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlRandom", SeedMarshal, Seed, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Seed 
 * @returns {Integer} 
 */
export RtlRandomEx(Seed) {
    SeedMarshal := Seed is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlRandomEx", SeedMarshal, Seed, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {PWSTR} SourceString 
 * @returns {NTSTATUS} 
 */
export RtlInitUnicodeStringEx(DestinationString, SourceString) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString

    result := DllCall("ntdll.dll\RtlInitUnicodeStringEx", UNICODE_STRING.Ptr, DestinationString, "ptr", SourceString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {PWSTR} SourceString 
 * @returns {BOOLEAN} 
 */
export RtlCreateUnicodeString(DestinationString, SourceString) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString

    result := DllCall("ntdll.dll\RtlCreateUnicodeString", UNICODE_STRING.Ptr, DestinationString, "ptr", SourceString, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} String1 
 * @param {Pointer<STRING>} String2 
 * @param {BOOLEAN} CaseInSensitive 
 * @returns {BOOLEAN} 
 */
export RtlPrefixString(String1, String2, CaseInSensitive) {
    result := DllCall("ntdll.dll\RtlPrefixString", STRING.Ptr, String1, STRING.Ptr, String2, BOOLEAN, CaseInSensitive, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} Destination 
 * @param {Pointer<STRING>} Source 
 * @returns {NTSTATUS} 
 */
export RtlAppendStringToString(Destination, Source) {
    result := DllCall("ntdll.dll\RtlAppendStringToString", STRING.Ptr, Destination, STRING.Ptr, Source, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {Pointer<STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlOemStringToUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlOemStringToUnicodeString", UNICODE_STRING.Ptr, DestinationString, STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlUpcaseUnicodeStringToOemString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlUpcaseUnicodeStringToOemString", STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {Pointer<STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlOemStringToCountedUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntoskrnl.exe\RtlOemStringToCountedUnicodeString", UNICODE_STRING.Ptr, DestinationString, STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeStringToCountedOemString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlUnicodeStringToCountedOemString", STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlUpcaseUnicodeStringToCountedOemString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlUpcaseUnicodeStringToCountedOemString", STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @returns {NTSTATUS} 
 */
export RtlValidateUnicodeString(_String) {
    static Flags := 0 ;Reserved parameters must always be NULL

    result := DllCall("ntdll.dll\RtlValidateUnicodeString", "uint", Flags, UNICODE_STRING.Ptr, _String, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer<UNICODE_STRING>} StringIn 
 * @param {Pointer<UNICODE_STRING>} StringOut 
 * @returns {NTSTATUS} 
 */
export RtlDuplicateUnicodeString(Flags, StringIn, StringOut) {
    result := DllCall("ntdll.dll\RtlDuplicateUnicodeString", "uint", Flags, UNICODE_STRING.Ptr, StringIn, UNICODE_STRING.Ptr, StringOut, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlDowncaseUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlDowncaseUnicodeString", UNICODE_STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} UnicodeString 
 * @returns {Integer} 
 */
export RtlxUnicodeStringToOemSize(UnicodeString) {
    result := DllCall("ntdll.dll\RtlxUnicodeStringToOemSize", UNICODE_STRING.Ptr, UnicodeString, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} OemString 
 * @returns {Integer} 
 */
export RtlxOemStringToUnicodeSize(OemString) {
    result := DllCall("ntdll.dll\RtlxOemStringToUnicodeSize", STRING.Ptr, OemString, UInt32)
    return result
}

/**
 * 
 * @param {Integer} UnicodeString 
 * @param {Integer} MaxBytesInUnicodeString 
 * @param {Pointer<Integer>} BytesInUnicodeString 
 * @param {Integer} MultiByteString 
 * @param {Integer} BytesInMultiByteString 
 * @returns {NTSTATUS} 
 */
export RtlMultiByteToUnicodeN(UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, MultiByteString, BytesInMultiByteString) {
    BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlMultiByteToUnicodeN", "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", MultiByteString, "uint", BytesInMultiByteString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} BytesInUnicodeString 
 * @param {Integer} MultiByteString 
 * @param {Integer} BytesInMultiByteString 
 * @returns {NTSTATUS} 
 */
export RtlMultiByteToUnicodeSize(BytesInUnicodeString, MultiByteString, BytesInMultiByteString) {
    BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlMultiByteToUnicodeSize", BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", MultiByteString, "uint", BytesInMultiByteString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} MultiByteString 
 * @param {Integer} MaxBytesInMultiByteString 
 * @param {Pointer<Integer>} BytesInMultiByteString 
 * @param {Integer} UnicodeString 
 * @param {Integer} BytesInUnicodeString 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeToMultiByteN(MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString) {
    BytesInMultiByteStringMarshal := BytesInMultiByteString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUnicodeToMultiByteN", "ptr", MultiByteString, "uint", MaxBytesInMultiByteString, BytesInMultiByteStringMarshal, BytesInMultiByteString, "ptr", UnicodeString, "uint", BytesInUnicodeString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} MultiByteString 
 * @param {Integer} MaxBytesInMultiByteString 
 * @param {Pointer<Integer>} BytesInMultiByteString 
 * @param {Integer} UnicodeString 
 * @param {Integer} BytesInUnicodeString 
 * @returns {NTSTATUS} 
 */
export RtlUpcaseUnicodeToMultiByteN(MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString) {
    BytesInMultiByteStringMarshal := BytesInMultiByteString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUpcaseUnicodeToMultiByteN", "ptr", MultiByteString, "uint", MaxBytesInMultiByteString, BytesInMultiByteStringMarshal, BytesInMultiByteString, "ptr", UnicodeString, "uint", BytesInUnicodeString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} UnicodeString 
 * @param {Integer} MaxBytesInUnicodeString 
 * @param {Pointer<Integer>} BytesInUnicodeString 
 * @param {Integer} OemString 
 * @param {Integer} BytesInOemString 
 * @returns {NTSTATUS} 
 */
export RtlOemToUnicodeN(UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, OemString, BytesInOemString) {
    BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlOemToUnicodeN", "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", OemString, "uint", BytesInOemString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} OemString 
 * @param {Integer} MaxBytesInOemString 
 * @param {Pointer<Integer>} BytesInOemString 
 * @param {Integer} UnicodeString 
 * @param {Integer} BytesInUnicodeString 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeToOemN(OemString, MaxBytesInOemString, BytesInOemString, UnicodeString, BytesInUnicodeString) {
    BytesInOemStringMarshal := BytesInOemString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUnicodeToOemN", "ptr", OemString, "uint", MaxBytesInOemString, BytesInOemStringMarshal, BytesInOemString, "ptr", UnicodeString, "uint", BytesInUnicodeString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} OemString 
 * @param {Integer} MaxBytesInOemString 
 * @param {Pointer<Integer>} BytesInOemString 
 * @param {Integer} UnicodeString 
 * @param {Integer} BytesInUnicodeString 
 * @returns {NTSTATUS} 
 */
export RtlUpcaseUnicodeToOemN(OemString, MaxBytesInOemString, BytesInOemString, UnicodeString, BytesInUnicodeString) {
    BytesInOemStringMarshal := BytesInOemString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUpcaseUnicodeToOemN", "ptr", OemString, "uint", MaxBytesInOemString, BytesInOemStringMarshal, BytesInOemString, "ptr", UnicodeString, "uint", BytesInUnicodeString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} NormForm 
 * @param {PWSTR} SourceString 
 * @param {Integer} SourceStringLength 
 * @param {PWSTR} DestinationString 
 * @param {Pointer<Integer>} DestinationStringLength 
 * @returns {NTSTATUS} 
 */
export RtlNormalizeString(NormForm, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
    DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

    DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlNormalizeString", "uint", NormForm, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} NormForm 
 * @param {PWSTR} SourceString 
 * @param {Integer} SourceStringLength 
 * @param {Pointer<BOOLEAN>} Normalized 
 * @returns {NTSTATUS} 
 */
export RtlIsNormalizedString(NormForm, SourceString, SourceStringLength, Normalized) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString

    NormalizedMarshal := Normalized is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlIsNormalizedString", "uint", NormForm, "ptr", SourceString, "int", SourceStringLength, NormalizedMarshal, Normalized, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {PWSTR} SourceString 
 * @param {Integer} SourceStringLength 
 * @param {PWSTR} DestinationString 
 * @param {Pointer<Integer>} DestinationStringLength 
 * @returns {NTSTATUS} 
 */
export RtlIdnToAscii(Flags, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
    DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

    DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlIdnToAscii", "uint", Flags, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {PWSTR} SourceString 
 * @param {Integer} SourceStringLength 
 * @param {PWSTR} DestinationString 
 * @param {Pointer<Integer>} DestinationStringLength 
 * @returns {NTSTATUS} 
 */
export RtlIdnToUnicode(Flags, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
    DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

    DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlIdnToUnicode", "uint", Flags, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {PWSTR} SourceString 
 * @param {Integer} SourceStringLength 
 * @param {PWSTR} DestinationString 
 * @param {Pointer<Integer>} DestinationStringLength 
 * @returns {NTSTATUS} 
 */
export RtlIdnToNameprepUnicode(Flags, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
    SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
    DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

    DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlIdnToNameprepUnicode", "uint", Flags, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {BOOLEAN} AllowExtendedCharacters 
 * @param {Pointer<GENERATE_NAME_CONTEXT>} _Context 
 * @param {Pointer<UNICODE_STRING>} Name8dot3 
 * @returns {NTSTATUS} 
 */
export RtlGenerate8dot3Name(Name, AllowExtendedCharacters, _Context, Name8dot3) {
    result := DllCall("ntdll.dll\RtlGenerate8dot3Name", UNICODE_STRING.Ptr, Name, BOOLEAN, AllowExtendedCharacters, GENERATE_NAME_CONTEXT.Ptr, _Context, UNICODE_STRING.Ptr, Name8dot3, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PWSTR} _Char 
 * @returns {BOOLEAN} 
 */
export RtlIsValidOemCharacter(_Char) {
    _Char := _Char is String ? StrPtr(_Char) : _Char

    result := DllCall("ntoskrnl.exe\RtlIsValidOemCharacter", "ptr", _Char, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PREFIX_TABLE>} PrefixTable 
 * @returns {String} Nothing - always returns an empty string
 */
export PfxInitialize(PrefixTable) {
    DllCall("ntdll.dll\PfxInitialize", PREFIX_TABLE.Ptr, PrefixTable)
}

/**
 * 
 * @param {Pointer<PREFIX_TABLE>} PrefixTable 
 * @param {Pointer<STRING>} Prefix 
 * @param {Pointer<PREFIX_TABLE_ENTRY>} PrefixTableEntry 
 * @returns {BOOLEAN} 
 */
export PfxInsertPrefix(PrefixTable, Prefix, PrefixTableEntry) {
    result := DllCall("ntdll.dll\PfxInsertPrefix", PREFIX_TABLE.Ptr, PrefixTable, STRING.Ptr, Prefix, PREFIX_TABLE_ENTRY.Ptr, PrefixTableEntry, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PREFIX_TABLE>} PrefixTable 
 * @param {Pointer<PREFIX_TABLE_ENTRY>} PrefixTableEntry 
 * @returns {String} Nothing - always returns an empty string
 */
export PfxRemovePrefix(PrefixTable, PrefixTableEntry) {
    DllCall("ntdll.dll\PfxRemovePrefix", PREFIX_TABLE.Ptr, PrefixTable, PREFIX_TABLE_ENTRY.Ptr, PrefixTableEntry)
}

/**
 * 
 * @param {Pointer<PREFIX_TABLE>} PrefixTable 
 * @param {Pointer<STRING>} FullName 
 * @returns {Pointer<PREFIX_TABLE_ENTRY>} 
 */
export PfxFindPrefix(PrefixTable, FullName) {
    result := DllCall("ntdll.dll\PfxFindPrefix", PREFIX_TABLE.Ptr, PrefixTable, STRING.Ptr, FullName, PREFIX_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlInitializeUnicodePrefix(PrefixTable) {
    DllCall("ntoskrnl.exe\RtlInitializeUnicodePrefix", UNICODE_PREFIX_TABLE.Ptr, PrefixTable)
}

/**
 * 
 * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
 * @param {Pointer<UNICODE_STRING>} Prefix 
 * @param {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} PrefixTableEntry 
 * @returns {BOOLEAN} 
 */
export RtlInsertUnicodePrefix(PrefixTable, Prefix, PrefixTableEntry) {
    result := DllCall("ntoskrnl.exe\RtlInsertUnicodePrefix", UNICODE_PREFIX_TABLE.Ptr, PrefixTable, UNICODE_STRING.Ptr, Prefix, UNICODE_PREFIX_TABLE_ENTRY.Ptr, PrefixTableEntry, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
 * @param {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} PrefixTableEntry 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlRemoveUnicodePrefix(PrefixTable, PrefixTableEntry) {
    DllCall("ntoskrnl.exe\RtlRemoveUnicodePrefix", UNICODE_PREFIX_TABLE.Ptr, PrefixTable, UNICODE_PREFIX_TABLE_ENTRY.Ptr, PrefixTableEntry)
}

/**
 * 
 * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
 * @param {Pointer<UNICODE_STRING>} FullName 
 * @param {Integer} CaseInsensitiveIndex 
 * @returns {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} 
 */
export RtlFindUnicodePrefix(PrefixTable, FullName, CaseInsensitiveIndex) {
    result := DllCall("ntoskrnl.exe\RtlFindUnicodePrefix", UNICODE_PREFIX_TABLE.Ptr, PrefixTable, UNICODE_STRING.Ptr, FullName, "uint", CaseInsensitiveIndex, UNICODE_PREFIX_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
 * @param {BOOLEAN} Restart 
 * @returns {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} 
 */
export RtlNextUnicodePrefix(PrefixTable, Restart) {
    result := DllCall("ntoskrnl.exe\RtlNextUnicodePrefix", UNICODE_PREFIX_TABLE.Ptr, PrefixTable, BOOLEAN, Restart, UNICODE_PREFIX_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormatAndEngine 
 * @param {Pointer<Integer>} CompressBufferWorkSpaceSize 
 * @param {Pointer<Integer>} CompressFragmentWorkSpaceSize 
 * @returns {NTSTATUS} 
 */
export RtlGetCompressionWorkSpaceSize(CompressionFormatAndEngine, CompressBufferWorkSpaceSize, CompressFragmentWorkSpaceSize) {
    CompressBufferWorkSpaceSizeMarshal := CompressBufferWorkSpaceSize is VarRef ? "uint*" : "ptr"
    CompressFragmentWorkSpaceSizeMarshal := CompressFragmentWorkSpaceSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetCompressionWorkSpaceSize", "ushort", CompressionFormatAndEngine, CompressBufferWorkSpaceSizeMarshal, CompressBufferWorkSpaceSize, CompressFragmentWorkSpaceSizeMarshal, CompressFragmentWorkSpaceSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormatAndEngine 
 * @param {Integer} UncompressedBuffer 
 * @param {Integer} UncompressedBufferSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Integer} UncompressedChunkSize 
 * @param {Pointer<Integer>} FinalCompressedSize 
 * @param {Pointer<Void>} _WorkSpace 
 * @returns {NTSTATUS} 
 */
export RtlCompressBuffer(CompressionFormatAndEngine, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, UncompressedChunkSize, FinalCompressedSize, _WorkSpace) {
    FinalCompressedSizeMarshal := FinalCompressedSize is VarRef ? "uint*" : "ptr"
    _WorkSpaceMarshal := _WorkSpace is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlCompressBuffer", "ushort", CompressionFormatAndEngine, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", UncompressedChunkSize, FinalCompressedSizeMarshal, FinalCompressedSize, _WorkSpaceMarshal, _WorkSpace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Integer} UncompressedBuffer 
 * @param {Integer} UncompressedBufferSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Pointer<Integer>} FinalUncompressedSize 
 * @returns {NTSTATUS} 
 */
export RtlDecompressBuffer(CompressionFormat, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, FinalUncompressedSize) {
    FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlDecompressBuffer", "ushort", CompressionFormat, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Integer} UncompressedBuffer 
 * @param {Integer} UncompressedBufferSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Pointer<Integer>} FinalUncompressedSize 
 * @param {Pointer<Void>} _WorkSpace 
 * @returns {NTSTATUS} 
 */
export RtlDecompressBufferEx(CompressionFormat, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, FinalUncompressedSize, _WorkSpace) {
    FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
    _WorkSpaceMarshal := _WorkSpace is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlDecompressBufferEx", "ushort", CompressionFormat, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, _WorkSpaceMarshal, _WorkSpace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Integer} UncompressedBuffer 
 * @param {Integer} UncompressedBufferSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Integer} UncompressedChunkSize 
 * @param {Pointer<Integer>} FinalUncompressedSize 
 * @param {Pointer<Void>} _WorkSpace 
 * @returns {NTSTATUS} 
 */
export RtlDecompressBufferEx2(CompressionFormat, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, UncompressedChunkSize, FinalUncompressedSize, _WorkSpace) {
    FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
    _WorkSpaceMarshal := _WorkSpace is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlDecompressBufferEx2", "ushort", CompressionFormat, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", UncompressedChunkSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, _WorkSpaceMarshal, _WorkSpace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Integer} UncompressedFragment 
 * @param {Integer} UncompressedFragmentSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Integer} FragmentOffset 
 * @param {Pointer<Integer>} FinalUncompressedSize 
 * @param {Pointer<Void>} _WorkSpace 
 * @returns {NTSTATUS} 
 */
export RtlDecompressFragment(CompressionFormat, UncompressedFragment, UncompressedFragmentSize, CompressedBuffer, CompressedBufferSize, FragmentOffset, FinalUncompressedSize, _WorkSpace) {
    FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
    _WorkSpaceMarshal := _WorkSpace is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlDecompressFragment", "ushort", CompressionFormat, "ptr", UncompressedFragment, "uint", UncompressedFragmentSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", FragmentOffset, FinalUncompressedSizeMarshal, FinalUncompressedSize, _WorkSpaceMarshal, _WorkSpace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Integer} UncompressedFragment 
 * @param {Integer} UncompressedFragmentSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Integer} FragmentOffset 
 * @param {Integer} UncompressedChunkSize 
 * @param {Pointer<Integer>} FinalUncompressedSize 
 * @param {Pointer<Void>} _WorkSpace 
 * @returns {NTSTATUS} 
 */
export RtlDecompressFragmentEx(CompressionFormat, UncompressedFragment, UncompressedFragmentSize, CompressedBuffer, CompressedBufferSize, FragmentOffset, UncompressedChunkSize, FinalUncompressedSize, _WorkSpace) {
    FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
    _WorkSpaceMarshal := _WorkSpace is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlDecompressFragmentEx", "ushort", CompressionFormat, "ptr", UncompressedFragment, "uint", UncompressedFragmentSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", FragmentOffset, "uint", UncompressedChunkSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, _WorkSpaceMarshal, _WorkSpace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Pointer<Pointer<Integer>>} CompressedBuffer 
 * @param {Pointer<Integer>} EndOfCompressedBufferPlus1 
 * @param {Pointer<Pointer<Integer>>} ChunkBuffer 
 * @param {Pointer<Integer>} ChunkSize 
 * @returns {NTSTATUS} 
 */
export RtlDescribeChunk(CompressionFormat, CompressedBuffer, EndOfCompressedBufferPlus1, ChunkBuffer, ChunkSize) {
    CompressedBufferMarshal := CompressedBuffer is VarRef ? "ptr*" : "ptr"
    EndOfCompressedBufferPlus1Marshal := EndOfCompressedBufferPlus1 is VarRef ? "char*" : "ptr"
    ChunkBufferMarshal := ChunkBuffer is VarRef ? "ptr*" : "ptr"
    ChunkSizeMarshal := ChunkSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlDescribeChunk", "ushort", CompressionFormat, CompressedBufferMarshal, CompressedBuffer, EndOfCompressedBufferPlus1Marshal, EndOfCompressedBufferPlus1, ChunkBufferMarshal, ChunkBuffer, ChunkSizeMarshal, ChunkSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} CompressionFormat 
 * @param {Pointer<Pointer<Integer>>} CompressedBuffer 
 * @param {Pointer<Integer>} EndOfCompressedBufferPlus1 
 * @param {Pointer<Pointer<Integer>>} ChunkBuffer 
 * @param {Integer} ChunkSize 
 * @returns {NTSTATUS} 
 */
export RtlReserveChunk(CompressionFormat, CompressedBuffer, EndOfCompressedBufferPlus1, ChunkBuffer, ChunkSize) {
    CompressedBufferMarshal := CompressedBuffer is VarRef ? "ptr*" : "ptr"
    EndOfCompressedBufferPlus1Marshal := EndOfCompressedBufferPlus1 is VarRef ? "char*" : "ptr"
    ChunkBufferMarshal := ChunkBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlReserveChunk", "ushort", CompressionFormat, CompressedBufferMarshal, CompressedBuffer, EndOfCompressedBufferPlus1Marshal, EndOfCompressedBufferPlus1, ChunkBufferMarshal, ChunkBuffer, "uint", ChunkSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} UncompressedBuffer 
 * @param {Integer} UncompressedBufferSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Integer} CompressedTail 
 * @param {Integer} CompressedTailSize 
 * @param {Pointer<COMPRESSED_DATA_INFO>} CompressedDataInfo 
 * @returns {NTSTATUS} 
 */
export RtlDecompressChunks(UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, CompressedTail, CompressedTailSize, CompressedDataInfo) {
    result := DllCall("ntoskrnl.exe\RtlDecompressChunks", "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "ptr", CompressedTail, "uint", CompressedTailSize, COMPRESSED_DATA_INFO.Ptr, CompressedDataInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} UncompressedBuffer 
 * @param {Integer} UncompressedBufferSize 
 * @param {Integer} CompressedBuffer 
 * @param {Integer} CompressedBufferSize 
 * @param {Integer} CompressedDataInfo 
 * @param {Integer} CompressedDataInfoLength 
 * @param {Pointer<Void>} _WorkSpace 
 * @returns {NTSTATUS} 
 */
export RtlCompressChunks(UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, CompressedDataInfo, CompressedDataInfoLength, _WorkSpace) {
    _WorkSpaceMarshal := _WorkSpace is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlCompressChunks", "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "ptr", CompressedDataInfo, "uint", CompressedDataInfoLength, _WorkSpaceMarshal, _WorkSpace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Source 
 * @param {Pointer} Length 
 * @param {Integer} Pattern 
 * @returns {Pointer} 
 */
export RtlCompareMemoryUlong(Source, Length, Pattern) {
    result := DllCall("ntdll.dll\RtlCompareMemoryUlong", "ptr", Source, "ptr", Length, "uint", Pattern, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Time 
 * @param {Pointer<Integer>} ElapsedSeconds 
 * @returns {BOOLEAN} 
 */
export RtlTimeToSecondsSince1980(Time, ElapsedSeconds) {
    TimeMarshal := Time is VarRef ? "int64*" : "ptr"
    ElapsedSecondsMarshal := ElapsedSeconds is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlTimeToSecondsSince1980", TimeMarshal, Time, ElapsedSecondsMarshal, ElapsedSeconds, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} ElapsedSeconds 
 * @param {Pointer<Integer>} Time 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlSecondsSince1980ToTime(ElapsedSeconds, Time) {
    TimeMarshal := Time is VarRef ? "int64*" : "ptr"

    DllCall("ntdll.dll\RtlSecondsSince1980ToTime", "uint", ElapsedSeconds, TimeMarshal, Time)
}

/**
 * 
 * @param {Integer} ElapsedSeconds 
 * @param {Pointer<Integer>} Time 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlSecondsSince1970ToTime(ElapsedSeconds, Time) {
    TimeMarshal := Time is VarRef ? "int64*" : "ptr"

    DllCall("ntdll.dll\RtlSecondsSince1970ToTime", "uint", ElapsedSeconds, TimeMarshal, Time)
}

/**
 * 
 * @param {PSID} _Sid 
 * @returns {BOOLEAN} 
 */
export RtlValidSid(_Sid) {
    result := DllCall("ntdll.dll\RtlValidSid", PSID, _Sid, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSID} Sid1 
 * @param {PSID} Sid2 
 * @returns {BOOLEAN} 
 */
export RtlEqualSid(Sid1, Sid2) {
    result := DllCall("ntdll.dll\RtlEqualSid", PSID, Sid1, PSID, Sid2, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSID} Sid1 
 * @param {PSID} Sid2 
 * @returns {BOOLEAN} 
 */
export RtlEqualPrefixSid(Sid1, Sid2) {
    result := DllCall("ntdll.dll\RtlEqualPrefixSid", PSID, Sid1, PSID, Sid2, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} SubAuthorityCount 
 * @returns {Integer} 
 */
export RtlLengthRequiredSid(SubAuthorityCount) {
    result := DllCall("ntdll.dll\RtlLengthRequiredSid", "uint", SubAuthorityCount, UInt32)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @returns {Pointer<Void>} 
 */
export RtlFreeSid(_Sid) {
    result := DllCall("ntdll.dll\RtlFreeSid", PSID, _Sid, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
 * @param {Integer} SubAuthorityCount 
 * @param {Integer} SubAuthority0 
 * @param {Integer} SubAuthority1 
 * @param {Integer} SubAuthority2 
 * @param {Integer} SubAuthority3 
 * @param {Integer} SubAuthority4 
 * @param {Integer} SubAuthority5 
 * @param {Integer} SubAuthority6 
 * @param {Integer} SubAuthority7 
 * @param {Pointer<PSID>} _Sid 
 * @returns {NTSTATUS} 
 */
export RtlAllocateAndInitializeSid(IdentifierAuthority, SubAuthorityCount, SubAuthority0, SubAuthority1, SubAuthority2, SubAuthority3, SubAuthority4, SubAuthority5, SubAuthority6, SubAuthority7, _Sid) {
    _SidMarshal := _Sid is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlAllocateAndInitializeSid", SID_IDENTIFIER_AUTHORITY.Ptr, IdentifierAuthority, "char", SubAuthorityCount, "uint", SubAuthority0, "uint", SubAuthority1, "uint", SubAuthority2, "uint", SubAuthority3, "uint", SubAuthority4, "uint", SubAuthority5, "uint", SubAuthority6, "uint", SubAuthority7, _SidMarshal, _Sid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
 * @param {Integer} SubAuthorityCount 
 * @param {Pointer<Integer>} SubAuthorities 
 * @param {Pointer<PSID>} _Sid 
 * @returns {NTSTATUS} 
 */
export RtlAllocateAndInitializeSidEx(IdentifierAuthority, SubAuthorityCount, SubAuthorities, _Sid) {
    SubAuthoritiesMarshal := SubAuthorities is VarRef ? "uint*" : "ptr"
    _SidMarshal := _Sid is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlAllocateAndInitializeSidEx", SID_IDENTIFIER_AUTHORITY.Ptr, IdentifierAuthority, "char", SubAuthorityCount, SubAuthoritiesMarshal, SubAuthorities, _SidMarshal, _Sid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
 * @param {Integer} SubAuthorityCount 
 * @returns {NTSTATUS} 
 */
export RtlInitializeSid(_Sid, IdentifierAuthority, SubAuthorityCount) {
    result := DllCall("ntdll.dll\RtlInitializeSid", PSID, _Sid, SID_IDENTIFIER_AUTHORITY.Ptr, IdentifierAuthority, "char", SubAuthorityCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
 * @param {Integer} SubAuthorityCount 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {NTSTATUS} 
 */
export RtlInitializeSidEx(_Sid, IdentifierAuthority, SubAuthorityCount, args*) {
    varArgs := [args*]
    varArgs.Push(NTSTATUS)

    result := DllCall("ntdll.dll\RtlInitializeSidEx", PSID, _Sid, SID_IDENTIFIER_AUTHORITY.Ptr, IdentifierAuthority, "char", SubAuthorityCount, varArgs*)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @returns {Pointer<SID_IDENTIFIER_AUTHORITY>} 
 */
export RtlIdentifierAuthoritySid(_Sid) {
    result := DllCall("ntdll.dll\RtlIdentifierAuthoritySid", PSID, _Sid, SID_IDENTIFIER_AUTHORITY.Ptr)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @param {Integer} SubAuthority 
 * @returns {Pointer<Integer>} 
 */
export RtlSubAuthoritySid(_Sid, SubAuthority) {
    result := DllCall("ntdll.dll\RtlSubAuthoritySid", PSID, _Sid, "uint", SubAuthority, IntPtr)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @returns {Pointer<Integer>} 
 */
export RtlSubAuthorityCountSid(_Sid) {
    result := DllCall("ntdll.dll\RtlSubAuthorityCountSid", PSID, _Sid, IntPtr)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @returns {Integer} 
 */
export RtlLengthSid(_Sid) {
    result := DllCall("ntdll.dll\RtlLengthSid", PSID, _Sid, UInt32)
    return result
}

/**
 * 
 * @param {Integer} DestinationSidLength 
 * @param {Integer} DestinationSid 
 * @param {PSID} SourceSid 
 * @returns {NTSTATUS} 
 */
export RtlCopySid(DestinationSidLength, DestinationSid, SourceSid) {
    result := DllCall("ntdll.dll\RtlCopySid", "uint", DestinationSidLength, "ptr", DestinationSid, PSID, SourceSid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ServiceName 
 * @param {Integer} ServiceSid 
 * @param {Pointer<Integer>} ServiceSidLength 
 * @returns {NTSTATUS} 
 */
export RtlCreateServiceSid(ServiceName, ServiceSid, ServiceSidLength) {
    ServiceSidLengthMarshal := ServiceSidLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlCreateServiceSid", UNICODE_STRING.Ptr, ServiceName, "ptr", ServiceSid, ServiceSidLengthMarshal, ServiceSidLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<BOOLEAN>} SaclPresent 
 * @param {Pointer<Pointer<ACL>>} Sacl 
 * @param {Pointer<BOOLEAN>} SaclDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlGetSaclSecurityDescriptor(_SecurityDescriptor, SaclPresent, Sacl, SaclDefaulted) {
    SaclPresentMarshal := SaclPresent is VarRef ? "char*" : "ptr"
    SaclMarshal := Sacl is VarRef ? "ptr*" : "ptr"
    SaclDefaultedMarshal := SaclDefaulted is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetSaclSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, SaclPresentMarshal, SaclPresent, SaclMarshal, Sacl, SaclDefaultedMarshal, SaclDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} OldSid 
 * @param {PSID} NewSid 
 * @param {Pointer<Integer>} NumChanges 
 * @returns {NTSTATUS} 
 */
export RtlReplaceSidInSd(_SecurityDescriptor, OldSid, NewSid, NumChanges) {
    NumChangesMarshal := NumChanges is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlReplaceSidInSd", PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, OldSid, PSID, NewSid, NumChangesMarshal, NumChanges, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {Integer} BaseSubAuthority 
 * @param {Integer} _Sid 
 * @param {Pointer<Integer>} SidLength 
 * @returns {NTSTATUS} 
 */
export RtlCreateVirtualAccountSid(Name, BaseSubAuthority, _Sid, SidLength) {
    SidLengthMarshal := SidLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlCreateVirtualAccountSid", UNICODE_STRING.Ptr, Name, "uint", BaseSubAuthority, "ptr", _Sid, SidLengthMarshal, SidLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LUID>} DestinationLuid 
 * @param {Pointer<LUID>} SourceLuid 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlCopyLuid(DestinationLuid, SourceLuid) {
    DllCall("ntdll.dll\RtlCopyLuid", LUID.Ptr, DestinationLuid, LUID.Ptr, SourceLuid)
}

/**
 * 
 * @param {Integer} _Acl 
 * @param {Integer} AclLength 
 * @param {Integer} AclRevision 
 * @returns {NTSTATUS} 
 */
export RtlCreateAcl(_Acl, AclLength, AclRevision) {
    result := DllCall("ntdll.dll\RtlCreateAcl", "ptr", _Acl, "uint", AclLength, "uint", AclRevision, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ACL>} _Acl 
 * @param {Integer} AceRevision 
 * @param {Integer} StartingAceIndex 
 * @param {Integer} AceList 
 * @param {Integer} AceListLength 
 * @returns {NTSTATUS} 
 */
export RtlAddAce(_Acl, AceRevision, StartingAceIndex, AceList, AceListLength) {
    result := DllCall("ntdll.dll\RtlAddAce", ACL.Ptr, _Acl, "uint", AceRevision, "uint", StartingAceIndex, "ptr", AceList, "uint", AceListLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ACL>} _Acl 
 * @param {Integer} AceIndex 
 * @returns {NTSTATUS} 
 */
export RtlDeleteAce(_Acl, AceIndex) {
    result := DllCall("ntdll.dll\RtlDeleteAce", ACL.Ptr, _Acl, "uint", AceIndex, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ACL>} _Acl 
 * @param {Integer} AceIndex 
 * @param {Pointer<Pointer<Void>>} Ace 
 * @returns {NTSTATUS} 
 */
export RtlGetAce(_Acl, AceIndex, Ace) {
    AceMarshal := Ace is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetAce", ACL.Ptr, _Acl, "uint", AceIndex, AceMarshal, Ace, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ACL>} _Acl 
 * @param {Integer} AceRevision 
 * @param {Integer} AccessMask 
 * @param {PSID} _Sid 
 * @returns {NTSTATUS} 
 */
export RtlAddAccessAllowedAce(_Acl, AceRevision, AccessMask, _Sid) {
    result := DllCall("ntdll.dll\RtlAddAccessAllowedAce", ACL.Ptr, _Acl, "uint", AceRevision, "uint", AccessMask, PSID, _Sid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ACL>} _Acl 
 * @param {Integer} AceRevision 
 * @param {Integer} AceFlags 
 * @param {Integer} AccessMask 
 * @param {PSID} _Sid 
 * @returns {NTSTATUS} 
 */
export RtlAddAccessAllowedAceEx(_Acl, AceRevision, AceFlags, AccessMask, _Sid) {
    result := DllCall("ntdll.dll\RtlAddAccessAllowedAceEx", ACL.Ptr, _Acl, "uint", AceRevision, "uint", AceFlags, "uint", AccessMask, PSID, _Sid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<BOOLEAN>} DaclPresent 
 * @param {Pointer<Pointer<ACL>>} Dacl 
 * @param {Pointer<BOOLEAN>} DaclDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlGetDaclSecurityDescriptor(_SecurityDescriptor, DaclPresent, Dacl, DaclDefaulted) {
    DaclPresentMarshal := DaclPresent is VarRef ? "char*" : "ptr"
    DaclMarshal := Dacl is VarRef ? "ptr*" : "ptr"
    DaclDefaultedMarshal := DaclDefaulted is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetDaclSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, DaclPresentMarshal, DaclPresent, DaclMarshal, Dacl, DaclDefaultedMarshal, DaclDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} Owner 
 * @param {BOOLEAN} OwnerDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlSetOwnerSecurityDescriptor(_SecurityDescriptor, Owner, OwnerDefaulted) {
    result := DllCall("ntdll.dll\RtlSetOwnerSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, Owner, BOOLEAN, OwnerDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSID} Group 
 * @param {BOOLEAN} GroupDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlSetGroupSecurityDescriptor(_SecurityDescriptor, Group, GroupDefaulted) {
    result := DllCall("ntdll.dll\RtlSetGroupSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSID, Group, BOOLEAN, GroupDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<PSID>} Group 
 * @param {Pointer<BOOLEAN>} GroupDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlGetGroupSecurityDescriptor(_SecurityDescriptor, Group, GroupDefaulted) {
    GroupMarshal := Group is VarRef ? "ptr*" : "ptr"
    GroupDefaultedMarshal := GroupDefaulted is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetGroupSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, GroupMarshal, Group, GroupDefaultedMarshal, GroupDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} AbsoluteSecurityDescriptor 
 * @param {Integer} SelfRelativeSecurityDescriptor 
 * @param {Pointer<Integer>} BufferLength 
 * @returns {NTSTATUS} 
 */
export RtlAbsoluteToSelfRelativeSD(AbsoluteSecurityDescriptor, SelfRelativeSecurityDescriptor, BufferLength) {
    BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlAbsoluteToSelfRelativeSD", PSECURITY_DESCRIPTOR, AbsoluteSecurityDescriptor, "ptr", SelfRelativeSecurityDescriptor, BufferLengthMarshal, BufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} SelfRelativeSecurityDescriptor 
 * @param {Integer} AbsoluteSecurityDescriptor 
 * @param {Pointer<Integer>} AbsoluteSecurityDescriptorSize 
 * @param {Integer} Dacl 
 * @param {Pointer<Integer>} DaclSize 
 * @param {Integer} Sacl 
 * @param {Pointer<Integer>} SaclSize 
 * @param {Integer} Owner 
 * @param {Pointer<Integer>} OwnerSize 
 * @param {Integer} PrimaryGroup 
 * @param {Pointer<Integer>} PrimaryGroupSize 
 * @returns {NTSTATUS} 
 */
export RtlSelfRelativeToAbsoluteSD(SelfRelativeSecurityDescriptor, AbsoluteSecurityDescriptor, AbsoluteSecurityDescriptorSize, Dacl, DaclSize, Sacl, SaclSize, Owner, OwnerSize, PrimaryGroup, PrimaryGroupSize) {
    AbsoluteSecurityDescriptorSizeMarshal := AbsoluteSecurityDescriptorSize is VarRef ? "uint*" : "ptr"
    DaclSizeMarshal := DaclSize is VarRef ? "uint*" : "ptr"
    SaclSizeMarshal := SaclSize is VarRef ? "uint*" : "ptr"
    OwnerSizeMarshal := OwnerSize is VarRef ? "uint*" : "ptr"
    PrimaryGroupSizeMarshal := PrimaryGroupSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlSelfRelativeToAbsoluteSD", PSECURITY_DESCRIPTOR, SelfRelativeSecurityDescriptor, "ptr", AbsoluteSecurityDescriptor, AbsoluteSecurityDescriptorSizeMarshal, AbsoluteSecurityDescriptorSize, "ptr", Dacl, DaclSizeMarshal, DaclSize, "ptr", Sacl, SaclSizeMarshal, SaclSize, "ptr", Owner, OwnerSizeMarshal, OwnerSize, "ptr", PrimaryGroup, PrimaryGroupSizeMarshal, PrimaryGroupSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<PSID>} Owner 
 * @param {Pointer<BOOLEAN>} OwnerDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlGetOwnerSecurityDescriptor(_SecurityDescriptor, Owner, OwnerDefaulted) {
    OwnerMarshal := Owner is VarRef ? "ptr*" : "ptr"
    OwnerDefaultedMarshal := OwnerDefaulted is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetOwnerSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, OwnerMarshal, Owner, OwnerDefaultedMarshal, OwnerDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {NTSTATUS} _Status 
 * @returns {Integer} 
 */
export RtlNtStatusToDosErrorNoTeb(_Status) {
    result := DllCall("ntdll.dll\RtlNtStatusToDosErrorNoTeb", NTSTATUS, _Status, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<CPTABLEINFO>} CustomCP 
 * @param {Integer} UnicodeString 
 * @param {Integer} MaxBytesInUnicodeString 
 * @param {Pointer<Integer>} BytesInUnicodeString 
 * @param {Integer} CustomCPString 
 * @param {Integer} BytesInCustomCPString 
 * @returns {NTSTATUS} 
 */
export RtlCustomCPToUnicodeN(CustomCP, UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, CustomCPString, BytesInCustomCPString) {
    BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlCustomCPToUnicodeN", CPTABLEINFO.Ptr, CustomCP, "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", CustomCPString, "uint", BytesInCustomCPString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CPTABLEINFO>} CustomCP 
 * @param {Integer} CustomCPString 
 * @param {Integer} MaxBytesInCustomCPString 
 * @param {Pointer<Integer>} BytesInCustomCPString 
 * @param {Integer} UnicodeString 
 * @param {Integer} BytesInUnicodeString 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeToCustomCPN(CustomCP, CustomCPString, MaxBytesInCustomCPString, BytesInCustomCPString, UnicodeString, BytesInUnicodeString) {
    BytesInCustomCPStringMarshal := BytesInCustomCPString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUnicodeToCustomCPN", CPTABLEINFO.Ptr, CustomCP, "ptr", CustomCPString, "uint", MaxBytesInCustomCPString, BytesInCustomCPStringMarshal, BytesInCustomCPString, "ptr", UnicodeString, "uint", BytesInUnicodeString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CPTABLEINFO>} CustomCP 
 * @param {Integer} CustomCPString 
 * @param {Integer} MaxBytesInCustomCPString 
 * @param {Pointer<Integer>} BytesInCustomCPString 
 * @param {Integer} UnicodeString 
 * @param {Integer} BytesInUnicodeString 
 * @returns {NTSTATUS} 
 */
export RtlUpcaseUnicodeToCustomCPN(CustomCP, CustomCPString, MaxBytesInCustomCPString, BytesInCustomCPString, UnicodeString, BytesInUnicodeString) {
    BytesInCustomCPStringMarshal := BytesInCustomCPString is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUpcaseUnicodeToCustomCPN", CPTABLEINFO.Ptr, CustomCP, "ptr", CustomCPString, "uint", MaxBytesInCustomCPString, BytesInCustomCPStringMarshal, BytesInCustomCPString, "ptr", UnicodeString, "uint", BytesInUnicodeString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} TableBase 
 * @param {Pointer<CPTABLEINFO>} CodePageTable 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlInitCodePageTable(TableBase, CodePageTable) {
    TableBaseMarshal := TableBase is VarRef ? "ushort*" : "ptr"

    DllCall("ntdll.dll\RtlInitCodePageTable", TableBaseMarshal, TableBase, CPTABLEINFO.Ptr, CodePageTable)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VolumeRootPath 
 * @returns {NTSTATUS} 
 */
export RtlCreateSystemVolumeInformationFolder(VolumeRootPath) {
    result := DllCall("ntdll.dll\RtlCreateSystemVolumeInformationFolder", UNICODE_STRING.Ptr, VolumeRootPath, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Altitude1 
 * @param {Pointer<UNICODE_STRING>} Altitude2 
 * @returns {Integer} 
 */
export RtlCompareAltitudes(Altitude1, Altitude2) {
    result := DllCall("ntdll.dll\RtlCompareAltitudes", UNICODE_STRING.Ptr, Altitude1, UNICODE_STRING.Ptr, Altitude2, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} TokenObject 
 * @param {Integer} PackageFullName 
 * @param {Pointer<Pointer>} PackageSize 
 * @param {Integer} AppId 
 * @param {Pointer<Pointer>} AppIdSize 
 * @param {Pointer<BOOLEAN>} Packaged 
 * @returns {NTSTATUS} 
 */
export RtlQueryPackageIdentity(TokenObject, PackageFullName, PackageSize, AppId, AppIdSize, Packaged) {
    TokenObjectMarshal := TokenObject is VarRef ? "ptr" : "ptr"
    PackageSizeMarshal := PackageSize is VarRef ? "ptr*" : "ptr"
    AppIdSizeMarshal := AppIdSize is VarRef ? "ptr*" : "ptr"
    PackagedMarshal := Packaged is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlQueryPackageIdentity", TokenObjectMarshal, TokenObject, "ptr", PackageFullName, PackageSizeMarshal, PackageSize, "ptr", AppId, AppIdSizeMarshal, AppIdSize, PackagedMarshal, Packaged, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} TokenObject 
 * @param {Integer} PackageFullName 
 * @param {Pointer<Pointer>} PackageSize 
 * @param {Integer} AppId 
 * @param {Pointer<Pointer>} AppIdSize 
 * @param {Pointer<Guid>} DynamicId 
 * @param {Pointer<Integer>} Flags 
 * @returns {NTSTATUS} 
 */
export RtlQueryPackageIdentityEx(TokenObject, PackageFullName, PackageSize, AppId, AppIdSize, DynamicId, Flags) {
    TokenObjectMarshal := TokenObject is VarRef ? "ptr" : "ptr"
    PackageSizeMarshal := PackageSize is VarRef ? "ptr*" : "ptr"
    AppIdSizeMarshal := AppIdSize is VarRef ? "ptr*" : "ptr"
    FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlQueryPackageIdentityEx", TokenObjectMarshal, TokenObject, "ptr", PackageFullName, PackageSizeMarshal, PackageSize, "ptr", AppId, AppIdSizeMarshal, AppIdSize, Guid.Ptr, DynamicId, FlagsMarshal, Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ReparseTag 
 * @returns {BOOLEAN} 
 */
export RtlIsNonEmptyDirectoryReparsePointAllowed(ReparseTag) {
    result := DllCall("ntdll.dll\RtlIsNonEmptyDirectoryReparsePointAllowed", "uint", ReparseTag, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} FileAttributes 
 * @param {Integer} ReparseTag 
 * @returns {BOOLEAN} 
 */
export RtlIsCloudFilesPlaceholder(FileAttributes, ReparseTag) {
    result := DllCall("ntdll.dll\RtlIsCloudFilesPlaceholder", "uint", FileAttributes, "uint", ReparseTag, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} FileAttributes 
 * @param {Integer} ReparseTag 
 * @returns {BOOLEAN} 
 */
export RtlIsPartialPlaceholder(FileAttributes, ReparseTag) {
    result := DllCall("ntdll.dll\RtlIsPartialPlaceholder", "uint", FileAttributes, "uint", ReparseTag, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<BOOLEAN>} IsPartialPlaceholder 
 * @returns {NTSTATUS} 
 */
export RtlIsPartialPlaceholderFileHandle(FileHandle, IsPartialPlaceholder) {
    IsPartialPlaceholderMarshal := IsPartialPlaceholder is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlIsPartialPlaceholderFileHandle", HANDLE, FileHandle, IsPartialPlaceholderMarshal, IsPartialPlaceholder, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} InfoBuffer 
 * @param {FILE_INFORMATION_CLASS} InfoClass 
 * @param {Pointer<BOOLEAN>} IsPartialPlaceholder 
 * @returns {NTSTATUS} 
 */
export RtlIsPartialPlaceholderFileInfo(InfoBuffer, InfoClass, IsPartialPlaceholder) {
    InfoBufferMarshal := InfoBuffer is VarRef ? "ptr" : "ptr"
    IsPartialPlaceholderMarshal := IsPartialPlaceholder is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlIsPartialPlaceholderFileInfo", InfoBufferMarshal, InfoBuffer, FILE_INFORMATION_CLASS, InfoClass, IsPartialPlaceholderMarshal, IsPartialPlaceholder, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {CHAR} 
 */
export RtlQueryThreadPlaceholderCompatibilityMode() {
    result := DllCall("ntdll.dll\RtlQueryThreadPlaceholderCompatibilityMode", CHAR)
    return result
}

/**
 * 
 * @param {CHAR} _Mode 
 * @returns {CHAR} 
 */
export RtlSetThreadPlaceholderCompatibilityMode(_Mode) {
    result := DllCall("ntdll.dll\RtlSetThreadPlaceholderCompatibilityMode", CHAR, _Mode, CHAR)
    return result
}

/**
 * 
 * @returns {CHAR} 
 */
export RtlQueryProcessPlaceholderCompatibilityMode() {
    result := DllCall("ntdll.dll\RtlQueryProcessPlaceholderCompatibilityMode", CHAR)
    return result
}

/**
 * 
 * @param {CHAR} _Mode 
 * @returns {CHAR} 
 */
export RtlSetProcessPlaceholderCompatibilityMode(_Mode) {
    result := DllCall("ntdll.dll\RtlSetProcessPlaceholderCompatibilityMode", CHAR, _Mode, CHAR)
    return result
}

/**
 * Creates a new file or directory, or opens an existing file, device, directory, or volume.
 * @remarks
 * The handle, given by <b>NtCreateFile</b>, can be used by 
 *     subsequent calls to manipulate data within the file or the file object's state or attributes.
 * 
 * There are two alternate ways to specify the name of the file to be created or opened with 
 *      <b>NtCreateFile</b>:
 * 
 * <ul>
 * <li>As a fully qualified pathname, supplied in the <b>ObjectName</b> member of the input 
 *       <i>ObjectAttributes</i></li>
 * <li>As a pathname relative to the directory file represented by the handle in the 
 *       <b>RootDirectory</b> member of the input <i>ObjectAttributes</i></li>
 * </ul>
 * Certain <i>DesiredAccess</i> flags and combinations of flags have the following effects:
 * 
 * <ul>
 * <li>For a caller to synchronize an I/O completion by waiting on the returned 
 *       <i>FileHandle</i>, the <b>SYNCHRONIZE</b> flag must be set.</li>
 * <li>Passing a zero to <i>DesiredFlags</i> is not valid.</li>
 * <li>If only the <b>FILE_APPEND_DATA</b> and <b>SYNCHRONIZE</b> flags are 
 *       set, the caller can write only to the end of the file, and any offset information on writes to the file is 
 *       ignored. However, the file is automatically  extended as necessary for this type of write operation.</li>
 * <li>Setting the <b>FILE_WRITE_DATA</b> flag for a file also allows writes beyond the end of 
 *       the file to occur. The file is automatically extended for this type of write, as well.</li>
 * <li>If only the <b>FILE_EXECUTE</b> and <b>SYNCHRONIZE</b> flags are set, 
 *       the caller cannot directly read or write any data in the file using the returned 
 *       <i>FileHandle</i>, that is, all operations on the file occur through the system pager in 
 *       response to instruction and data accesses. </li>
 * </ul>
 * The <i>ShareAccess</i> parameter determines whether separate threads can access the same file, 
 *     possibly simultaneously. Provided that both file openers have the privilege to access a file in the specified 
 *     manner, the file can be successfully opened and shared. If the original caller of 
 *     <b>NtCreateFile</b> does not specify 
 *     <b>FILE_SHARE_READ</b>, <b>FILE_SHARE_WRITE</b>, or 
 *     <b>FILE_SHARE_DELETE</b>, no other open operations can be performed on the file; that is, the 
 *     original caller is given exclusive access to the file.
 * 
 * For a shared file to be successfully opened, the requested <i>DesiredAccess</i> parameter to 
 *      the file must be compatible with both the <i>DesiredAccess</i> and 
 *      <i>ShareAccess</i> specifications of all preceding opens that have not yet been released with 
 *      <b>NtClose</b>. That is, the <i>DesiredAccess</i> parameter 
 *      specified to <b>NtCreateFile</b> for a given file must not 
 *      conflict with the accesses that other openers of the file have disallowed.
 * 
 * The <i>CreateDisposition</i> value <b>FILE_SUPERSEDE</b> requires that 
 *      the caller have <b>DELETE</b> access to an existing file object. If so, a successful call to 
 *      <b>NtCreateFile</b> with 
 *      <b>FILE_SUPERSEDE</b> on an existing file effectively deletes that file, and then re-creates 
 *      it. This implies that, if the file has already been opened by another thread, it opened the file by specifying a 
 *      <i>ShareAccess</i> parameter with the <b>FILE_SHARE_DELETE</b> flag set. 
 *      Note that this type of disposition is consistent with the POSIX style of overwriting files. The 
 *      <i>CreateDisposition</i> values <b>FILE_OVERWRITE_IF</b> and 
 *      <b>FILE_SUPERSEDE</b> are similar. If <b>ZwCreateFile</b> is called 
 *      with an existing file and either of these <i>CreateDisposition</i> values, the file is 
 *      replaced.
 * 
 * Overwriting a file is semantically equivalent to a supersede operation, except for the following:
 * 
 * <ul>
 * <li>The caller must have write access to the file, rather than delete access. This implies that, if the file 
 *       has already been opened by another thread, it opened the file with the 
 *       <b>FILE_SHARE_WRITE</b> flag set in the input <i>ShareAccess</i> 
 *       parameter.</li>
 * <li>The specified file attributes are logically ORed with those already on the file. This implies that, if the 
 *       file has already been opened by another thread, a subsequent caller of 
 *       <b>NtCreateFile</b> cannot disable existing 
 *       <i>FileAttributes</i> flags but can enable additional flags for the same file. Note that this 
 *       style of overwriting files is consistent with MS-DOS, Windows 3.1, and  OS/2 operating systems.</li>
 * </ul>
 * The <i>CreateOptions</i> <b>FILE_DIRECTORY_FILE</b> value specifies that the file to be created or opened is a 
 *      directory file. When a directory file is created, the file system creates an appropriate structure on the disk to 
 *      represent an empty directory for that particular file system's on-disk structure. If this option was specified 
 *      and the given file to be opened is not a directory file, or if the caller specified an inconsistent 
 *      <i>CreateOptions</i> or <i>CreateDisposition</i> value, the call to 
 *      <b>NtCreateFile</b> fails.
 * 
 * The <i>CreateOptions</i> <b>FILE_NO_INTERMEDIATE_BUFFERING</b> flag prevents the file system from performing any 
 *      intermediate buffering on behalf of the caller. Specifying this value places certain restrictions on the caller's 
 *      parameters to other <b>Nt<i>XXX</i>File</b> routines, including the 
 *      following:
 * 
 * <ul>
 * <li>Any optional <i>ByteOffset</i> passed to  the 
 *       <b>NtReadFile</b> or <b>NtWriteFile</b> function must be an 
 *       integral of the sector size.</li>
 * <li>The <i>Length</i> passed to <b>NtReadFile</b> or 
 *       <b>NtWriteFile</b>, must be an integral of the sector size. Note that specifying a 
 *       read operation to a buffer whose length is exactly the sector size might result in a lesser number of 
 *       significant bytes being transferred to that buffer if the end of the file was reached during the transfer.</li>
 * <li>Buffers must be adjusted in accordance with the alignment requirement of the underlying device. This 
 *       information can be obtained by calling <b>NtCreateFile</b> 
 *       to get a handle for the file object that represents the physical device, and then calling 
 *       <b>NtQueryInformationFile</b> with that handle. For a list of the system 
 *        <b>FILE_</b><i>XXX</i><b>_ALIGNMENT</b> values, see 
 *        the Windows SDK documentation.</li>
 * <li>Calls to <b>NtSetInformationFile</b> with the 
 *       <i>FileInformationClass</i> parameter set to 
 *       <b>FilePositionInformation</b> must specify an offset that is an integral of the 
 *       sector size.</li>
 * </ul>
 * The <i>CreateOptions</i> <b>FILE_SYNCHRONOUS_IO_ALERT</b> and <b>FILE_SYNCHRONOUS_IO_NONALERT</b> flags, 
 *      which are mutually exclusive as their names suggest, specify that all I/O operations on the file are to be 
 *      synchronous as long as they occur through the file object referred to by the returned 
 *      <i>FileHandle</i>. All I/O on such a file is serialized across all threads using the returned 
 *      handle. With either of these <i>CreateOptions</i>, the <i>DesiredAccess</i> <b>SYNCHRONIZE</b> flag must be set so that the I/O Manager  uses the 
 *      file object as a synchronization object. With either of these <i>CreateOptions</i> set, the 
 *      I/O Manager maintains the "file position context" for the file object, an internal, current file position offset. 
 *      This offset can be used in calls to <b>NtReadFile</b> and 
 *      <b>NtWriteFile</b>. Its position also can be queried or set with 
 *      <b>NtQueryInformationFile</b> and 
 *      <b>NtSetInformationFile</b>.
 * 
 * If the <i>CreateOptions</i> parameter specifies the <b>FILE_OPEN_REPARSE_POINT</b> flag and <b>NtCreateFile</b> opens a file with a reparse point, normal reparse processing does not occur and <b>NtCreateFile</b> attempts to directly open the reparse point file. If the <b>FILE_OPEN_REPARSE_POINT</b> flag is not specified, normal reparse point processing occurs for the file. In either case, if the open operation was successful, <b>NtCreateFile</b> returns <b>STATUS_SUCCESS</b>; otherwise, an error code. The <b>NtCreateFile</b> function never returns <b>STATUS_REPARSE</b>.
 * 
 * The <i>CreateOptions</i> parameter's <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag eliminates the time between when you open the file and request an oplock that could potentially allow a third party to open the file, which would cause a sharing violation. An application can use the <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag with <b>NtCreateFile</b> and then request any oplock. This ensures that an oplock owner will be notified of any subsequent open request that causes a sharing violation. 
 * 
 * In Windows 7, if other handles exist on the file when an application uses this flag, the create operation will fail with <b>STATUS_OPLOCK_NOT_GRANTED</b>. This restriction no longer exists starting with Windows 8.
 * 
 * If this create operation would break an oplock that already exists on the file, then setting the <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag will cause the create operation to fail with <b>STATUS_CANNOT_BREAK_OPLOCK</b>. The existing oplock will not be broken by this create operation.
 * 
 * An application that uses this flag must request an oplock after this call succeeds, or all subsequent attempts to open the file will be blocked without the benefit of normal oplock processing. Similarly, if this call succeeds but the subsequent oplock request fails, an application that uses this flag must close its handle after it detects that the oplock request has failed.
 * 
 * <div class="alert"><b>Note</b>  The <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag is available in Windows 7, Windows Server 2008 R2 and later operating systems for the following file systems: NTFS, FAT, and exFAT.
 * </div>
 * <div> </div>
 * 
 * 
 * 
 * The <i>CreateOptions</i> parameter's <b>FILE_RESERVE_OPFILTER</b> flag allows an application to request a Level 1, Batch, or Filter oplock to prevent other applications from getting share violations. However, in practical terms, the <b>FILE_RESERVE_OPFILTER</b> is useful only for filter oplocks. To use it, you must complete the following steps:
 * 
 * 
 * 
 * <ol>
 * <li>Issue a create request with <i>CreateOptions</i> of <b>FILE_RESERVE_OPFILTER</b>, <i>DesiredAccess</i> of exactly <b>FILE_READ_ATTRIBUTES</b>, and <i>ShareAccess</i> of exactly <c>(FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE)</c>. Possible failures are as follows:<ul>
 * <li>If there are already open handles, the create request fails with <b>STATUS_OPLOCK_NOT_GRANTED</b>, and the next requested oplock also fails. </li>
 * <li>If you open with more access than <b>FILE_READ_ATTRIBUTES</b>  or less sharing than <c>(FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE)</c>, the request  fails with <b>STATUS_OPLOCK_NOT_GRANTED</b>.</li>
 * </ul>
 * </li>
 * <li>If the create request succeeds, request an oplock.</li>
 * <li>Open another handle to the file to do I/O.</li>
 * </ol>Step three makes this practical only for filter oplocks. The handle opened in step three can have a <i>DesiredAccess</i> that contains a maximum of <c>(FILE_READ_ATTRIBUTES | FILE_WRITE_ATTRIBUTES | FILE_READ_DATA | FILE_READ_EA | FILE_EXECUTE | SYNCHRONIZE | READ_CONTROL)</code> and still not break a filter oplock. However, any <i>DesiredAccess</i> greater than <code>(FILE_READ_ATTRIBUTES | FILE_WRITE_ATTRIBUTES | SYNCHRONIZE)</c> will break a Level 1 or Batch oplock and make the <b>FILE_RESERVE_OPFILTER</b> flag useless for those oplock types.
 * 
 * 
 * 
 * NTFS is the only Microsoft file system that implements <b>FILE_RESERVE_OPFILTER</b>.
 * 
 * For more information on oplocks, see <a href="https://msdn.microsoft.com/library/dd445267.aspx">Oplock Semantics</a>.
 * 
 * Note that the WDK header file NtDef.h is necessary for many constant definitions 
 *     as well as the <b>InitializeObjectAttributes</b> macro. The associated import library, 
 *     NtDll.lib is available in the WDK. To obtain the WDK, see <a href="https://docs.microsoft.com/windows-hardware/drivers/download-the-wdk">Download kits for Windows hardware development</a>. You can also use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to 
 *     NtDll.dll.
 * @param {Pointer<HANDLE>} FileHandle A pointer to a variable that receives the file handle if the call is successful.
 * @param {FILE_ACCESS_RIGHTS} DesiredAccess The <b>ACCESS_MASK</b> value that expresses the type of access that the caller 
 *       requires to the file or directory. The set of system-defined <i>DesiredAccess</i> flags 
 *       determines the following specific access rights for file objects.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DELETE"></a><a id="delete"></a><dl>
 * <dt><b>DELETE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file can be deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_READ_DATA"></a><a id="file_read_data"></a><dl>
 * <dt><b>FILE_READ_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data can be read from the file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_READ_ATTRIBUTES"></a><a id="file_read_attributes"></a><dl>
 * <dt><b>FILE_READ_ATTRIBUTES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>FileAttributes</i> flags, described later, can be read.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_READ_EA"></a><a id="file_read_ea"></a><dl>
 * <dt><b>FILE_READ_EA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Extended attributes associated with the file can be read. This flag is irrelevant to device and 
 *         intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="READ_CONTROL"></a><a id="read_control"></a><dl>
 * <dt><b>READ_CONTROL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The access control list (ACL) and ownership information associated with the file can be read.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_WRITE_DATA"></a><a id="file_write_data"></a><dl>
 * <dt><b>FILE_WRITE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data can be written to the file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_WRITE_ATTRIBUTES"></a><a id="file_write_attributes"></a><dl>
 * <dt><b>FILE_WRITE_ATTRIBUTES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>FileAttributes</i> flags can be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_WRITE_EA"></a><a id="file_write_ea"></a><dl>
 * <dt><b>FILE_WRITE_EA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Extended attributes (EAs) associated with the file can be written. This flag is irrelevant to device and 
 *         intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_APPEND_DATA"></a><a id="file_append_data"></a><dl>
 * <dt><b>FILE_APPEND_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data can be appended to the file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WRITE_DAC"></a><a id="write_dac"></a><dl>
 * <dt><b>WRITE_DAC</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The discretionary access control list (DACL) associated with the file can be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WRITE_OWNER"></a><a id="write_owner"></a><dl>
 * <dt><b>WRITE_OWNER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Ownership information associated with the file can be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SYNCHRONIZE"></a><a id="synchronize"></a><dl>
 * <dt><b>SYNCHRONIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The returned <i>FileHandle</i> can be waited on to synchronize with the completion of 
 *         an I/O operation. If <i>FileHandle</i> was not opened for synchronous I/O, this value is ignored.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_EXECUTE"></a><a id="file_execute"></a><dl>
 * <dt><b>FILE_EXECUTE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data can be read into memory from the file using system paging I/O. This flag is irrelevant for device and 
 *         intermediate drivers.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Do not specify <b>FILE_READ_DATA</b>, <b>FILE_WRITE_DATA</b>, <b>FILE_APPEND_DATA</b>, or <b>FILE_EXECUTE</b> when you create or open a directory.
 * 
 * Callers of <b>NtCreateFile</b> can specify one or a combination of the following, 
 *       possibly using a bitwise-OR with additional compatible flags from the preceding <i>DesiredAccess</i> flags 
 *       list, for any file object that does not represent a directory file.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_GENERIC_READ"></a><a id="file_generic_read"></a><dl>
 * <dt><b>FILE_GENERIC_READ</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <code>STANDARD_RIGHTS_READ | FILE_READ_DATA | 
 *         FILE_READ_ATTRIBUTES | FILE_READ_EA | SYNCHRONIZE</code>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_GENERIC_WRITE"></a><a id="file_generic_write"></a><dl>
 * <dt><b>FILE_GENERIC_WRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <code>STANDARD_RIGHTS_WRITE | FILE_WRITE_DATA | 
 *         FILE_WRITE_ATTRIBUTES | FILE_WRITE_EA |
 *         FILE_APPEND_DATA | SYNCHRONIZE</code>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_GENERIC_EXECUTE"></a><a id="file_generic_execute"></a><dl>
 * <dt><b>FILE_GENERIC_EXECUTE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <c>STANDARD_RIGHTS_EXECUTE | FILE_READ_ATTRIBUTES | FILE_EXECUTE | SYNCHRONIZE</c>
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The <b>FILE_GENERIC_EXECUTE</b>  value is irrelevant for device and intermediate drivers.
 * 
 * The <b>STANDARD_RIGHTS_</b><i>XXX</i> are predefined system values 
 *       used to enforce security on system objects.
 *       
 * 
 * To open or create a directory file, as also indicated with the <i>CreateOptions</i> 
 *        parameter, callers of <b>NtCreateFile</b> can specify one or a combination of the 
 *        following, possibly using a bitwise-OR with one or more compatible flags from the preceding 
 *        <i>DesiredAccess</i> flags list.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_LIST_DIRECTORY"></a><a id="file_list_directory"></a><dl>
 * <dt><b>FILE_LIST_DIRECTORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Files in the directory can be listed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_TRAVERSE"></a><a id="file_traverse"></a><dl>
 * <dt><b>FILE_TRAVERSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The directory can be traversed: that is, it can be part of the pathname of a file.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes A pointer to a structure already initialized with 
 *       <b>InitializeObjectAttributes</b>. 
 *       Members of this structure for a file object include the following.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ULONG_Length"></a><a id="ulong_length"></a><a id="ULONG_LENGTH"></a><dl>
 * <dt><b>ULONG Length</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the number of bytes of <i>ObjectAttributes</i> data supplied. This value 
 *         must be at least sizeof(OBJECT_ATTRIBUTES).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HANDLE_RootDirectory"></a><a id="handle_rootdirectory"></a><a id="HANDLE_ROOTDIRECTORY"></a><dl>
 * <dt><b>HANDLE RootDirectory</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Optionally specifies a handle to a directory obtained by a preceding call to 
 *         <b>NtCreateFile</b>. If this value is 
 *         <b>NULL</b>, the <b>ObjectName</b> member must be a fully qualified 
 *         file specification that includes the full path to the target file. If this value is 
 *         non-<b>NULL</b>, the <b>ObjectName</b> member specifies a file name 
 *         relative to this directory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PUNICODE_STRING_ObjectName"></a><a id="punicode_string_objectname"></a><a id="PUNICODE_STRING_OBJECTNAME"></a><dl>
 * <dt><b>PUNICODE_STRING ObjectName</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Points to a buffered Unicode string that names the file to be created or opened. This value must be a 
 *         fully qualified file specification or the name of a device object, unless it is the name of a file relative to 
 *         the directory specified by <b>RootDirectory</b>. For example, \Device\Floppy1\myfile.dat 
 *         or \??\B:\myfile.dat could be the fully qualified file specification, provided that the floppy driver and 
 *         overlying file system are already loaded. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Names, Paths, and Namespaces</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ULONG_Attributes"></a><a id="ulong_attributes"></a><a id="ULONG_ATTRIBUTES"></a><dl>
 * <dt><b>ULONG Attributes</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Is a set of flags that controls the file object attributes. This value can be zero or 
 *         <b>OBJ_CASE_INSENSITIVE</b>, which indicates that name-lookup code should ignore the case 
 *         of the <b>ObjectName</b> member rather than performing an exact-match search. The value 
 *         <b>OBJ_INHERIT</b> is irrelevant to device and intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PSECURITY_DESCRIPTOR_SecurityDescriptor"></a><a id="psecurity_descriptor_securitydescriptor"></a><a id="PSECURITY_DESCRIPTOR_SECURITYDESCRIPTOR"></a><dl>
 * <dt><b>PSECURITY_DESCRIPTOR SecurityDescriptor</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Optionally specifies a security descriptor to be applied to a file. ACLs specified by such a security 
 *         descriptor are applied to the file only when it is created. If the value is <b>NULL</b> when a file is created, the 
 *         ACL placed on the file is file-system-dependent; most file systems propagate some part of such an ACL from the 
 *         parent directory file combined with the caller's default ACL. Device and intermediate drivers can set this 
 *         member to <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PSECURITY_QUALITY_OF_SERVICE_SecurityQualityOfService"></a><a id="psecurity_quality_of_service_securityqualityofservice"></a><a id="PSECURITY_QUALITY_OF_SERVICE_SECURITYQUALITYOFSERVICE"></a><dl>
 * <dt><b>PSECURITY_QUALITY_OF_SERVICE SecurityQualityOfService</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the access rights a server should be given to the client's security context. This value is 
 *         non-<b>NULL</b> only when a connection to a protected server is established, allowing the 
 *         caller to control which parts of the caller's security context are made available to the server and whether 
 *         the server is allowed to impersonate the caller.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock A pointer to a variable that receives the final completion status and information about the requested 
 *       operation. On return from <b>NtCreateFile</b>, the
 * @param {Pointer<Integer>} AllocationSize The initial allocation size in bytes for the file. A nonzero value has no effect unless the file is being 
 *       created, overwritten, or superseded.
 * @param {FILE_FLAGS_AND_ATTRIBUTES} FileAttributes The file attributes. Explicitly specified attributes are applied only when the file is created, superseded, 
 *       or, in some cases, overwritten. By default, this value is a <b>FILE_ATTRIBUTE_NORMAL</b>, 
 *       which can be overridden by an ORed combination of one or more 
 *       <b>FILE_ATTRIBUTE_</b><i>xxxx</i> flags, which are defined in Wdm.h and 
 *       NtDdk.h. For a list of flags that can be used with 
 *       <b>NtCreateFile</b>, see 
 *       <b>CreateFile</b>.
 * @param {FILE_SHARE_MODE} ShareAccess The type of share access that the caller would like to use in  the file, as zero, or as one or a
 * @param {NTCREATEFILE_CREATE_DISPOSITION} CreateDisposition 
 * @param {NTCREATEFILE_CREATE_OPTIONS} CreateOptions The options to be applied when creating or opening the file, as a compatible combination of the following 
 *       flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_DIRECTORY_FILE"></a><a id="file_directory_file"></a><dl>
 * <dt><b>FILE_DIRECTORY_FILE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file being created or opened is a directory file. With this flag, the 
 *         <i>CreateDisposition</i> parameter must be set to <b>FILE_CREATE</b>, 
 *         <b>FILE_OPEN</b>, or <b>FILE_OPEN_IF</b>. With this flag, other 
 *         compatible <i>CreateOptions</i> flags include only the following: 
 *         <b>FILE_SYNCHRONOUS_IO_ALERT</b>, <b>FILE_SYNCHRONOUS_IO _NONALERT</b>, 
 *         <b>FILE_WRITE_THROUGH</b>, <b>FILE_OPEN_FOR_BACKUP_INTENT</b>, and 
 *         <b>FILE_OPEN_BY_FILE_ID</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_NON_DIRECTORY_FILE"></a><a id="file_non_directory_file"></a><dl>
 * <dt><b>FILE_NON_DIRECTORY_FILE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file being opened must not be a directory file or this call fails. The file object being opened can 
 *         represent a data file, a logical, virtual, or physical device, or a volume.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_WRITE_THROUGH"></a><a id="file_write_through"></a><dl>
 * <dt><b>FILE_WRITE_THROUGH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Applications that write data to the file must actually transfer the data into the file before any 
 *         requested write operation is considered complete. This flag is automatically set if the 
 *         <i>CreateOptions</i> flag <b>FILE_NO_INTERMEDIATE _BUFFERING</b> is set.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_SEQUENTIAL_ONLY"></a><a id="file_sequential_only"></a><dl>
 * <dt><b>FILE_SEQUENTIAL_ONLY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All accesses to the file are sequential.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_RANDOM_ACCESS"></a><a id="file_random_access"></a><dl>
 * <dt><b>FILE_RANDOM_ACCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Accesses to the file can be random, so no sequential read-ahead operations should be performed on the 
 *         file by FSDs or the system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_NO_INTERMEDIATE_BUFFERING"></a><a id="file_no_intermediate_buffering"></a><dl>
 * <dt><b>FILE_NO_INTERMEDIATE_BUFFERING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file cannot be cached or buffered in a driver's internal buffers. This flag is incompatible with the 
 *         <i>DesiredAccess</i> <b>FILE_APPEND_DATA</b> 
 *         flag.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_SYNCHRONOUS_IO_ALERT"></a><a id="file_synchronous_io_alert"></a><dl>
 * <dt><b>FILE_SYNCHRONOUS_IO_ALERT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All operations on the file are performed synchronously. Any wait on behalf of the caller is subject to 
 *         premature termination from alerts. This flag also causes the I/O system to maintain the file position context. 
 *         If this flag is set, the <i>DesiredAccess</i> <b>SYNCHRONIZE</b> flag also must be set.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_SYNCHRONOUS_IO_NONALERT"></a><a id="file_synchronous_io_nonalert"></a><dl>
 * <dt><b>FILE_SYNCHRONOUS_IO_NONALERT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All operations on the file are performed synchronously. Waits in the system to synchronize I/O queuing 
 *         and completion are not subject to alerts. This flag also causes the I/O system to maintain the file position 
 *         context. If this flag is set, the <i>DesiredAccess</i> <b>SYNCHRONIZE</b> flag also must be set.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_CREATE_TREE_CONNECTION"></a><a id="file_create_tree_connection"></a><dl>
 * <dt><b>FILE_CREATE_TREE_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Create a tree connection for this file in order to open it over the network. This flag is not used by device and intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_NO_EA_KNOWLEDGE"></a><a id="file_no_ea_knowledge"></a><dl>
 * <dt><b>FILE_NO_EA_KNOWLEDGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If the extended attributes on an existing file being opened indicate that the caller must understand EAs 
 *         to properly interpret the file, fail this request because the caller does not understand how to deal with EAs. This flag is irrelevant for device and intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_OPEN_REPARSE_POINT"></a><a id="file_open_reparse_point"></a><dl>
 * <dt><b>FILE_OPEN_REPARSE_POINT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Open a file with a reparse point and bypass normal reparse point processing for the file. For more information, see the Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_DELETE_ON_CLOSE"></a><a id="file_delete_on_close"></a><dl>
 * <dt><b>FILE_DELETE_ON_CLOSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the file when the last handle to it is passed to <b>NtClose</b>. If this flag is set, the DELETE flag must be set in the <i>DesiredAccess</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_OPEN_BY_FILE_ID"></a><a id="file_open_by_file_id"></a><dl>
 * <dt><b>FILE_OPEN_BY_FILE_ID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file name that is specified by the <i>ObjectAttributes</i> parameter includes the 8-byte file reference number for the file. This number is assigned by and specific to the particular file system. If the file is a reparse point, the file name will also include the name of a device. Note that the FAT file system does not support this flag. This flag is not used by device and intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_OPEN_FOR_BACKUP_INTENT"></a><a id="file_open_for_backup_intent"></a><dl>
 * <dt><b>FILE_OPEN_FOR_BACKUP_INTENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is being opened for backup intent. Therefore, the system should check for certain access rights and grant the caller the appropriate access to the file before checking the <i>DesiredAccess</i> parameter against the file's security descriptor. This flag not used by device and intermediate drivers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_RESERVE_OPFILTER_"></a><a id="file_reserve_opfilter_"></a><dl>
 * <dt><b>FILE_RESERVE_OPFILTER </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This flag allows an application to request a filter opportunistic lock (<a href="https://www.microsoft.com/?ref=go">oplock</a>) to prevent other applications from getting share violations. If there are already open handles, the create request will fail with <b>STATUS_OPLOCK_NOT_GRANTED</b>. For more information, see the Remarks section.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_OPEN_REQUIRING_OPLOCK"></a><a id="file_open_requiring_oplock"></a><dl>
 * <dt><b>FILE_OPEN_REQUIRING_OPLOCK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is being opened and an opportunistic lock (<a href="https://www.microsoft.com/?ref=go">oplock</a>) on the file is being requested as a single atomic operation. The file system checks for oplocks before it performs the create operation and will fail the create with a return code of <b>STATUS_CANNOT_BREAK_OPLOCK</b> if the result would be to break an existing oplock.  For more information, see the Remarks section.<b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This flag is not supported.
 * 
 * 
 * 
 * This flag is supported on the following file systems: NTFS, FAT, and exFAT.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FILE_COMPLETE_IF_OPLOCKED"></a><a id="file_complete_if_oplocked"></a><dl>
 * <dt><b>FILE_COMPLETE_IF_OPLOCKED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Complete this operation immediately with an alternate success code of <b>STATUS_OPLOCK_BREAK_IN_PROGRESS</b> if the target file is oplocked, rather than blocking the caller's thread. If the file is <a href="https://www.microsoft.com/?ref=go">oplocked</a>, another caller already has access to the file. This flag is not used by device and intermediate drivers.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} EaBuffer Pointer to an EA buffer used to pass extended attributes.
 *       
 * 
 * <div class="alert"><b>Note</b>  Some file systems may not support EA buffers.</div>
 * <div> </div>
 * @param {Integer} EaLength Length of the EA buffer.
 * @returns {NTSTATUS} <b>NtCreateFile</b> returns either 
 *       <b>STATUS_SUCCESS</b> or an appropriate error status. If it returns an error status, the 
 *       caller can find more information about the cause of the failure by checking the 
 *       <i>IoStatusBlock</i>. To simplify this check, an application can use the <b>NT_SUCCESS</b>, <b>NT_ERROR</b>, and <b>NT_WARNING</b> macros.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntcreatefile
 */
export NtCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtCreateFile", HANDLE.Ptr, FileHandle, FILE_ACCESS_RIGHTS, DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, FILE_FLAGS_AND_ATTRIBUTES, FileAttributes, FILE_SHARE_MODE, ShareAccess, NTCREATEFILE_CREATE_DISPOSITION, CreateDisposition, NTCREATEFILE_CREATE_OPTIONS, CreateOptions, "ptr", EaBuffer, "uint", EaLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Opens an existing file, device, directory, or volume, and returns a handle for the file object.
 * @remarks
 * Before using this function, please read 
 *     <a href="https://docs.microsoft.com/windows/desktop/DevNotes/calling-internal-apis">Calling Internal APIs</a>.
 * 
 * Driver routines that run in a process context other than that of the system process must set the 
 *      <b>OBJ_KERNEL_HANDLE</b> attribute for the <i>ObjectAttributes</i> 
 *      parameter of <b>ZwOpenFile</b>. This restricts the use of the handle returned by 
 *      <b>ZwOpenFile</b> to processes running only in kernel mode. Otherwise, the handle can 
 *      be accessed by the process in whose context the driver is running. Drivers can call 
 *      <b>InitializeObjectAttributes</b> to set the 
 *      <b>OBJ_KERNEL_HANDLE</b> attribute as follows.
 * 
 * <c>InitializeObjectAttributes(&amp;ObjectAddributes, NULL, OBJ_KERNEL_HANDLE, NULL, NULL);</c>
 * 
 * Callers of <b>ZwCreateFile</b> must be running at IRQL = PASSIVE_LEVEL.
 * 
 * Note that the WDK header file Ntdef.h is necessary for many constant definitions 
 *     as well as the <b>InitializeObjectAttributes</b> macro. The associated import library, 
 *     Ntdll.lib is available in the WDK. You can also use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to 
 *     Ntdll.dll.
 * @param {Pointer<HANDLE>} FileHandle A pointer to a handle for the opened file. The driver must close the handle with 
 *       <b>ZwClose</b> once the handle is no longer in use.
 * @param {Integer} DesiredAccess The <b>ACCESS_MASK</b> value that expresses the types of file access desired by the 
 *       caller. For information about the types of access that can be specified, see 
 *       <b>ZwCreateFile</b> in the WDK.
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes A pointer to a structure that a caller initializes with 
 *       <b>InitializeObjectAttributes</b>. If the caller is not running in the system process 
 *       context, it must set the <b>OBJ_KERNEL_HANDLE</b> attribute for 
 *       <i>ObjectAttributes</i>. For more information about specifying object attributes, see 
 *       the <i>CreateOptions</i> parameter of <b>ZwCreateFile</b> in the WDK.
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock A pointer to a structure that contains information about the requested operation and the final completion 
 *       status.
 * @param {Integer} ShareAccess The type of share access for the file. For more information, see 
 *       <b>ZwCreateFile</b> in the WDK.
 * @param {Integer} OpenOptions The options to be applied when opening the file. For more information, see 
 *        <b>ZwCreateFile</b> in the WDK.
 * @returns {NTSTATUS} <b>NtOpenFile</b> either returns 
 *        <b>STATUS_SUCCESS</b> or an appropriate error status. If it returns an error status, the 
 *        caller can find additional information about the cause of the failure by checking the 
 *        <i>IoStatusBlock</i>.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntopenfile
 */
export NtOpenFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, OpenOptions) {
    result := DllCall("ntdll.dll\NtOpenFile", HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", ShareAccess, "uint", OpenOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationByName(ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass) {
    result := DllCall("ntdll.dll\NtQueryInformationByName", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
    result := DllCall("ntdll.dll\NtQueryInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Reads data from an open file.
 * @remarks
 * Callers of **NtReadFile** must have already called [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) with the FILE\_READ\_DATA or GENERIC\_READ value set in the *DesiredAccess* parameter.
 * 
 * If the preceding call to [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) set the FILE\_NO\_INTERMEDIATE\_BUFFERING flag in the *CreateOptions* parameter to **NtCreateFile**, the *Length* and *ByteOffset* parameters to **NtReadFile** must be multiples of the sector size. For more information, see **NtCreateFile**.
 * 
 * **NtReadFile** begins reading from the given *ByteOffset* or the current file position into the given *Buffer*. It terminates the read operation under one of the following conditions:
 * 
 * -   The buffer is full because the number of bytes specified by the *Length* parameter has been read. Therefore, no more data can be placed into the buffer without an overflow.
 * 
 * -   The end of file is reached during the read operation, so there is no more data in the file to be transferred into the buffer.
 * 
 * If the caller opened the file with the SYNCHRONIZE flag set in *DesiredAccess*, the calling thread can synchronize to the completion of the read operation by waiting on the file handle, *FileHandle*. The handle is signaled each time that an I/O operation that was issued on the handle completes. However, the caller must not wait on a handle that was opened for synchronous file access (FILE\_SYNCHRONOUS\_IO\_NONALERT or FILE\_SYNCHRONOUS\_IO\_ALERT). In this case, **NtReadFile** waits on behalf of the caller and does not return until the read operation is complete. The caller can safely wait on the file handle only if all three of the following conditions are met:
 * 
 * -   The handle was opened for asynchronous access (that is, neither FILE\_SYNCHRONOUS\_IO\_*XXX* flag was specified).
 * 
 * -   The handle is being used for only one I/O operation at a time.
 * 
 * -   **NtReadFile** returned STATUS\_PENDING.
 * 
 * A driver should call **NtReadFile** in the context of the system process if any of the following conditions exist:
 * 
 * -   The driver created the file handle that it passes to **NtReadFile**.
 * 
 * -   **NtReadFile** will notify the driver of I/O completion by means of an event that the driver created.
 * 
 * -   **NtReadFile** will notify the driver of I/O completion by means of an APC callback routine that the driver passes to **NtReadFile**.
 * 
 * File and event handles are valid only in the process context where the handles are created. Therefore, to avoid security holes, the driver should create any file or event handle that it passes to **NtReadFile** in the context of the system process rather than the context of the process that the driver is in.
 * 
 * Likewise, **NtReadFile** should be called in the context of the system process if it notifies the driver of I/O completion by means of an APC, because APCs are always fired in the context of the thread that issues the I/O request. If the driver calls **NtReadFile** in the context of a process other than the system one, the APC could be delayed indefinitely, or it might not fire at all.
 * 
 * For more information about working with files, see [Using Files in a Driver](/windows-hardware/drivers/kernel/using-files-in-a-driver).
 * 
 * Callers of **NtReadFile** must be running at IRQL = PASSIVE\_LEVEL and [with special kernel APCs enabled](/windows-hardware/drivers/kernel/disabling-apcs).
 * @param {HANDLE} FileHandle Handle to the file object. This handle is created by a successful call to [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) or [**NtOpenFile**](/windows/desktop/api/Winternl/nf-winternl-ntopenfile).
 * @param {HANDLE} Event Optionally, a handle to an event object to set to the signaled state after the read operation completes. Device and intermediate drivers should set this parameter to **NULL**.
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine This parameter is reserved. Device and intermediate drivers should set this pointer to **NULL**.
 * @param {Pointer<Void>} ApcContext This parameter is reserved. Device and intermediate drivers should set this pointer to **NULL**.
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock Pointer to an [**IO\_STATUS\_BLOCK**](/windows-hardware/drivers/ddi/wdm/ns-wdm-_io_status_block) structure that receives the final completion status and information about the requested read operation. The **Information** member receives the number of bytes actually read from the file.
 * @param {Integer} _Buffer Pointer to a caller-allocated buffer that receives the data read from the file.
 * @param {Integer} Length The size, in bytes, of the buffer pointed to by *Buffer*.
 * @param {Pointer<Integer>} ByteOffset Pointer to a variable that specifies the starting byte offset in the file where the read operation will begin. If an attempt is made to read beyond the end of the file, **NtReadFile** returns an error.
 * 
 * If the call to [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) set either of the *CreateOptions* flags FILE\_SYNCHRONOUS\_IO\_ALERT or FILE\_SYNCHRONOUS\_IO\_NONALERT, the I/O Manager maintains the current file position. If so, the caller of **NtReadFile** can specify that the current file position offset be used instead of an explicit *ByteOffset* value. This specification can be made by using one of the following methods:
 * 
 * -   Specify a pointer to a **LARGE\_INTEGER** value with the **HighPart** member set to -1 and the **LowPart** member set to the system-defined value FILE\_USE\_FILE\_POINTER\_POSITION.
 * 
 * -   Pass a **NULL** pointer for *ByteOffset*.
 * @param {Pointer<Integer>} Key Device and intermediate drivers should set this pointer to **NULL**.
 * @returns {NTSTATUS} **NtReadFile** returns either STATUS\_SUCCESS or the appropriate NTSTATUS error code.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/ntreadfile
 */
export NtReadFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, _Buffer, Length, ByteOffset, Key) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtReadFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export NtSetInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
    result := DllCall("ntdll.dll\NtSetInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Key 
 * @returns {NTSTATUS} 
 */
export NtWriteFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, _Buffer, Length, ByteOffset, Key) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtWriteFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Integer} Flags 
 * @param {Integer} Parameters 
 * @param {Integer} ParametersSize 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export NtFlushBuffersFileEx(FileHandle, Flags, Parameters, ParametersSize, IoStatusBlock) {
    result := DllCall("ntdll.dll\NtFlushBuffersFileEx", HANDLE, FileHandle, "uint", Flags, "ptr", Parameters, "uint", ParametersSize, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} SecurityInformation 
 * @param {Integer} _SecurityDescriptor 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} LengthNeeded 
 * @returns {NTSTATUS} 
 */
export NtQuerySecurityObject(_Handle, SecurityInformation, _SecurityDescriptor, Length, LengthNeeded) {
    LengthNeededMarshal := LengthNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQuerySecurityObject", HANDLE, _Handle, "uint", SecurityInformation, "ptr", _SecurityDescriptor, "uint", Length, LengthNeededMarshal, LengthNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Integer>} MaximumSize 
 * @param {Integer} SectionPageProtection 
 * @param {Integer} AllocationAttributes 
 * @param {HANDLE} FileHandle 
 * @returns {NTSTATUS} 
 */
export NtCreateSection(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle) {
    MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtCreateSection", HANDLE.Ptr, SectionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, HANDLE, FileHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Integer>} MaximumSize 
 * @param {Integer} SectionPageProtection 
 * @param {Integer} AllocationAttributes 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
 * @param {Integer} ExtendedParameterCount 
 * @returns {NTSTATUS} 
 */
export NtCreateSectionEx(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle, ExtendedParameters, ExtendedParameterCount) {
    MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtCreateSectionEx", HANDLE.Ptr, SectionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, HANDLE, FileHandle, MEM_EXTENDED_PARAMETER.Ptr, ExtendedParameters, "uint", ExtendedParameterCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} BaseAddress 
 * @param {Pointer} ZeroBits 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Integer} AllocationType 
 * @param {Integer} Protect 
 * @returns {NTSTATUS} 
 */
export NtAllocateVirtualMemory(ProcessHandle, BaseAddress, ZeroBits, RegionSize, AllocationType, Protect) {
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\NtAllocateVirtualMemory", HANDLE, ProcessHandle, "ptr", BaseAddress, "ptr", ZeroBits, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", Protect, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KMUTANT>} Mutant 
 * @param {BOOLEAN} InitialOwner 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeMutant(Mutant, InitialOwner) {
    DllCall("ntoskrnl.exe\KeInitializeMutant", KMUTANT.Ptr, Mutant, BOOLEAN, InitialOwner)
}

/**
 * 
 * @param {Pointer<KMUTANT>} Mutant 
 * @returns {Integer} 
 */
export KeReadStateMutant(Mutant) {
    result := DllCall("ntoskrnl.exe\KeReadStateMutant", KMUTANT.Ptr, Mutant, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KMUTANT>} Mutant 
 * @param {Integer} Increment 
 * @param {BOOLEAN} Abandoned 
 * @param {BOOLEAN} Wait 
 * @returns {Integer} 
 */
export KeReleaseMutant(Mutant, Increment, Abandoned, Wait) {
    result := DllCall("ntoskrnl.exe\KeReleaseMutant", KMUTANT.Ptr, Mutant, "int", Increment, BOOLEAN, Abandoned, BOOLEAN, Wait, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @param {Integer} Count 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeQueue(Queue, Count) {
    DllCall("ntoskrnl.exe\KeInitializeQueue", KQUEUE.Ptr, Queue, "uint", Count)
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @returns {Integer} 
 */
export KeReadStateQueue(Queue) {
    result := DllCall("ntoskrnl.exe\KeReadStateQueue", KQUEUE.Ptr, Queue, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @param {Pointer<LIST_ENTRY>} Entry 
 * @returns {Integer} 
 */
export KeInsertQueue(Queue, Entry) {
    result := DllCall("ntoskrnl.exe\KeInsertQueue", KQUEUE.Ptr, Queue, LIST_ENTRY.Ptr, Entry, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @param {Pointer<LIST_ENTRY>} Entry 
 * @returns {Integer} 
 */
export KeInsertHeadQueue(Queue, Entry) {
    result := DllCall("ntoskrnl.exe\KeInsertHeadQueue", KQUEUE.Ptr, Queue, LIST_ENTRY.Ptr, Entry, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @param {Integer} WaitMode 
 * @param {Pointer<Integer>} Timeout 
 * @returns {Pointer<LIST_ENTRY>} 
 */
export KeRemoveQueue(Queue, WaitMode, Timeout) {
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeRemoveQueue", KQUEUE.Ptr, Queue, "char", WaitMode, TimeoutMarshal, Timeout, LIST_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @param {Integer} WaitMode 
 * @param {BOOLEAN} Alertable 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<Pointer<LIST_ENTRY>>} EntryArray 
 * @param {Integer} Count 
 * @returns {Integer} 
 */
export KeRemoveQueueEx(Queue, WaitMode, Alertable, Timeout, EntryArray, Count) {
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"
    EntryArrayMarshal := EntryArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeRemoveQueueEx", KQUEUE.Ptr, Queue, "char", WaitMode, BOOLEAN, Alertable, TimeoutMarshal, Timeout, EntryArrayMarshal, EntryArray, "uint", Count, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<KQUEUE>} Queue 
 * @returns {Pointer<LIST_ENTRY>} 
 */
export KeRundownQueue(Queue) {
    result := DllCall("ntoskrnl.exe\KeRundownQueue", KQUEUE.Ptr, Queue, LIST_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {PRKPROCESS} Process 
 * @returns {String} Nothing - always returns an empty string
 */
export KeAttachProcess(Process) {
    DllCall("ntoskrnl.exe\KeAttachProcess", PRKPROCESS, Process)
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeDetachProcess() {
    DllCall("ntoskrnl.exe\KeDetachProcess")
}

/**
 * 
 * @param {PRKPROCESS} PROCESS 
 * @param {Pointer<KAPC_STATE>} ApcState 
 * @returns {String} Nothing - always returns an empty string
 */
export KeStackAttachProcess(PROCESS, ApcState) {
    DllCall("ntoskrnl.exe\KeStackAttachProcess", PRKPROCESS, PROCESS, KAPC_STATE.Ptr, ApcState)
}

/**
 * 
 * @param {Pointer<KAPC_STATE>} ApcState 
 * @returns {String} Nothing - always returns an empty string
 */
export KeUnstackDetachProcess(ApcState) {
    DllCall("ntoskrnl.exe\KeUnstackDetachProcess", KAPC_STATE.Ptr, ApcState)
}

/**
 * 
 * @param {PKTHREAD} Thread 
 * @param {Integer} Processor 
 * @returns {Integer} 
 */
export KeSetIdealProcessorThread(Thread, Processor) {
    result := DllCall("ntoskrnl.exe\KeSetIdealProcessorThread", PKTHREAD, Thread, "char", Processor, Int8)
    return result
}

/**
 * 
 * @param {BOOLEAN} Enable 
 * @returns {BOOLEAN} 
 */
export KeSetKernelStackSwapEnable(Enable) {
    result := DllCall("ntoskrnl.exe\KeSetKernelStackSwapEnable", BOOLEAN, Enable, BOOLEAN)
    return result
}

/**
 * 
 * @param {KSPIN_LOCK_QUEUE_NUMBER} _Number 
 * @returns {Integer} 
 */
export KeAcquireQueuedSpinLock(_Number) {
    result := DllCall("ntoskrnl.exe\KeAcquireQueuedSpinLock", KSPIN_LOCK_QUEUE_NUMBER, _Number, Int8)
    return result
}

/**
 * 
 * @param {KSPIN_LOCK_QUEUE_NUMBER} _Number 
 * @param {Integer} OldIrql 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseQueuedSpinLock(_Number, OldIrql) {
    DllCall("ntoskrnl.exe\KeReleaseQueuedSpinLock", KSPIN_LOCK_QUEUE_NUMBER, _Number, "char", OldIrql)
}

/**
 * 
 * @param {KSPIN_LOCK_QUEUE_NUMBER} _Number 
 * @param {Pointer<Integer>} OldIrql 
 * @returns {Integer} 
 */
export KeTryToAcquireQueuedSpinLock(_Number, OldIrql) {
    OldIrqlMarshal := OldIrql is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeTryToAcquireQueuedSpinLock", KSPIN_LOCK_QUEUE_NUMBER, _Number, OldIrqlMarshal, OldIrql, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @returns {Integer} 
 */
export KeAcquireSpinLockRaiseToSynch(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeAcquireSpinLockRaiseToSynch", SpinLockMarshal, SpinLock, Int8)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PoolBlock 
 * @param {Pointer<BOOLEAN>} QuotaCharged 
 * @returns {Pointer} 
 */
export ExQueryPoolBlockSize(PoolBlock, QuotaCharged) {
    PoolBlockMarshal := PoolBlock is VarRef ? "ptr" : "ptr"
    QuotaChargedMarshal := QuotaCharged is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExQueryPoolBlockSize", PoolBlockMarshal, PoolBlock, QuotaChargedMarshal, QuotaCharged, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export ExDisableResourceBoostLite(Resource) {
    DllCall("ntoskrnl.exe\ExDisableResourceBoostLite", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
 * @returns {String} Nothing - always returns an empty string
 */
export SeDeleteClientSecurity(ClientContext) {
    DllCall("ntoskrnl.exe\SeDeleteClientSecurity", SECURITY_CLIENT_CONTEXT.Ptr, ClientContext)
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {PEPROCESS} Process 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @returns {String} Nothing - always returns an empty string
 */
export SeCaptureSubjectContextEx(Thread, Process, SubjectContext) {
    DllCall("ntoskrnl.exe\SeCaptureSubjectContextEx", PETHREAD, Thread, PEPROCESS, Process, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext)
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer<UNICODE_STRING>} SourceName 
 * @param {PSID} UserSid 
 * @param {Pointer<SE_ADT_PARAMETER_ARRAY>} AuditParameters 
 * @param {Integer} AuditSubcategoryId 
 * @returns {NTSTATUS} 
 */
export SeReportSecurityEventWithSubCategory(Flags, SourceName, UserSid, AuditParameters, AuditSubcategoryId) {
    result := DllCall("ntoskrnl.exe\SeReportSecurityEventWithSubCategory", "uint", Flags, UNICODE_STRING.Ptr, SourceName, PSID, UserSid, SE_ADT_PARAMETER_ARRAY.Ptr, AuditParameters, "uint", AuditSubcategoryId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<TOKEN_ACCESS_INFORMATION>} PrimaryTokenInformation 
 * @param {Pointer<TOKEN_ACCESS_INFORMATION>} ClientTokenInformation 
 * @param {Integer} DesiredAccess 
 * @param {Integer} PreviouslyGrantedAccess 
 * @param {Pointer<Pointer<PRIVILEGE_SET>>} Privileges 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {Integer} AccessMode 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @returns {BOOLEAN} 
 */
export SeAccessCheckFromState(_SecurityDescriptor, PrimaryTokenInformation, ClientTokenInformation, DesiredAccess, PreviouslyGrantedAccess, Privileges, GenericMapping, AccessMode, GrantedAccess, AccessStatus) {
    PrivilegesMarshal := Privileges is VarRef ? "ptr*" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeAccessCheckFromState", PSECURITY_DESCRIPTOR, _SecurityDescriptor, TOKEN_ACCESS_INFORMATION.Ptr, PrimaryTokenInformation, TOKEN_ACCESS_INFORMATION.Ptr, ClientTokenInformation, "uint", DesiredAccess, "uint", PreviouslyGrantedAccess, PrivilegesMarshal, Privileges, GENERIC_MAPPING.Ptr, GenericMapping, "char", AccessMode, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<Void>} PrimaryToken 
 * @param {Pointer<Void>} ClientToken 
 * @param {Integer} DesiredAccess 
 * @param {Integer} PreviouslyGrantedAccess 
 * @param {Pointer<Pointer<PRIVILEGE_SET>>} Privileges 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {Integer} AccessMode 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @returns {BOOLEAN} 
 */
export SeAccessCheckFromStateEx(_SecurityDescriptor, PrimaryToken, ClientToken, DesiredAccess, PreviouslyGrantedAccess, Privileges, GenericMapping, AccessMode, GrantedAccess, AccessStatus) {
    PrimaryTokenMarshal := PrimaryToken is VarRef ? "ptr" : "ptr"
    ClientTokenMarshal := ClientToken is VarRef ? "ptr" : "ptr"
    PrivilegesMarshal := Privileges is VarRef ? "ptr*" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeAccessCheckFromStateEx", PSECURITY_DESCRIPTOR, _SecurityDescriptor, PrimaryTokenMarshal, PrimaryToken, ClientTokenMarshal, ClientToken, "uint", DesiredAccess, "uint", PreviouslyGrantedAccess, PrivilegesMarshal, Privileges, GENERIC_MAPPING.Ptr, GenericMapping, "char", AccessMode, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<TOKEN_ACCESS_INFORMATION>} AccessInformation 
 * @param {Pointer<Void>} Token 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} RequiredLength 
 * @returns {NTSTATUS} 
 */
export SeTokenFromAccessInformation(AccessInformation, Token, Length, RequiredLength) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"
    RequiredLengthMarshal := RequiredLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeTokenFromAccessInformation", TOKEN_ACCESS_INFORMATION.Ptr, AccessInformation, TokenMarshal, Token, "uint", Length, RequiredLengthMarshal, RequiredLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @param {Integer} AccessMode 
 * @returns {BOOLEAN} 
 */
export SePrivilegeCheck(RequiredPrivileges, SubjectSecurityContext, AccessMode) {
    result := DllCall("ntoskrnl.exe\SePrivilegeCheck", PRIVILEGE_SET.Ptr, RequiredPrivileges, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, "char", AccessMode, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @returns {String} Nothing - always returns an empty string
 */
export SeFreePrivileges(Privileges) {
    DllCall("ntoskrnl.exe\SeFreePrivileges", PRIVILEGE_SET.Ptr, Privileges)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @param {BOOLEAN} ObjectCreated 
 * @param {BOOLEAN} AccessGranted 
 * @param {Integer} AccessMode 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {String} Nothing - always returns an empty string
 */
export SeOpenObjectAuditAlarm(ObjectTypeName, _Object, AbsoluteObjectName, _SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, GenerateOnClose) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\SeOpenObjectAuditAlarm", UNICODE_STRING.Ptr, ObjectTypeName, _ObjectMarshal, _Object, UNICODE_STRING.Ptr, AbsoluteObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, ACCESS_STATE.Ptr, AccessState, BOOLEAN, ObjectCreated, BOOLEAN, AccessGranted, "char", AccessMode, GenerateOnCloseMarshal, GenerateOnClose)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @param {BOOLEAN} ObjectCreated 
 * @param {BOOLEAN} AccessGranted 
 * @param {Integer} AccessMode 
 * @param {Pointer<Guid>} TransactionId 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {String} Nothing - always returns an empty string
 */
export SeOpenObjectAuditAlarmWithTransaction(ObjectTypeName, _Object, AbsoluteObjectName, _SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, TransactionId, GenerateOnClose) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\SeOpenObjectAuditAlarmWithTransaction", UNICODE_STRING.Ptr, ObjectTypeName, _ObjectMarshal, _Object, UNICODE_STRING.Ptr, AbsoluteObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, ACCESS_STATE.Ptr, AccessState, BOOLEAN, ObjectCreated, BOOLEAN, AccessGranted, "char", AccessMode, Guid.Ptr, TransactionId, GenerateOnCloseMarshal, GenerateOnClose)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @param {BOOLEAN} ObjectCreated 
 * @param {BOOLEAN} AccessGranted 
 * @param {Integer} AccessMode 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {String} Nothing - always returns an empty string
 */
export SeOpenObjectForDeleteAuditAlarm(ObjectTypeName, _Object, AbsoluteObjectName, _SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, GenerateOnClose) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\SeOpenObjectForDeleteAuditAlarm", UNICODE_STRING.Ptr, ObjectTypeName, _ObjectMarshal, _Object, UNICODE_STRING.Ptr, AbsoluteObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, ACCESS_STATE.Ptr, AccessState, BOOLEAN, ObjectCreated, BOOLEAN, AccessGranted, "char", AccessMode, GenerateOnCloseMarshal, GenerateOnClose)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @param {BOOLEAN} ObjectCreated 
 * @param {BOOLEAN} AccessGranted 
 * @param {Integer} AccessMode 
 * @param {Pointer<Guid>} TransactionId 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {String} Nothing - always returns an empty string
 */
export SeOpenObjectForDeleteAuditAlarmWithTransaction(ObjectTypeName, _Object, AbsoluteObjectName, _SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, TransactionId, GenerateOnClose) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\SeOpenObjectForDeleteAuditAlarmWithTransaction", UNICODE_STRING.Ptr, ObjectTypeName, _ObjectMarshal, _Object, UNICODE_STRING.Ptr, AbsoluteObjectName, PSECURITY_DESCRIPTOR, _SecurityDescriptor, ACCESS_STATE.Ptr, AccessState, BOOLEAN, ObjectCreated, BOOLEAN, AccessGranted, "char", AccessMode, Guid.Ptr, TransactionId, GenerateOnCloseMarshal, GenerateOnClose)
}

/**
 * 
 * @param {Pointer<ACL>} Sacl 
 * @param {Pointer<ACL>} ResourceSacl 
 * @param {Pointer<Void>} Token 
 * @param {Integer} DesiredAccess 
 * @param {BOOLEAN} AccessGranted 
 * @param {Pointer<BOOLEAN>} GenerateAudit 
 * @param {Pointer<BOOLEAN>} GenerateAlarm 
 * @returns {String} Nothing - always returns an empty string
 */
export SeExamineSacl(Sacl, ResourceSacl, Token, DesiredAccess, AccessGranted, GenerateAudit, GenerateAlarm) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"
    GenerateAuditMarshal := GenerateAudit is VarRef ? "char*" : "ptr"
    GenerateAlarmMarshal := GenerateAlarm is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\SeExamineSacl", ACL.Ptr, Sacl, ACL.Ptr, ResourceSacl, TokenMarshal, Token, "uint", DesiredAccess, BOOLEAN, AccessGranted, GenerateAuditMarshal, GenerateAudit, GenerateAlarmMarshal, GenerateAlarm)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {HANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export SeDeleteObjectAuditAlarm(_Object, _Handle) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\SeDeleteObjectAuditAlarm", _ObjectMarshal, _Object, HANDLE, _Handle)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {HANDLE} _Handle 
 * @param {Pointer<Guid>} TransactionId 
 * @returns {String} Nothing - always returns an empty string
 */
export SeDeleteObjectAuditAlarmWithTransaction(_Object, _Handle, TransactionId) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\SeDeleteObjectAuditAlarmWithTransaction", _ObjectMarshal, _Object, HANDLE, _Handle, Guid.Ptr, TransactionId)
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @returns {TOKEN_TYPE} 
 */
export SeTokenType(Token) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeTokenType", TokenMarshal, Token, TOKEN_TYPE)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @returns {BOOLEAN} 
 */
export SeTokenIsAdmin(Token) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeTokenIsAdmin", TokenMarshal, Token, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @returns {BOOLEAN} 
 */
export SeTokenIsRestricted(Token) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeTokenIsRestricted", TokenMarshal, Token, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @returns {BOOLEAN} 
 */
export SeTokenIsWriteRestricted(Token) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeTokenIsWriteRestricted", TokenMarshal, Token, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ExistingToken 
 * @param {Integer} Flags 
 * @param {Pointer<TOKEN_GROUPS>} SidsToDisable 
 * @param {Pointer<TOKEN_PRIVILEGES>} PrivilegesToDelete 
 * @param {Pointer<TOKEN_GROUPS>} RestrictedSids 
 * @param {Pointer<Pointer<Void>>} FilteredToken 
 * @returns {NTSTATUS} 
 */
export SeFilterToken(ExistingToken, Flags, SidsToDisable, PrivilegesToDelete, RestrictedSids, FilteredToken) {
    ExistingTokenMarshal := ExistingToken is VarRef ? "ptr" : "ptr"
    FilteredTokenMarshal := FilteredToken is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeFilterToken", ExistingTokenMarshal, ExistingToken, "uint", Flags, TOKEN_GROUPS.Ptr, SidsToDisable, TOKEN_PRIVILEGES.Ptr, PrivilegesToDelete, TOKEN_GROUPS.Ptr, RestrictedSids, FilteredTokenMarshal, FilteredToken, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @param {Pointer<LUID>} AuthenticationId 
 * @returns {NTSTATUS} 
 */
export SeQueryAuthenticationIdToken(Token, AuthenticationId) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeQueryAuthenticationIdToken", TokenMarshal, Token, LUID.Ptr, AuthenticationId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @param {Pointer<Integer>} SessionId 
 * @returns {NTSTATUS} 
 */
export SeQuerySessionIdToken(Token, SessionId) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"
    SessionIdMarshal := SessionId is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeQuerySessionIdToken", TokenMarshal, Token, SessionIdMarshal, SessionId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @param {Pointer<Integer>} SessionId 
 * @param {Pointer<BOOLEAN>} IsServiceSession 
 * @returns {NTSTATUS} 
 */
export SeQuerySessionIdTokenEx(Token, SessionId, IsServiceSession) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"
    SessionIdMarshal := SessionId is VarRef ? "uint*" : "ptr"
    IsServiceSessionMarshal := IsServiceSession is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeQuerySessionIdTokenEx", TokenMarshal, Token, SessionIdMarshal, SessionId, IsServiceSessionMarshal, IsServiceSession, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @param {Pointer<PESILO>} pServerSilo 
 * @returns {NTSTATUS} 
 */
export SeQueryServerSiloToken(Token, pServerSilo) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"
    pServerSiloMarshal := pServerSilo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeQueryServerSiloToken", TokenMarshal, Token, pServerSiloMarshal, pServerSilo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PETHREAD} ClientThread 
 * @param {Pointer<SECURITY_QUALITY_OF_SERVICE>} ClientSecurityQos 
 * @param {BOOLEAN} RemoteSession 
 * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
 * @returns {NTSTATUS} 
 */
export SeCreateClientSecurity(ClientThread, ClientSecurityQos, RemoteSession, ClientContext) {
    result := DllCall("ntoskrnl.exe\SeCreateClientSecurity", PETHREAD, ClientThread, SECURITY_QUALITY_OF_SERVICE.Ptr, ClientSecurityQos, BOOLEAN, RemoteSession, SECURITY_CLIENT_CONTEXT.Ptr, ClientContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
 * @param {PETHREAD} ServerThread 
 * @returns {String} Nothing - always returns an empty string
 */
export SeImpersonateClient(ClientContext, ServerThread) {
    DllCall("ntoskrnl.exe\SeImpersonateClient", SECURITY_CLIENT_CONTEXT.Ptr, ClientContext, PETHREAD, ServerThread)
}

/**
 * 
 * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
 * @param {PETHREAD} ServerThread 
 * @returns {NTSTATUS} 
 */
export SeImpersonateClientEx(ClientContext, ServerThread) {
    result := DllCall("ntoskrnl.exe\SeImpersonateClientEx", SECURITY_CLIENT_CONTEXT.Ptr, ClientContext, PETHREAD, ServerThread, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @param {Pointer<SECURITY_QUALITY_OF_SERVICE>} ClientSecurityQos 
 * @param {BOOLEAN} ServerIsRemote 
 * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
 * @returns {NTSTATUS} 
 */
export SeCreateClientSecurityFromSubjectContext(SubjectContext, ClientSecurityQos, ServerIsRemote, ClientContext) {
    result := DllCall("ntoskrnl.exe\SeCreateClientSecurityFromSubjectContext", SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext, SECURITY_QUALITY_OF_SERVICE.Ptr, ClientSecurityQos, BOOLEAN, ServerIsRemote, SECURITY_CLIENT_CONTEXT.Ptr, ClientContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} SecurityInformation 
 * @param {Integer} _SecurityDescriptor 
 * @param {Pointer<Integer>} Length 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor 
 * @returns {NTSTATUS} 
 */
export SeQuerySecurityDescriptorInfo(SecurityInformation, _SecurityDescriptor, Length, ObjectsSecurityDescriptor) {
    SecurityInformationMarshal := SecurityInformation is VarRef ? "uint*" : "ptr"
    LengthMarshal := Length is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeQuerySecurityDescriptorInfo", SecurityInformationMarshal, SecurityInformation, "ptr", _SecurityDescriptor, LengthMarshal, Length, PSECURITY_DESCRIPTOR.Ptr, ObjectsSecurityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Integer>} SecurityInformation 
 * @param {PSECURITY_DESCRIPTOR} ModificationDescriptor 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @returns {NTSTATUS} 
 */
export SeSetSecurityDescriptorInfo(_Object, SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, PoolType, GenericMapping) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    SecurityInformationMarshal := SecurityInformation is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeSetSecurityDescriptorInfo", _ObjectMarshal, _Object, SecurityInformationMarshal, SecurityInformation, PSECURITY_DESCRIPTOR, ModificationDescriptor, PSECURITY_DESCRIPTOR.Ptr, ObjectsSecurityDescriptor, POOL_TYPE, PoolType, GENERIC_MAPPING.Ptr, GenericMapping, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Integer>} SecurityInformation 
 * @param {PSECURITY_DESCRIPTOR} ModificationDescriptor 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor 
 * @param {Integer} AutoInheritFlags 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @returns {NTSTATUS} 
 */
export SeSetSecurityDescriptorInfoEx(_Object, SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, AutoInheritFlags, PoolType, GenericMapping) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    SecurityInformationMarshal := SecurityInformation is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeSetSecurityDescriptorInfoEx", _ObjectMarshal, _Object, SecurityInformationMarshal, SecurityInformation, PSECURITY_DESCRIPTOR, ModificationDescriptor, PSECURITY_DESCRIPTOR.Ptr, ObjectsSecurityDescriptor, "uint", AutoInheritFlags, POOL_TYPE, PoolType, GENERIC_MAPPING.Ptr, GenericMapping, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @param {Pointer<PRIVILEGE_SET>} Privileges 
 * @returns {NTSTATUS} 
 */
export SeAppendPrivileges(AccessState, Privileges) {
    result := DllCall("ntoskrnl.exe\SeAppendPrivileges", ACCESS_STATE.Ptr, AccessState, PRIVILEGE_SET.Ptr, Privileges, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {Pointer<UNICODE_STRING>} LinkName 
 * @param {BOOLEAN} bSuccess 
 * @returns {String} Nothing - always returns an empty string
 */
export SeAuditHardLinkCreation(FileName, LinkName, bSuccess) {
    DllCall("ntoskrnl.exe\SeAuditHardLinkCreation", UNICODE_STRING.Ptr, FileName, UNICODE_STRING.Ptr, LinkName, BOOLEAN, bSuccess)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {Pointer<UNICODE_STRING>} LinkName 
 * @param {BOOLEAN} bSuccess 
 * @param {Pointer<Guid>} TransactionId 
 * @returns {String} Nothing - always returns an empty string
 */
export SeAuditHardLinkCreationWithTransaction(FileName, LinkName, bSuccess, TransactionId) {
    DllCall("ntoskrnl.exe\SeAuditHardLinkCreationWithTransaction", UNICODE_STRING.Ptr, FileName, UNICODE_STRING.Ptr, LinkName, BOOLEAN, bSuccess, Guid.Ptr, TransactionId)
}

/**
 * 
 * @param {BOOLEAN} bSuccess 
 * @param {Integer} SelftestCode 
 * @returns {String} Nothing - always returns an empty string
 */
export SeAuditFipsCryptoSelftests(bSuccess, SelftestCode) {
    DllCall("ntoskrnl.exe\SeAuditFipsCryptoSelftests", BOOLEAN, bSuccess, "uint", SelftestCode)
}

/**
 * 
 * @param {Pointer<Guid>} TransactionId 
 * @param {Pointer<Guid>} ResourceManagerId 
 * @param {Integer} NewTransactionState 
 * @returns {String} Nothing - always returns an empty string
 */
export SeAuditTransactionStateChange(TransactionId, ResourceManagerId, NewTransactionState) {
    DllCall("ntoskrnl.exe\SeAuditTransactionStateChange", Guid.Ptr, TransactionId, Guid.Ptr, ResourceManagerId, "uint", NewTransactionState)
}

/**
 * 
 * @param {BOOLEAN} AccessGranted 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {BOOLEAN} 
 */
export SeAuditingFileEvents(AccessGranted, _SecurityDescriptor) {
    result := DllCall("ntoskrnl.exe\SeAuditingFileEvents", BOOLEAN, AccessGranted, PSECURITY_DESCRIPTOR, _SecurityDescriptor, BOOLEAN)
    return result
}

/**
 * 
 * @param {BOOLEAN} AccessGranted 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @returns {BOOLEAN} 
 */
export SeAuditingFileEventsWithContext(AccessGranted, _SecurityDescriptor, SubjectSecurityContext) {
    result := DllCall("ntoskrnl.exe\SeAuditingFileEventsWithContext", BOOLEAN, AccessGranted, PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @returns {BOOLEAN} 
 */
export SeAuditingAnyFileEventsWithContext(_SecurityDescriptor, SubjectSecurityContext) {
    result := DllCall("ntoskrnl.exe\SeAuditingAnyFileEventsWithContext", PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {BOOLEAN} AccessGranted 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @param {Pointer<BOOLEAN>} StagingEnabled 
 * @returns {BOOLEAN} 
 */
export SeAuditingFileEventsWithContextEx(AccessGranted, _SecurityDescriptor, SubjectSecurityContext, StagingEnabled) {
    StagingEnabledMarshal := StagingEnabled is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeAuditingFileEventsWithContextEx", BOOLEAN, AccessGranted, PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, StagingEnabledMarshal, StagingEnabled, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @param {Pointer<BOOLEAN>} StagingEnabled 
 * @returns {BOOLEAN} 
 */
export SeAuditingAnyFileEventsWithContextEx(_SecurityDescriptor, SubjectSecurityContext, StagingEnabled) {
    StagingEnabledMarshal := StagingEnabled is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeAuditingAnyFileEventsWithContextEx", PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, StagingEnabledMarshal, StagingEnabled, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _ObjectType 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @returns {String} Nothing - always returns an empty string
 */
export SeAdjustAccessStateForTrustLabel(_ObjectType, _SecurityDescriptor, AccessState) {
    _ObjectTypeMarshal := _ObjectType is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\SeAdjustAccessStateForTrustLabel", _ObjectTypeMarshal, _ObjectType, PSECURITY_DESCRIPTOR, _SecurityDescriptor, ACCESS_STATE.Ptr, AccessState)
}

/**
 * 
 * @param {Pointer<Void>} _ObjectType 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @returns {String} Nothing - always returns an empty string
 */
export SeAdjustAccessStateForAccessConstraints(_ObjectType, _SecurityDescriptor, AccessState) {
    _ObjectTypeMarshal := _ObjectType is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\SeAdjustAccessStateForAccessConstraints", _ObjectTypeMarshal, _ObjectType, PSECURITY_DESCRIPTOR, _SecurityDescriptor, ACCESS_STATE.Ptr, AccessState)
}

/**
 * 
 * @param {Pointer<Void>} _ObjectType 
 * @param {PSECURITY_DESCRIPTOR} ChildDescriptor 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @returns {BOOLEAN} 
 */
export SeShouldCheckForAccessRightsFromParent(_ObjectType, ChildDescriptor, AccessState) {
    _ObjectTypeMarshal := _ObjectType is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeShouldCheckForAccessRightsFromParent", _ObjectTypeMarshal, _ObjectType, PSECURITY_DESCRIPTOR, ChildDescriptor, ACCESS_STATE.Ptr, AccessState, BOOLEAN)
    return result
}

/**
 * 
 * @param {BOOLEAN} AccessGranted 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {BOOLEAN} 
 */
export SeAuditingHardLinkEvents(AccessGranted, _SecurityDescriptor) {
    result := DllCall("ntoskrnl.exe\SeAuditingHardLinkEvents", BOOLEAN, AccessGranted, PSECURITY_DESCRIPTOR, _SecurityDescriptor, BOOLEAN)
    return result
}

/**
 * 
 * @param {BOOLEAN} AccessGranted 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @returns {BOOLEAN} 
 */
export SeAuditingHardLinkEventsWithContext(AccessGranted, _SecurityDescriptor, SubjectSecurityContext) {
    result := DllCall("ntoskrnl.exe\SeAuditingHardLinkEventsWithContext", BOOLEAN, AccessGranted, PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {BOOLEAN} AccessGranted 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @returns {BOOLEAN} 
 */
export SeAuditingFileOrGlobalEvents(AccessGranted, _SecurityDescriptor, SubjectSecurityContext) {
    result := DllCall("ntoskrnl.exe\SeAuditingFileOrGlobalEvents", BOOLEAN, AccessGranted, PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ACCESS_STATE>} AccessState 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @returns {String} Nothing - always returns an empty string
 */
export SeSetAccessStateGenericMapping(AccessState, GenericMapping) {
    DllCall("ntoskrnl.exe\SeSetAccessStateGenericMapping", ACCESS_STATE.Ptr, AccessState, GENERIC_MAPPING.Ptr, GenericMapping)
}

/**
 * 
 * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE>} CallbackRoutine 
 * @returns {NTSTATUS} 
 */
export SeRegisterLogonSessionTerminatedRoutine(CallbackRoutine) {
    result := DllCall("ntoskrnl.exe\SeRegisterLogonSessionTerminatedRoutine", "ptr", CallbackRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE>} CallbackRoutine 
 * @returns {NTSTATUS} 
 */
export SeUnregisterLogonSessionTerminatedRoutine(CallbackRoutine) {
    result := DllCall("ntoskrnl.exe\SeUnregisterLogonSessionTerminatedRoutine", "ptr", CallbackRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX>} CallbackRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export SeRegisterLogonSessionTerminatedRoutineEx(CallbackRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeRegisterLogonSessionTerminatedRoutineEx", "ptr", CallbackRoutine, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX>} CallbackRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export SeUnregisterLogonSessionTerminatedRoutineEx(CallbackRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeUnregisterLogonSessionTerminatedRoutineEx", "ptr", CallbackRoutine, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LUID>} LogonId 
 * @returns {NTSTATUS} 
 */
export SeMarkLogonSessionForTerminationNotification(LogonId) {
    result := DllCall("ntoskrnl.exe\SeMarkLogonSessionForTerminationNotification", LUID.Ptr, LogonId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LUID>} LogonId 
 * @param {PESILO} pServerSilo 
 * @returns {NTSTATUS} 
 */
export SeMarkLogonSessionForTerminationNotificationEx(LogonId, pServerSilo) {
    result := DllCall("ntoskrnl.exe\SeMarkLogonSessionForTerminationNotificationEx", LUID.Ptr, LogonId, PESILO, pServerSilo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Token 
 * @param {TOKEN_INFORMATION_CLASS} TokenInformationClass 
 * @param {Pointer<Pointer<Void>>} TokenInformation 
 * @returns {NTSTATUS} 
 */
export SeQueryInformationToken(Token, TokenInformationClass, TokenInformation) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"
    TokenInformationMarshal := TokenInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeQueryInformationToken", TokenMarshal, Token, TOKEN_INFORMATION_CLASS, TokenInformationClass, TokenInformationMarshal, TokenInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @param {Pointer<Pointer<UNICODE_STRING>>} pImageFileName 
 * @returns {NTSTATUS} 
 */
export SeLocateProcessImageName(Process, pImageFileName) {
    pImageFileNameMarshal := pImageFileName is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeLocateProcessImageName", PEPROCESS, Process, pImageFileNameMarshal, pImageFileName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} _Context 
 * @param {Integer} PreviousMode 
 * @returns {BOOLEAN} 
 */
export RtlIsSandboxedToken(_Context, PreviousMode) {
    result := DllCall("ntoskrnl.exe\RtlIsSandboxedToken", SECURITY_SUBJECT_CONTEXT.Ptr, _Context, "char", PreviousMode, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} CurrentDescriptor 
 * @param {PSECURITY_DESCRIPTOR} NewDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @param {Pointer<BOOLEAN>} AceRemoved 
 * @returns {String} Nothing - always returns an empty string
 */
export SeCheckForCriticalAceRemoval(CurrentDescriptor, NewDescriptor, SubjectSecurityContext, AceRemoved) {
    AceRemovedMarshal := AceRemoved is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\SeCheckForCriticalAceRemoval", PSECURITY_DESCRIPTOR, CurrentDescriptor, PSECURITY_DESCRIPTOR, NewDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, AceRemovedMarshal, AceRemoved)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {PSECURITY_DESCRIPTOR} OriginalDescriptor 
 * @param {PSECURITY_DESCRIPTOR} ProposedDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} AdjustedDescriptor 
 * @param {Pointer<BOOLEAN>} ApplyAdjustedDescriptor 
 * @returns {NTSTATUS} 
 */
export SeAdjustObjectSecurity(ObjectName, OriginalDescriptor, ProposedDescriptor, SubjectSecurityContext, AdjustedDescriptor, ApplyAdjustedDescriptor) {
    ApplyAdjustedDescriptorMarshal := ApplyAdjustedDescriptor is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeAdjustObjectSecurity", UNICODE_STRING.Ptr, ObjectName, PSECURITY_DESCRIPTOR, OriginalDescriptor, PSECURITY_DESCRIPTOR, ProposedDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, PSECURITY_DESCRIPTOR.Ptr, AdjustedDescriptor, ApplyAdjustedDescriptorMarshal, ApplyAdjustedDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {HANDLE} Token 
 * @returns {NTSTATUS} 
 */
export PsAssignImpersonationToken(Thread, Token) {
    result := DllCall("ntoskrnl.exe\PsAssignImpersonationToken", PETHREAD, Thread, HANDLE, Token, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @returns {Pointer<Void>} 
 */
export PsReferencePrimaryToken(Process) {
    result := DllCall("ntoskrnl.exe\PsReferencePrimaryToken", PEPROCESS, Process, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PrimaryToken 
 * @returns {String} Nothing - always returns an empty string
 */
export PsDereferencePrimaryToken(PrimaryToken) {
    PrimaryTokenMarshal := PrimaryToken is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PsDereferencePrimaryToken", PrimaryTokenMarshal, PrimaryToken)
}

/**
 * 
 * @param {Pointer<Void>} ImpersonationToken 
 * @returns {String} Nothing - always returns an empty string
 */
export PsDereferenceImpersonationToken(ImpersonationToken) {
    ImpersonationTokenMarshal := ImpersonationToken is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PsDereferenceImpersonationToken", ImpersonationTokenMarshal, ImpersonationToken)
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {Pointer<BOOLEAN>} CopyOnOpen 
 * @param {Pointer<BOOLEAN>} EffectiveOnly 
 * @param {Pointer<SECURITY_IMPERSONATION_LEVEL>} ImpersonationLevel 
 * @returns {Pointer<Void>} 
 */
export PsReferenceImpersonationToken(Thread, CopyOnOpen, EffectiveOnly, ImpersonationLevel) {
    CopyOnOpenMarshal := CopyOnOpen is VarRef ? "char*" : "ptr"
    EffectiveOnlyMarshal := EffectiveOnly is VarRef ? "char*" : "ptr"
    ImpersonationLevelMarshal := ImpersonationLevel is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsReferenceImpersonationToken", PETHREAD, Thread, CopyOnOpenMarshal, CopyOnOpen, EffectiveOnlyMarshal, EffectiveOnly, ImpersonationLevelMarshal, ImpersonationLevel, IntPtr)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export PsGetProcessExitTime() {
    result := DllCall("ntoskrnl.exe\PsGetProcessExitTime", Int64)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {BOOLEAN} 
 */
export PsIsThreadTerminating(Thread) {
    result := DllCall("ntoskrnl.exe\PsIsThreadTerminating", PETHREAD, Thread, BOOLEAN)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {Pointer<Void>} Token 
 * @param {BOOLEAN} CopyOnOpen 
 * @param {BOOLEAN} EffectiveOnly 
 * @param {SECURITY_IMPERSONATION_LEVEL} ImpersonationLevel 
 * @returns {NTSTATUS} 
 */
export PsImpersonateClient(Thread, Token, CopyOnOpen, EffectiveOnly, ImpersonationLevel) {
    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PsImpersonateClient", PETHREAD, Thread, TokenMarshal, Token, BOOLEAN, CopyOnOpen, BOOLEAN, EffectiveOnly, SECURITY_IMPERSONATION_LEVEL, ImpersonationLevel, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {Pointer<SE_IMPERSONATION_STATE>} ImpersonationState 
 * @returns {BOOLEAN} 
 */
export PsDisableImpersonation(Thread, ImpersonationState) {
    result := DllCall("ntoskrnl.exe\PsDisableImpersonation", PETHREAD, Thread, SE_IMPERSONATION_STATE.Ptr, ImpersonationState, BOOLEAN)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {Pointer<SE_IMPERSONATION_STATE>} ImpersonationState 
 * @returns {String} Nothing - always returns an empty string
 */
export PsRestoreImpersonation(Thread, ImpersonationState) {
    DllCall("ntoskrnl.exe\PsRestoreImpersonation", PETHREAD, Thread, SE_IMPERSONATION_STATE.Ptr, ImpersonationState)
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export PsRevertToSelf() {
    DllCall("ntoskrnl.exe\PsRevertToSelf")
}

/**
 * 
 * @param {HANDLE} ProcessId 
 * @param {Pointer<PEPROCESS>} Process 
 * @returns {NTSTATUS} 
 */
export PsLookupProcessByProcessId(ProcessId, Process) {
    ProcessMarshal := Process is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsLookupProcessByProcessId", HANDLE, ProcessId, ProcessMarshal, Process, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadId 
 * @param {Pointer<PETHREAD>} Thread 
 * @returns {NTSTATUS} 
 */
export PsLookupThreadByThreadId(ThreadId, Thread) {
    ThreadMarshal := Thread is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsLookupThreadByThreadId", HANDLE, ThreadId, ThreadMarshal, Thread, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} Amount 
 * @returns {String} Nothing - always returns an empty string
 */
export PsChargePoolQuota(Process, PoolType, Amount) {
    DllCall("ntoskrnl.exe\PsChargePoolQuota", PEPROCESS, Process, POOL_TYPE, PoolType, "ptr", Amount)
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} Amount 
 * @returns {NTSTATUS} 
 */
export PsChargeProcessPoolQuota(Process, PoolType, Amount) {
    result := DllCall("ntoskrnl.exe\PsChargeProcessPoolQuota", PEPROCESS, Process, POOL_TYPE, PoolType, "ptr", Amount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} Amount 
 * @returns {String} Nothing - always returns an empty string
 */
export PsReturnPoolQuota(Process, PoolType, Amount) {
    DllCall("ntoskrnl.exe\PsReturnPoolQuota", PEPROCESS, Process, POOL_TYPE, PoolType, "ptr", Amount)
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {PEPROCESS} 
 */
export PsGetThreadProcess(Thread) {
    result := DllCall("ntoskrnl.exe\PsGetThreadProcess", PETHREAD, Thread, PEPROCESS)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {BOOLEAN} 
 */
export PsIsSystemThread(Thread) {
    result := DllCall("ntoskrnl.exe\PsIsSystemThread", PETHREAD, Thread, BOOLEAN)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @param {Integer} BytesRead 
 * @param {Integer} BytesWritten 
 * @param {Integer} ReadOperationCount 
 * @param {Integer} WriteOperationCount 
 * @param {Integer} FlushOperationCount 
 * @returns {String} Nothing - always returns an empty string
 */
export PsUpdateDiskCounters(Process, BytesRead, BytesWritten, ReadOperationCount, WriteOperationCount, FlushOperationCount) {
    DllCall("ntoskrnl.exe\PsUpdateDiskCounters", PEPROCESS, Process, "uint", BytesRead, "uint", BytesWritten, "uint", ReadOperationCount, "uint", WriteOperationCount, "uint", FlushOperationCount)
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export PsIsDiskCountersEnabled() {
    result := DllCall("ntoskrnl.exe\PsIsDiskCountersEnabled", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} FilterDriverObject 
 * @param {Pointer<FS_FILTER_CALLBACKS>} Callbacks 
 * @returns {NTSTATUS} 
 */
export FsRtlRegisterFileSystemFilterCallbacks(FilterDriverObject, Callbacks) {
    result := DllCall("ntoskrnl.exe\FsRtlRegisterFileSystemFilterCallbacks", DRIVER_OBJECT.Ptr, FilterDriverObject, FS_FILTER_CALLBACKS.Ptr, Callbacks, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Irql 
 * @returns {String} Nothing - always returns an empty string
 */
export IoAcquireVpbSpinLock(Irql) {
    IrqlMarshal := Irql is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\IoAcquireVpbSpinLock", IrqlMarshal, Irql)
}

/**
 * 
 * @param {Pointer<Integer>} DesiredAccess 
 * @param {Integer} GrantedAccess 
 * @returns {NTSTATUS} 
 */
export IoCheckDesiredAccess(DesiredAccess, GrantedAccess) {
    DesiredAccessMarshal := DesiredAccess is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCheckDesiredAccess", DesiredAccessMarshal, DesiredAccess, "uint", GrantedAccess, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_FULL_EA_INFORMATION>} EaBuffer 
 * @param {Integer} EaLength 
 * @param {Pointer<Integer>} ErrorOffset 
 * @returns {NTSTATUS} 
 */
export IoCheckEaBufferValidity(EaBuffer, EaLength, ErrorOffset) {
    ErrorOffsetMarshal := ErrorOffset is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCheckEaBufferValidity", FILE_FULL_EA_INFORMATION.Ptr, EaBuffer, "uint", EaLength, ErrorOffsetMarshal, ErrorOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} GrantedAccess 
 * @param {Integer} MajorFunction 
 * @param {Integer} MinorFunction 
 * @param {Integer} IoControlCode 
 * @param {Pointer<Void>} Arg1 
 * @param {Pointer<Void>} Arg2 
 * @returns {NTSTATUS} 
 */
export IoCheckFunctionAccess(GrantedAccess, MajorFunction, MinorFunction, IoControlCode, Arg1, Arg2) {
    Arg1Marshal := Arg1 is VarRef ? "ptr" : "ptr"
    Arg2Marshal := Arg2 is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCheckFunctionAccess", "uint", GrantedAccess, "char", MajorFunction, "char", MinorFunction, "uint", IoControlCode, Arg1Marshal, Arg1, Arg2Marshal, Arg2, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} Length 
 * @param {BOOLEAN} SetOperation 
 * @returns {NTSTATUS} 
 */
export IoCheckQuerySetFileInformation(FileInformationClass, Length, SetOperation) {
    result := DllCall("ntoskrnl.exe\IoCheckQuerySetFileInformation", FILE_INFORMATION_CLASS, FileInformationClass, "uint", Length, BOOLEAN, SetOperation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @param {Integer} Length 
 * @param {BOOLEAN} SetOperation 
 * @returns {NTSTATUS} 
 */
export IoCheckQuerySetVolumeInformation(FsInformationClass, Length, SetOperation) {
    result := DllCall("ntoskrnl.exe\IoCheckQuerySetVolumeInformation", FS_INFORMATION_CLASS, FsInformationClass, "uint", Length, BOOLEAN, SetOperation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_QUOTA_INFORMATION>} QuotaBuffer 
 * @param {Integer} QuotaLength 
 * @param {Pointer<Integer>} ErrorOffset 
 * @returns {NTSTATUS} 
 */
export IoCheckQuotaBufferValidity(QuotaBuffer, QuotaLength, ErrorOffset) {
    ErrorOffsetMarshal := ErrorOffset is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCheckQuotaBufferValidity", FILE_QUOTA_INFORMATION.Ptr, QuotaBuffer, "uint", QuotaLength, ErrorOffsetMarshal, ErrorOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<FILE_OBJECT>} 
 */
export IoCreateStreamFileObject(FileObject, DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoCreateStreamFileObject", FILE_OBJECT.Ptr, FileObject, DEVICE_OBJECT.Ptr, DeviceObject, FILE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<HANDLE>} FileHandle 
 * @returns {Pointer<FILE_OBJECT>} 
 */
export IoCreateStreamFileObjectEx(FileObject, DeviceObject, FileHandle) {
    result := DllCall("ntoskrnl.exe\IoCreateStreamFileObjectEx", FILE_OBJECT.Ptr, FileObject, DEVICE_OBJECT.Ptr, DeviceObject, HANDLE.Ptr, FileHandle, FILE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<FILE_OBJECT>} 
 */
export IoCreateStreamFileObjectLite(FileObject, DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoCreateStreamFileObjectLite", FILE_OBJECT.Ptr, FileObject, DEVICE_OBJECT.Ptr, DeviceObject, FILE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<IO_CREATE_STREAM_FILE_OPTIONS>} CreateOptions 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Pointer<FILE_OBJECT>>} StreamFileObject 
 * @param {Pointer<HANDLE>} FileHandle 
 * @returns {NTSTATUS} 
 */
export IoCreateStreamFileObjectEx2(CreateOptions, FileObject, DeviceObject, StreamFileObject, FileHandle) {
    StreamFileObjectMarshal := StreamFileObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCreateStreamFileObjectEx2", IO_CREATE_STREAM_FILE_OPTIONS.Ptr, CreateOptions, FILE_OBJECT.Ptr, FileObject, DEVICE_OBJECT.Ptr, DeviceObject, StreamFileObjectMarshal, StreamFileObject, HANDLE.Ptr, FileHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} DesiredAccess 
 * @param {Integer} OpenOptions 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} _Buffer 
 * @returns {BOOLEAN} 
 */
export IoFastQueryNetworkAttributes(ObjectAttributes, DesiredAccess, OpenOptions, IoStatus, _Buffer) {
    result := DllCall("ntoskrnl.exe\IoFastQueryNetworkAttributes", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", DesiredAccess, "uint", OpenOptions, IO_STATUS_BLOCK.Ptr, IoStatus, FILE_NETWORK_OPEN_INFORMATION.Ptr, _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Pointer<Integer>} StartingOffset 
 * @param {Pointer<KEVENT>} Event 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export IoPageRead(FileObject, MemoryDescriptorList, StartingOffset, Event, IoStatusBlock) {
    StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoPageRead", FILE_OBJECT.Ptr, FileObject, MDL.Ptr, MemoryDescriptorList, StartingOffsetMarshal, StartingOffset, KEVENT.Ptr, Event, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetAttachedDevice(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoGetAttachedDevice", DEVICE_OBJECT.Ptr, DeviceObject, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetBaseFileSystemDeviceObject(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetBaseFileSystemDeviceObject", FILE_OBJECT.Ptr, FileObject, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetDeviceToVerify(Thread) {
    result := DllCall("ntoskrnl.exe\IoGetDeviceToVerify", PETHREAD, Thread, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {Integer} 
 */
export IoGetRequestorProcessId(_Irp) {
    result := DllCall("ntoskrnl.exe\IoGetRequestorProcessId", IRP.Ptr, _Irp, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {PEPROCESS} 
 */
export IoGetRequestorProcess(_Irp) {
    result := DllCall("ntoskrnl.exe\IoGetRequestorProcess", IRP.Ptr, _Irp, PEPROCESS)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export IoIsOperationSynchronous(_Irp) {
    result := DllCall("ntoskrnl.exe\IoIsOperationSynchronous", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {BOOLEAN} 
 */
export IoIsSystemThread(Thread) {
    result := DllCall("ntoskrnl.exe\IoIsSystemThread", PETHREAD, Thread, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<REPARSE_DATA_BUFFER>} ReparseBuffer 
 * @returns {BOOLEAN} 
 */
export IoIsValidNameGraftingBuffer(_Irp, ReparseBuffer) {
    result := DllCall("ntoskrnl.exe\IoIsValidNameGraftingBuffer", IRP.Ptr, _Irp, REPARSE_DATA_BUFFER.Ptr, ReparseBuffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Pointer<OBJECT_NAME_INFORMATION>>} ObjectNameInformation 
 * @returns {NTSTATUS} 
 */
export IoQueryFileDosDeviceName(FileObject, ObjectNameInformation) {
    ObjectNameInformationMarshal := ObjectNameInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoQueryFileDosDeviceName", FILE_OBJECT.Ptr, FileObject, ObjectNameInformationMarshal, ObjectNameInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} Length 
 * @param {Pointer<Void>} FileInformation 
 * @param {Pointer<Integer>} ReturnedLength 
 * @returns {NTSTATUS} 
 */
export IoQueryFileInformation(FileObject, FileInformationClass, Length, FileInformation, ReturnedLength) {
    FileInformationMarshal := FileInformation is VarRef ? "ptr" : "ptr"
    ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoQueryFileInformation", FILE_OBJECT.Ptr, FileObject, FILE_INFORMATION_CLASS, FileInformationClass, "uint", Length, FileInformationMarshal, FileInformation, ReturnedLengthMarshal, ReturnedLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @param {Integer} Length 
 * @param {Pointer<Void>} FsInformation 
 * @param {Pointer<Integer>} ReturnedLength 
 * @returns {NTSTATUS} 
 */
export IoQueryVolumeInformation(FileObject, FsInformationClass, Length, FsInformation, ReturnedLength) {
    FsInformationMarshal := FsInformation is VarRef ? "ptr" : "ptr"
    ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoQueryVolumeInformation", FILE_OBJECT.Ptr, FileObject, FS_INFORMATION_CLASS, FsInformationClass, "uint", Length, FsInformationMarshal, FsInformation, ReturnedLengthMarshal, ReturnedLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export IoQueueThreadIrp(_Irp) {
    DllCall("ntoskrnl.exe\IoQueueThreadIrp", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRegisterFileSystem(DeviceObject) {
    DllCall("ntoskrnl.exe\IoRegisterFileSystem", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DRIVER_FS_NOTIFICATION>} DriverNotificationRoutine 
 * @returns {NTSTATUS} 
 */
export IoRegisterFsRegistrationChange(DriverObject, DriverNotificationRoutine) {
    result := DllCall("ntoskrnl.exe\IoRegisterFsRegistrationChange", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverNotificationRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DRIVER_FS_NOTIFICATION>} DriverNotificationRoutine 
 * @param {BOOLEAN} SynchronizeWithMounts 
 * @returns {NTSTATUS} 
 */
export IoRegisterFsRegistrationChangeMountAware(DriverObject, DriverNotificationRoutine, SynchronizeWithMounts) {
    result := DllCall("ntoskrnl.exe\IoRegisterFsRegistrationChangeMountAware", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverNotificationRoutine, BOOLEAN, SynchronizeWithMounts, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} DriverObjectList 
 * @param {Integer} DriverObjectListSize 
 * @param {Pointer<Integer>} ActualNumberDriverObjects 
 * @returns {NTSTATUS} 
 */
export IoEnumerateRegisteredFiltersList(DriverObjectList, DriverObjectListSize, ActualNumberDriverObjects) {
    ActualNumberDriverObjectsMarshal := ActualNumberDriverObjects is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoEnumerateRegisteredFiltersList", "ptr", DriverObjectList, "uint", DriverObjectListSize, ActualNumberDriverObjectsMarshal, ActualNumberDriverObjects, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} NewFileName 
 * @param {Integer} FileNameLength 
 * @returns {NTSTATUS} 
 */
export IoReplaceFileObjectName(FileObject, NewFileName, FileNameLength) {
    result := DllCall("ntoskrnl.exe\IoReplaceFileObjectName", FILE_OBJECT.Ptr, FileObject, "ptr", NewFileName, "ushort", FileNameLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Irql 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReleaseVpbSpinLock(Irql) {
    DllCall("ntoskrnl.exe\IoReleaseVpbSpinLock", "char", Irql)
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetDeviceToVerify(Thread, DeviceObject) {
    DllCall("ntoskrnl.exe\IoSetDeviceToVerify", PETHREAD, Thread, DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} Length 
 * @param {Pointer<Void>} FileInformation 
 * @returns {NTSTATUS} 
 */
export IoSetInformation(FileObject, FileInformationClass, Length, FileInformation) {
    FileInformationMarshal := FileInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoSetInformation", FILE_OBJECT.Ptr, FileObject, FILE_INFORMATION_CLASS, FileInformationClass, "uint", Length, FileInformationMarshal, FileInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Pointer<Integer>} StartingOffset 
 * @param {Pointer<KEVENT>} Event 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export IoSynchronousPageWrite(FileObject, MemoryDescriptorList, StartingOffset, Event, IoStatusBlock) {
    StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoSynchronousPageWrite", FILE_OBJECT.Ptr, FileObject, MDL.Ptr, MemoryDescriptorList, StartingOffsetMarshal, StartingOffset, KEVENT.Ptr, Event, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {PEPROCESS} 
 */
export IoThreadToProcess(Thread) {
    result := DllCall("ntoskrnl.exe\IoThreadToProcess", PETHREAD, Thread, PEPROCESS)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUnregisterFileSystem(DeviceObject) {
    DllCall("ntoskrnl.exe\IoUnregisterFileSystem", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DRIVER_FS_NOTIFICATION>} DriverNotificationRoutine 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUnregisterFsRegistrationChange(DriverObject, DriverNotificationRoutine) {
    DllCall("ntoskrnl.exe\IoUnregisterFsRegistrationChange", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverNotificationRoutine)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {BOOLEAN} AllowRawMount 
 * @returns {NTSTATUS} 
 */
export IoVerifyVolume(DeviceObject, AllowRawMount) {
    result := DllCall("ntoskrnl.exe\IoVerifyVolume", DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN, AllowRawMount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Integer>} pSessionId 
 * @returns {NTSTATUS} 
 */
export IoGetRequestorSessionId(_Irp, pSessionId) {
    pSessionIdMarshal := pSessionId is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetRequestorSessionId", IRP.Ptr, _Irp, pSessionIdMarshal, pSessionId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Integer} DeviceObjectList 
 * @param {Integer} DeviceObjectListSize 
 * @param {Pointer<Integer>} ActualNumberDeviceObjects 
 * @returns {NTSTATUS} 
 */
export IoEnumerateDeviceObjectList(DriverObject, DeviceObjectList, DeviceObjectListSize, ActualNumberDeviceObjects) {
    ActualNumberDeviceObjectsMarshal := ActualNumberDeviceObjects is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoEnumerateDeviceObjectList", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DeviceObjectList, "uint", DeviceObjectListSize, ActualNumberDeviceObjectsMarshal, ActualNumberDeviceObjects, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetLowerDeviceObject(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoGetLowerDeviceObject", DEVICE_OBJECT.Ptr, DeviceObject, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetDeviceAttachmentBaseRef(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoGetDeviceAttachmentBaseRef", DEVICE_OBJECT.Ptr, DeviceObject, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} FileSystemDeviceObject 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} DiskDeviceObject 
 * @returns {NTSTATUS} 
 */
export IoGetDiskDeviceObject(FileSystemDeviceObject, DiskDeviceObject) {
    DiskDeviceObjectMarshal := DiskDeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDiskDeviceObject", DEVICE_OBJECT.Ptr, FileSystemDeviceObject, DiskDeviceObjectMarshal, DiskDeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PETHREAD} Thread 
 * @param {Pointer<IO_PRIORITY_INFO>} PriorityInfo 
 * @returns {NTSTATUS} 
 */
export IoRetrievePriorityInfo(_Irp, FileObject, Thread, PriorityInfo) {
    result := DllCall("ntoskrnl.exe\IoRetrievePriorityInfo", IRP.Ptr, _Irp, FILE_OBJECT.Ptr, FileObject, PETHREAD, Thread, IO_PRIORITY_INFO.Ptr, PriorityInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_PRIORITY_INFO>} InputPriorityInfo 
 * @param {Pointer<IO_PRIORITY_INFO>} OutputPriorityInfo 
 * @param {PETHREAD} Thread 
 * @returns {NTSTATUS} 
 */
export IoApplyPriorityInfoThread(InputPriorityInfo, OutputPriorityInfo, Thread) {
    result := DllCall("ntoskrnl.exe\IoApplyPriorityInfoThread", IO_PRIORITY_INFO.Ptr, InputPriorityInfo, IO_PRIORITY_INFO.Ptr, OutputPriorityInfo, PETHREAD, Thread, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>>} RetFsTrackOffsetBlob 
 * @param {Pointer<Integer>} RetTrackedOffset 
 * @returns {NTSTATUS} 
 */
export IoGetFsTrackOffsetState(_Irp, RetFsTrackOffsetBlob, RetTrackedOffset) {
    RetFsTrackOffsetBlobMarshal := RetFsTrackOffsetBlob is VarRef ? "ptr*" : "ptr"
    RetTrackedOffsetMarshal := RetTrackedOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetFsTrackOffsetState", IRP.Ptr, _Irp, RetFsTrackOffsetBlobMarshal, RetFsTrackOffsetBlob, RetTrackedOffsetMarshal, RetTrackedOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>} FsTrackOffsetBlob 
 * @param {Integer} TrackedOffset 
 * @returns {NTSTATUS} 
 */
export IoSetFsTrackOffsetState(_Irp, FsTrackOffsetBlob, TrackedOffset) {
    result := DllCall("ntoskrnl.exe\IoSetFsTrackOffsetState", IRP.Ptr, _Irp, IO_IRP_EXT_TRACK_OFFSET_HEADER.Ptr, FsTrackOffsetBlob, "int64", TrackedOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export IoClearFsTrackOffsetState(_Irp) {
    result := DllCall("ntoskrnl.exe\IoClearFsTrackOffsetState", IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export IoIrpHasFsTrackOffsetExtensionType(_Irp) {
    result := DllCall("ntoskrnl.exe\IoIrpHasFsTrackOffsetExtensionType", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<WORK_QUEUE_ITEM>} WorkItem 
 * @returns {NTSTATUS} 
 */
export PoQueueShutdownWorkItem(WorkItem) {
    result := DllCall("ntoskrnl.exe\PoQueueShutdownWorkItem", WORK_QUEUE_ITEM.Ptr, WorkItem, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export MmIsRecursiveIoFault() {
    result := DllCall("ntoskrnl.exe\MmIsRecursiveIoFault", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {BOOLEAN} DelayClose 
 * @returns {BOOLEAN} 
 */
export MmForceSectionClosed(SectionObjectPointer, DelayClose) {
    result := DllCall("ntoskrnl.exe\MmForceSectionClosed", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, BOOLEAN, DelayClose, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {Integer} ForceCloseFlags 
 * @returns {BOOLEAN} 
 */
export MmForceSectionClosedEx(SectionObjectPointer, ForceCloseFlags) {
    result := DllCall("ntoskrnl.exe\MmForceSectionClosedEx", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, "uint", ForceCloseFlags, BOOLEAN)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export MmGetMaximumFileSectionSize() {
    result := DllCall("ntoskrnl.exe\MmGetMaximumFileSectionSize", Int64)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {MMFLUSH_TYPE} FlushType 
 * @returns {BOOLEAN} 
 */
export MmFlushImageSection(SectionObjectPointer, FlushType) {
    result := DllCall("ntoskrnl.exe\MmFlushImageSection", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, MMFLUSH_TYPE, FlushType, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionPointer 
 * @param {Pointer<Integer>} NewFileSize 
 * @returns {BOOLEAN} 
 */
export MmCanFileBeTruncated(SectionPointer, NewFileSize) {
    NewFileSizeMarshal := NewFileSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmCanFileBeTruncated", SECTION_OBJECT_POINTERS.Ptr, SectionPointer, NewFileSizeMarshal, NewFileSize, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} _Address 
 * @param {Pointer} Length 
 * @returns {BOOLEAN} 
 */
export MmSetAddressRangeModified(_Address, Length) {
    result := DllCall("ntoskrnl.exe\MmSetAddressRangeModified", "ptr", _Address, "ptr", Length, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} FsSectionPointer 
 * @param {Integer} Flags 
 * @param {Pointer<Integer>} SectionIsActive 
 * @returns {NTSTATUS} 
 */
export MmIsFileSectionActive(FsSectionPointer, Flags, SectionIsActive) {
    SectionIsActiveMarshal := SectionIsActive is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmIsFileSectionActive", SECTION_OBJECT_POINTERS.Ptr, FsSectionPointer, "uint", Flags, SectionIsActiveMarshal, SectionIsActive, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} NumberOfLists 
 * @param {Pointer<Pointer<READ_LIST>>} ReadLists 
 * @returns {NTSTATUS} 
 */
export MmPrefetchPages(NumberOfLists, ReadLists) {
    ReadListsMarshal := ReadLists is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmPrefetchPages", "uint", NumberOfLists, ReadListsMarshal, ReadLists, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionPointer 
 * @returns {Integer} 
 */
export MmDoesFileHaveUserWritableReferences(SectionPointer) {
    result := DllCall("ntoskrnl.exe\MmDoesFileHaveUserWritableReferences", SECTION_OBJECT_POINTERS.Ptr, SectionPointer, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} _Mdl 
 * @returns {Integer} 
 */
export MmMdlPagesAreZero(_Mdl) {
    result := DllCall("ntoskrnl.exe\MmMdlPagesAreZero", MDL.Ptr, _Mdl, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<ACCESS_STATE>} PassedAccessState 
 * @param {Integer} DesiredAccess 
 * @param {Integer} ObjectPointerBias 
 * @param {Pointer<Pointer<Void>>} NewObject 
 * @param {Pointer<HANDLE>} _Handle 
 * @returns {NTSTATUS} 
 */
export ObInsertObject(_Object, PassedAccessState, DesiredAccess, ObjectPointerBias, NewObject, _Handle) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    NewObjectMarshal := NewObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObInsertObject", _ObjectMarshal, _Object, ACCESS_STATE.Ptr, PassedAccessState, "uint", DesiredAccess, "uint", ObjectPointerBias, NewObjectMarshal, NewObject, HANDLE.Ptr, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} HandleAttributes 
 * @param {Pointer<ACCESS_STATE>} PassedAccessState 
 * @param {Integer} DesiredAccess 
 * @param {POBJECT_TYPE} _ObjectType 
 * @param {Integer} AccessMode 
 * @param {Pointer<HANDLE>} _Handle 
 * @returns {NTSTATUS} 
 */
export ObOpenObjectByPointer(_Object, HandleAttributes, PassedAccessState, DesiredAccess, _ObjectType, AccessMode, _Handle) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObOpenObjectByPointer", _ObjectMarshal, _Object, "uint", HandleAttributes, ACCESS_STATE.Ptr, PassedAccessState, "uint", DesiredAccess, POBJECT_TYPE, _ObjectType, "char", AccessMode, HANDLE.Ptr, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} HandleAttributes 
 * @param {Pointer<ACCESS_STATE>} PassedAccessState 
 * @param {Integer} DesiredAccess 
 * @param {POBJECT_TYPE} _ObjectType 
 * @param {Integer} AccessMode 
 * @param {Integer} Tag 
 * @param {Pointer<HANDLE>} _Handle 
 * @returns {NTSTATUS} 
 */
export ObOpenObjectByPointerWithTag(_Object, HandleAttributes, PassedAccessState, DesiredAccess, _ObjectType, AccessMode, Tag, _Handle) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObOpenObjectByPointerWithTag", _ObjectMarshal, _Object, "uint", HandleAttributes, ACCESS_STATE.Ptr, PassedAccessState, "uint", DesiredAccess, POBJECT_TYPE, _ObjectType, "char", AccessMode, "uint", Tag, HANDLE.Ptr, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @returns {String} Nothing - always returns an empty string
 */
export ObMakeTemporaryObject(_Object) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ObMakeTemporaryObject", _ObjectMarshal, _Object)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} ObjectNameInfo 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ObQueryNameString(_Object, ObjectNameInfo, Length, ReturnLength) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObQueryNameString", _ObjectMarshal, _Object, "ptr", ObjectNameInfo, "uint", Length, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @returns {BOOLEAN} 
 */
export ObIsKernelHandle(_Handle) {
    result := DllCall("ntoskrnl.exe\ObIsKernelHandle", HANDLE, _Handle, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Pointer<BOOLEAN>} GenerateOnClose 
 * @returns {NTSTATUS} 
 */
export ObQueryObjectAuditingByHandle(_Handle, GenerateOnClose) {
    GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObQueryObjectAuditingByHandle", HANDLE, _Handle, GenerateOnCloseMarshal, GenerateOnClose, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export IoRequestDeviceRemovalForReset(PhysicalDeviceObject, Flags) {
    result := DllCall("ntoskrnl.exe\IoRequestDeviceRemovalForReset", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} LockKey 
 * @param {Integer} _Buffer 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FsRtlCopyRead(FileObject, FileOffset, Length, Wait, LockKey, _Buffer, IoStatus, DeviceObject) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCopyRead", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "uint", LockKey, "ptr", _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} LockKey 
 * @param {Integer} _Buffer 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FsRtlCopyWrite(FileObject, FileOffset, Length, Wait, LockKey, _Buffer, IoStatus, DeviceObject) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCopyWrite", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "uint", LockKey, "ptr", _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} LockKey 
 * @param {Pointer<Pointer<MDL>>} MdlChain 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {NTSTATUS} 
 */
export FsRtlMdlReadEx(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlMdlReadEx", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} LockKey 
 * @param {Pointer<Pointer<MDL>>} MdlChain 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FsRtlMdlReadDev(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus, DeviceObject) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlMdlReadDev", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<MDL>} MdlChain 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FsRtlMdlReadCompleteDev(FileObject, MdlChain, DeviceObject) {
    result := DllCall("ntoskrnl.exe\FsRtlMdlReadCompleteDev", FILE_OBJECT.Ptr, FileObject, MDL.Ptr, MdlChain, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} LockKey 
 * @param {Pointer<Pointer<MDL>>} MdlChain 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {NTSTATUS} 
 */
export FsRtlPrepareMdlWriteEx(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlPrepareMdlWriteEx", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} LockKey 
 * @param {Pointer<Pointer<MDL>>} MdlChain 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FsRtlPrepareMdlWriteDev(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus, DeviceObject) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlPrepareMdlWriteDev", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Pointer<MDL>} MdlChain 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FsRtlMdlWriteCompleteDev(FileObject, FileOffset, MdlChain, DeviceObject) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlMdlWriteCompleteDev", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, MDL.Ptr, MdlChain, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlAcquireFileExclusive(FileObject) {
    DllCall("ntoskrnl.exe\FsRtlAcquireFileExclusive", FILE_OBJECT.Ptr, FileObject)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlReleaseFile(FileObject) {
    DllCall("ntoskrnl.exe\FsRtlReleaseFile", FILE_OBJECT.Ptr, FileObject)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileSize 
 * @returns {NTSTATUS} 
 */
export FsRtlGetFileSize(FileObject, FileSize) {
    FileSizeMarshal := FileSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetFileSize", FILE_OBJECT.Ptr, FileObject, FileSizeMarshal, FileSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PCOMPLETE_LOCK_IRP_ROUTINE>} CompleteLockIrpRoutine 
 * @param {Pointer<PUNLOCK_ROUTINE>} UnlockRoutine 
 * @returns {Pointer<FILE_LOCK>} 
 */
export FsRtlAllocateFileLock(CompleteLockIrpRoutine, UnlockRoutine) {
    result := DllCall("ntoskrnl.exe\FsRtlAllocateFileLock", "ptr", CompleteLockIrpRoutine, "ptr", UnlockRoutine, FILE_LOCK.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlFreeFileLock(FileLock) {
    DllCall("ntoskrnl.exe\FsRtlFreeFileLock", FILE_LOCK.Ptr, FileLock)
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<PCOMPLETE_LOCK_IRP_ROUTINE>} CompleteLockIrpRoutine 
 * @param {Pointer<PUNLOCK_ROUTINE>} UnlockRoutine 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeFileLock(FileLock, CompleteLockIrpRoutine, UnlockRoutine) {
    DllCall("ntoskrnl.exe\FsRtlInitializeFileLock", FILE_LOCK.Ptr, FileLock, "ptr", CompleteLockIrpRoutine, "ptr", UnlockRoutine)
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlUninitializeFileLock(FileLock) {
    DllCall("ntoskrnl.exe\FsRtlUninitializeFileLock", FILE_LOCK.Ptr, FileLock)
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export FsRtlProcessFileLock(FileLock, _Irp, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlProcessFileLock", FILE_LOCK.Ptr, FileLock, IRP.Ptr, _Irp, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export FsRtlCheckLockForReadAccess(FileLock, _Irp) {
    result := DllCall("ntoskrnl.exe\FsRtlCheckLockForReadAccess", FILE_LOCK.Ptr, FileLock, IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export FsRtlCheckLockForWriteAccess(FileLock, _Irp) {
    result := DllCall("ntoskrnl.exe\FsRtlCheckLockForWriteAccess", FILE_LOCK.Ptr, FileLock, IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<Integer>} AllocationSize 
 * @returns {BOOLEAN} 
 */
export FsRtlCheckLockForOplockRequest(FileLock, AllocationSize) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCheckLockForOplockRequest", FILE_LOCK.Ptr, FileLock, AllocationSizeMarshal, AllocationSize, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<Integer>} StartingByte 
 * @param {Pointer<Integer>} Length 
 * @param {Integer} Key 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Void>} ProcessId 
 * @returns {BOOLEAN} 
 */
export FsRtlFastCheckLockForRead(FileLock, StartingByte, Length, Key, FileObject, ProcessId) {
    StartingByteMarshal := StartingByte is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"
    ProcessIdMarshal := ProcessId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFastCheckLockForRead", FILE_LOCK.Ptr, FileLock, StartingByteMarshal, StartingByte, LengthMarshal, Length, "uint", Key, FILE_OBJECT.Ptr, FileObject, ProcessIdMarshal, ProcessId, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<Integer>} StartingByte 
 * @param {Pointer<Integer>} Length 
 * @param {Integer} Key 
 * @param {Pointer<Void>} FileObject 
 * @param {Pointer<Void>} ProcessId 
 * @returns {BOOLEAN} 
 */
export FsRtlFastCheckLockForWrite(FileLock, StartingByte, Length, Key, FileObject, ProcessId) {
    StartingByteMarshal := StartingByte is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"
    FileObjectMarshal := FileObject is VarRef ? "ptr" : "ptr"
    ProcessIdMarshal := ProcessId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFastCheckLockForWrite", FILE_LOCK.Ptr, FileLock, StartingByteMarshal, StartingByte, LengthMarshal, Length, "uint", Key, FileObjectMarshal, FileObject, ProcessIdMarshal, ProcessId, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {BOOLEAN} Restart 
 * @returns {Pointer<FILE_LOCK_INFO>} 
 */
export FsRtlGetNextFileLock(FileLock, Restart) {
    result := DllCall("ntoskrnl.exe\FsRtlGetNextFileLock", FILE_LOCK.Ptr, FileLock, BOOLEAN, Restart, FILE_LOCK_INFO.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {BOOLEAN} 
 */
export FsRtlAreThereCurrentOrInProgressFileLocks(FileLock) {
    result := DllCall("ntoskrnl.exe\FsRtlAreThereCurrentOrInProgressFileLocks", FILE_LOCK.Ptr, FileLock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {BOOLEAN} 
 */
export FsRtlAreThereWaitingFileLocks(FileLock) {
    result := DllCall("ntoskrnl.exe\FsRtlAreThereWaitingFileLocks", FILE_LOCK.Ptr, FileLock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Pointer<Integer>} Length 
 * @param {PEPROCESS} ProcessId 
 * @param {Integer} Key 
 * @param {Pointer<Void>} _Context 
 * @param {BOOLEAN} AlreadySynchronized 
 * @returns {NTSTATUS} 
 */
export FsRtlFastUnlockSingle(FileLock, FileObject, FileOffset, Length, ProcessId, Key, _Context, AlreadySynchronized) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFastUnlockSingle", FILE_LOCK.Ptr, FileLock, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, LengthMarshal, Length, PEPROCESS, ProcessId, "uint", Key, _ContextMarshal, _Context, BOOLEAN, AlreadySynchronized, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PEPROCESS} ProcessId 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export FsRtlFastUnlockAll(FileLock, FileObject, ProcessId, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFastUnlockAll", FILE_LOCK.Ptr, FileLock, FILE_OBJECT.Ptr, FileObject, PEPROCESS, ProcessId, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PEPROCESS} ProcessId 
 * @param {Integer} Key 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export FsRtlFastUnlockAllByKey(FileLock, FileObject, ProcessId, Key, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFastUnlockAllByKey", FILE_LOCK.Ptr, FileLock, FILE_OBJECT.Ptr, FileObject, PEPROCESS, ProcessId, "uint", Key, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Pointer<Integer>} Length 
 * @param {PEPROCESS} ProcessId 
 * @param {Integer} Key 
 * @param {BOOLEAN} FailImmediately 
 * @param {BOOLEAN} ExclusiveLock 
 * @param {Pointer<IO_STATUS_BLOCK>} Iosb 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Void>} _Context 
 * @param {BOOLEAN} AlreadySynchronized 
 * @returns {BOOLEAN} 
 */
export FsRtlPrivateLock(FileLock, FileObject, FileOffset, Length, ProcessId, Key, FailImmediately, ExclusiveLock, Iosb, _Irp, _Context, AlreadySynchronized) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlPrivateLock", FILE_LOCK.Ptr, FileLock, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, LengthMarshal, Length, PEPROCESS, ProcessId, "uint", Key, BOOLEAN, FailImmediately, BOOLEAN, ExclusiveLock, IO_STATUS_BLOCK.Ptr, Iosb, IRP.Ptr, _Irp, _ContextMarshal, _Context, BOOLEAN, AlreadySynchronized, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeTunnelCache(Cache) {
    DllCall("ntoskrnl.exe\FsRtlInitializeTunnelCache", TUNNEL.Ptr, Cache)
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @param {Integer} DirectoryKey 
 * @param {Pointer<UNICODE_STRING>} ShortName 
 * @param {Pointer<UNICODE_STRING>} LongName 
 * @param {BOOLEAN} KeyByShortName 
 * @param {Integer} DataLength 
 * @param {Integer} Data 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlAddToTunnelCache(Cache, DirectoryKey, ShortName, LongName, KeyByShortName, DataLength, Data) {
    DllCall("ntoskrnl.exe\FsRtlAddToTunnelCache", TUNNEL.Ptr, Cache, "uint", DirectoryKey, UNICODE_STRING.Ptr, ShortName, UNICODE_STRING.Ptr, LongName, BOOLEAN, KeyByShortName, "uint", DataLength, "ptr", Data)
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @param {Integer} DirectoryKey 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {Pointer<UNICODE_STRING>} ShortName 
 * @param {Pointer<UNICODE_STRING>} LongName 
 * @param {Pointer<Integer>} DataLength 
 * @param {Integer} Data 
 * @returns {BOOLEAN} 
 */
export FsRtlFindInTunnelCache(Cache, DirectoryKey, Name, ShortName, LongName, DataLength, Data) {
    DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFindInTunnelCache", TUNNEL.Ptr, Cache, "uint", DirectoryKey, UNICODE_STRING.Ptr, Name, UNICODE_STRING.Ptr, ShortName, UNICODE_STRING.Ptr, LongName, DataLengthMarshal, DataLength, "ptr", Data, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @param {Integer} DirectoryKey 
 * @param {Pointer<UNICODE_STRING>} ShortName 
 * @param {Pointer<UNICODE_STRING>} LongName 
 * @param {Integer} Flags 
 * @param {Integer} DataLength 
 * @param {Integer} Data 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlAddToTunnelCacheEx(Cache, DirectoryKey, ShortName, LongName, Flags, DataLength, Data) {
    DllCall("ntoskrnl.exe\FsRtlAddToTunnelCacheEx", TUNNEL.Ptr, Cache, "uint", DirectoryKey, UNICODE_STRING.Ptr, ShortName, UNICODE_STRING.Ptr, LongName, "uint", Flags, "uint", DataLength, "ptr", Data)
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @param {Integer} DirectoryKey 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {Pointer<UNICODE_STRING>} ShortName 
 * @param {Pointer<UNICODE_STRING>} LongName 
 * @param {Integer} Flags 
 * @param {Pointer<Integer>} DataLength 
 * @param {Integer} Data 
 * @returns {BOOLEAN} 
 */
export FsRtlFindInTunnelCacheEx(Cache, DirectoryKey, Name, ShortName, LongName, Flags, DataLength, Data) {
    DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFindInTunnelCacheEx", TUNNEL.Ptr, Cache, "uint", DirectoryKey, UNICODE_STRING.Ptr, Name, UNICODE_STRING.Ptr, ShortName, UNICODE_STRING.Ptr, LongName, "uint", Flags, DataLengthMarshal, DataLength, "ptr", Data, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @param {Integer} DirectoryKey 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDeleteKeyFromTunnelCache(Cache, DirectoryKey) {
    DllCall("ntoskrnl.exe\FsRtlDeleteKeyFromTunnelCache", TUNNEL.Ptr, Cache, "uint", DirectoryKey)
}

/**
 * 
 * @param {Pointer<TUNNEL>} Cache 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDeleteTunnelCache(Cache) {
    DllCall("ntoskrnl.exe\FsRtlDeleteTunnelCache", TUNNEL.Ptr, Cache)
}

/**
 * 
 * @param {STRING} _Path 
 * @param {Pointer<STRING>} FirstName 
 * @param {Pointer<STRING>} RemainingName 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDissectDbcs(_Path, FirstName, RemainingName) {
    DllCall("ntoskrnl.exe\FsRtlDissectDbcs", STRING, _Path, STRING.Ptr, FirstName, STRING.Ptr, RemainingName)
}

/**
 * 
 * @param {Pointer<STRING>} Name 
 * @returns {BOOLEAN} 
 */
export FsRtlDoesDbcsContainWildCards(Name) {
    result := DllCall("ntoskrnl.exe\FsRtlDoesDbcsContainWildCards", STRING.Ptr, Name, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} Expression 
 * @param {Pointer<STRING>} Name 
 * @returns {BOOLEAN} 
 */
export FsRtlIsDbcsInExpression(Expression, Name) {
    result := DllCall("ntoskrnl.exe\FsRtlIsDbcsInExpression", STRING.Ptr, Expression, STRING.Ptr, Name, BOOLEAN)
    return result
}

/**
 * 
 * @param {STRING} DbcsName 
 * @param {BOOLEAN} WildCardsPermissible 
 * @param {BOOLEAN} PathNamePermissible 
 * @param {BOOLEAN} LeadingBackslashPermissible 
 * @returns {BOOLEAN} 
 */
export FsRtlIsFatDbcsLegal(DbcsName, WildCardsPermissible, PathNamePermissible, LeadingBackslashPermissible) {
    result := DllCall("ntoskrnl.exe\FsRtlIsFatDbcsLegal", STRING, DbcsName, BOOLEAN, WildCardsPermissible, BOOLEAN, PathNamePermissible, BOOLEAN, LeadingBackslashPermissible, BOOLEAN)
    return result
}

/**
 * 
 * @param {STRING} DbcsName 
 * @param {BOOLEAN} WildCardsPermissible 
 * @param {BOOLEAN} PathNamePermissible 
 * @param {BOOLEAN} LeadingBackslashPermissible 
 * @returns {BOOLEAN} 
 */
export FsRtlIsHpfsDbcsLegal(DbcsName, WildCardsPermissible, PathNamePermissible, LeadingBackslashPermissible) {
    result := DllCall("ntoskrnl.exe\FsRtlIsHpfsDbcsLegal", STRING, DbcsName, BOOLEAN, WildCardsPermissible, BOOLEAN, PathNamePermissible, BOOLEAN, LeadingBackslashPermissible, BOOLEAN)
    return result
}

/**
 * 
 * @param {NTSTATUS} Exception 
 * @param {NTSTATUS} GenericException 
 * @returns {NTSTATUS} 
 */
export FsRtlNormalizeNtstatus(Exception, GenericException) {
    result := DllCall("ntoskrnl.exe\FsRtlNormalizeNtstatus", NTSTATUS, Exception, NTSTATUS, GenericException, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {NTSTATUS} Exception 
 * @returns {BOOLEAN} 
 */
export FsRtlIsNtstatusExpected(Exception) {
    result := DllCall("ntoskrnl.exe\FsRtlIsNtstatusExpected", NTSTATUS, Exception, BOOLEAN)
    return result
}

/**
 * 
 * @returns {Pointer<ERESOURCE>} 
 */
export FsRtlAllocateResource() {
    result := DllCall("ntoskrnl.exe\FsRtlAllocateResource", ERESOURCE.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {POOL_TYPE} PoolType 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeLargeMcb(_Mcb, PoolType) {
    DllCall("ntoskrnl.exe\FsRtlInitializeLargeMcb", LARGE_MCB.Ptr, _Mcb, POOL_TYPE, PoolType)
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlUninitializeLargeMcb(_Mcb) {
    DllCall("ntoskrnl.exe\FsRtlUninitializeLargeMcb", LARGE_MCB.Ptr, _Mcb)
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {BOOLEAN} SelfSynchronized 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlResetLargeMcb(_Mcb, SelfSynchronized) {
    DllCall("ntoskrnl.exe\FsRtlResetLargeMcb", LARGE_MCB.Ptr, _Mcb, BOOLEAN, SelfSynchronized)
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlTruncateLargeMcb(_Mcb, Vbn) {
    DllCall("ntoskrnl.exe\FsRtlTruncateLargeMcb", LARGE_MCB.Ptr, _Mcb, "int64", Vbn)
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} Lbn 
 * @param {Integer} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlAddLargeMcbEntry(_Mcb, Vbn, Lbn, SectorCount) {
    result := DllCall("ntoskrnl.exe\FsRtlAddLargeMcbEntry", LARGE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", Lbn, "int64", SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} SectorCount 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlRemoveLargeMcbEntry(_Mcb, Vbn, SectorCount) {
    DllCall("ntoskrnl.exe\FsRtlRemoveLargeMcbEntry", LARGE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", SectorCount)
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @param {Pointer<Integer>} SectorCountFromLbn 
 * @param {Pointer<Integer>} StartingLbn 
 * @param {Pointer<Integer>} SectorCountFromStartingLbn 
 * @param {Pointer<Integer>} Index 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupLargeMcbEntry(_Mcb, Vbn, Lbn, SectorCountFromLbn, StartingLbn, SectorCountFromStartingLbn, Index) {
    LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
    SectorCountFromLbnMarshal := SectorCountFromLbn is VarRef ? "int64*" : "ptr"
    StartingLbnMarshal := StartingLbn is VarRef ? "int64*" : "ptr"
    SectorCountFromStartingLbnMarshal := SectorCountFromStartingLbn is VarRef ? "int64*" : "ptr"
    IndexMarshal := Index is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupLargeMcbEntry", LARGE_MCB.Ptr, _Mcb, "int64", Vbn, LbnMarshal, Lbn, SectorCountFromLbnMarshal, SectorCountFromLbn, StartingLbnMarshal, StartingLbn, SectorCountFromStartingLbnMarshal, SectorCountFromStartingLbn, IndexMarshal, Index, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Pointer<Integer>} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupLastLargeMcbEntry(_Mcb, Vbn, Lbn) {
    VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
    LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupLastLargeMcbEntry", LARGE_MCB.Ptr, _Mcb, VbnMarshal, Vbn, LbnMarshal, Lbn, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} OpaqueMcb 
 * @param {Pointer<Integer>} LargeVbn 
 * @param {Pointer<Integer>} LargeLbn 
 * @param {Pointer<Integer>} Index 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupLastLargeMcbEntryAndIndex(OpaqueMcb, LargeVbn, LargeLbn, Index) {
    LargeVbnMarshal := LargeVbn is VarRef ? "int64*" : "ptr"
    LargeLbnMarshal := LargeLbn is VarRef ? "int64*" : "ptr"
    IndexMarshal := Index is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupLastLargeMcbEntryAndIndex", LARGE_MCB.Ptr, OpaqueMcb, LargeVbnMarshal, LargeVbn, LargeLbnMarshal, LargeLbn, IndexMarshal, Index, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @returns {Integer} 
 */
export FsRtlNumberOfRunsInLargeMcb(_Mcb) {
    result := DllCall("ntoskrnl.exe\FsRtlNumberOfRunsInLargeMcb", LARGE_MCB.Ptr, _Mcb, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Integer} RunIndex 
 * @param {Pointer<Integer>} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @param {Pointer<Integer>} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlGetNextLargeMcbEntry(_Mcb, RunIndex, Vbn, Lbn, SectorCount) {
    VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
    LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
    SectorCountMarshal := SectorCount is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetNextLargeMcbEntry", LARGE_MCB.Ptr, _Mcb, "uint", RunIndex, VbnMarshal, Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<LARGE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} Amount 
 * @returns {BOOLEAN} 
 */
export FsRtlSplitLargeMcb(_Mcb, Vbn, Amount) {
    result := DllCall("ntoskrnl.exe\FsRtlSplitLargeMcb", LARGE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", Amount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {POOL_TYPE} PoolType 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeBaseMcb(_Mcb, PoolType) {
    DllCall("ntoskrnl.exe\FsRtlInitializeBaseMcb", BASE_MCB.Ptr, _Mcb, POOL_TYPE, PoolType)
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {POOL_TYPE} PoolType 
 * @param {Integer} Flags 
 * @returns {BOOLEAN} 
 */
export FsRtlInitializeBaseMcbEx(_Mcb, PoolType, Flags) {
    result := DllCall("ntoskrnl.exe\FsRtlInitializeBaseMcbEx", BASE_MCB.Ptr, _Mcb, POOL_TYPE, PoolType, "ushort", Flags, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlUninitializeBaseMcb(_Mcb) {
    DllCall("ntoskrnl.exe\FsRtlUninitializeBaseMcb", BASE_MCB.Ptr, _Mcb)
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlResetBaseMcb(_Mcb) {
    DllCall("ntoskrnl.exe\FsRtlResetBaseMcb", BASE_MCB.Ptr, _Mcb)
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlTruncateBaseMcb(_Mcb, Vbn) {
    DllCall("ntoskrnl.exe\FsRtlTruncateBaseMcb", BASE_MCB.Ptr, _Mcb, "int64", Vbn)
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} Lbn 
 * @param {Integer} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlAddBaseMcbEntry(_Mcb, Vbn, Lbn, SectorCount) {
    result := DllCall("ntoskrnl.exe\FsRtlAddBaseMcbEntry", BASE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", Lbn, "int64", SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} Lbn 
 * @param {Integer} SectorCount 
 * @returns {NTSTATUS} 
 */
export FsRtlAddBaseMcbEntryEx(_Mcb, Vbn, Lbn, SectorCount) {
    result := DllCall("ntoskrnl.exe\FsRtlAddBaseMcbEntryEx", BASE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", Lbn, "int64", SectorCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlRemoveBaseMcbEntry(_Mcb, Vbn, SectorCount) {
    result := DllCall("ntoskrnl.exe\FsRtlRemoveBaseMcbEntry", BASE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @param {Pointer<Integer>} SectorCountFromLbn 
 * @param {Pointer<Integer>} StartingLbn 
 * @param {Pointer<Integer>} SectorCountFromStartingLbn 
 * @param {Pointer<Integer>} Index 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupBaseMcbEntry(_Mcb, Vbn, Lbn, SectorCountFromLbn, StartingLbn, SectorCountFromStartingLbn, Index) {
    LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
    SectorCountFromLbnMarshal := SectorCountFromLbn is VarRef ? "int64*" : "ptr"
    StartingLbnMarshal := StartingLbn is VarRef ? "int64*" : "ptr"
    SectorCountFromStartingLbnMarshal := SectorCountFromStartingLbn is VarRef ? "int64*" : "ptr"
    IndexMarshal := Index is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupBaseMcbEntry", BASE_MCB.Ptr, _Mcb, "int64", Vbn, LbnMarshal, Lbn, SectorCountFromLbnMarshal, SectorCountFromLbn, StartingLbnMarshal, StartingLbn, SectorCountFromStartingLbnMarshal, SectorCountFromStartingLbn, IndexMarshal, Index, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Pointer<Integer>} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupLastBaseMcbEntry(_Mcb, Vbn, Lbn) {
    VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
    LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupLastBaseMcbEntry", BASE_MCB.Ptr, _Mcb, VbnMarshal, Vbn, LbnMarshal, Lbn, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} OpaqueMcb 
 * @param {Pointer<Integer>} LargeVbn 
 * @param {Pointer<Integer>} LargeLbn 
 * @param {Pointer<Integer>} Index 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupLastBaseMcbEntryAndIndex(OpaqueMcb, LargeVbn, LargeLbn, Index) {
    LargeVbnMarshal := LargeVbn is VarRef ? "int64*" : "ptr"
    LargeLbnMarshal := LargeLbn is VarRef ? "int64*" : "ptr"
    IndexMarshal := Index is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupLastBaseMcbEntryAndIndex", BASE_MCB.Ptr, OpaqueMcb, LargeVbnMarshal, LargeVbn, LargeLbnMarshal, LargeLbn, IndexMarshal, Index, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @returns {Integer} 
 */
export FsRtlNumberOfRunsInBaseMcb(_Mcb) {
    result := DllCall("ntoskrnl.exe\FsRtlNumberOfRunsInBaseMcb", BASE_MCB.Ptr, _Mcb, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} RunIndex 
 * @param {Pointer<Integer>} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @param {Pointer<Integer>} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlGetNextBaseMcbEntry(_Mcb, RunIndex, Vbn, Lbn, SectorCount) {
    VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
    LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
    SectorCountMarshal := SectorCount is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetNextBaseMcbEntry", BASE_MCB.Ptr, _Mcb, "uint", RunIndex, VbnMarshal, Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<BASE_MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} Amount 
 * @returns {BOOLEAN} 
 */
export FsRtlSplitBaseMcb(_Mcb, Vbn, Amount) {
    result := DllCall("ntoskrnl.exe\FsRtlSplitBaseMcb", BASE_MCB.Ptr, _Mcb, "int64", Vbn, "int64", Amount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {POOL_TYPE} PoolType 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeMcb(_Mcb, PoolType) {
    DllCall("ntoskrnl.exe\FsRtlInitializeMcb", MCB.Ptr, _Mcb, POOL_TYPE, PoolType)
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlUninitializeMcb(_Mcb) {
    DllCall("ntoskrnl.exe\FsRtlUninitializeMcb", MCB.Ptr, _Mcb)
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlTruncateMcb(_Mcb, Vbn) {
    DllCall("ntoskrnl.exe\FsRtlTruncateMcb", MCB.Ptr, _Mcb, "uint", Vbn)
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} Lbn 
 * @param {Integer} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlAddMcbEntry(_Mcb, Vbn, Lbn, SectorCount) {
    result := DllCall("ntoskrnl.exe\FsRtlAddMcbEntry", MCB.Ptr, _Mcb, "uint", Vbn, "uint", Lbn, "uint", SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Integer} SectorCount 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlRemoveMcbEntry(_Mcb, Vbn, SectorCount) {
    DllCall("ntoskrnl.exe\FsRtlRemoveMcbEntry", MCB.Ptr, _Mcb, "uint", Vbn, "uint", SectorCount)
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {Integer} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @param {Pointer<Integer>} SectorCount 
 * @param {Pointer<Integer>} Index 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupMcbEntry(_Mcb, Vbn, Lbn, SectorCount, Index) {
    LbnMarshal := Lbn is VarRef ? "uint*" : "ptr"
    SectorCountMarshal := SectorCount is VarRef ? "uint*" : "ptr"
    IndexMarshal := Index is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupMcbEntry", MCB.Ptr, _Mcb, "uint", Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, IndexMarshal, Index, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {Pointer<Integer>} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @returns {BOOLEAN} 
 */
export FsRtlLookupLastMcbEntry(_Mcb, Vbn, Lbn) {
    VbnMarshal := Vbn is VarRef ? "uint*" : "ptr"
    LbnMarshal := Lbn is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupLastMcbEntry", MCB.Ptr, _Mcb, VbnMarshal, Vbn, LbnMarshal, Lbn, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @returns {Integer} 
 */
export FsRtlNumberOfRunsInMcb(_Mcb) {
    result := DllCall("ntoskrnl.exe\FsRtlNumberOfRunsInMcb", MCB.Ptr, _Mcb, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<MCB>} _Mcb 
 * @param {Integer} RunIndex 
 * @param {Pointer<Integer>} Vbn 
 * @param {Pointer<Integer>} Lbn 
 * @param {Pointer<Integer>} SectorCount 
 * @returns {BOOLEAN} 
 */
export FsRtlGetNextMcbEntry(_Mcb, RunIndex, Vbn, Lbn, SectorCount) {
    VbnMarshal := Vbn is VarRef ? "uint*" : "ptr"
    LbnMarshal := Lbn is VarRef ? "uint*" : "ptr"
    SectorCountMarshal := SectorCount is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetNextMcbEntry", MCB.Ptr, _Mcb, "uint", RunIndex, VbnMarshal, Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
 * @returns {NTSTATUS} 
 */
export FsRtlBalanceReads(TargetDevice) {
    result := DllCall("ntoskrnl.exe\FsRtlBalanceReads", DEVICE_OBJECT.Ptr, TargetDevice, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlInitializeOplock", OplockMarshal, Oplock)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlUninitializeOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlUninitializeOplock", OplockMarshal, Oplock)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} OpenCount 
 * @returns {NTSTATUS} 
 */
export FsRtlOplockFsctrl(Oplock, _Irp, OpenCount) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockFsctrl", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", OpenCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @returns {NTSTATUS} 
 */
export FsRtlCheckOplock(Oplock, _Irp, _Context, CompletionRoutine, PostIrpRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCheckOplock", OplockMarshal, Oplock, IRP.Ptr, _Irp, _ContextMarshal, _Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @returns {NTSTATUS} 
 */
export FsRtlCheckOplockEx(Oplock, _Irp, Flags, _Context, CompletionRoutine, PostIrpRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCheckOplockEx", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", Flags, _ContextMarshal, _Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Integer} NewLowerOplockState 
 * @param {Pointer<Void>} CompletionRoutineContext 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PrePendRoutine 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlCheckUpperOplock(Oplock, NewLowerOplockState, CompletionRoutineContext, CompletionRoutine, PrePendRoutine, Flags) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    CompletionRoutineContextMarshal := CompletionRoutineContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCheckUpperOplock", OplockMarshal, Oplock, "uint", NewLowerOplockState, CompletionRoutineContextMarshal, CompletionRoutineContext, "ptr", CompletionRoutine, "ptr", PrePendRoutine, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} OpenCount 
 * @param {Integer} LowerOplockState 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlUpperOplockFsctrl(Oplock, _Irp, OpenCount, LowerOplockState, Flags) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlUpperOplockFsctrl", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", OpenCount, "uint", LowerOplockState, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FsRtlOplockIsFastIoPossible(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockIsFastIoPossible", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FsRtlCurrentBatchOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCurrentBatchOplock", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FsRtlCurrentOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCurrentOplock", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IO_STACK_LOCATION>} IrpSp 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @returns {NTSTATUS} 
 */
export FsRtlOplockBreakToNone(Oplock, IrpSp, _Irp, _Context, CompletionRoutine, PostIrpRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockBreakToNone", OplockMarshal, Oplock, IO_STACK_LOCATION.Ptr, IrpSp, IRP.Ptr, _Irp, _ContextMarshal, _Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export FsRtlOplockIsSharedRequest(_Irp) {
    result := DllCall("ntoskrnl.exe\FsRtlOplockIsSharedRequest", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @returns {NTSTATUS} 
 */
export FsRtlOplockBreakH(Oplock, _Irp, Flags, _Context, CompletionRoutine, PostIrpRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockBreakH", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", Flags, _ContextMarshal, _Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} ShareAccess 
 * @returns {NTSTATUS} 
 */
export FsRtlOplockBreakH2(Oplock, _Irp, Flags, _Context, CompletionRoutine, PostIrpRoutine, GrantedAccess, ShareAccess) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    ShareAccessMarshal := ShareAccess is VarRef ? "ushort*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockBreakH2", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", Flags, _ContextMarshal, _Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, GrantedAccessMarshal, GrantedAccess, ShareAccessMarshal, ShareAccess, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FsRtlCurrentOplockH(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCurrentOplockH", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @returns {NTSTATUS} 
 */
export FsRtlOplockBreakToNoneEx(Oplock, _Irp, Flags, _Context, CompletionRoutine, PostIrpRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockBreakToNoneEx", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", Flags, _ContextMarshal, _Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} OpenCount 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlOplockFsctrlEx(Oplock, _Irp, OpenCount, Flags) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockFsctrlEx", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", OpenCount, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} Fo1 
 * @param {Pointer<FILE_OBJECT>} Fo2 
 * @returns {BOOLEAN} 
 */
export FsRtlOplockKeysEqual(Fo1, Fo2) {
    result := DllCall("ntoskrnl.exe\FsRtlOplockKeysEqual", FILE_OBJECT.Ptr, Fo1, FILE_OBJECT.Ptr, Fo2, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} EventCode 
 * @returns {NTSTATUS} 
 */
export FsRtlNotifyVolumeEvent(FileObject, EventCode) {
    result := DllCall("ntoskrnl.exe\FsRtlNotifyVolumeEvent", FILE_OBJECT.Ptr, FileObject, "uint", EventCode, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} EventCode 
 * @param {Pointer<TARGET_DEVICE_CUSTOM_NOTIFICATION>} Event 
 * @returns {NTSTATUS} 
 */
export FsRtlNotifyVolumeEventEx(FileObject, EventCode, Event) {
    result := DllCall("ntoskrnl.exe\FsRtlNotifyVolumeEventEx", FILE_OBJECT.Ptr, FileObject, "uint", EventCode, TARGET_DEVICE_CUSTOM_NOTIFICATION.Ptr, Event, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PNOTIFY_SYNC>} NotifySync 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyInitializeSync(NotifySync) {
    NotifySyncMarshal := NotifySync is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyInitializeSync", NotifySyncMarshal, NotifySync)
}

/**
 * 
 * @param {Pointer<PNOTIFY_SYNC>} NotifySync 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyUninitializeSync(NotifySync) {
    NotifySyncMarshal := NotifySync is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyUninitializeSync", NotifySyncMarshal, NotifySync)
}

/**
 * 
 * @param {PNOTIFY_SYNC} NotifySync 
 * @param {Pointer<LIST_ENTRY>} NotifyList 
 * @param {Pointer<Void>} FsContext 
 * @param {Pointer<STRING>} FullDirectoryName 
 * @param {BOOLEAN} WatchTree 
 * @param {BOOLEAN} IgnoreBuffer 
 * @param {Integer} CompletionFilter 
 * @param {Pointer<IRP>} NotifyIrp 
 * @param {Pointer<PCHECK_FOR_TRAVERSE_ACCESS>} TraverseCallback 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyFullChangeDirectory(NotifySync, NotifyList, FsContext, FullDirectoryName, WatchTree, IgnoreBuffer, CompletionFilter, NotifyIrp, TraverseCallback, SubjectContext) {
    FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyFullChangeDirectory", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList, FsContextMarshal, FsContext, STRING.Ptr, FullDirectoryName, BOOLEAN, WatchTree, BOOLEAN, IgnoreBuffer, "uint", CompletionFilter, IRP.Ptr, NotifyIrp, "ptr", TraverseCallback, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext)
}

/**
 * 
 * @param {PNOTIFY_SYNC} NotifySync 
 * @param {Pointer<LIST_ENTRY>} NotifyList 
 * @param {Pointer<Void>} FsContext 
 * @param {Pointer<STRING>} FullDirectoryName 
 * @param {BOOLEAN} WatchTree 
 * @param {BOOLEAN} IgnoreBuffer 
 * @param {Integer} CompletionFilter 
 * @param {Pointer<IRP>} NotifyIrp 
 * @param {Pointer<PCHECK_FOR_TRAVERSE_ACCESS>} TraverseCallback 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @param {Pointer<PFILTER_REPORT_CHANGE>} FilterCallback 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyFilterChangeDirectory(NotifySync, NotifyList, FsContext, FullDirectoryName, WatchTree, IgnoreBuffer, CompletionFilter, NotifyIrp, TraverseCallback, SubjectContext, FilterCallback) {
    FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyFilterChangeDirectory", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList, FsContextMarshal, FsContext, STRING.Ptr, FullDirectoryName, BOOLEAN, WatchTree, BOOLEAN, IgnoreBuffer, "uint", CompletionFilter, IRP.Ptr, NotifyIrp, "ptr", TraverseCallback, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext, "ptr", FilterCallback)
}

/**
 * 
 * @param {PNOTIFY_SYNC} NotifySync 
 * @param {Pointer<LIST_ENTRY>} NotifyList 
 * @param {Pointer<STRING>} FullTargetName 
 * @param {Integer} TargetNameOffset 
 * @param {Pointer<STRING>} StreamName 
 * @param {Pointer<STRING>} NormalizedParentName 
 * @param {Integer} FilterMatch 
 * @param {Integer} Action 
 * @param {Pointer<Void>} TargetContext 
 * @param {Pointer<Void>} FilterContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyFilterReportChange(NotifySync, NotifyList, FullTargetName, TargetNameOffset, StreamName, NormalizedParentName, FilterMatch, Action, TargetContext, FilterContext) {
    TargetContextMarshal := TargetContext is VarRef ? "ptr" : "ptr"
    FilterContextMarshal := FilterContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyFilterReportChange", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList, STRING.Ptr, FullTargetName, "ushort", TargetNameOffset, STRING.Ptr, StreamName, STRING.Ptr, NormalizedParentName, "uint", FilterMatch, "uint", Action, TargetContextMarshal, TargetContext, FilterContextMarshal, FilterContext)
}

/**
 * 
 * @param {PNOTIFY_SYNC} NotifySync 
 * @param {Pointer<LIST_ENTRY>} NotifyList 
 * @param {Pointer<STRING>} FullTargetName 
 * @param {Integer} TargetNameOffset 
 * @param {Pointer<STRING>} StreamName 
 * @param {Pointer<STRING>} NormalizedParentName 
 * @param {Integer} FilterMatch 
 * @param {Integer} Action 
 * @param {Pointer<Void>} TargetContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyFullReportChange(NotifySync, NotifyList, FullTargetName, TargetNameOffset, StreamName, NormalizedParentName, FilterMatch, Action, TargetContext) {
    TargetContextMarshal := TargetContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyFullReportChange", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList, STRING.Ptr, FullTargetName, "ushort", TargetNameOffset, STRING.Ptr, StreamName, STRING.Ptr, NormalizedParentName, "uint", FilterMatch, "uint", Action, TargetContextMarshal, TargetContext)
}

/**
 * 
 * @param {PNOTIFY_SYNC} NotifySync 
 * @param {Pointer<LIST_ENTRY>} NotifyList 
 * @param {Pointer<Void>} FsContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyCleanup(NotifySync, NotifyList, FsContext) {
    FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlNotifyCleanup", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList, FsContextMarshal, FsContext)
}

/**
 * 
 * @param {PNOTIFY_SYNC} NotifySync 
 * @param {Pointer<LIST_ENTRY>} NotifyList 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlNotifyCleanupAll(NotifySync, NotifyList) {
    DllCall("ntoskrnl.exe\FsRtlNotifyCleanupAll", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList)
}

/**
 * 
 * @param {UNICODE_STRING} _Path 
 * @param {Pointer<UNICODE_STRING>} FirstName 
 * @param {Pointer<UNICODE_STRING>} RemainingName 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDissectName(_Path, FirstName, RemainingName) {
    DllCall("ntoskrnl.exe\FsRtlDissectName", UNICODE_STRING, _Path, UNICODE_STRING.Ptr, FirstName, UNICODE_STRING.Ptr, RemainingName)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @returns {BOOLEAN} 
 */
export FsRtlDoesNameContainWildCards(Name) {
    result := DllCall("ntoskrnl.exe\FsRtlDoesNameContainWildCards", UNICODE_STRING.Ptr, Name, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ConstantNameA 
 * @param {Pointer<UNICODE_STRING>} ConstantNameB 
 * @param {BOOLEAN} IgnoreCase 
 * @param {Pointer<Integer>} UpcaseTable 
 * @returns {BOOLEAN} 
 */
export FsRtlAreNamesEqual(ConstantNameA, ConstantNameB, IgnoreCase, UpcaseTable) {
    UpcaseTableMarshal := UpcaseTable is VarRef ? "ushort*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlAreNamesEqual", UNICODE_STRING.Ptr, ConstantNameA, UNICODE_STRING.Ptr, ConstantNameB, BOOLEAN, IgnoreCase, UpcaseTableMarshal, UpcaseTable, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Expression 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {BOOLEAN} IgnoreCase 
 * @param {PWSTR} UpcaseTable 
 * @returns {BOOLEAN} 
 */
export FsRtlIsNameInExpression(Expression, Name, IgnoreCase, UpcaseTable) {
    UpcaseTable := UpcaseTable is String ? StrPtr(UpcaseTable) : UpcaseTable

    result := DllCall("ntoskrnl.exe\FsRtlIsNameInExpression", UNICODE_STRING.Ptr, Expression, UNICODE_STRING.Ptr, Name, BOOLEAN, IgnoreCase, "ptr", UpcaseTable, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Expression 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {BOOLEAN} IgnoreCase 
 * @param {PWSTR} UpcaseTable 
 * @returns {BOOLEAN} 
 */
export FsRtlIsNameInUnUpcasedExpression(Expression, Name, IgnoreCase, UpcaseTable) {
    UpcaseTable := UpcaseTable is String ? StrPtr(UpcaseTable) : UpcaseTable

    result := DllCall("ntoskrnl.exe\FsRtlIsNameInUnUpcasedExpression", UNICODE_STRING.Ptr, Expression, UNICODE_STRING.Ptr, Name, BOOLEAN, IgnoreCase, "ptr", UpcaseTable, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<KEVENT>} Event 
 * @param {Pointer<PFSRTL_STACK_OVERFLOW_ROUTINE>} StackOverflowRoutine 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlPostStackOverflow(_Context, Event, StackOverflowRoutine) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlPostStackOverflow", _ContextMarshal, _Context, KEVENT.Ptr, Event, "ptr", StackOverflowRoutine)
}

/**
 * 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<KEVENT>} Event 
 * @param {Pointer<PFSRTL_STACK_OVERFLOW_ROUTINE>} StackOverflowRoutine 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlPostPagingFileStackOverflow(_Context, Event, StackOverflowRoutine) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlPostPagingFileStackOverflow", _ContextMarshal, _Context, KEVENT.Ptr, Event, "ptr", StackOverflowRoutine)
}

/**
 * 
 * @param {Pointer<HANDLE>} MupHandle 
 * @param {Pointer<UNICODE_STRING>} RedirectorDeviceName 
 * @param {BOOLEAN} MailslotsSupported 
 * @returns {NTSTATUS} 
 */
export FsRtlRegisterUncProvider(MupHandle, RedirectorDeviceName, MailslotsSupported) {
    result := DllCall("ntoskrnl.exe\FsRtlRegisterUncProvider", HANDLE.Ptr, MupHandle, UNICODE_STRING.Ptr, RedirectorDeviceName, BOOLEAN, MailslotsSupported, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} MupHandle 
 * @param {Pointer<UNICODE_STRING>} RedirDevName 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlRegisterUncProviderEx(MupHandle, RedirDevName, DeviceObject, Flags) {
    result := DllCall("ntoskrnl.exe\FsRtlRegisterUncProviderEx", HANDLE.Ptr, MupHandle, UNICODE_STRING.Ptr, RedirDevName, DEVICE_OBJECT.Ptr, DeviceObject, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} RedirDevName 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<FSRTL_UNC_PROVIDER_REGISTRATION>} Registration 
 * @param {Pointer<HANDLE>} MupHandle 
 * @returns {NTSTATUS} 
 */
export FsRtlRegisterUncProviderEx2(RedirDevName, DeviceObject, Registration, MupHandle) {
    result := DllCall("ntoskrnl.exe\FsRtlRegisterUncProviderEx2", UNICODE_STRING.Ptr, RedirDevName, DEVICE_OBJECT.Ptr, DeviceObject, FSRTL_UNC_PROVIDER_REGISTRATION.Ptr, Registration, HANDLE.Ptr, MupHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDeregisterUncProvider(_Handle) {
    DllCall("ntoskrnl.exe\FsRtlDeregisterUncProvider", HANDLE, _Handle)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export FsRtlCancellableWaitForSingleObject(_Object, Timeout, _Irp) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCancellableWaitForSingleObject", _ObjectMarshal, _Object, TimeoutMarshal, Timeout, IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Count 
 * @param {Pointer<Pointer<Void>>} ObjectArray 
 * @param {WAIT_TYPE} WaitType 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<KWAIT_BLOCK>} WaitBlockArray 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export FsRtlCancellableWaitForMultipleObjects(Count, ObjectArray, WaitType, Timeout, WaitBlockArray, _Irp) {
    ObjectArrayMarshal := ObjectArray is VarRef ? "ptr*" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCancellableWaitForMultipleObjects", "uint", Count, ObjectArrayMarshal, ObjectArray, WAIT_TYPE, WaitType, TimeoutMarshal, Timeout, KWAIT_BLOCK.Ptr, WaitBlockArray, IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} pFileObject 
 * @param {Integer} Level 
 * @param {Integer} pBuffer 
 * @param {Pointer<Integer>} pBufferSize 
 * @returns {NTSTATUS} 
 */
export FsRtlMupGetProviderInfoFromFileObject(pFileObject, Level, pBuffer, pBufferSize) {
    pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlMupGetProviderInfoFromFileObject", FILE_OBJECT.Ptr, pFileObject, "uint", Level, "ptr", pBuffer, pBufferSizeMarshal, pBufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} pProviderName 
 * @param {Pointer<Integer>} pProviderId 
 * @returns {NTSTATUS} 
 */
export FsRtlMupGetProviderIdFromName(pProviderName, pProviderId) {
    pProviderIdMarshal := pProviderId is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlMupGetProviderIdFromName", UNICODE_STRING.Ptr, pProviderName, pProviderIdMarshal, pProviderId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
 * @param {Pointer<FSRTL_PER_FILE_CONTEXT>} Ptr 
 * @returns {NTSTATUS} 
 */
export FsRtlInsertPerFileContext(PerFileContextPointer, Ptr) {
    PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlInsertPerFileContext", PerFileContextPointerMarshal, PerFileContextPointer, FSRTL_PER_FILE_CONTEXT.Ptr, Ptr, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
 * @param {Pointer<Void>} OwnerId 
 * @param {Pointer<Void>} InstanceId 
 * @returns {Pointer<FSRTL_PER_FILE_CONTEXT>} 
 */
export FsRtlLookupPerFileContext(PerFileContextPointer, OwnerId, InstanceId) {
    PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"
    OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
    InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupPerFileContext", PerFileContextPointerMarshal, PerFileContextPointer, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, FSRTL_PER_FILE_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
 * @param {Pointer<Void>} OwnerId 
 * @param {Pointer<Void>} InstanceId 
 * @returns {Pointer<FSRTL_PER_FILE_CONTEXT>} 
 */
export FsRtlRemovePerFileContext(PerFileContextPointer, OwnerId, InstanceId) {
    PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"
    OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
    InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlRemovePerFileContext", PerFileContextPointerMarshal, PerFileContextPointer, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, FSRTL_PER_FILE_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlTeardownPerFileContexts(PerFileContextPointer) {
    PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlTeardownPerFileContexts", PerFileContextPointerMarshal, PerFileContextPointer)
}

/**
 * 
 * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} PerStreamContext 
 * @param {Pointer<FSRTL_PER_STREAM_CONTEXT>} Ptr 
 * @returns {NTSTATUS} 
 */
export FsRtlInsertPerStreamContext(PerStreamContext, Ptr) {
    result := DllCall("ntoskrnl.exe\FsRtlInsertPerStreamContext", FSRTL_ADVANCED_FCB_HEADER.Ptr, PerStreamContext, FSRTL_PER_STREAM_CONTEXT.Ptr, Ptr, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} StreamContext 
 * @param {Pointer<Void>} OwnerId 
 * @param {Pointer<Void>} InstanceId 
 * @returns {Pointer<FSRTL_PER_STREAM_CONTEXT>} 
 */
export FsRtlLookupPerStreamContextInternal(StreamContext, OwnerId, InstanceId) {
    OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
    InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupPerStreamContextInternal", FSRTL_ADVANCED_FCB_HEADER.Ptr, StreamContext, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, FSRTL_PER_STREAM_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} StreamContext 
 * @param {Pointer<Void>} OwnerId 
 * @param {Pointer<Void>} InstanceId 
 * @returns {Pointer<FSRTL_PER_STREAM_CONTEXT>} 
 */
export FsRtlRemovePerStreamContext(StreamContext, OwnerId, InstanceId) {
    OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
    InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlRemovePerStreamContext", FSRTL_ADVANCED_FCB_HEADER.Ptr, StreamContext, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, FSRTL_PER_STREAM_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Integer} Tag 
 * @returns {Pointer<Void>} 
 */
export FsRtlAllocateAePushLock(PoolType, Tag) {
    result := DllCall("ntoskrnl.exe\FsRtlAllocateAePushLock", POOL_TYPE, PoolType, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} AePushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlFreeAePushLock(AePushLock) {
    AePushLockMarshal := AePushLock is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlFreeAePushLock", AePushLockMarshal, AePushLock)
}

/**
 * 
 * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} AdvancedHeader 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlTeardownPerStreamContexts(AdvancedHeader) {
    DllCall("ntoskrnl.exe\FsRtlTeardownPerStreamContexts", FSRTL_ADVANCED_FCB_HEADER.Ptr, AdvancedHeader)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<FSRTL_PER_FILEOBJECT_CONTEXT>} Ptr 
 * @returns {NTSTATUS} 
 */
export FsRtlInsertPerFileObjectContext(FileObject, Ptr) {
    result := DllCall("ntoskrnl.exe\FsRtlInsertPerFileObjectContext", FILE_OBJECT.Ptr, FileObject, FSRTL_PER_FILEOBJECT_CONTEXT.Ptr, Ptr, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Void>} OwnerId 
 * @param {Pointer<Void>} InstanceId 
 * @returns {Pointer<FSRTL_PER_FILEOBJECT_CONTEXT>} 
 */
export FsRtlLookupPerFileObjectContext(FileObject, OwnerId, InstanceId) {
    OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
    InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlLookupPerFileObjectContext", FILE_OBJECT.Ptr, FileObject, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, FSRTL_PER_FILEOBJECT_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Void>} OwnerId 
 * @param {Pointer<Void>} InstanceId 
 * @returns {Pointer<FSRTL_PER_FILEOBJECT_CONTEXT>} 
 */
export FsRtlRemovePerFileObjectContext(FileObject, OwnerId, InstanceId) {
    OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
    InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlRemovePerFileObjectContext", FILE_OBJECT.Ptr, FileObject, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, FSRTL_PER_FILEOBJECT_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlIncrementCcFastReadNotPossible() {
    DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadNotPossible")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlIncrementCcFastReadWait() {
    DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadWait")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlIncrementCcFastReadNoWait() {
    DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadNoWait")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlIncrementCcFastReadResourceMiss() {
    DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadResourceMiss")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlIncrementCcFastMdlReadWait() {
    DllCall("ntoskrnl.exe\FsRtlIncrementCcFastMdlReadWait")
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Integer} 
 */
export FsRtlIsPagingFile(FileObject) {
    result := DllCall("ntoskrnl.exe\FsRtlIsPagingFile", FILE_OBJECT.Ptr, FileObject, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Integer} 
 */
export FsRtlIsSystemPagingFile(FileObject) {
    result := DllCall("ntoskrnl.exe\FsRtlIsSystemPagingFile", FILE_OBJECT.Ptr, FileObject, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Pointer<Pointer<Void>>} SectionObject 
 * @param {Pointer<Integer>} SectionFileSize 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Integer>} MaximumSize 
 * @param {Integer} SectionPageProtection 
 * @param {Integer} AllocationAttributes 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlCreateSectionForDataScan(SectionHandle, SectionObject, SectionFileSize, FileObject, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, Flags) {
    SectionObjectMarshal := SectionObject is VarRef ? "ptr*" : "ptr"
    SectionFileSizeMarshal := SectionFileSize is VarRef ? "int64*" : "ptr"
    MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCreateSectionForDataScan", HANDLE.Ptr, SectionHandle, SectionObjectMarshal, SectionObject, SectionFileSizeMarshal, SectionFileSize, FILE_OBJECT.Ptr, FileObject, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} BufferLength 
 * @param {Integer} ReparseBuffer 
 * @returns {NTSTATUS} 
 */
export FsRtlValidateReparsePointBuffer(BufferLength, ReparseBuffer) {
    result := DllCall("ntoskrnl.exe\FsRtlValidateReparsePointBuffer", "uint", BufferLength, "ptr", ReparseBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} OriginalString 
 * @param {Integer} PathLength 
 * @param {Pointer<Integer>} NewLength 
 * @returns {NTSTATUS} 
 */
export FsRtlRemoveDotsFromPath(OriginalString, PathLength, NewLength) {
    NewLengthMarshal := NewLength is VarRef ? "ushort*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlRemoveDotsFromPath", "ptr", OriginalString, "ushort", PathLength, NewLengthMarshal, NewLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ReparseTag 
 * @returns {BOOLEAN} 
 */
export FsRtlIsNonEmptyDirectoryReparsePointAllowed(ReparseTag) {
    result := DllCall("ntoskrnl.exe\FsRtlIsNonEmptyDirectoryReparsePointAllowed", "uint", ReparseTag, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
 * @returns {NTSTATUS} 
 */
export FsRtlAllocateExtraCreateParameterList(Flags, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlAllocateExtraCreateParameterList", "uint", Flags, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlFreeExtraCreateParameterList(EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlFreeExtraCreateParameterList", EcpListMarshal, EcpList)
}

/**
 * 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {NTSTATUS} 
 */
export FsRtlInitializeExtraCreateParameterList(EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlInitializeExtraCreateParameterList", EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} EcpType 
 * @param {Integer} SizeOfContext 
 * @param {Integer} Flags 
 * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
 * @param {Integer} PoolTag 
 * @param {Pointer<Pointer<Void>>} EcpContext 
 * @returns {NTSTATUS} 
 */
export FsRtlAllocateExtraCreateParameter(EcpType, SizeOfContext, Flags, CleanupCallback, PoolTag, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlAllocateExtraCreateParameter", Guid.Ptr, EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, "uint", PoolTag, EcpContextMarshal, EcpContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} EcpContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlFreeExtraCreateParameter(EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlFreeExtraCreateParameter", EcpContextMarshal, EcpContext)
}

/**
 * 
 * @param {Pointer<ECP_HEADER>} Ecp 
 * @param {Integer} EcpFlags 
 * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
 * @param {Integer} TotalSize 
 * @param {Pointer<Guid>} EcpType 
 * @param {Pointer<Void>} ListAllocatedFrom 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitializeExtraCreateParameter(Ecp, EcpFlags, CleanupCallback, TotalSize, EcpType, ListAllocatedFrom) {
    EcpMarshal := Ecp is VarRef ? "ptr*" : "ptr"
    ListAllocatedFromMarshal := ListAllocatedFrom is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlInitializeExtraCreateParameter", EcpMarshal, Ecp, "uint", EcpFlags, "ptr", CleanupCallback, "uint", TotalSize, Guid.Ptr, EcpType, ListAllocatedFromMarshal, ListAllocatedFrom)
}

/**
 * 
 * @param {Pointer<Void>} Lookaside 
 * @param {Integer} Flags 
 * @param {Pointer} _Size 
 * @param {Integer} Tag 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlInitExtraCreateParameterLookasideList(Lookaside, Flags, _Size, Tag) {
    LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlInitExtraCreateParameterLookasideList", LookasideMarshal, Lookaside, "uint", Flags, "ptr", _Size, "uint", Tag)
}

/**
 * 
 * @param {Pointer<Void>} Lookaside 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDeleteExtraCreateParameterLookasideList(Lookaside, Flags) {
    LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlDeleteExtraCreateParameterLookasideList", LookasideMarshal, Lookaside, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Guid>} EcpType 
 * @param {Integer} SizeOfContext 
 * @param {Integer} Flags 
 * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
 * @param {Pointer<Void>} LookasideList 
 * @param {Pointer<Pointer<Void>>} EcpContext 
 * @returns {NTSTATUS} 
 */
export FsRtlAllocateExtraCreateParameterFromLookasideList(EcpType, SizeOfContext, Flags, CleanupCallback, LookasideList, EcpContext) {
    LookasideListMarshal := LookasideList is VarRef ? "ptr" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlAllocateExtraCreateParameterFromLookasideList", Guid.Ptr, EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, LookasideListMarshal, LookasideList, EcpContextMarshal, EcpContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @param {Pointer<Void>} EcpContext 
 * @returns {NTSTATUS} 
 */
export FsRtlInsertExtraCreateParameter(EcpList, EcpContext) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlInsertExtraCreateParameter", EcpListMarshal, EcpList, EcpContextMarshal, EcpContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @param {Pointer<Guid>} EcpType 
 * @param {Pointer<Pointer<Void>>} EcpContext 
 * @param {Pointer<Integer>} EcpContextSize 
 * @returns {NTSTATUS} 
 */
export FsRtlFindExtraCreateParameter(EcpList, EcpType, EcpContext, EcpContextSize) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
    EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlFindExtraCreateParameter", EcpListMarshal, EcpList, Guid.Ptr, EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @param {Pointer<Guid>} EcpType 
 * @param {Pointer<Pointer<Void>>} EcpContext 
 * @param {Pointer<Integer>} EcpContextSize 
 * @returns {NTSTATUS} 
 */
export FsRtlRemoveExtraCreateParameter(EcpList, EcpType, EcpContext, EcpContextSize) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
    EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlRemoveExtraCreateParameter", EcpListMarshal, EcpList, Guid.Ptr, EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
 * @returns {NTSTATUS} 
 */
export FsRtlGetEcpListFromIrp(_Irp, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetEcpListFromIrp", IRP.Ptr, _Irp, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {NTSTATUS} 
 */
export FsRtlSetEcpListIntoIrp(_Irp, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlSetEcpListIntoIrp", IRP.Ptr, _Irp, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @param {Pointer<Void>} CurrentEcpContext 
 * @param {Pointer<Guid>} NextEcpType 
 * @param {Pointer<Pointer<Void>>} NextEcpContext 
 * @param {Pointer<Integer>} NextEcpContextSize 
 * @returns {NTSTATUS} 
 */
export FsRtlGetNextExtraCreateParameter(EcpList, CurrentEcpContext, NextEcpType, NextEcpContext, NextEcpContextSize) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    CurrentEcpContextMarshal := CurrentEcpContext is VarRef ? "ptr" : "ptr"
    NextEcpContextMarshal := NextEcpContext is VarRef ? "ptr*" : "ptr"
    NextEcpContextSizeMarshal := NextEcpContextSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetNextExtraCreateParameter", EcpListMarshal, EcpList, CurrentEcpContextMarshal, CurrentEcpContext, Guid.Ptr, NextEcpType, NextEcpContextMarshal, NextEcpContext, NextEcpContextSizeMarshal, NextEcpContextSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} EcpContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlAcknowledgeEcp(EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlAcknowledgeEcp", EcpContextMarshal, EcpContext)
}

/**
 * 
 * @param {Pointer<Void>} EcpContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlPrepareToReuseEcp(EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\FsRtlPrepareToReuseEcp", EcpContextMarshal, EcpContext)
}

/**
 * 
 * @param {Pointer<Void>} EcpContext 
 * @returns {BOOLEAN} 
 */
export FsRtlIsEcpAcknowledged(EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlIsEcpAcknowledged", EcpContextMarshal, EcpContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} EcpContext 
 * @returns {BOOLEAN} 
 */
export FsRtlIsEcpFromUserMode(EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlIsEcpFromUserMode", EcpContextMarshal, EcpContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {PEPROCESS} 
 */
export FsRtlOplockGetAnyBreakOwnerProcess(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlOplockGetAnyBreakOwnerProcess", OplockMarshal, Oplock, PEPROCESS)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} Flags 
 * @param {Integer} FlagsEx2 
 * @param {Pointer<Void>} CompletionRoutineContext 
 * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
 * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
 * @param {Integer} Timeout 
 * @param {Pointer<Void>} NotifyContext 
 * @param {Pointer<POPLOCK_NOTIFY_ROUTINE>} NotifyRoutine 
 * @returns {NTSTATUS} 
 */
export FsRtlCheckOplockEx2(Oplock, _Irp, Flags, FlagsEx2, CompletionRoutineContext, CompletionRoutine, PostIrpRoutine, Timeout, NotifyContext, NotifyRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    CompletionRoutineContextMarshal := CompletionRoutineContext is VarRef ? "ptr" : "ptr"
    NotifyContextMarshal := NotifyContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlCheckOplockEx2", OplockMarshal, Oplock, IRP.Ptr, _Irp, "uint", Flags, "uint", FlagsEx2, CompletionRoutineContextMarshal, CompletionRoutineContext, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "uint", Timeout, NotifyContextMarshal, NotifyContext, "ptr", NotifyRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {Pointer<LIST_ENTRY>} 
 */
export FsRtlGetCurrentProcessLoaderList() {
    result := DllCall("ntoskrnl.exe\FsRtlGetCurrentProcessLoaderList", LIST_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @returns {BOOLEAN} 
 */
export FsRtlIs32BitProcess(Process) {
    result := DllCall("ntoskrnl.exe\FsRtlIs32BitProcess", PEPROCESS, Process, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} CurrentFileObject 
 * @param {Pointer<FILE_OBJECT>} NewFileObject 
 * @param {FSRTL_CHANGE_BACKING_TYPE} ChangeBackingType 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlChangeBackingFileObject(CurrentFileObject, NewFileObject, ChangeBackingType, Flags) {
    result := DllCall("ntoskrnl.exe\FsRtlChangeBackingFileObject", FILE_OBJECT.Ptr, CurrentFileObject, FILE_OBJECT.Ptr, NewFileObject, FSRTL_CHANGE_BACKING_TYPE, ChangeBackingType, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {NTSTATUS} FlushError 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlLogCcFlushError(FileName, DeviceObject, SectionObjectPointer, FlushError, Flags) {
    result := DllCall("ntoskrnl.exe\FsRtlLogCcFlushError", UNICODE_STRING.Ptr, FileName, DEVICE_OBJECT.Ptr, DeviceObject, SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, NTSTATUS, FlushError, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export FsRtlAreVolumeStartupApplicationsComplete() {
    result := DllCall("ntoskrnl.exe\FsRtlAreVolumeStartupApplicationsComplete", BOOLEAN)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export FsRtlQueryMaximumVirtualDiskNestingLevel() {
    result := DllCall("ntoskrnl.exe\FsRtlQueryMaximumVirtualDiskNestingLevel", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Integer>} NestingLevel 
 * @param {Pointer<Integer>} NestingFlags 
 * @returns {NTSTATUS} 
 */
export FsRtlGetVirtualDiskNestingLevel(DeviceObject, NestingLevel, NestingFlags) {
    NestingLevelMarshal := NestingLevel is VarRef ? "uint*" : "ptr"
    NestingFlagsMarshal := NestingFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetVirtualDiskNestingLevel", DEVICE_OBJECT.Ptr, DeviceObject, NestingLevelMarshal, NestingLevel, NestingFlagsMarshal, NestingFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} VolumeDeviceObject 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export FsRtlVolumeDeviceToCorrelationId(VolumeDeviceObject, Guid) {
    result := DllCall("ntoskrnl.exe\FsRtlVolumeDeviceToCorrelationId", DEVICE_OBJECT.Ptr, VolumeDeviceObject, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} IoCtl 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Pointer<Void>} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @param {Pointer<Pointer>} IosbInformation 
 * @returns {NTSTATUS} 
 */
export FsRtlIssueDeviceIoControl(DeviceObject, IoCtl, Flags, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, IosbInformation) {
    InputBufferMarshal := InputBuffer is VarRef ? "ptr" : "ptr"
    OutputBufferMarshal := OutputBuffer is VarRef ? "ptr" : "ptr"
    IosbInformationMarshal := IosbInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlIssueDeviceIoControl", DEVICE_OBJECT.Ptr, DeviceObject, "uint", IoCtl, "char", Flags, InputBufferMarshal, InputBuffer, "uint", InputBufferLength, OutputBufferMarshal, OutputBuffer, "uint", OutputBufferLength, IosbInformationMarshal, IosbInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<FILE_FS_SECTOR_SIZE_INFORMATION>} SectorSizeInfo 
 * @returns {NTSTATUS} 
 */
export FsRtlGetSectorSizeInformation(DeviceObject, SectorSizeInfo) {
    result := DllCall("ntoskrnl.exe\FsRtlGetSectorSizeInformation", DEVICE_OBJECT.Ptr, DeviceObject, FILE_FS_SECTOR_SIZE_INFORMATION.Ptr, SectorSizeInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Integer>} SupportedFeatures 
 * @returns {NTSTATUS} 
 */
export FsRtlGetSupportedFeatures(DeviceObject, SupportedFeatures) {
    SupportedFeaturesMarshal := SupportedFeatures is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlGetSupportedFeatures", DEVICE_OBJECT.Ptr, DeviceObject, SupportedFeaturesMarshal, SupportedFeatures, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FsControlCode 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @param {Pointer<Integer>} RetOutputBufferSize 
 * @returns {NTSTATUS} 
 */
export FsRtlKernelFsControlFile(FileObject, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, RetOutputBufferSize) {
    RetOutputBufferSizeMarshal := RetOutputBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlKernelFsControlFile", FILE_OBJECT.Ptr, FileObject, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, RetOutputBufferSizeMarshal, RetOutputBufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} ReturnedEaData 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} EaList 
 * @param {Integer} EaListLength 
 * @param {Pointer<Integer>} EaIndex 
 * @param {BOOLEAN} RestartScan 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FsRtlQueryKernelEaFile(FileObject, ReturnedEaData, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan, LengthReturned) {
    EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlQueryKernelEaFile", FILE_OBJECT.Ptr, FileObject, "ptr", ReturnedEaData, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, BOOLEAN, RestartScan, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} EaBuffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export FsRtlSetKernelEaFile(FileObject, EaBuffer, Length) {
    result := DllCall("ntoskrnl.exe\FsRtlSetKernelEaFile", FILE_OBJECT.Ptr, FileObject, "ptr", EaBuffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Pointer<Integer>} RetFileInformationSize 
 * @returns {NTSTATUS} 
 */
export FsRtlQueryInformationFile(FileObject, FileInformation, Length, FileInformationClass, RetFileInformationSize) {
    RetFileInformationSizeMarshal := RetFileInformationSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlQueryInformationFile", FILE_OBJECT.Ptr, FileObject, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, RetFileInformationSizeMarshal, RetFileInformationSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} Vdl 
 * @returns {NTSTATUS} 
 */
export FsRtlQueryCachedVdl(FileObject, Vdl) {
    VdlMarshal := Vdl is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\FsRtlQueryCachedVdl", FILE_OBJECT.Ptr, FileObject, VdlMarshal, Vdl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} BytesRead 
 * @param {Integer} BytesWritten 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlUpdateDiskCounters(BytesRead, BytesWritten) {
    DllCall("ntoskrnl.exe\FsRtlUpdateDiskCounters", "uint", BytesRead, "uint", BytesWritten)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {NTSTATUS} DismountStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export FsRtlDismountComplete(DeviceObject, DismountStatus) {
    DllCall("ntoskrnl.exe\FsRtlDismountComplete", DEVICE_OBJECT.Ptr, DeviceObject, NTSTATUS, DismountStatus)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} _DriverObj 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FsRtlSetDriverBacking(_DriverObj, Flags) {
    result := DllCall("ntoskrnl.exe\FsRtlSetDriverBacking", DRIVER_OBJECT.Ptr, _DriverObj, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export FsRtlIsMobileOS() {
    result := DllCall("ntoskrnl.exe\FsRtlIsMobileOS", BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} StartPage 
 * @param {Integer} NumberOfPages 
 * @param {Integer} Flags 
 * @returns {Integer} 
 */
export FsRtlIsExtentDangling(StartPage, NumberOfPages, Flags) {
    result := DllCall("ntoskrnl.exe\FsRtlIsExtentDangling", "uint", StartPage, "uint", NumberOfPages, "uint", Flags, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {BOOLEAN} 
 */
export FsRtlIsDaxVolume(FileObject) {
    result := DllCall("ntoskrnl.exe\FsRtlIsDaxVolume", FILE_OBJECT.Ptr, FileObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<CC_FILE_SIZES>} FileSizes 
 * @param {BOOLEAN} PinAccess 
 * @param {Pointer<CACHE_MANAGER_CALLBACKS>} Callbacks 
 * @param {Pointer<Void>} LazyWriteContext 
 * @returns {String} Nothing - always returns an empty string
 */
export CcInitializeCacheMap(FileObject, FileSizes, PinAccess, Callbacks, LazyWriteContext) {
    LazyWriteContextMarshal := LazyWriteContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcInitializeCacheMap", FILE_OBJECT.Ptr, FileObject, CC_FILE_SIZES.Ptr, FileSizes, BOOLEAN, PinAccess, CACHE_MANAGER_CALLBACKS.Ptr, Callbacks, LazyWriteContextMarshal, LazyWriteContext)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} TruncateSize 
 * @param {Pointer<CACHE_UNINITIALIZE_EVENT>} UninitializeEvent 
 * @returns {BOOLEAN} 
 */
export CcUninitializeCacheMap(FileObject, TruncateSize, UninitializeEvent) {
    TruncateSizeMarshal := TruncateSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcUninitializeCacheMap", FILE_OBJECT.Ptr, FileObject, TruncateSizeMarshal, TruncateSize, CACHE_UNINITIALIZE_EVENT.Ptr, UninitializeEvent, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<CC_FILE_SIZES>} FileSizes 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetFileSizes(FileObject, FileSizes) {
    DllCall("ntoskrnl.exe\CcSetFileSizes", FILE_OBJECT.Ptr, FileObject, CC_FILE_SIZES.Ptr, FileSizes)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<CC_FILE_SIZES>} FileSizes 
 * @returns {NTSTATUS} 
 */
export CcSetFileSizesEx(FileObject, FileSizes) {
    result := DllCall("ntoskrnl.exe\CcSetFileSizesEx", FILE_OBJECT.Ptr, FileObject, CC_FILE_SIZES.Ptr, FileSizes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} Flags 
 * @returns {BOOLEAN} 
 */
export CcPurgeCacheSection(SectionObjectPointer, FileOffset, Length, Flags) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcPurgeCacheSection", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export CcCoherencyFlushAndPurgeCache(SectionObjectPointer, FileOffset, Length, IoStatus, Flags) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\CcCoherencyFlushAndPurgeCache", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, FileOffsetMarshal, FileOffset, "uint", Length, IO_STATUS_BLOCK.Ptr, IoStatus, "uint", Flags)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} DirtyPageThreshold 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetDirtyPageThreshold(FileObject, DirtyPageThreshold) {
    DllCall("ntoskrnl.exe\CcSetDirtyPageThreshold", FILE_OBJECT.Ptr, FileObject, "uint", DirtyPageThreshold)
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export CcFlushCache(SectionObjectPointer, FileOffset, Length, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\CcFlushCache", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, FileOffsetMarshal, FileOffset, "uint", Length, IO_STATUS_BLOCK.Ptr, IoStatus)
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @param {BOOLEAN} BcbListHeld 
 * @returns {Integer} 
 */
export CcGetFlushedValidData(SectionObjectPointer, BcbListHeld) {
    result := DllCall("ntoskrnl.exe\CcGetFlushedValidData", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, BOOLEAN, BcbListHeld, Int64)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} StartOffset 
 * @param {Pointer<Integer>} EndOffset 
 * @param {BOOLEAN} Wait 
 * @returns {BOOLEAN} 
 */
export CcZeroData(FileObject, StartOffset, EndOffset, Wait) {
    StartOffsetMarshal := StartOffset is VarRef ? "int64*" : "ptr"
    EndOffsetMarshal := EndOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcZeroData", FILE_OBJECT.Ptr, FileObject, StartOffsetMarshal, StartOffset, EndOffsetMarshal, EndOffset, BOOLEAN, Wait, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @returns {Pointer<Void>} 
 */
export CcRemapBcb(Bcb) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\CcRemapBcb", BcbMarshal, Bcb, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @returns {String} Nothing - always returns an empty string
 */
export CcRepinBcb(Bcb) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcRepinBcb", BcbMarshal, Bcb)
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @param {BOOLEAN} WriteThrough 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export CcUnpinRepinnedBcb(Bcb, WriteThrough, IoStatus) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcUnpinRepinnedBcb", BcbMarshal, Bcb, BOOLEAN, WriteThrough, IO_STATUS_BLOCK.Ptr, IoStatus)
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @returns {Pointer<FILE_OBJECT>} 
 */
export CcGetFileObjectFromSectionPtrs(SectionObjectPointer) {
    result := DllCall("ntoskrnl.exe\CcGetFileObjectFromSectionPtrs", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, FILE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
 * @returns {Pointer<FILE_OBJECT>} 
 */
export CcGetFileObjectFromSectionPtrsRef(SectionObjectPointer) {
    result := DllCall("ntoskrnl.exe\CcGetFileObjectFromSectionPtrsRef", SECTION_OBJECT_POINTERS.Ptr, SectionObjectPointer, FILE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @returns {Pointer<FILE_OBJECT>} 
 */
export CcGetFileObjectFromBcb(Bcb) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\CcGetFileObjectFromBcb", BcbMarshal, Bcb, FILE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @returns {BOOLEAN} 
 */
export CcCopyWriteWontFlush(FileObject, FileOffset, Length) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcCopyWriteWontFlush", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} BytesToWrite 
 * @param {BOOLEAN} Wait 
 * @param {Integer} Retrying 
 * @returns {BOOLEAN} 
 */
export CcCanIWrite(FileObject, BytesToWrite, Wait, Retrying) {
    result := DllCall("ntoskrnl.exe\CcCanIWrite", FILE_OBJECT.Ptr, FileObject, "uint", BytesToWrite, BOOLEAN, Wait, "char", Retrying, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PCC_POST_DEFERRED_WRITE>} PostRoutine 
 * @param {Pointer<Void>} Context1 
 * @param {Pointer<Void>} Context2 
 * @param {Integer} BytesToWrite 
 * @param {BOOLEAN} Retrying 
 * @returns {String} Nothing - always returns an empty string
 */
export CcDeferWrite(FileObject, PostRoutine, Context1, Context2, BytesToWrite, Retrying) {
    Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
    Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcDeferWrite", FILE_OBJECT.Ptr, FileObject, "ptr", PostRoutine, Context1Marshal, Context1, Context2Marshal, Context2, "uint", BytesToWrite, BOOLEAN, Retrying)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} _Buffer 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {BOOLEAN} 
 */
export CcCopyRead(FileObject, FileOffset, Length, Wait, _Buffer, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcCopyRead", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "ptr", _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} PageCount 
 * @param {Integer} _Buffer 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export CcFastCopyRead(FileObject, FileOffset, Length, PageCount, _Buffer, IoStatus) {
    DllCall("ntoskrnl.exe\CcFastCopyRead", FILE_OBJECT.Ptr, FileObject, "uint", FileOffset, "uint", Length, "uint", PageCount, "ptr", _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} _Buffer 
 * @returns {BOOLEAN} 
 */
export CcCopyWrite(FileObject, FileOffset, Length, Wait, _Buffer) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcCopyWrite", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "ptr", _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} _Buffer 
 * @returns {String} Nothing - always returns an empty string
 */
export CcFastCopyWrite(FileObject, FileOffset, Length, _Buffer) {
    DllCall("ntoskrnl.exe\CcFastCopyWrite", FILE_OBJECT.Ptr, FileObject, "uint", FileOffset, "uint", Length, "ptr", _Buffer)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Pointer<Pointer<MDL>>} MdlChain 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export CcMdlRead(FileObject, FileOffset, Length, MdlChain, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\CcMdlRead", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<MDL>} MdlChain 
 * @returns {String} Nothing - always returns an empty string
 */
export CcMdlReadComplete(FileObject, MdlChain) {
    DllCall("ntoskrnl.exe\CcMdlReadComplete", FILE_OBJECT.Ptr, FileObject, MDL.Ptr, MdlChain)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Pointer<Pointer<MDL>>} MdlChain 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export CcPrepareMdlWrite(FileObject, FileOffset, Length, MdlChain, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\CcPrepareMdlWrite", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Pointer<MDL>} MdlChain 
 * @returns {String} Nothing - always returns an empty string
 */
export CcMdlWriteComplete(FileObject, FileOffset, MdlChain) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\CcMdlWriteComplete", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, MDL.Ptr, MdlChain)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<MDL>} MdlChain 
 * @returns {String} Nothing - always returns an empty string
 */
export CcMdlWriteAbort(FileObject, MdlChain) {
    DllCall("ntoskrnl.exe\CcMdlWriteAbort", FILE_OBJECT.Ptr, FileObject, MDL.Ptr, MdlChain)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @returns {String} Nothing - always returns an empty string
 */
export CcScheduleReadAhead(FileObject, FileOffset, Length) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\CcScheduleReadAhead", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length)
}

/**
 * 
 * @returns {NTSTATUS} 
 */
export CcWaitForCurrentLazyWriterActivity() {
    result := DllCall("ntoskrnl.exe\CcWaitForCurrentLazyWriterActivity", NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} Granularity 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetReadAheadGranularity(FileObject, Granularity) {
    DllCall("ntoskrnl.exe\CcSetReadAheadGranularity", FILE_OBJECT.Ptr, FileObject, "uint", Granularity)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} _Buffer 
 * @param {PETHREAD} IoIssuerThread 
 * @returns {BOOLEAN} 
 */
export CcCopyWriteEx(FileObject, FileOffset, Length, Wait, _Buffer, IoIssuerThread) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcCopyWriteEx", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "ptr", _Buffer, PETHREAD, IoIssuerThread, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} _Buffer 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {PETHREAD} IoIssuerThread 
 * @returns {BOOLEAN} 
 */
export CcCopyReadEx(FileObject, FileOffset, Length, Wait, _Buffer, IoStatus, IoIssuerThread) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcCopyReadEx", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "ptr", _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus, PETHREAD, IoIssuerThread, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Wait 
 * @param {Integer} _Buffer 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @param {PETHREAD} IoIssuerThread 
 * @param {Pointer<CC_ASYNC_READ_CONTEXT>} AsyncReadContext 
 * @returns {BOOLEAN} 
 */
export CcAsyncCopyRead(FileObject, FileOffset, Length, Wait, _Buffer, IoStatus, IoIssuerThread, AsyncReadContext) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcAsyncCopyRead", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Wait, "ptr", _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus, PETHREAD, IoIssuerThread, CC_ASYNC_READ_CONTEXT.Ptr, AsyncReadContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {PETHREAD} IoIssuerThread 
 * @returns {String} Nothing - always returns an empty string
 */
export CcScheduleReadAheadEx(FileObject, FileOffset, Length, IoIssuerThread) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\CcScheduleReadAheadEx", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, PETHREAD, IoIssuerThread)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<CC_FILE_SIZES>} FileSizes 
 * @param {BOOLEAN} PinAccess 
 * @param {Pointer<CACHE_MANAGER_CALLBACKS>} Callbacks 
 * @param {Pointer<Void>} LazyWriteContext 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export CcInitializeCacheMapEx(FileObject, FileSizes, PinAccess, Callbacks, LazyWriteContext, Flags) {
    LazyWriteContextMarshal := LazyWriteContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcInitializeCacheMapEx", FILE_OBJECT.Ptr, FileObject, CC_FILE_SIZES.Ptr, FileSizes, BOOLEAN, PinAccess, CACHE_MANAGER_CALLBACKS.Ptr, Callbacks, LazyWriteContextMarshal, LazyWriteContext, "uint", Flags)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} Bcb 
 * @param {Pointer<Pointer<Void>>} _Buffer 
 * @returns {BOOLEAN} 
 */
export CcPinRead(FileObject, FileOffset, Length, Flags, Bcb, _Buffer) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcPinRead", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BcbMarshal, Bcb, _BufferMarshal, _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} Bcb 
 * @param {Pointer<Pointer<Void>>} _Buffer 
 * @returns {BOOLEAN} 
 */
export CcMapData(FileObject, FileOffset, Length, Flags, Bcb, _Buffer) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcMapData", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BcbMarshal, Bcb, _BufferMarshal, _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} Bcb 
 * @returns {BOOLEAN} 
 */
export CcPinMappedData(FileObject, FileOffset, Length, Flags, Bcb) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcPinMappedData", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BcbMarshal, Bcb, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} FileOffset 
 * @param {Integer} Length 
 * @param {BOOLEAN} Zero 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} Bcb 
 * @param {Pointer<Pointer<Void>>} _Buffer 
 * @returns {BOOLEAN} 
 */
export CcPreparePinWrite(FileObject, FileOffset, Length, Zero, Flags, Bcb, _Buffer) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcPreparePinWrite", FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, BOOLEAN, Zero, "uint", Flags, BcbMarshal, Bcb, _BufferMarshal, _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} BcbVoid 
 * @param {Pointer<Integer>} Lsn 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetDirtyPinnedData(BcbVoid, Lsn) {
    BcbVoidMarshal := BcbVoid is VarRef ? "ptr" : "ptr"
    LsnMarshal := Lsn is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\CcSetDirtyPinnedData", BcbVoidMarshal, BcbVoid, LsnMarshal, Lsn)
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @returns {String} Nothing - always returns an empty string
 */
export CcUnpinData(Bcb) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcUnpinData", BcbMarshal, Bcb)
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @param {Pointer<Void>} OwnerPointer 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetBcbOwnerPointer(Bcb, OwnerPointer) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"
    OwnerPointerMarshal := OwnerPointer is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcSetBcbOwnerPointer", BcbMarshal, Bcb, OwnerPointerMarshal, OwnerPointer)
}

/**
 * 
 * @param {Pointer<Void>} Bcb 
 * @param {Pointer} ResourceThreadId 
 * @returns {String} Nothing - always returns an empty string
 */
export CcUnpinDataForThread(Bcb, ResourceThreadId) {
    BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcUnpinDataForThread", BcbMarshal, Bcb, "ptr", ResourceThreadId)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {BOOLEAN} DisableReadAhead 
 * @param {BOOLEAN} DisableWriteBehind 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetAdditionalCacheAttributes(FileObject, DisableReadAhead, DisableWriteBehind) {
    DllCall("ntoskrnl.exe\CcSetAdditionalCacheAttributes", FILE_OBJECT.Ptr, FileObject, BOOLEAN, DisableReadAhead, BOOLEAN, DisableWriteBehind)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetAdditionalCacheAttributesEx(FileObject, Flags) {
    DllCall("ntoskrnl.exe\CcSetAdditionalCacheAttributesEx", FILE_OBJECT.Ptr, FileObject, "uint", Flags)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {BOOLEAN} EnableParallelFlush 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetParallelFlushFile(FileObject, EnableParallelFlush) {
    DllCall("ntoskrnl.exe\CcSetParallelFlushFile", FILE_OBJECT.Ptr, FileObject, BOOLEAN, EnableParallelFlush)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Void>} LogHandle 
 * @param {Pointer<PFLUSH_TO_LSN>} FlushToLsnRoutine 
 * @returns {String} Nothing - always returns an empty string
 */
export CcSetLogHandleForFile(FileObject, LogHandle, FlushToLsnRoutine) {
    LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\CcSetLogHandleForFile", FILE_OBJECT.Ptr, FileObject, LogHandleMarshal, LogHandle, "ptr", FlushToLsnRoutine)
}

/**
 * 
 * @param {Pointer<Void>} LogHandle 
 * @param {Pointer<PDIRTY_PAGE_ROUTINE>} DirtyPageRoutine 
 * @param {Pointer<Void>} Context1 
 * @param {Pointer<Void>} Context2 
 * @returns {Integer} 
 */
export CcGetDirtyPages(LogHandle, DirtyPageRoutine, Context1, Context2) {
    LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"
    Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
    Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\CcGetDirtyPages", LogHandleMarshal, LogHandle, "ptr", DirtyPageRoutine, Context1Marshal, Context1, Context2Marshal, Context2, Int64)
    return result
}

/**
 * 
 * @param {Pointer<VPB>} _Vpb 
 * @returns {BOOLEAN} 
 */
export CcIsThereDirtyData(_Vpb) {
    result := DllCall("ntoskrnl.exe\CcIsThereDirtyData", VPB.Ptr, _Vpb, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<VPB>} _Vpb 
 * @param {Pointer<Integer>} NumberOfDirtyPages 
 * @returns {BOOLEAN} 
 */
export CcIsThereDirtyDataEx(_Vpb, NumberOfDirtyPages) {
    NumberOfDirtyPagesMarshal := NumberOfDirtyPages is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\CcIsThereDirtyDataEx", VPB.Ptr, _Vpb, NumberOfDirtyPagesMarshal, NumberOfDirtyPages, BOOLEAN)
    return result
}

/**
 * 
 * @param {NTSTATUS} _Status 
 * @returns {BOOLEAN} 
 */
export CcIsCacheManagerCallbackNeeded(_Status) {
    result := DllCall("ntoskrnl.exe\CcIsCacheManagerCallbackNeeded", NTSTATUS, _Status, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<CC_ERROR_CALLBACK_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export CcErrorCallbackRoutine(_Context) {
    result := DllCall("ntoskrnl.exe\CcErrorCallbackRoutine", CC_ERROR_CALLBACK_CONTEXT.Ptr, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates an instance of SspiAsyncContext which is used to track the async call.
 * @remarks
 * When done, the caller must free the async context with [SspiFreeAsyncContext](nf-sspi-sspifreeasynccontext.md)
 * 
 * While the instance's lifetime is the single async operation, it can be reused by calling [SspiReinitAsyncContext](nf-sspi-sspireinitasynccontext.md) after the operation has completed.
 * @returns {Pointer<SspiAsyncContext>} Returns the initialized SspiAsyncContext.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspicreateasynccontext
 */
export SspiCreateAsyncContext() {
    result := DllCall("ksecdd.sys\SspiCreateAsyncContext", SspiAsyncContext.Ptr)
    return result
}

/**
 * Frees up a context created in the call to the SspiCreateAsyncContext function.
 * @remarks
 * For all operations that require notification of completion, SspiFreeAsyncContext must not be called until the async operation is complete and the callback has been invoked. Calling [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md) will return status != SEC_I_ASYNC_CALL_PENDING to indicate the async operation has not completed.
 * @param {Pointer<SspiAsyncContext>} _Handle The async call context to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspifreeasynccontext
 */
export SspiFreeAsyncContext(_Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr*" : "ptr"

    DllCall("ksecdd.sys\SspiFreeAsyncContext", _HandleMarshal, _Handle)
}

/**
 * Marks an async context for reuse.
 * @remarks
 * Only the context state is altered. Client notification info, such as callback, is left alone.
 * @param {Pointer<SspiAsyncContext>} _Handle The async context handle.
 * @returns {NTSTATUS} If the context is invalid or currently in use, an error will be returned.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspireinitasynccontext
 */
export SspiReinitAsyncContext(_Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ksecdd.sys\SspiReinitAsyncContext", _HandleMarshal, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Registers a callback that is notified on async call completion.
 * @remarks
 * The *Callback* and *CallbackData* parameters can be set to **null** in order to specify that the caller is not interested in the result of the operation. 
 * 
 * > [!NOTE]
 * > Setting the callback to null is only supported for [SspiDeleteSecurityContextAsync](nf-sspi-sspideletesecuritycontextasync.md)
 * @param {Pointer<SspiAsyncContext>} _Context The async call context.
 * @param {Pointer<SspiAsyncNotifyCallback>} Callback The SspiAsyncNotifyCallback that will be notified on call completion.
 * @param {Pointer<Void>} CallbackData An opaque pointer that is passed to [SspiAsyncNotifyCallback](nc-sspi-sspiasyncnotifycallback.md).
 * @returns {HRESULT} 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspisetasyncnotifycallback
 */
export SspiSetAsyncNotifyCallback(_Context, Callback, CallbackData) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"
    CallbackDataMarshal := CallbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("ksecdd.sys\SspiSetAsyncNotifyCallback", _ContextMarshal, _Context, "ptr", Callback, CallbackDataMarshal, CallbackData, "HRESULT")
    return result
}

/**
 * Gets the current status of an async call associated with the provided context.
 * @param {Pointer<SspiAsyncContext>} _Handle The async call context to get status for.
 * @returns {HRESULT} When complete, returns the status of the async request. If the function succeeded, SspiGetAsyncCallStatus will return **SEC_E_OK**. Otherwise, refer to the respective API called to see return error codes and their respective descriptions.
 * 
 * Until the call is completed, status is **SEC_I_ASYNC_CALL_PENDING**.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspigetasynccallstatus
 */
export SspiGetAsyncCallStatus(_Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ksecdd.sys\SspiGetAsyncCallStatus", _HandleMarshal, _Handle, "HRESULT")
    return result
}

/**
 * Asynchronously acquires a handle to preexisting credentials of a security principal. (Unicode)
 * @remarks
 * The **SspiAcquireCredentialsHandleAsyncW** function returns a handle to the credentials of a principal, such as a user or client, as used by a specific [security package](/windows/desktop/SecGloss/s-gly). The function can return the handle to either preexisting credentials or newly created credentials and return it. This handle can be used in subsequent calls to the 
 * [SspiAcceptSecurityContextAsync](nf-sspi-sspiacceptsecuritycontextasync.md) and 
 * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md) functions.
 * 
 * In general, **SspiAcquireCredentialsHandleAsyncW** does not provide  the credentials of other users logged on to the same computer. However, a caller with SE_TCB_NAME  [privilege](/windows/desktop/SecGloss/p-gly) can obtain the [credentials](/windows/desktop/SecGloss/c-gly) of an existing logon session by specifying the [logon identifier](/windows/desktop/SecGloss/l-gly) (LUID) of that session. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
 * 
 * A package might call the function in *pGetKeyFn* provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be **NULL**.
 * 
 * For kernel mode callers, the following differences must be noted:
 * 
 * - The two string parameters must be [Unicode](/windows/desktop/SecGloss/u-gly) strings.
 * - The buffer values must be allocated in process virtual memory, not from the pool.
 * 
 * When you have finished using the returned credentials, free the memory used by the credentials by calling the 
 * [SspiFreeCredentialsHandleAsync](nf-sspi-sspifreecredentialshandleasync.md) function.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {Pointer<UNICODE_STRING>} pszPrincipal A pointer to a null-terminated string that specifies the name of the principal whose credentials the handle will reference asynchronously.
 * 
 * > [!NOTE]
 * > If the process that requests the handle does not have access to the credentials, the function returns an error. A null string indicates that the process requires a handle to the credentials of the user under whose [security context](/windows/desktop/SecGloss/s-gly) it is executing.
 * @param {Pointer<UNICODE_STRING>} pszPackage A pointer to a null-terminated string that specifies the name of the [security package](/windows/desktop/SecGloss/s-gly) with which these credentials will be used. This is a security package name returned in the **Name** member of a 
 * [SecPkgInfo](/windows/desktop/api/sspi/ns-sspi-secpkginfoa) structure returned by the 
 * [EnumerateSecurityPackages](/windows/desktop/api/sspi/nf-sspi-enumeratesecuritypackagesa)  function. After a context is established, 
 * [QueryContextAttributes (CredSSP)](/windows/desktop/api/sspi/nf-sspi-querycontextattributesa) can be called with *ulAttribute* set to **SECPKG_ATTR_PACKAGE_INFO** to return information on the security package in use.
 * @param {Integer} fCredentialUse 
 * @param {Pointer<Void>} pvLogonId A pointer to a [locally unique identifier](/windows/desktop/SecGloss/l-gly) (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be **NULL**.
 * @param {Pointer<Void>} pAuthData A pointer to a [CREDSSP_CRED](/windows/desktop/api/credssp/ns-credssp-credssp_cred) structure that specifies authentication data for both Schannel and Negotiate packages.
 * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Pointer to the GetKey() function.
 * @param {Pointer<Void>} pvGetKeyArgument Pass to GetKey().
 * @param {Pointer<SecHandle>} phCredential A pointer to the [CredHandle](/windows/desktop/SecAuthN/sspi-handles) structure that will receive the credential handle.
 * @param {Pointer<Integer>} ptsExpiry *optional* A pointer to a [TimeStamp](/windows/desktop/SecAuthN/timestamp) structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to acquire a credential handle was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * If the handle was acquired, SspiGetAsyncCallStatus returns **SEC_E_OK**. Otherwise, it may return *SEC_I_ASYNC_CALL_PENDING* if the call is still in progress, or any of the following fatal error codes in the table below.
 * 
 * |<div>Return code</div>|<div>Description</div>|
 * |---|---|
 * | **SEC_E_INSUFFICIENT_MEMORY** | There is insufficient memory available to complete the requested action. |
 * | **SEC_E_INTERNAL_ERROR** | An error occurred that did not map to an SSPI error code. |
 * | **SEC_E_NO_CREDENTIALS** | No credentials are available in the [security package](/windows/desktop/SecGloss/s-gly) |
 * | **SEC_E_NOT_OWNER** | The caller of the function does not have the necessary credentials. |
 * | **SEC_E_SECPKG_NOT_FOUND** | The requested security package does not exist.|
 * | **SEC_E_UNKNOWN_CREDENTIALS** | The credentials supplied to the package were not recognized. |
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiacquirecredentialshandleasyncw
 */
export SspiAcquireCredentialsHandleAsyncW(AsyncContext, pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential, ptsExpiry) {
    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
    pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
    pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
    pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("ksecdd.sys\SspiAcquireCredentialsHandleAsyncW", AsyncContextMarshal, AsyncContext, UNICODE_STRING.Ptr, pszPrincipal, UNICODE_STRING.Ptr, pszPackage, "uint", fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, SecHandle.Ptr, phCredential, ptsExpiryMarshal, ptsExpiry, "HRESULT")
    return result
}

/**
 * Asynchronously acquires a handle to preexisting credentials of a security principal. (ANSI)
 * @remarks
 * The **SspiAcquireCredentialsHandleAsyncA** function returns a handle to the credentials of a principal, such as a user or client, as used by a specific [security package](/windows/desktop/SecGloss/s-gly). The function can return the handle to either preexisting credentials or newly created credentials and return it. This handle can be used in subsequent calls to the 
 * [SspiAcceptSecurityContextAsync](nf-sspi-sspiacceptsecuritycontextasync.md) and 
 * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md) functions.
 * 
 * In general, **SspiAcquireCredentialsHandleAsyncA** does not provide  the credentials of other users logged on to the same computer. However, a caller with SE_TCB_NAME  [privilege](/windows/desktop/SecGloss/p-gly) can obtain the [credentials](/windows/desktop/SecGloss/c-gly) of an existing logon session by specifying the [logon identifier](/windows/desktop/SecGloss/l-gly) (LUID) of that session. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
 * 
 * A package might call the function in *pGetKeyFn* provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be **NULL**.
 * 
 * For kernel mode callers, the following differences must be noted:
 * 
 * - The two string parameters must be [Unicode](/windows/desktop/SecGloss/u-gly) strings.
 * - The buffer values must be allocated in process virtual memory, not from the pool.
 * 
 * When you have finished using the returned credentials, free the memory used by the credentials by calling the 
 * [SspiFreeCredentialsHandleAsync](nf-sspi-sspifreecredentialshandleasync.md) function.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {PSTR} pszPrincipal A pointer to a null-terminated string that specifies the name of the principal whose credentials the handle will reference asynchronously.
 * @param {PSTR} pszPackage A pointer to a null-terminated string that specifies the name of the [security package](/windows/desktop/SecGloss/s-gly) with which these credentials will be used. 
 * 
 * See [AcquireCredentialsHandleA: pszPackage](/windows/win32/secauthn/acquirecredentialshandle--general#parameters)
 * @param {Integer} fCredentialUse 
 * @param {Pointer<Void>} pvLogonId A pointer to a [locally unique identifier](/windows/desktop/SecGloss/l-gly) (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be **NULL**.
 * @param {Pointer<Void>} pAuthData A pointer to a [CREDSSP_CRED](/windows/desktop/api/credssp/ns-credssp-credssp_cred) structure that specifies authentication data for both Schannel and Negotiate packages.
 * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Pointer to the GetKey() function.
 * @param {Pointer<Void>} pvGetKeyArgument Pass to GetKey().
 * @param {Pointer<SecHandle>} phCredential A pointer to the [CredHandle](/windows/desktop/SecAuthN/sspi-handles) structure that will receive the credential handle.
 * @param {Pointer<Integer>} ptsExpiry *optional* A pointer to a [TimeStamp](/windows/desktop/SecAuthN/timestamp) structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to acquire a credential handle was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * If the handle was acquired, SspiGetAsyncCallStatus returns **SEC_E_OK**. Otherwise, it may return *SEC_I_ASYNC_CALL_PENDING* if the call is still in progress, or any of the following fatal error codes in the table below.
 * 
 * |<div>Return code</div>|<div>Description</div>|
 * |---|---|
 * | **SEC_E_INSUFFICIENT_MEMORY** | There is insufficient memory available to complete the requested action. |
 * | **SEC_E_INTERNAL_ERROR** | An error occurred that did not map to an SSPI error code. |
 * | **SEC_E_NO_CREDENTIALS** | No credentials are available in the [security package](/windows/desktop/SecGloss/s-gly) |
 * | **SEC_E_NOT_OWNER** | The caller of the function does not have the necessary credentials. |
 * | **SEC_E_SECPKG_NOT_FOUND** | The requested security package does not exist.|
 * | **SEC_E_UNKNOWN_CREDENTIALS** | The credentials supplied to the package were not recognized. |
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiacquirecredentialshandleasynca
 */
export SspiAcquireCredentialsHandleAsyncA(AsyncContext, pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential, ptsExpiry) {
    pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
    pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
    pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
    pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("ksecdd.sys\SspiAcquireCredentialsHandleAsyncA", AsyncContextMarshal, AsyncContext, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, SecHandle.Ptr, phCredential, ptsExpiryMarshal, ptsExpiry, "HRESULT")
    return result
}

/**
 * Initializes an async security context. (Unicode)
 * @remarks
 * See [InitializeSecurityContext](/windows/win32/secauthn/initializesecuritycontext--general#remarks) for complete remarks.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {Pointer<SecHandle>} phCredential A handle to the credentials returned by 
 * [AcquireCredentialsHandle](nf-sspi-sspiacquirecredentialshandleasynca.md). This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
 * @param {Pointer<SecHandle>} phContext A pointer to an existing [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure.
 * @param {Pointer<UNICODE_STRING>} pszTargetName A pointer to a null-terminated string that indicates the target of the context. The string contents are [*security package*](/windows/win32/secgloss/s-gly) specific, as described in the following table. This list is not exhaustive. Additional system SSPs and third party SSPs can be added to a system.
 * 
 * | SSP in use | Meaning |
 * |---|---|
 * | **Digest** | Null-terminated string that uniquely identifies the URI of the requested resource. The string must be composed of characters that are allowed in a URI and must be representable by the US ASCII code set. Percent encoding can be used to represent characters outside the US ASCII code set. |
 * | **Kerberos or Negotiate** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
 * | **NTLM** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
 * | **Schannel/SSL** | Null-terminated string that uniquely identifies the target server. Schannel uses this value to verify the server certificate. Schannel also uses this value to locate the session in the session cache when reestablishing a connection. The cached session is used only if all of the following conditions are met: <ul><li> The target name is the same.</li><li>The cache entry has not expired.<li>The application process that calls the function is the same.<li>The logon session is the same.<li>The credential handle is the same.</li></li></li></li></ul> |
 * @param {Integer} fContextReq Bit flags that indicate requests for the context.
 * 
 * See [InitializeSecurityContext: fContextReq](/windows/win32/secauthn/initializesecuritycontext--general#parameters) for a list of flag values and their meanings.
 * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
 * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the buffers supplied as input to the package.
 * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
 * @param {Pointer<SecHandle>} phNewContext A pointer to a [CtxtHandle](/windows/win32/secauthn/sspi-handles) structure.
 * @param {Pointer<SecBufferDesc>} pOutput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the SecBuffer structure that receives the output data.
 * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the attributes of the established context. For a description of the various attributes, see [Context Requirements](/windows/win32/secauthn/context-requirements).
 * @param {Pointer<Integer>} ptsExpiry *Optional*. A pointer to a [TimeStamp](/windows/win32/secauthn/timestamp) structure that receives the expiration time of the context.
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to establish a security context was successfully queued for execution, otherwise, returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * If the security context received from the server was accepted, SspiGetAsyncCallStatus returns **SEC_E_OK** or one of the SSPI codes in the table below. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or any of the following fatal error codes in the second table below.
 * 
 * |<div>Return code</div>|<div>Description</div>|
 * |---|---|
 * |**SEC_I_COMPLETE_AND_CONTINUE**<br>0x00090314L| The client must call [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken) and pass the output token to the server. The client then waits for a returned token and passes it, in another call, to SspiInitializeSecurityContextAsyncA. |
 * |**SEC_I_COMPLETE_NEEDED**<br>0x00090313L |  The client must finish building the message from the server before calling [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken).|
 * |**SEC_I_CONTINUE_NEEDED**<br>0x00090312L| The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to SspiInitializeSecurityContextAsyncA. The output token can be empty. |
 * | **SEC_I_INCOMPLETE_CREDENTIALS** | Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a certification authority that is trusted by the server. |
 * |**SEC_E_INCOMPLETE_MESSAGE**<br>0x80090318L |  Data for the whole message was not read from the wire. When this value is returned, the pInput buffer contains a SecBuffer structure with a BufferType member of SECBUFFER_MISSING. The cbBuffer member of SecBuffer contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.|
 * |**SEC_E_OK**<br>0x00000000L| The security context received from the client was accepted. If the function generated an output token, the token must be sent to the server.|
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiinitializesecuritycontextasyncw
 */
export SspiInitializeSecurityContextAsyncW(AsyncContext, phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("ksecdd.sys\SspiInitializeSecurityContextAsyncW", AsyncContextMarshal, AsyncContext, SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, UNICODE_STRING.Ptr, pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, SecBufferDesc.Ptr, pInput, "uint", Reserved2, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "HRESULT")
    return result
}

/**
 * Initializes an async security context. (ANSI)
 * @remarks
 * See [InitializeSecurityContext](/windows/win32/secauthn/initializesecuritycontext--general#remarks) for complete remarks.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {Pointer<SecHandle>} phCredential A handle to the credentials returned by 
 * [AcquireCredentialsHandle](nf-sspi-sspiacquirecredentialshandleasynca.md). This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
 * @param {Pointer<SecHandle>} phContext A pointer to an existing [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure.
 * @param {PSTR} pszTargetName A pointer to a null-terminated string that indicates the target of the context. The string contents are [*security package*](/windows/win32/secgloss/s-gly) specific, as described in the following table. This list is not exhaustive. Additional system SSPs and third party SSPs can be added to a system.
 * 
 * | SSP in use | Meaning |
 * |---|---|
 * | **Digest** | Null-terminated string that uniquely identifies the URI of the requested resource. The string must be composed of characters that are allowed in a URI and must be representable by the US ASCII code set. Percent encoding can be used to represent characters outside the US ASCII code set. |
 * | **Kerberos or Negotiate** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
 * | **NTLM** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
 * | **Schannel/SSL** | Null-terminated string that uniquely identifies the target server. Schannel uses this value to verify the server certificate. Schannel also uses this value to locate the session in the session cache when reestablishing a connection. The cached session is used only if all of the following conditions are met: <ul><li> The target name is the same.</li><li>The cache entry has not expired.<li>The application process that calls the function is the same.<li>The logon session is the same.<li>The credential handle is the same.</li></li></li></li></ul> |
 * @param {Integer} fContextReq Bit flags that indicate requests for the context.
 * 
 * See [InitializeSecurityContext: fContextReq](/windows/win32/secauthn/initializesecuritycontext--general#parameters) for a list of flag values and their meanings.
 * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
 * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the buffers supplied as input to the package.
 * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
 * @param {Pointer<SecHandle>} phNewContext A pointer to a [CtxtHandle](/windows/win32/secauthn/sspi-handles) structure.
 * @param {Pointer<SecBufferDesc>} pOutput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the SecBuffer structure that receives the output data.
 * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the attributes of the established context. For a description of the various attributes, see [Context Requirements](/windows/win32/secauthn/context-requirements).
 * @param {Pointer<Integer>} ptsExpiry *Optional*. A pointer to a [TimeStamp](/windows/win32/secauthn/timestamp) structure that receives the expiration time of the context.
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to establish a security context was successfully queued for execution, otherwise, returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * If the security context received from the server was accepted, SspiGetAsyncCallStatus returns **SEC_E_OK** or one of the SSPI codes in the table below. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or any of the following fatal error codes in the second table below.
 * 
 * |<div>Return code</div>|<div>Description</div>|
 * |---|---|
 * |**SEC_I_COMPLETE_AND_CONTINUE**<br>0x00090314L| The client must call [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken) and pass the output token to the server. The client then waits for a returned token and passes it, in another call, to SspiInitializeSecurityContextAsyncA. |
 * |**SEC_I_COMPLETE_NEEDED**<br>0x00090313L |  The client must finish building the message from the server before calling [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken).|
 * |**SEC_I_CONTINUE_NEEDED**<br>0x00090312L| The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to SspiInitializeSecurityContextAsyncA. The output token can be empty. |
 * | **SEC_I_INCOMPLETE_CREDENTIALS** | Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a certification authority that is trusted by the server. |
 * |**SEC_E_INCOMPLETE_MESSAGE**<br>0x80090318L |  Data for the whole message was not read from the wire. When this value is returned, the pInput buffer contains a SecBuffer structure with a BufferType member of SECBUFFER_MISSING. The cbBuffer member of SecBuffer contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.|
 * |**SEC_E_OK**<br>0x00000000L| The security context received from the client was accepted. If the function generated an output token, the token must be sent to the server.|
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiinitializesecuritycontextasynca
 */
export SspiInitializeSecurityContextAsyncA(AsyncContext, phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("ksecdd.sys\SspiInitializeSecurityContextAsyncA", AsyncContextMarshal, AsyncContext, SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, "ptr", pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, SecBufferDesc.Ptr, pInput, "uint", Reserved2, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "HRESULT")
    return result
}

/**
 * Lets the server component of a transport application asynchronously establish a security context between the server and a remote client.
 * @remarks
 * The **SspiAcceptSecurityContextAsync** function is the server counterpart to the 
 * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md) function.
 * 
 * The caller is responsible for determining whether the final context attributes are sufficient. For example, if confidentiality (encryption) was requested but could not be established, some applications may choose to shut down the connection immediately. If the security context cannot be established, the server must free the partially created context by calling the [SspiDeleteSecurityContextAsync](nf-sspi-sspideletesecuritycontextasync.md) function.
 * 
 * See [AcceptSecurityContext](/windows/win32/secauthn/acceptsecuritycontext--schannel#remarks) for additional remarks.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {Pointer<SecHandle>} phCredential A handle to the server credentials. To retrieve this handle, the server calls the 
 * [SspiAcquireCredentialsHandleAsync](nf-sspi-sspiacquirecredentialshandleasynca.md) function with either the SECPKG_CRED_INBOUND or SECPKG_CRED_BOTH flag set.
 * @param {Pointer<SecHandle>} phContext A pointer to a [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure. On the first call to [SspiAcceptSecurityContextAsync](nf-sspi-sspiacceptsecuritycontextasync.md), this pointer is **NULL**. On subsequent calls, *phContext* specifies the partially formed context returned in the *phNewContext* parameter by the first call.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
 * [SecBufferDesc](/windows/desktop/api/sspi/ns-sspi-secbufferdesc) structure generated by a client call to 
 * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md). The structure contains the input buffer descriptor.
 * 
 * The first buffer must be of type **SECBUFFER_TOKEN** and contain the security token received from the client. The second buffer should be of type **SECBUFFER_EMPTY**.
 * @param {Integer} fContextReq Bit flags that specify the attributes required by the server to establish the context. 
 * 
 * See [AcceptSecurityContext: fContextReq](/windows/win32/secauthn/acceptsecuritycontext--schannel#parameters) for a full list of parameter values.
 * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either **SECURITY_NATIVE_DREP** or **SECURITY_NETWORK_DREP**.
 * @param {Pointer<SecHandle>} phNewContext A pointer to a [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure. On the first call to **SspiAcceptSecurityContextAsync**, this pointer receives the new context handle. On subsequent calls, *phNewContext* can be the same as the handle specified in the *phContext* parameter.
 * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
 * [SecBufferDesc](/windows/desktop/api/sspi/ns-sspi-secbufferdesc) structure that contains the output buffer descriptor. This buffer is sent to the client for input into additional calls to [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md). An output buffer may be generated even if the function returns SEC_E_OK. Any buffer generated must be sent back to the client application.
 * 
 * On output, this buffer receives a token for the async security context. The token must be sent to the client. The function can also return a buffer of type SECBUFFER_EXTRA.
 * @param {Pointer<Integer>} pfContextAttr A pointer to a set of bit flags that indicate the attributes of the established context. 
 * 
 * See [AcceptSecurityContext: pfContextAttr](/windows/win32/secauthn/acceptsecuritycontext--schannel#parameters) for descriptions of the attributes.
 * @param {Pointer<Integer>} ptsExpiry A pointer to a [TimeStamp](/windows/desktop/SecAuthN/timestamp) structure that receives the expiration time of the context. 
 * 
 * See [AcceptSecurityContext: ptsExpiry](/windows/win32/secauthn/acceptsecuritycontext--schannel#parameters).
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to establish a security context was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * If the security context received from the client was accepted, SspiGetAsyncCallStatus returns **SEC_E_OK** or one of the SSPI codes in the table below. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or any of the following fatal error codes in the second table below.
 * 
 * |<div>Return code</div>|<div>Description</div>|
 * |---|---|
 * |**SEC_E_INCOMPLETE_MESSAGE**<br>0x80090318L | The function succeeded. The data in the input buffer is incomplete. The application must read additional data from the client and call SspiAcceptSecurityContextAsync again.|
 * |**SEC_I_COMPLETE_AND_CONTINUE**<br>0x00090314L|The function succeeded. The server must call [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken) and pass the output token to the client. The server must then wait for a return token from the client before making another call to SspiAcceptSecurityContextAsync.|
 * |**SEC_I_COMPLETE_NEEDED**<br>0x00090313L | The function succeeded. The server must finish building the message from the client before calling [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken).|
 * |**SEC_I_CONTINUE_NEEDED**<br>0x00090312L|The function succeeded. The server must send the output token to the client and wait for a returned token. The returned token should be passed in *pInput* for another call to SspiAcceptSecurityContextAsync.|
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiacceptsecuritycontextasync
 */
export SspiAcceptSecurityContextAsync(AsyncContext, phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("ksecdd.sys\SspiAcceptSecurityContextAsync", AsyncContextMarshal, AsyncContext, SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pInput, "uint", fContextReq, "uint", TargetDataRep, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "HRESULT")
    return result
}

/**
 * Frees up a credential handle.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {Pointer<SecHandle>} phCredential The credential handle to free.
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to free the credential handle was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * SspiGetAsyncCallStatus returns **SEC_E_OK** on completion. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspifreecredentialshandleasync
 */
export SspiFreeCredentialsHandleAsync(AsyncContext, phCredential) {
    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ksecdd.sys\SspiFreeCredentialsHandleAsync", AsyncContextMarshal, AsyncContext, SecHandle.Ptr, phCredential, "HRESULT")
    return result
}

/**
 * Deletes the local data structures associated with the specified security context initiated by a previous call to the SspiInitializeSecurityContextAsync function or the SspiAcceptSecurityContextAsync function.
 * @remarks
 * On async call completion, callers can choose to opt out of receiving a notification by avoiding setting a callback for a new SspiAsyncContext or by removing the callback using [SspiSetAsyncNotifyCallback](nf-sspi-sspisetasyncnotifycallback.md) with a null parameter. If opting out, the caller should free the context with [SspiFreeAsyncContext](nf-sspi-sspifreeasynccontext.md) immediately after calling SspiDeleteSecurityContextAsync, unless the context is intended for reuse.
 * 
 * The **SspiDeleteSecurityContextAsync** function terminates a security context and frees associated resources.
 * 
 * The caller must call this function for a security context when that security context is no longer needed. This is true if the security context is partial, incomplete, rejected, or failed. After the security context is successfully deleted, further use of that security context is not permitted and the handle is no longer valid.
 * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
 * @param {Pointer<SecHandle>} phContext Handle of the security context to delete.
 * @returns {HRESULT} Returns **SEC_E_OK** if the async request to delete the security context was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
 * 
 * SspiGetAsyncCallStatus returns **SEC_E_OK** on completion. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or one of the error codes below.
 * 
 * |<div>Return code</div>|<div>Description</div>|
 * |---|---|
 * |**SEC_E_INVALID_HANDLE**|The handle passed to the function is not valid.|
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspideletesecuritycontextasync
 */
export SspiDeleteSecurityContextAsync(AsyncContext, phContext) {
    AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ksecdd.sys\SspiDeleteSecurityContextAsync", AsyncContextMarshal, AsyncContext, SecHandle.Ptr, phContext, "HRESULT")
    return result
}

/**
 * Completes an authentication token. (CompleteAuthToken)
 * @remarks
 * The client of a transport application calls the <b>CompleteAuthToken</b> function to allow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to update a checksum or similar operation after all the protocol headers have been updated by the transport application. The client calls this function only if the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (Digest)</a> call returned SEC_I_COMPLETE_NEEDED or SEC_I_COMPLETE_AND_CONTINUE.
 * @param {Pointer<SecHandle>} phContext A handle of the context that needs to be completed.
 * @param {Pointer<SecBufferDesc>} pToken A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the buffer descriptor for the entire message.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 						
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle that was passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The token that was passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client's security context was located, but the message number is incorrect. This return value is used with the Digest SSP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_MESSAGE_ALTERED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client's security context was located, but the client's message has been tampered with. This return value is used with the Digest SSP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-completeauthtoken
 */
export CompleteAuthToken(phContext, pToken) {
    result := DllCall("SECUR32.dll\CompleteAuthToken", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pToken, "HRESULT")
    return result
}

/**
 * Obtains the access token for a client security context and uses it directly.
 * @remarks
 * This function is called by a server application to control impersonation outside the SSPI layer, such as when launching a child process. The handle returned must be closed with <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when the handle is no longer needed.
 * @param {Pointer<SecHandle>} phContext Handle of the context to query.
 * @returns {Pointer<Void>} Returned handle to the access token.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querysecuritycontexttoken
 */
export QuerySecurityContextToken(phContext) {
    result := DllCall("SECUR32.dll\QuerySecurityContextToken", SecHandle.Ptr, phContext, "ptr*", &Token := 0, "HRESULT")
    return Token
}

/**
 * Provides a way to apply a control token to a security context.
 * @remarks
 * The <b>ApplyControlToken</b> function can modify the context based on this token. Among the tokens that this function can add to the client context are <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_alert_token">SCHANNEL_ALERT_TOKEN</a> and <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_session_token">SCHANNEL_SESSION_TOKEN</a>.
 * 
 * This function can be used to shut down the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> that underlies an existing Schannel connection. For information about how to do this, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
 * @param {Pointer<SecHandle>} phContext A handle to the context to which the token is applied.
 * 
 * For information about the way the Schannel SSP notifies the remote party of the shutdown, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (Schannel)</a>. For additional information on the use of this function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the input token to apply to the context.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes that can be returned.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is returned by Schannel kernel mode to indicate that this function is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-applycontroltoken
 */
export ApplyControlToken(phContext, pInput) {
    result := DllCall("SECUR32.dll\ApplyControlToken", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pInput, "HRESULT")
    return result
}

/**
 * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SetContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A handle to the security context to be set.
 * @param {Integer} ulAttribute 
 * @param {Integer} pBuffer A pointer to a structure that contains  values to set  the attributes to. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is returned by Schannel kernel mode to indicate that this function is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcontextattributesw
 */
export SetContextAttributesW(phContext, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SECUR32.dll\SetContextAttributesW", SecHandle.Ptr, phContext, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Generates a cryptographic checksum of the message, and also includes sequencing information to prevent message loss or insertion.
 * @remarks
 * The <b>MakeSignature</b> function generates a signature that is based on the message and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function verifies the messages signed by the <b>MakeSignature</b> function.
 * 
 * If the transport application created the security context to support sequence detection and the caller provides a sequence number, the function includes this information in the signature. This protects against reply, insertion, and suppression of messages. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> incorporates the sequence number passed down from the transport application.
 * @param {Pointer<SecHandle>} phContext A handle to the security context to use to sign the message.
 * @param {Integer} fQOP <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Package</a>-specific flags that indicate the quality of protection. A security package can use this parameter to enable the selection of cryptographic algorithms.
 * 
 * When using the Digest SSP, this parameter must be set to zero.
 * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message to be signed. The function does not process buffers with the SECBUFFER_READONLY_WITH_CHECKSUM  attribute.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure also references a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure of type SECBUFFER_TOKEN that receives the signature.
 * 
 * When the Digest SSP is used as an HTTP authentication protocol, the buffers should be configured as follows.
 * 
 * <table>
 * <tr>
 * <th>Buffer #/buffer type</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * <dt>SECBUFFER_TOKEN</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * <dt>SECBUFFER_PKG_PARAMS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Method.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="2"></a><dl>
 * <dt><b>2</b></dt>
 * <dt>SECBUFFER_PKG_PARAMS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * URL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="3"></a><dl>
 * <dt><b>3</b></dt>
 * <dt>SECBUFFER_PKG_PARAMS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * HEntity. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/input-buffers-for-the-digest-challenge-response">Input Buffers for the Digest Challenge Response</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="4"></a><dl>
 * <dt><b>4</b></dt>
 * <dt>SECBUFFER_PADDING</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty. Receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a>.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * When the Digest SSP is used as an SASL mechanism, the buffers should be configured as follows.
 * 
 * <table>
 * <tr>
 * <th>Buffer #/buffer type</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * <dt>SECBUFFER_TOKEN</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty. Receives the signature. This buffer must be large enough to hold the largest possible signature. Determine the size required by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function and specifying SECPKG_ATTR_SIZES. Check the returned 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure member <b>cbMaxSignature</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * <dt>SECBUFFER_DATA</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Message to be signed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="2"></a><dl>
 * <dt><b>2</b></dt>
 * <dt>SECBUFFER_PADDING</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} MessageSeqNo The sequence number that the transport application assigned to the message. If the transport application does not maintain sequence numbers, this parameter is zero.
 * 
 * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_RENEGOTIATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote party requires a new handshake sequence or the application has just initiated a shutdown. Return to the negotiation loop and call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> again. An empty input buffer is passed in the first call.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context handle specified by <i>phContext</i> is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>pMessage</i> did not contain a valid SECBUFFER_TOKEN buffer or contained too few buffers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/n-gly">nonce</a> count is out of sequence.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> (<i>phContext</i>) must be revalidated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The nonce count is not numeric.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_QOP_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The quality of protection negotiated between the client and server did not include <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a> checking.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-makesignature
 */
export MakeSignature(phContext, fQOP, pMessage, MessageSeqNo) {
    result := DllCall("SECUR32.dll\MakeSignature", SecHandle.Ptr, phContext, "uint", fQOP, SecBufferDesc.Ptr, pMessage, "uint", MessageSeqNo, "HRESULT")
    return result
}

/**
 * Verifies that a message signed by using the MakeSignature function was received in the correct sequence and has not been modified.
 * @remarks
 * <div class="alert"><b>Warning</b>  <p class="note">The <b>VerifySignature</b> function will fail if the message was signed using the <a href="https://docs.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha512">RsaSignPssSha512</a> algorithm on a different version of Windows. For example, a message that was signed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function on Windows 8 will cause the <b>VerifySignature</b> function on Windows 8.1 to fail.
 * 
 * </div>
 * <div> </div>
 * @param {Pointer<SecHandle>} phContext A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> to use for the message.
 * @param {Pointer<SecBufferDesc>} pMessage Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that references a set of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message and signature to verify. The signature is in a <b>SecBuffer</b> structure of type SECBUFFER_TOKEN.
 * @param {Integer} MessageSeqNo Specifies the sequence number expected by the transport application, if any. If the transport application does not maintain sequence numbers, this parameter is zero.
 * @returns {Integer} Pointer to a <b>ULONG</b> variable that receives package-specific flags that indicate the quality of protection.
 * 
 * Some security packages ignore this parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-verifysignature
 */
export VerifySignature(phContext, pMessage, MessageSeqNo) {
    result := DllCall("SECUR32.dll\VerifySignature", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pMessage, "uint", MessageSeqNo, "uint*", &pfQOP := 0, "HRESULT")
    return pfQOP
}

/**
 * The ExportSecurityContext function creates a serialized representation of a security context that can later be imported into a different process by calling ImportSecurityContext.
 * @param {Pointer<SecHandle>} phContext A handle of the security context to be exported.
 * @param {Integer} fFlags 
 * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer of type <b>SECBUFFER_EMPTY</b> that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context. When you have finished using this context,  free it by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * @returns {Pointer<Void>} A pointer to receive the handle of the context's token.
 * 
 * When you have finished using the user token, release the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-exportsecuritycontext
 */
export ExportSecurityContext(phContext, fFlags, pPackedContext) {
    result := DllCall("SECUR32.dll\ExportSecurityContext", SecHandle.Ptr, phContext, "uint", fFlags, SecBuffer.Ptr, pPackedContext, "ptr*", &pToken := 0, "HRESULT")
    return pToken
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ServiceClass 
 * @param {Pointer<UNICODE_STRING>} ServiceName 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Integer} InstancePort 
 * @param {Pointer<UNICODE_STRING>} Referrer 
 * @param {Pointer<UNICODE_STRING>} Spn 
 * @param {Pointer<Integer>} Length 
 * @param {BOOLEAN} Allocate 
 * @returns {NTSTATUS} 
 */
export SecMakeSPN(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, Spn, Length, Allocate) {
    LengthMarshal := Length is VarRef ? "uint*" : "ptr"

    result := DllCall("ksecdd.sys\SecMakeSPN", UNICODE_STRING.Ptr, ServiceClass, UNICODE_STRING.Ptr, ServiceName, UNICODE_STRING.Ptr, InstanceName, "ushort", InstancePort, UNICODE_STRING.Ptr, Referrer, UNICODE_STRING.Ptr, Spn, LengthMarshal, Length, BOOLEAN, Allocate, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ServiceClass 
 * @param {Pointer<UNICODE_STRING>} ServiceName 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Integer} InstancePort 
 * @param {Pointer<UNICODE_STRING>} Referrer 
 * @param {Pointer<UNICODE_STRING>} TargetInfo 
 * @param {Pointer<UNICODE_STRING>} Spn 
 * @param {Pointer<Integer>} Length 
 * @param {BOOLEAN} Allocate 
 * @returns {NTSTATUS} 
 */
export SecMakeSPNEx(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, TargetInfo, Spn, Length, Allocate) {
    LengthMarshal := Length is VarRef ? "uint*" : "ptr"

    result := DllCall("ksecdd.sys\SecMakeSPNEx", UNICODE_STRING.Ptr, ServiceClass, UNICODE_STRING.Ptr, ServiceName, UNICODE_STRING.Ptr, InstanceName, "ushort", InstancePort, UNICODE_STRING.Ptr, Referrer, UNICODE_STRING.Ptr, TargetInfo, UNICODE_STRING.Ptr, Spn, LengthMarshal, Length, BOOLEAN, Allocate, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ServiceClass 
 * @param {Pointer<UNICODE_STRING>} ServiceName 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Integer} InstancePort 
 * @param {Pointer<UNICODE_STRING>} Referrer 
 * @param {Pointer<UNICODE_STRING>} InTargetInfo 
 * @param {Pointer<UNICODE_STRING>} Spn 
 * @param {Pointer<Integer>} TotalSize 
 * @param {BOOLEAN} Allocate 
 * @param {BOOLEAN} IsTargetInfoMarshaled 
 * @returns {NTSTATUS} 
 */
export SecMakeSPNEx2(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, InTargetInfo, Spn, TotalSize, Allocate, IsTargetInfoMarshaled) {
    TotalSizeMarshal := TotalSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ksecdd.sys\SecMakeSPNEx2", UNICODE_STRING.Ptr, ServiceClass, UNICODE_STRING.Ptr, ServiceName, UNICODE_STRING.Ptr, InstanceName, "ushort", InstancePort, UNICODE_STRING.Ptr, Referrer, UNICODE_STRING.Ptr, InTargetInfo, UNICODE_STRING.Ptr, Spn, TotalSizeMarshal, TotalSize, BOOLEAN, Allocate, BOOLEAN, IsTargetInfoMarshaled, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSID} _Sid 
 * @param {Pointer<Integer>} NameSize 
 * @param {Pointer<UNICODE_STRING>} NameBuffer 
 * @param {Pointer<Integer>} DomainSize 
 * @param {Pointer<UNICODE_STRING>} DomainBuffer 
 * @param {Pointer<SID_NAME_USE>} NameUse 
 * @returns {NTSTATUS} 
 */
export SecLookupAccountSid(_Sid, NameSize, NameBuffer, DomainSize, DomainBuffer, NameUse) {
    NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
    DomainSizeMarshal := DomainSize is VarRef ? "uint*" : "ptr"
    NameUseMarshal := NameUse is VarRef ? "int*" : "ptr"

    result := DllCall("ksecdd.sys\SecLookupAccountSid", PSID, _Sid, NameSizeMarshal, NameSize, UNICODE_STRING.Ptr, NameBuffer, DomainSizeMarshal, DomainSize, UNICODE_STRING.Ptr, DomainBuffer, NameUseMarshal, NameUse, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {Pointer<Integer>} SidSize 
 * @param {PSID} _Sid 
 * @param {Pointer<SID_NAME_USE>} NameUse 
 * @param {Pointer<Integer>} DomainSize 
 * @param {Pointer<UNICODE_STRING>} ReferencedDomain 
 * @returns {NTSTATUS} 
 */
export SecLookupAccountName(Name, SidSize, _Sid, NameUse, DomainSize, ReferencedDomain) {
    SidSizeMarshal := SidSize is VarRef ? "uint*" : "ptr"
    NameUseMarshal := NameUse is VarRef ? "int*" : "ptr"
    DomainSizeMarshal := DomainSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ksecdd.sys\SecLookupAccountName", UNICODE_STRING.Ptr, Name, SidSizeMarshal, SidSize, PSID, _Sid, NameUseMarshal, NameUse, DomainSizeMarshal, DomainSize, UNICODE_STRING.Ptr, ReferencedDomain, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {WELL_KNOWN_SID_TYPE} SidType 
 * @param {PSID} _Sid 
 * @param {Integer} SidBufferSize 
 * @param {Pointer<Integer>} SidSize 
 * @returns {NTSTATUS} 
 */
export SecLookupWellKnownSid(SidType, _Sid, SidBufferSize, SidSize) {
    SidSizeMarshal := SidSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ksecdd.sys\SecLookupWellKnownSid", WELL_KNOWN_SID_TYPE, SidType, PSID, _Sid, "uint", SidBufferSize, SidSizeMarshal, SidSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LUID>} LogonId 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<SECURITY_USER_DATA>>} UserInformation 
 * @returns {NTSTATUS} 
 */
export GetSecurityUserInfo(LogonId, Flags, UserInformation) {
    UserInformationMarshal := UserInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\GetSecurityUserInfo", LUID.Ptr, LogonId, "uint", Flags, UserInformationMarshal, UserInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HRESULT} SecStatus 
 * @returns {NTSTATUS} 
 */
export MapSecurityError(SecStatus) {
    result := DllCall("ksecdd.sys\MapSecurityError", "int", SecStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {OBJECT_INFORMATION_CLASS} ObjectInformationClass 
 * @param {Integer} ObjectInformation 
 * @param {Integer} ObjectInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryObject(_Handle, ObjectInformationClass, ObjectInformation, ObjectInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryObject", HANDLE, _Handle, OBJECT_INFORMATION_CLASS, ObjectInformationClass, "ptr", ObjectInformation, "uint", ObjectInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} CompletionFilter 
 * @param {BOOLEAN} WatchTree 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {BOOLEAN} Asynchronous 
 * @returns {NTSTATUS} 
 */
export ZwNotifyChangeKey(KeyHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, _Buffer, BufferSize, Asynchronous) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwNotifyChangeKey", HANDLE, KeyHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", CompletionFilter, BOOLEAN, WatchTree, "ptr", _Buffer, "uint", BufferSize, BOOLEAN, Asynchronous, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EventHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {EVENT_TYPE} EventType 
 * @param {BOOLEAN} InitialState 
 * @returns {NTSTATUS} 
 */
export ZwCreateEvent(EventHandle, DesiredAccess, ObjectAttributes, EventType, InitialState) {
    result := DllCall("ntdll.dll\ZwCreateEvent", HANDLE.Ptr, EventHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, EVENT_TYPE, EventType, BOOLEAN, InitialState, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwDeleteFile(ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwDeleteFile", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {BOOLEAN} RestartScan 
 * @returns {NTSTATUS} 
 */
export ZwQueryDirectoryFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, ReturnSingleEntry, FileName, RestartScan) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryDirectoryFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, BOOLEAN, ReturnSingleEntry, UNICODE_STRING.Ptr, FileName, BOOLEAN, RestartScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} QueryFlags 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @returns {NTSTATUS} 
 */
export ZwQueryDirectoryFileEx(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, QueryFlags, FileName) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryDirectoryFileEx", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, "uint", QueryFlags, UNICODE_STRING.Ptr, FileName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @returns {NTSTATUS} 
 */
export ZwQueryVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
    result := DllCall("ntdll.dll\ZwQueryVolumeInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @returns {NTSTATUS} 
 */
export ZwSetVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
    result := DllCall("ntdll.dll\ZwSetVolumeInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FsControlCode 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @returns {NTSTATUS} 
 */
export ZwFsControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwFsControlFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} SourceProcessHandle 
 * @param {HANDLE} SourceHandle 
 * @param {HANDLE} TargetProcessHandle 
 * @param {Pointer<HANDLE>} TargetHandle 
 * @param {Integer} DesiredAccess 
 * @param {Integer} HandleAttributes 
 * @param {Integer} Options 
 * @returns {NTSTATUS} 
 */
export ZwDuplicateObject(SourceProcessHandle, SourceHandle, TargetProcessHandle, TargetHandle, DesiredAccess, HandleAttributes, Options) {
    result := DllCall("ntdll.dll\ZwDuplicateObject", HANDLE, SourceProcessHandle, HANDLE, SourceHandle, HANDLE, TargetProcessHandle, HANDLE.Ptr, TargetHandle, "uint", DesiredAccess, "uint", HandleAttributes, "uint", Options, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} DirectoryHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenDirectoryObject", HANDLE.Ptr, DirectoryHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Pointer<Void>>} BaseAddress 
 * @param {Pointer} ZeroBits 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Integer} AllocationType 
 * @param {Integer} Protect 
 * @returns {NTSTATUS} 
 */
export ZwAllocateVirtualMemory(ProcessHandle, BaseAddress, ZeroBits, RegionSize, AllocationType, Protect) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\ZwAllocateVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, "ptr", ZeroBits, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", Protect, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} BaseAddress 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Integer} AllocationType 
 * @param {Integer} PageProtection 
 * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
 * @param {Integer} ExtendedParameterCount 
 * @returns {NTSTATUS} 
 */
export ZwAllocateVirtualMemoryEx(ProcessHandle, BaseAddress, RegionSize, AllocationType, PageProtection, ExtendedParameters, ExtendedParameterCount) {
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\ZwAllocateVirtualMemoryEx", HANDLE, ProcessHandle, "ptr", BaseAddress, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", PageProtection, MEM_EXTENDED_PARAMETER.Ptr, ExtendedParameters, "uint", ExtendedParameterCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Pointer<Void>>} BaseAddress 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Integer} FreeType 
 * @returns {NTSTATUS} 
 */
export ZwFreeVirtualMemory(ProcessHandle, BaseAddress, RegionSize, FreeType) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\ZwFreeVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, "uint", FreeType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Void>} BaseAddress 
 * @param {MEMORY_INFORMATION_CLASS} MemoryInformationClass 
 * @param {Integer} MemoryInformation 
 * @param {Pointer} MemoryInformationLength 
 * @param {Pointer<Pointer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryVirtualMemory(ProcessHandle, BaseAddress, MemoryInformationClass, MemoryInformation, MemoryInformationLength, ReturnLength) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, MEMORY_INFORMATION_CLASS, MemoryInformationClass, "ptr", MemoryInformation, "ptr", MemoryInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {VIRTUAL_MEMORY_INFORMATION_CLASS} VmInformationClass 
 * @param {Pointer} NumberOfEntries 
 * @param {Pointer<MEMORY_RANGE_ENTRY>} VirtualAddresses 
 * @param {Integer} VmInformation 
 * @param {Integer} VmInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationVirtualMemory(ProcessHandle, VmInformationClass, NumberOfEntries, VirtualAddresses, VmInformation, VmInformationLength) {
    result := DllCall("ntdll.dll\ZwSetInformationVirtualMemory", HANDLE, ProcessHandle, VIRTUAL_MEMORY_INFORMATION_CLASS, VmInformationClass, "ptr", NumberOfEntries, MEMORY_RANGE_ENTRY.Ptr, VirtualAddresses, "ptr", VmInformation, "uint", VmInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EventHandle 
 * @param {Pointer<Integer>} PreviousState 
 * @returns {NTSTATUS} 
 */
export ZwSetEvent(EventHandle, PreviousState) {
    PreviousStateMarshal := PreviousState is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\ZwSetEvent", HANDLE, EventHandle, PreviousStateMarshal, PreviousState, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Pointer<Void>>} BaseAddress 
 * @param {Pointer<Pointer>} RegionSize 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
 * @returns {NTSTATUS} 
 */
export ZwFlushVirtualMemory(ProcessHandle, BaseAddress, RegionSize, IoStatus) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\ZwFlushVirtualMemory", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, IO_STATUS_BLOCK.Ptr, IoStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Integer} DesiredAccess 
 * @param {Integer} HandleAttributes 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenProcessTokenEx(ProcessHandle, DesiredAccess, HandleAttributes, TokenHandle) {
    result := DllCall("ntdll.dll\ZwOpenProcessTokenEx", HANDLE, ProcessHandle, "uint", DesiredAccess, "uint", HandleAttributes, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ThreadHandle 
 * @param {Integer} DesiredAccess 
 * @param {BOOLEAN} OpenAsSelf 
 * @param {Integer} HandleAttributes 
 * @param {Pointer<HANDLE>} TokenHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenThreadTokenEx(ThreadHandle, DesiredAccess, OpenAsSelf, HandleAttributes, TokenHandle) {
    result := DllCall("ntdll.dll\ZwOpenThreadTokenEx", HANDLE, ThreadHandle, "uint", DesiredAccess, BOOLEAN, OpenAsSelf, "uint", HandleAttributes, HANDLE.Ptr, TokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {TOKEN_INFORMATION_CLASS} TokenInformationClass 
 * @param {Integer} TokenInformation 
 * @param {Integer} TokenInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryInformationToken", HANDLE, TokenHandle, TOKEN_INFORMATION_CLASS, TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TokenHandle 
 * @param {TOKEN_INFORMATION_CLASS} TokenInformationClass 
 * @param {Integer} TokenInformation 
 * @param {Integer} TokenInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength) {
    result := DllCall("ntdll.dll\ZwSetInformationToken", HANDLE, TokenHandle, TOKEN_INFORMATION_CLASS, TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} SecurityInformation 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {NTSTATUS} 
 */
export ZwSetSecurityObject(_Handle, SecurityInformation, _SecurityDescriptor) {
    result := DllCall("ntdll.dll\ZwSetSecurityObject", HANDLE, _Handle, "uint", SecurityInformation, PSECURITY_DESCRIPTOR, _SecurityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} SecurityInformation 
 * @param {Integer} _SecurityDescriptor 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} LengthNeeded 
 * @returns {NTSTATUS} 
 */
export ZwQuerySecurityObject(_Handle, SecurityInformation, _SecurityDescriptor, Length, LengthNeeded) {
    LengthNeededMarshal := LengthNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQuerySecurityObject", HANDLE, _Handle, "uint", SecurityInformation, "ptr", _SecurityDescriptor, "uint", Length, LengthNeededMarshal, LengthNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Length 
 * @param {Integer} Key 
 * @param {BOOLEAN} FailImmediately 
 * @param {BOOLEAN} ExclusiveLock 
 * @returns {NTSTATUS} 
 */
export ZwLockFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, ByteOffset, Length, Key, FailImmediately, ExclusiveLock) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwLockFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, BOOLEAN, FailImmediately, BOOLEAN, ExclusiveLock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Length 
 * @param {Integer} Key 
 * @returns {NTSTATUS} 
 */
export ZwUnlockFile(FileHandle, IoStatusBlock, ByteOffset, Length, Key) {
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    LengthMarshal := Length is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwUnlockFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} SidList 
 * @param {Integer} SidListLength 
 * @param {PSID} StartSid 
 * @param {BOOLEAN} RestartScan 
 * @returns {NTSTATUS} 
 */
export ZwQueryQuotaInformationFile(FileHandle, IoStatusBlock, _Buffer, Length, ReturnSingleEntry, SidList, SidListLength, StartSid, RestartScan) {
    result := DllCall("ntdll.dll\ZwQueryQuotaInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", SidList, "uint", SidListLength, PSID, StartSid, BOOLEAN, RestartScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export ZwSetQuotaInformationFile(FileHandle, IoStatusBlock, _Buffer, Length) {
    result := DllCall("ntdll.dll\ZwSetQuotaInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export ZwFlushBuffersFile(FileHandle, IoStatusBlock) {
    result := DllCall("ntdll.dll\ZwFlushBuffersFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Integer} FLags 
 * @param {Integer} Parameters 
 * @param {Integer} ParametersSize 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {NTSTATUS} 
 */
export ZwFlushBuffersFileEx(FileHandle, FLags, Parameters, ParametersSize, IoStatusBlock) {
    result := DllCall("ntdll.dll\ZwFlushBuffersFileEx", HANDLE, FileHandle, "uint", FLags, "ptr", Parameters, "uint", ParametersSize, IO_STATUS_BLOCK.Ptr, IoStatusBlock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} EaList 
 * @param {Integer} EaListLength 
 * @param {Pointer<Integer>} EaIndex 
 * @param {BOOLEAN} RestartScan 
 * @returns {NTSTATUS} 
 */
export ZwQueryEaFile(FileHandle, IoStatusBlock, _Buffer, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan) {
    EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryEaFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, BOOLEAN, RestartScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export ZwSetEaFile(FileHandle, IoStatusBlock, _Buffer, Length) {
    result := DllCall("ntdll.dll\ZwSetEaFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ExistingTokenHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {BOOLEAN} EffectiveOnly 
 * @param {TOKEN_TYPE} TokenType 
 * @param {Pointer<HANDLE>} NewTokenHandle 
 * @returns {NTSTATUS} 
 */
export ZwDuplicateToken(ExistingTokenHandle, DesiredAccess, ObjectAttributes, EffectiveOnly, TokenType, NewTokenHandle) {
    result := DllCall("ntdll.dll\ZwDuplicateToken", HANDLE, ExistingTokenHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, BOOLEAN, EffectiveOnly, TOKEN_TYPE, TokenType, HANDLE.Ptr, NewTokenHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PWSTR} DosFileName 
 * @returns {Integer} 
 */
export RtlIsDosDeviceName_U(DosFileName) {
    DosFileName := DosFileName is String ? StrPtr(DosFileName) : DosFileName

    result := DllCall("ntdll.dll\RtlIsDosDeviceName_U", "ptr", DosFileName, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} DosFileName 
 * @param {Pointer<UNICODE_STRING>} NtFileName 
 * @param {Pointer<PWSTR>} FilePart 
 * @returns {NTSTATUS} 
 */
export RtlDosPathNameToNtPathName_U_WithStatus(DosFileName, NtFileName, FilePart) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    DosFileName := DosFileName is String ? StrPtr(DosFileName) : DosFileName

    FilePartMarshal := FilePart is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlDosPathNameToNtPathName_U_WithStatus", "ptr", DosFileName, UNICODE_STRING.Ptr, NtFileName, FilePartMarshal, FilePart, "ptr", Reserved, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} DirectoryHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwCreateDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwCreateDirectoryObject", HANDLE.Ptr, DirectoryHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} FileInformation 
 * @returns {NTSTATUS} 
 */
export ZwQueryFullAttributesFile(ObjectAttributes, FileInformation) {
    result := DllCall("ntdll.dll\ZwQueryFullAttributesFile", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, FILE_NETWORK_OPEN_INFORMATION.Ptr, FileInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Pointer<OPLOCK_KEY_ECP_CONTEXT>} 
 */
export IoGetOplockKeyContext(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetOplockKeyContext", FILE_OBJECT.Ptr, FileObject, OPLOCK_KEY_ECP_CONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Pointer<OPLOCK_KEY_CONTEXT>} 
 */
export IoGetOplockKeyContextEx(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetOplockKeyContextEx", FILE_OBJECT.Ptr, FileObject, OPLOCK_KEY_CONTEXT.Ptr)
    return result
}

;@endregion Functions

#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\KEY_VALUE_INFORMATION_CLASS.ahk" { KEY_VALUE_INFORMATION_CLASS }
#Import ".\KEY_INFORMATION_CLASS.ahk" { KEY_INFORMATION_CLASS }
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }
#Import ".\KEY_SET_INFORMATION_CLASS.ahk" { KEY_SET_INFORMATION_CLASS }
#Import ".\KEY_VALUE_ENTRY.ahk" { KEY_VALUE_ENTRY }

/**
 * @namespace Windows.Wdk.System.Registry
 */

;@region Functions
/**
 * Requests notification when a registry key or any of its subkeys changes.
 * @remarks
 * This function has no associated header file. The associated import library, Ntdll.lib, is available in the WDK. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-loadlibrary">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-getprocaddress-">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
 * @param {HANDLE} MasterKeyHandle A handle to an open key. The handle must be opened with the <b>KEY_NOTIFY</b> access right.
 * @param {Integer} Count The number of subkeys under the key specified by the <i>MasterKeyHandle</i> parameter. This parameter must be 1.
 * @param {Pointer<OBJECT_ATTRIBUTES>} SubordinateObjects Pointer to an array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wudfwdm/ns-wudfwdm-_object_attributes">OBJECT_ATTRIBUTES</a> structures, one for each subkey.   This array can contain one <b>OBJECT_ATTRIBUTES</b> structure.
 * @param {HANDLE} Event A handle to an event created by the caller. If <i>Event</i> is not <b>NULL</b>, the caller waits until the operation succeeds, at which time the event is signaled.
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine A pointer to an asynchronous procedure call (APC) function supplied by the caller. If <i>ApcRoutine</i> is not <b>NULL</b>, the specified APC function executes after the operation completes.
 * @param {Pointer<Void>} ApcContext A pointer to a context supplied by the caller for its APC function. This value is passed to the APC function when it is executed. The <i>Asynchronous</i> parameter must be <b>TRUE</b>. If <i>ApcContext</i> is specified, the <i>Event</i> parameter must be <b>NULL</b>.
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock A pointer to an <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/ns-wdm-_io_status_block">IO_STATUS_BLOCK</a> structure that contains the final status and information about the operation. For successful calls that return data, the number of bytes written to the <i>Buffer</i> parameter is supplied in the <b>Information</b> member of the <b>IO_STATUS_BLOCK</b> structure.
 * @param {Integer} CompletionFilter A bitmap of operations that trigger notification. This parameter can be one or more of the following flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_NOTIFY_CHANGE_NAME_"></a><a id="reg_notify_change_name_"></a><dl>
 * <dt><b>REG_NOTIFY_CHANGE_NAME </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notify the caller if a subkey is added or deleted. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_NOTIFY_CHANGE_ATTRIBUTES_"></a><a id="reg_notify_change_attributes_"></a><dl>
 * <dt><b>REG_NOTIFY_CHANGE_ATTRIBUTES </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notify the caller of changes to the attributes of the key, such as the security descriptor information. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_NOTIFY_CHANGE_LAST_SET_"></a><a id="reg_notify_change_last_set_"></a><dl>
 * <dt><b>REG_NOTIFY_CHANGE_LAST_SET </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notify the caller of changes to a value of the key. This can include adding or deleting a value, or changing an existing value. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_NOTIFY_CHANGE_SECURITY_"></a><a id="reg_notify_change_security_"></a><dl>
 * <dt><b>REG_NOTIFY_CHANGE_SECURITY </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Notify the caller of changes to the security descriptor of the key.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {BOOLEAN} WatchTree If this parameter is <b>TRUE</b>, the caller is notified about changes to all subkeys of the specified key. If this parameter is <b>FALSE</b>, the caller is notified only about changes to the specified key.
 * @param {Integer} _Buffer Reserved for system use. This parameter must be <b>NULL</b>.
 * @param {Integer} BufferSize Reserved for system use. This parameter must be zero.
 * @param {BOOLEAN} Asynchronous If this parameter is <b>TRUE</b>, the function returns immediately. If this parameter is <b>FALSE</b>, the function does not return until the specified event occurs.
 * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code.
 * 
 * If the <i>Asynchronous</i> parameter is <b>TRUE</b> and the specified event has not yet occurred, the function returns <b>STATUS_PENDING</b>.
 * 
 * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntnotifychangemultiplekeys
 */
export NtNotifyChangeMultipleKeys(MasterKeyHandle, Count, SubordinateObjects, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, _Buffer, BufferSize, Asynchronous) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtNotifyChangeMultipleKeys", HANDLE, MasterKeyHandle, "uint", Count, OBJECT_ATTRIBUTES.Ptr, SubordinateObjects, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", CompletionFilter, BOOLEAN, WatchTree, "ptr", _Buffer, "uint", BufferSize, BOOLEAN, Asynchronous, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} MasterKeyHandle 
 * @param {Integer} Count 
 * @param {Pointer<OBJECT_ATTRIBUTES>} SubordinateObjects 
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
export ZwNotifyChangeMultipleKeys(MasterKeyHandle, Count, SubordinateObjects, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, _Buffer, BufferSize, Asynchronous) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwNotifyChangeMultipleKeys", HANDLE, MasterKeyHandle, "uint", Count, OBJECT_ATTRIBUTES.Ptr, SubordinateObjects, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", CompletionFilter, BOOLEAN, WatchTree, "ptr", _Buffer, "uint", BufferSize, BOOLEAN, Asynchronous, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves values for the specified multiple-value key.
 * @remarks
 * This function has no associated header file. The associated import library, Ntdll.lib, is available in the WDK. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-loadlibrary">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-getprocaddress-">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
 * @param {HANDLE} KeyHandle A handle to the key for which to retrieve values. The handle must be opened with the <b>KEY_QUERY_VALUE</b> access right.
 * @param {Pointer<KEY_VALUE_ENTRY>} ValueEntries A pointer to an array of [**KEY_VALUE_ENTRY**] structures containing the names of values to retrieve.
 * @param {Integer} EntryCount The number of elements in the <i>ValueEntries</i> array.
 * @param {Integer} ValueBuffer A pointer to a buffer to receive the values.
 * @param {Pointer<Integer>} BufferLength A pointer to a variable that contains the size of the buffer at <i>ValueBuffer</i>, in bytes. When the function returns, the <i>BufferLength</i> parameter contains the number of bytes written to the buffer at <i>ValueBuffer</i>.
 * @param {Pointer<Integer>} RequiredBufferLength A pointer to a variable to receive the number of bytes required for all of the values to be returned by the function. This parameter can be <b>NULL</b>.
 * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code.
 * 
 * If the buffer is too small to hold the information to be retrieved, the function returns <b>STATUS_BUFFER_OVERFLOW</b> and, if the <i>RequiredBufferLength</i> parameter is specified, sets it to the buffer size required.
 * 
 * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntquerymultiplevaluekey
 */
export NtQueryMultipleValueKey(KeyHandle, ValueEntries, EntryCount, ValueBuffer, BufferLength, RequiredBufferLength) {
    BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"
    RequiredBufferLengthMarshal := RequiredBufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryMultipleValueKey", HANDLE, KeyHandle, KEY_VALUE_ENTRY.Ptr, ValueEntries, "uint", EntryCount, "ptr", ValueBuffer, BufferLengthMarshal, BufferLength, RequiredBufferLengthMarshal, RequiredBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<KEY_VALUE_ENTRY>} ValueEntries 
 * @param {Integer} EntryCount 
 * @param {Integer} ValueBuffer 
 * @param {Pointer<Integer>} BufferLength 
 * @param {Pointer<Integer>} RequiredBufferLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryMultipleValueKey(KeyHandle, ValueEntries, EntryCount, ValueBuffer, BufferLength, RequiredBufferLength) {
    BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"
    RequiredBufferLengthMarshal := RequiredBufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryMultipleValueKey", HANDLE, KeyHandle, KEY_VALUE_ENTRY.Ptr, ValueEntries, "uint", EntryCount, "ptr", ValueBuffer, BufferLengthMarshal, BufferLength, RequiredBufferLengthMarshal, RequiredBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Changes the name of the specified registry key. (NtRenameKey)
 * @remarks
 * This function has no associated header file. The associated import library, Ntdll.lib, is available in the WDK. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-loadlibrary">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-getprocaddress-">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
 * 
 * The <b>NtRenameKey</b> function can be used to rename an entire registry subtree. The caller must have <b>KEY_CREATE_SUB_KEY</b> access to the parent of the specified key and DELETE access to the entire subtree being renamed.
 * @param {HANDLE} KeyHandle A handle to the key to be renamed. The handle must be opened with the KEY_WRITE access right.
 * @param {Pointer<UNICODE_STRING>} NewName A pointer to a UNICODE string that is the new name for the key.
 * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code. An error code of <b>STATUS_ACCESS_DENIED</b> indicates that the caller does not have the necessary access rights to the specified registry key or subkeys.
 * 
 * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntrenamekey
 */
export NtRenameKey(KeyHandle, NewName) {
    result := DllCall("ntdll.dll\NtRenameKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, NewName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets information for the specified registry key.
 * @remarks
 * The associated import library, Ntdll.lib, is available in the 
 *     WDK. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-loadlibrary">LoadLibrary</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-getprocaddress-">GetProcAddress</a> functions to dynamically link to 
 *     Ntdll.dll.
 * @param {HANDLE} KeyHandle A handle to the registry key. The handle must be opened with the <b>KEY_WRITE</b> access 
 *       right.
 * @param {KEY_SET_INFORMATION_CLASS} KeySetInformationClass A <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/ne-wdm-_key_set_information_class">KEY_SET_INFORMATION_CLASS</a> value that 
 *       specifies the kind of information to be set.
 * @param {Integer} KeySetInformation A pointer to the buffer that contains the information to be set. The format of this buffer is determined by 
 *       the <i>KeySetInformationClass</i> parameter.
 * @param {Integer} KeySetInformationLength The length of the buffer specified by the <i>KeySetInformation</i> parameter, in 
 *       bytes.
 * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code. An error code of 
 *        <b>STATUS_INFO_LENGTH_MISMATCH</b> indicates that the 
 *        <i>KeySetInformationLength</i> parameter is the wrong length for the information class 
 *        specified by the <i>KeySetInformationClass</i> parameter.
 * 
 * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h 
 *        header file available in the WDK, and are described in the WDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntsetinformationkey
 */
export NtSetInformationKey(KeyHandle, KeySetInformationClass, KeySetInformation, KeySetInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationKey", HANDLE, KeyHandle, KEY_SET_INFORMATION_CLASS, KeySetInformationClass, "ptr", KeySetInformation, "uint", KeySetInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} _Class 
 * @param {Integer} CreateOptions 
 * @param {Pointer<Integer>} Disposition 
 * @returns {NTSTATUS} 
 */
export NtCreateKey(KeyHandle, DesiredAccess, ObjectAttributes, _Class, CreateOptions, Disposition) {
    static TitleIndex := 0 ;Reserved parameters must always be NULL

    DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtCreateKey", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", TitleIndex, UNICODE_STRING.Ptr, _Class, "uint", CreateOptions, DispositionMarshal, Disposition, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} _Class 
 * @param {Integer} CreateOptions 
 * @param {HANDLE} TransactionHandle 
 * @param {Pointer<Integer>} Disposition 
 * @returns {NTSTATUS} 
 */
export NtCreateKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, _Class, CreateOptions, TransactionHandle, Disposition) {
    static TitleIndex := 0 ;Reserved parameters must always be NULL

    DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtCreateKeyTransacted", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", TitleIndex, UNICODE_STRING.Ptr, _Class, "uint", CreateOptions, HANDLE, TransactionHandle, DispositionMarshal, Disposition, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} CreateOptions 
 * @returns {NTSTATUS} 
 */
export NtCreateRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, CreateOptions) {
    result := DllCall("ntdll.dll\NtCreateRegistryTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", CreateOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export NtCommitRegistryTransaction(TransactionHandle, Flags) {
    result := DllCall("ntdll.dll\NtCommitRegistryTransaction", HANDLE, TransactionHandle, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtOpenKey(KeyHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenKey", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} OpenOptions 
 * @returns {NTSTATUS} 
 */
export NtOpenKeyEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions) {
    result := DllCall("ntdll.dll\NtOpenKeyEx", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", OpenOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {HANDLE} TransactionHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, TransactionHandle) {
    result := DllCall("ntdll.dll\NtOpenKeyTransacted", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, HANDLE, TransactionHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} OpenOptions 
 * @param {HANDLE} TransactionHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenKeyTransactedEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions, TransactionHandle) {
    result := DllCall("ntdll.dll\NtOpenKeyTransactedEx", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", OpenOptions, HANDLE, TransactionHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @returns {NTSTATUS} 
 */
export NtDeleteKey(KeyHandle) {
    result := DllCall("ntdll.dll\NtDeleteKey", HANDLE, KeyHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @returns {NTSTATUS} 
 */
export NtDeleteValueKey(KeyHandle, _ValueName) {
    result := DllCall("ntdll.dll\NtDeleteValueKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, _ValueName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Integer} Index 
 * @param {KEY_INFORMATION_CLASS} KeyInformationClass 
 * @param {Integer} KeyInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export NtEnumerateKey(KeyHandle, Index, KeyInformationClass, KeyInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtEnumerateKey", HANDLE, KeyHandle, "uint", Index, KEY_INFORMATION_CLASS, KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Integer} Index 
 * @param {KEY_VALUE_INFORMATION_CLASS} KeyValueInformationClass 
 * @param {Integer} KeyValueInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export NtEnumerateValueKey(KeyHandle, Index, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtEnumerateValueKey", HANDLE, KeyHandle, "uint", Index, KEY_VALUE_INFORMATION_CLASS, KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @returns {NTSTATUS} 
 */
export NtFlushKey(KeyHandle) {
    result := DllCall("ntdll.dll\NtFlushKey", HANDLE, KeyHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {KEY_INFORMATION_CLASS} KeyInformationClass 
 * @param {Integer} KeyInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export NtQueryKey(KeyHandle, KeyInformationClass, KeyInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryKey", HANDLE, KeyHandle, KEY_INFORMATION_CLASS, KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @param {KEY_VALUE_INFORMATION_CLASS} KeyValueInformationClass 
 * @param {Integer} KeyValueInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export NtQueryValueKey(KeyHandle, _ValueName, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryValueKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, _ValueName, KEY_VALUE_INFORMATION_CLASS, KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} FileHandle 
 * @returns {NTSTATUS} 
 */
export NtSaveKey(KeyHandle, FileHandle) {
    result := DllCall("ntdll.dll\NtSaveKey", HANDLE, KeyHandle, HANDLE, FileHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} FileHandle 
 * @param {Integer} Format 
 * @returns {NTSTATUS} 
 */
export NtSaveKeyEx(KeyHandle, FileHandle, Format) {
    result := DllCall("ntdll.dll\NtSaveKeyEx", HANDLE, KeyHandle, HANDLE, FileHandle, "uint", Format, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} FileHandle 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export NtRestoreKey(KeyHandle, FileHandle, Flags) {
    result := DllCall("ntdll.dll\NtRestoreKey", HANDLE, KeyHandle, HANDLE, FileHandle, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @param {Integer} TitleIndex 
 * @param {Integer} Type 
 * @param {Integer} Data 
 * @param {Integer} DataSize 
 * @returns {NTSTATUS} 
 */
export NtSetValueKey(KeyHandle, _ValueName, TitleIndex, Type, Data, DataSize) {
    result := DllCall("ntdll.dll\NtSetValueKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, _ValueName, "uint", TitleIndex, "uint", Type, "ptr", Data, "uint", DataSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenRegistryTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export ZwRollbackRegistryTransaction(TransactionHandle, Flags) {
    result := DllCall("ntdll.dll\ZwRollbackRegistryTransaction", HANDLE, TransactionHandle, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} _Class 
 * @param {Integer} CreateOptions 
 * @param {Pointer<Integer>} Disposition 
 * @returns {NTSTATUS} 
 */
export ZwCreateKey(KeyHandle, DesiredAccess, ObjectAttributes, _Class, CreateOptions, Disposition) {
    static TitleIndex := 0 ;Reserved parameters must always be NULL

    DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateKey", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", TitleIndex, UNICODE_STRING.Ptr, _Class, "uint", CreateOptions, DispositionMarshal, Disposition, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} _Class 
 * @param {Integer} CreateOptions 
 * @param {HANDLE} TransactionHandle 
 * @param {Pointer<Integer>} Disposition 
 * @returns {NTSTATUS} 
 */
export ZwCreateKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, _Class, CreateOptions, TransactionHandle, Disposition) {
    static TitleIndex := 0 ;Reserved parameters must always be NULL

    DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateKeyTransacted", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", TitleIndex, UNICODE_STRING.Ptr, _Class, "uint", CreateOptions, HANDLE, TransactionHandle, DispositionMarshal, Disposition, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} CreateOptions 
 * @returns {NTSTATUS} 
 */
export ZwCreateRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, CreateOptions) {
    result := DllCall("ntdll.dll\ZwCreateRegistryTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", CreateOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtOpenRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenRegistryTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export ZwCommitRegistryTransaction(TransactionHandle, Flags) {
    result := DllCall("ntdll.dll\ZwCommitRegistryTransaction", HANDLE, TransactionHandle, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export NtRollbackRegistryTransaction(TransactionHandle, Flags) {
    result := DllCall("ntdll.dll\NtRollbackRegistryTransaction", HANDLE, TransactionHandle, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenKey(KeyHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenKey", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} OpenOptions 
 * @returns {NTSTATUS} 
 */
export ZwOpenKeyEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions) {
    result := DllCall("ntdll.dll\ZwOpenKeyEx", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", OpenOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {HANDLE} TransactionHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, TransactionHandle) {
    result := DllCall("ntdll.dll\ZwOpenKeyTransacted", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, HANDLE, TransactionHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} KeyHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} OpenOptions 
 * @param {HANDLE} TransactionHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenKeyTransactedEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions, TransactionHandle) {
    result := DllCall("ntdll.dll\ZwOpenKeyTransactedEx", HANDLE.Ptr, KeyHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", OpenOptions, HANDLE, TransactionHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @returns {NTSTATUS} 
 */
export ZwDeleteKey(KeyHandle) {
    result := DllCall("ntdll.dll\ZwDeleteKey", HANDLE, KeyHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @returns {NTSTATUS} 
 */
export ZwDeleteValueKey(KeyHandle, _ValueName) {
    result := DllCall("ntdll.dll\ZwDeleteValueKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, _ValueName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Integer} Index 
 * @param {KEY_INFORMATION_CLASS} KeyInformationClass 
 * @param {Integer} KeyInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export ZwEnumerateKey(KeyHandle, Index, KeyInformationClass, KeyInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwEnumerateKey", HANDLE, KeyHandle, "uint", Index, KEY_INFORMATION_CLASS, KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Integer} Index 
 * @param {KEY_VALUE_INFORMATION_CLASS} KeyValueInformationClass 
 * @param {Integer} KeyValueInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export ZwEnumerateValueKey(KeyHandle, Index, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwEnumerateValueKey", HANDLE, KeyHandle, "uint", Index, KEY_VALUE_INFORMATION_CLASS, KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @returns {NTSTATUS} 
 */
export ZwFlushKey(KeyHandle) {
    result := DllCall("ntdll.dll\ZwFlushKey", HANDLE, KeyHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {KEY_INFORMATION_CLASS} KeyInformationClass 
 * @param {Integer} KeyInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryKey(KeyHandle, KeyInformationClass, KeyInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryKey", HANDLE, KeyHandle, KEY_INFORMATION_CLASS, KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @param {KEY_VALUE_INFORMATION_CLASS} KeyValueInformationClass 
 * @param {Integer} KeyValueInformation 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryValueKey(KeyHandle, _ValueName, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryValueKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, _ValueName, KEY_VALUE_INFORMATION_CLASS, KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} NewName 
 * @returns {NTSTATUS} 
 */
export ZwRenameKey(KeyHandle, NewName) {
    result := DllCall("ntdll.dll\ZwRenameKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, NewName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} FileHandle 
 * @returns {NTSTATUS} 
 */
export ZwSaveKey(KeyHandle, FileHandle) {
    result := DllCall("ntdll.dll\ZwSaveKey", HANDLE, KeyHandle, HANDLE, FileHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} FileHandle 
 * @param {Integer} Format 
 * @returns {NTSTATUS} 
 */
export ZwSaveKeyEx(KeyHandle, FileHandle, Format) {
    result := DllCall("ntdll.dll\ZwSaveKeyEx", HANDLE, KeyHandle, HANDLE, FileHandle, "uint", Format, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {HANDLE} FileHandle 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export ZwRestoreKey(KeyHandle, FileHandle, Flags) {
    result := DllCall("ntdll.dll\ZwRestoreKey", HANDLE, KeyHandle, HANDLE, FileHandle, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {KEY_SET_INFORMATION_CLASS} KeySetInformationClass 
 * @param {Integer} KeySetInformation 
 * @param {Integer} KeySetInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationKey(KeyHandle, KeySetInformationClass, KeySetInformation, KeySetInformationLength) {
    result := DllCall("ntdll.dll\ZwSetInformationKey", HANDLE, KeyHandle, KEY_SET_INFORMATION_CLASS, KeySetInformationClass, "ptr", KeySetInformation, "uint", KeySetInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} KeyHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @param {Integer} TitleIndex 
 * @param {Integer} Type 
 * @param {Integer} Data 
 * @param {Integer} DataSize 
 * @returns {NTSTATUS} 
 */
export ZwSetValueKey(KeyHandle, _ValueName, TitleIndex, Type, Data, DataSize) {
    result := DllCall("ntdll.dll\ZwSetValueKey", HANDLE, KeyHandle, UNICODE_STRING.Ptr, _ValueName, "uint", TitleIndex, "uint", Type, "ptr", Data, "uint", DataSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions

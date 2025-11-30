#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.System.Registry
 * @version v4.0.30319
 */
class Registry {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Requests notification when a registry key or any of its subkeys changes.
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
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize Reserved for system use. This parameter must be zero.
     * @param {BOOLEAN} Asynchronous If this parameter is <b>TRUE</b>, the function returns immediately. If this parameter is <b>FALSE</b>, the function does not return until the specified event occurs.
     * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code.
     * 
     * If the <i>Asynchronous</i> parameter is <b>TRUE</b> and the specified event has not yet occurred, the function returns <b>STATUS_PENDING</b>.
     * 
     * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntnotifychangemultiplekeys
     */
    static NtNotifyChangeMultipleKeys(MasterKeyHandle, Count, SubordinateObjects, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, Buffer_R, BufferSize, Asynchronous) {
        MasterKeyHandle := MasterKeyHandle is Win32Handle ? NumGet(MasterKeyHandle, "ptr") : MasterKeyHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtNotifyChangeMultipleKeys", "ptr", MasterKeyHandle, "uint", Count, "ptr", SubordinateObjects, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", CompletionFilter, "char", WatchTree, "ptr", Buffer_R, "uint", BufferSize, "char", Asynchronous, "int")
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
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {BOOLEAN} Asynchronous 
     * @returns {NTSTATUS} 
     */
    static ZwNotifyChangeMultipleKeys(MasterKeyHandle, Count, SubordinateObjects, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, Buffer_R, BufferSize, Asynchronous) {
        MasterKeyHandle := MasterKeyHandle is Win32Handle ? NumGet(MasterKeyHandle, "ptr") : MasterKeyHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwNotifyChangeMultipleKeys", "ptr", MasterKeyHandle, "uint", Count, "ptr", SubordinateObjects, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", CompletionFilter, "char", WatchTree, "ptr", Buffer_R, "uint", BufferSize, "char", Asynchronous, "int")
        return result
    }

    /**
     * Retrieves values for the specified multiple-value key.
     * @param {HANDLE} KeyHandle A handle to the key for which to retrieve values. The handle must be opened with the <b>KEY_QUERY_VALUE</b> access right.
     * @param {Pointer<KEY_VALUE_ENTRY>} ValueEntries A pointer to an array of [**KEY_VALUE_ENTRY**] structures containing the names of values to retrieve.
     * @param {Integer} EntryCount The number of elements in the <i>ValueEntries</i> array.
     * @param {Pointer} ValueBuffer A pointer to a buffer to receive the values.
     * @param {Pointer<Integer>} BufferLength A pointer to a variable that contains the size of the buffer at <i>ValueBuffer</i>, in bytes. When the function returns, the <i>BufferLength</i> parameter contains the number of bytes written to the buffer at <i>ValueBuffer</i>.
     * @param {Pointer<Integer>} RequiredBufferLength A pointer to a variable to receive the number of bytes required for all of the values to be returned by the function. This parameter can be <b>NULL</b>.
     * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code.
     * 
     * If the buffer is too small to hold the information to be retrieved, the function returns <b>STATUS_BUFFER_OVERFLOW</b> and, if the <i>RequiredBufferLength</i> parameter is specified, sets it to the buffer size required.
     * 
     * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntquerymultiplevaluekey
     */
    static NtQueryMultipleValueKey(KeyHandle, ValueEntries, EntryCount, ValueBuffer, BufferLength, RequiredBufferLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"
        RequiredBufferLengthMarshal := RequiredBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryMultipleValueKey", "ptr", KeyHandle, "ptr", ValueEntries, "uint", EntryCount, "ptr", ValueBuffer, BufferLengthMarshal, BufferLength, RequiredBufferLengthMarshal, RequiredBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<KEY_VALUE_ENTRY>} ValueEntries 
     * @param {Integer} EntryCount 
     * @param {Pointer} ValueBuffer 
     * @param {Pointer<Integer>} BufferLength 
     * @param {Pointer<Integer>} RequiredBufferLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryMultipleValueKey(KeyHandle, ValueEntries, EntryCount, ValueBuffer, BufferLength, RequiredBufferLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"
        RequiredBufferLengthMarshal := RequiredBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryMultipleValueKey", "ptr", KeyHandle, "ptr", ValueEntries, "uint", EntryCount, "ptr", ValueBuffer, BufferLengthMarshal, BufferLength, RequiredBufferLengthMarshal, RequiredBufferLength, "int")
        return result
    }

    /**
     * Changes the name of the specified registry key.
     * @param {HANDLE} KeyHandle A handle to the key to be renamed. The handle must be opened with the KEY_WRITE access right.
     * @param {Pointer<UNICODE_STRING>} NewName A pointer to a UNICODE string that is the new name for the key.
     * @returns {NTSTATUS} Returns an <b>NTSTATUS</b> or error code. An error code of <b>STATUS_ACCESS_DENIED</b> indicates that the caller does not have the necessary access rights to the specified registry key or subkeys.
     * 
     * The forms and significance of <b>NTSTATUS</b> error codes are listed in the Ntstatus.h header file available in the WDK, and are described in the WDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntrenamekey
     */
    static NtRenameKey(KeyHandle, NewName) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\NtRenameKey", "ptr", KeyHandle, "ptr", NewName, "int")
        return result
    }

    /**
     * Sets information for the specified registry key.
     * @param {HANDLE} KeyHandle A handle to the registry key. The handle must be opened with the <b>KEY_WRITE</b> access 
     *       right.
     * @param {Integer} KeySetInformationClass A <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/ne-wdm-_key_set_information_class">KEY_SET_INFORMATION_CLASS</a> value that 
     *       specifies the kind of information to be set.
     * @param {Pointer} KeySetInformation A pointer to the buffer that contains the information to be set. The format of this buffer is determined by 
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
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntsetinformationkey
     */
    static NtSetInformationKey(KeyHandle, KeySetInformationClass, KeySetInformation, KeySetInformationLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\NtSetInformationKey", "ptr", KeyHandle, "int", KeySetInformationClass, "ptr", KeySetInformation, "uint", KeySetInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} KeyHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} Class_R 
     * @param {Integer} CreateOptions 
     * @param {Pointer<Integer>} Disposition 
     * @returns {NTSTATUS} 
     */
    static NtCreateKey(KeyHandle, DesiredAccess, ObjectAttributes, Class_R, CreateOptions, Disposition) {
        static TitleIndex := 0 ;Reserved parameters must always be NULL

        DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtCreateKey", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", TitleIndex, "ptr", Class_R, "uint", CreateOptions, DispositionMarshal, Disposition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} KeyHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} Class_R 
     * @param {Integer} CreateOptions 
     * @param {HANDLE} TransactionHandle 
     * @param {Pointer<Integer>} Disposition 
     * @returns {NTSTATUS} 
     */
    static NtCreateKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, Class_R, CreateOptions, TransactionHandle, Disposition) {
        static TitleIndex := 0 ;Reserved parameters must always be NULL

        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtCreateKeyTransacted", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", TitleIndex, "ptr", Class_R, "uint", CreateOptions, "ptr", TransactionHandle, DispositionMarshal, Disposition, "int")
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
    static NtCreateRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, CreateOptions) {
        result := DllCall("ntdll.dll\NtCreateRegistryTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", CreateOptions, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static NtCommitRegistryTransaction(TransactionHandle, Flags) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtCommitRegistryTransaction", "ptr", TransactionHandle, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} KeyHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenKey(KeyHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenKey", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
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
    static NtOpenKeyEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions) {
        result := DllCall("ntdll.dll\NtOpenKeyEx", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", OpenOptions, "int")
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
    static NtOpenKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, TransactionHandle) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtOpenKeyTransacted", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", TransactionHandle, "int")
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
    static NtOpenKeyTransactedEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions, TransactionHandle) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtOpenKeyTransactedEx", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", OpenOptions, "ptr", TransactionHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @returns {NTSTATUS} 
     */
    static NtDeleteKey(KeyHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\NtDeleteKey", "ptr", KeyHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @returns {NTSTATUS} 
     */
    static NtDeleteValueKey(KeyHandle, ValueName) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\NtDeleteValueKey", "ptr", KeyHandle, "ptr", ValueName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} Index 
     * @param {Integer} KeyInformationClass 
     * @param {Pointer} KeyInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static NtEnumerateKey(KeyHandle, Index, KeyInformationClass, KeyInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtEnumerateKey", "ptr", KeyHandle, "uint", Index, "int", KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} Index 
     * @param {Integer} KeyValueInformationClass 
     * @param {Pointer} KeyValueInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static NtEnumerateValueKey(KeyHandle, Index, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtEnumerateValueKey", "ptr", KeyHandle, "uint", Index, "int", KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @returns {NTSTATUS} 
     */
    static NtFlushKey(KeyHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\NtFlushKey", "ptr", KeyHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} KeyInformationClass 
     * @param {Pointer} KeyInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryKey(KeyHandle, KeyInformationClass, KeyInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryKey", "ptr", KeyHandle, "int", KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @param {Integer} KeyValueInformationClass 
     * @param {Pointer} KeyValueInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryValueKey(KeyHandle, ValueName, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryValueKey", "ptr", KeyHandle, "ptr", ValueName, "int", KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} FileHandle 
     * @returns {NTSTATUS} 
     */
    static NtSaveKey(KeyHandle, FileHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtSaveKey", "ptr", KeyHandle, "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} FileHandle 
     * @param {Integer} Format 
     * @returns {NTSTATUS} 
     */
    static NtSaveKeyEx(KeyHandle, FileHandle, Format) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtSaveKeyEx", "ptr", KeyHandle, "ptr", FileHandle, "uint", Format, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} FileHandle 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static NtRestoreKey(KeyHandle, FileHandle, Flags) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtRestoreKey", "ptr", KeyHandle, "ptr", FileHandle, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @param {Integer} TitleIndex 
     * @param {Integer} Type 
     * @param {Pointer} Data 
     * @param {Integer} DataSize 
     * @returns {NTSTATUS} 
     */
    static NtSetValueKey(KeyHandle, ValueName, TitleIndex, Type, Data, DataSize) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\NtSetValueKey", "ptr", KeyHandle, "ptr", ValueName, "uint", TitleIndex, "uint", Type, "ptr", Data, "uint", DataSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenRegistryTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static ZwRollbackRegistryTransaction(TransactionHandle, Flags) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\ZwRollbackRegistryTransaction", "ptr", TransactionHandle, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} KeyHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} Class_R 
     * @param {Integer} CreateOptions 
     * @param {Pointer<Integer>} Disposition 
     * @returns {NTSTATUS} 
     */
    static ZwCreateKey(KeyHandle, DesiredAccess, ObjectAttributes, Class_R, CreateOptions, Disposition) {
        static TitleIndex := 0 ;Reserved parameters must always be NULL

        DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateKey", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", TitleIndex, "ptr", Class_R, "uint", CreateOptions, DispositionMarshal, Disposition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} KeyHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} Class_R 
     * @param {Integer} CreateOptions 
     * @param {HANDLE} TransactionHandle 
     * @param {Pointer<Integer>} Disposition 
     * @returns {NTSTATUS} 
     */
    static ZwCreateKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, Class_R, CreateOptions, TransactionHandle, Disposition) {
        static TitleIndex := 0 ;Reserved parameters must always be NULL

        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        DispositionMarshal := Disposition is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateKeyTransacted", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", TitleIndex, "ptr", Class_R, "uint", CreateOptions, "ptr", TransactionHandle, DispositionMarshal, Disposition, "int")
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
    static ZwCreateRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, CreateOptions) {
        result := DllCall("ntdll.dll\ZwCreateRegistryTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", CreateOptions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenRegistryTransaction(TransactionHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenRegistryTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static ZwCommitRegistryTransaction(TransactionHandle, Flags) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\ZwCommitRegistryTransaction", "ptr", TransactionHandle, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static NtRollbackRegistryTransaction(TransactionHandle, Flags) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtRollbackRegistryTransaction", "ptr", TransactionHandle, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} KeyHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenKey(KeyHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenKey", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
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
    static ZwOpenKeyEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions) {
        result := DllCall("ntdll.dll\ZwOpenKeyEx", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", OpenOptions, "int")
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
    static ZwOpenKeyTransacted(KeyHandle, DesiredAccess, ObjectAttributes, TransactionHandle) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\ZwOpenKeyTransacted", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", TransactionHandle, "int")
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
    static ZwOpenKeyTransactedEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions, TransactionHandle) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\ZwOpenKeyTransactedEx", "ptr", KeyHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "uint", OpenOptions, "ptr", TransactionHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @returns {NTSTATUS} 
     */
    static ZwDeleteKey(KeyHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\ZwDeleteKey", "ptr", KeyHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @returns {NTSTATUS} 
     */
    static ZwDeleteValueKey(KeyHandle, ValueName) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\ZwDeleteValueKey", "ptr", KeyHandle, "ptr", ValueName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} Index 
     * @param {Integer} KeyInformationClass 
     * @param {Pointer} KeyInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static ZwEnumerateKey(KeyHandle, Index, KeyInformationClass, KeyInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwEnumerateKey", "ptr", KeyHandle, "uint", Index, "int", KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} Index 
     * @param {Integer} KeyValueInformationClass 
     * @param {Pointer} KeyValueInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static ZwEnumerateValueKey(KeyHandle, Index, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwEnumerateValueKey", "ptr", KeyHandle, "uint", Index, "int", KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @returns {NTSTATUS} 
     */
    static ZwFlushKey(KeyHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\ZwFlushKey", "ptr", KeyHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} KeyInformationClass 
     * @param {Pointer} KeyInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryKey(KeyHandle, KeyInformationClass, KeyInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryKey", "ptr", KeyHandle, "int", KeyInformationClass, "ptr", KeyInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @param {Integer} KeyValueInformationClass 
     * @param {Pointer} KeyValueInformation 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryValueKey(KeyHandle, ValueName, KeyValueInformationClass, KeyValueInformation, Length, ResultLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryValueKey", "ptr", KeyHandle, "ptr", ValueName, "int", KeyValueInformationClass, "ptr", KeyValueInformation, "uint", Length, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} NewName 
     * @returns {NTSTATUS} 
     */
    static ZwRenameKey(KeyHandle, NewName) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\ZwRenameKey", "ptr", KeyHandle, "ptr", NewName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} FileHandle 
     * @returns {NTSTATUS} 
     */
    static ZwSaveKey(KeyHandle, FileHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwSaveKey", "ptr", KeyHandle, "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} FileHandle 
     * @param {Integer} Format 
     * @returns {NTSTATUS} 
     */
    static ZwSaveKeyEx(KeyHandle, FileHandle, Format) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwSaveKeyEx", "ptr", KeyHandle, "ptr", FileHandle, "uint", Format, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} FileHandle 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static ZwRestoreKey(KeyHandle, FileHandle, Flags) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwRestoreKey", "ptr", KeyHandle, "ptr", FileHandle, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Integer} KeySetInformationClass 
     * @param {Pointer} KeySetInformation 
     * @param {Integer} KeySetInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationKey(KeyHandle, KeySetInformationClass, KeySetInformation, KeySetInformationLength) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\ZwSetInformationKey", "ptr", KeyHandle, "int", KeySetInformationClass, "ptr", KeySetInformation, "uint", KeySetInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @param {Integer} TitleIndex 
     * @param {Integer} Type 
     * @param {Pointer} Data 
     * @param {Integer} DataSize 
     * @returns {NTSTATUS} 
     */
    static ZwSetValueKey(KeyHandle, ValueName, TitleIndex, Type, Data, DataSize) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("ntdll.dll\ZwSetValueKey", "ptr", KeyHandle, "ptr", ValueName, "uint", TitleIndex, "uint", Type, "ptr", Data, "uint", DataSize, "int")
        return result
    }

;@endregion Methods
}

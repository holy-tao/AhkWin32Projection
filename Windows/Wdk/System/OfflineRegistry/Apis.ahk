#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.System.OfflineRegistry
 * @version v4.0.30319
 */
class OfflineRegistry {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * This function retrieves the version of the offline registry library.
     * @param {Pointer<Integer>} pdwMajorVersion A pointer to a variable to receive the major version of the offline registry library. For the initial release of the library, the value is 1.
     * @param {Pointer<Integer>} pdwMinorVersion A pointer to a variable to receive the minor version of the offline registry library. For the initial release of the library, the value is 0.
     * @returns {Integer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orgetversion
     */
    static ORGetVersion(pdwMajorVersion, pdwMinorVersion) {
        pdwMajorVersionMarshal := pdwMajorVersion is VarRef ? "uint*" : "ptr"
        pdwMinorVersionMarshal := pdwMinorVersion is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetVersion", pdwMajorVersionMarshal, pdwMajorVersion, pdwMinorVersionMarshal, pdwMinorVersion, "uint")
        return result
    }

    /**
     * Loads the specified registry hive file into memory and validates the hive.
     * @remarks
     * The **OROpenHive** function is the only offline registry function that validates a registry hive. If the validation fails, no attempt is made to repair the hive.
     * @param {PWSTR} FilePath 
     * @param {Pointer<ORHKEY>} HORKey 
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error. Possible error codes include the following:
     * 
     * -   If the file is empty or larger than 4 GB in size, the function returns ERROR\_BADDB.
     * -   If the caller does not have the necessary access rights to open the file, the function returns ERROR\_ACCESS\_DENIED.
     * -   If the registry hive fails validation, the function returns ERROR\_NOT\_REGISTRY\_FILE.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/oropenhive
     */
    static OROpenHive(FilePath, HORKey) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        result := DllCall("OFFREG.dll\OROpenHive", "ptr", FilePath, "ptr", HORKey, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<ORHKEY>} HORKey 
     * @returns {Integer} 
     */
    static OROpenHiveByHandle(FileHandle, HORKey) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("OFFREG.dll\OROpenHiveByHandle", "ptr", FileHandle, "ptr", HORKey, "uint")
        return result
    }

    /**
     * Creates an offline registry hive that contains a single empty root key.
     * @remarks
     * The **ORCreateHive** function creates an empty offline registry hive in memory. Use the [**ORCreateKey**](orcreatekey.md) and [**ORSetValue**](orsetvalue.md) functions to add keys and set their values.
     * @param {Pointer<ORHKEY>} HORKey 
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If there is insufficient memory to create the registry hive, the function returns ERROR\_NOT\_ENOUGH\_MEMORY.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orcreatehive
     */
    static ORCreateHive(HORKey) {
        result := DllCall("OFFREG.dll\ORCreateHive", "ptr", HORKey, "uint")
        return result
    }

    /**
     * Closes the specified offline registry hive and frees memory allocated for the hive.
     * @remarks
     * The **ORCloseHive** function frees all memory allocated by the offline registry functions on behalf of the specified hive.
     * 
     * To preserve changes to the hive, call the [**ORSaveHive**](orsavehive.md) function before calling **ORCloseHive**.
     * @param {ORHKEY} Handle A handle to the root key of the offline registry hive to be closed.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orclosehive
     */
    static ORCloseHive(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("OFFREG.dll\ORCloseHive", "ptr", Handle, "uint")
        return result
    }

    /**
     * Writes the specified offline registry hive to a file.
     * @remarks
     * The **ORSaveHive** function must be used to save changes made to an offline registry hive. Changes are not preserved until **ORSaveHive** is called to save the hive to a file.
     * 
     * The *dwOsMajorVersion* and *dwOsMinorVersion* parameters together specify the target format of the registry hive file. The following table summarizes the most recent operating system version numbers.
     * 
     * 
     * 
     * | Operating system                    | Version number |
     * |-------------------------------------|----------------|
     * | Windows Server 2008 R2              | 6.1            |
     * | Windows 7                           | 6.1            |
     * | Windows Server 2008                 | 6.0            |
     * | Windows Vista                       | 6.0            |
     * | Windows Server 2003 R2              | 5.2            |
     * | Windows Server 2003                 | 5.2            |
     * | Windows XP Professional x64 Edition | 5.2            |
     * | Windows XP                          | 5.1            |
     * 
     * 
     * 
     *  
     * 
     * Use the [GetVersionEx](/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversionexa) function to retrieve information about the current operating system.
     * 
     * The **ORSaveHive** function locks the registry hive while it is writing the hive to the file, then closes the file and releases the lock. The registry hive remains in memory until it is closed by calling the [**ORCloseHive**](orclosehive.md) function. It is possible to make further changes to the registry hive while it is open; however, to preserve these changes the hive must be saved to a new file, because the **ORSaveHive** function will not overwrite an existing file.
     * 
     * The **ORSaveHive** function can be used to save part of the offline registry hive. The key specified in the *Handle* parameter becomes the root key of a hive that consists of the specified key and all of its subkeys.
     * @param {ORHKEY} HORKey 
     * @param {PWSTR} HivePath 
     * @param {Integer} OsMajorVersion 
     * @param {Integer} OsMinorVersion 
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error. Possible error codes include the following:
     * 
     * -   If the caller does not have the necessary access rights to write the file, the function returns ERROR\_ACCESS\_DENIED.
     * -   If the specified file already exists, the function returns ERROR\_ALREADY\_EXISTS.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orsavehive
     */
    static ORSaveHive(HORKey, HivePath, OsMajorVersion, OsMinorVersion) {
        HORKey := HORKey is Win32Handle ? NumGet(HORKey, "ptr") : HORKey
        HivePath := HivePath is String ? StrPtr(HivePath) : HivePath

        result := DllCall("OFFREG.dll\ORSaveHive", "ptr", HORKey, "ptr", HivePath, "uint", OsMajorVersion, "uint", OsMinorVersion, "uint")
        return result
    }

    /**
     * Opens the specified registry key in an offline registry hive.
     * @remarks
     * The **OROpenKey** function cannot be used to open the root key in an offline registry hive. To obtain a handle to the root key of a hive, use the [**OROpenHive**](oropenhive.md) function to load the hive into memory.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {PWSTR} lpSubKey 
     * @param {Pointer<ORHKEY>} phkResult A pointer to a variable that receives a handle to the opened key. Use the [**ORCloseKey**](orclosekey.md) function to close the key after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If the handle to be returned would be a handle to the root key of the hive, the function returns ERROR\_INVALID\_PARAMETER.
     * 
     * If the specified key has been marked as deleted, this function returns ERROR\_KEY\_DELETED.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/oropenkey
     */
    static OROpenKey(Handle, lpSubKey, phkResult) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("OFFREG.dll\OROpenKey", "ptr", Handle, "ptr", lpSubKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Closes a handle to the specified registry key in an offline registry hive.
     * @remarks
     * The handle for a specified key should not be used after it has been closed, because it will no longer be valid. Key handles should not be left open any longer than necessary.
     * 
     * Use the [**ORCloseHive**](orclosehive.md) function to close an offline registry hive.
     * @param {ORHKEY} KeyHandle 
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If the specified key is the root key of the registry hive, the function fails with ERROR\_INVALID\_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orclosekey
     */
    static ORCloseKey(KeyHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("OFFREG.dll\ORCloseKey", "ptr", KeyHandle, "uint")
        return result
    }

    /**
     * Creates the specified registry key in an offline registry hive. If the key already exists, the function opens it.
     * @remarks
     * The key that the **ORCreateKey** function creates has no values. An application can use the [**ORSetValue**](orsetvalue.md) function to set key values.
     * 
     * The **ORCreateKey** function cannot be used to create the root key in an offline registry hive. Use the [**ORCreateHive**](orcreatehive.md) function to create the root key and obtain a handle to the key.
     * 
     * The offline registry does not support saving individual keys. Use the [**ORSaveHive**](orsavehive.md) function to save a key and its subkeys in a hive.
     * @param {ORHKEY} KeyHandle 
     * @param {PWSTR} lpSubKey A pointer to a Unicode string that contains the name of a subkey that this function opens or creates. The *lpSubKey* parameter must specify a subkey of the key identified by the *Handle* parameter; it can be up to 32 levels deep in the registry tree. For more information about key names, see [Structure of the Registry](../sysinfo/structure-of-the-registry.md).
     * 
     * This parameter cannot be **NULL**.
     * 
     * Key names are not case sensitive.
     * @param {PWSTR} lpClass The class (object type) of this key. This parameter may be ignored. This parameter can be **NULL**.
     * @param {Integer} dwOptions This parameter can be 0 or one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="REG_OPTION_CREATE_LINK"></span><span id="reg_option_create_link"></span><dl> <dt>**REG\_OPTION\_CREATE\_LINK**</dt> <dt>0x00000002L</dt> </dl>    | The key is a symbolic link. The target path is assigned to the L"SymbolicLinkValue" value of the key. The target path must be an absolute registry path. If this option is set, **REG\_OPTION\_NON\_VOLATILE** must also be set. <br/> If the *lpSubKey* parameter specifies an existing key, it must have been created with **REG\_OPTION\_CREATE\_LINK**.<br/> Registry symbolic links should be used only when absolutely necessary for application compatibility. <br/> |
     * | <span id="REG_OPTION_NON_VOLATILE"></span><span id="reg_option_non_volatile"></span><dl> <dt>**REG\_OPTION\_NON\_VOLATILE**</dt> <dt>0x00000000L</dt> </dl> | The key is not volatile; this is the default. The information is stored in a file and is preserved when the system is restarted. The [**ORSaveHive**](orsavehive.md) function saves keys that are not volatile.<br/>                                                                                                                                                                                                                                                                   |
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a [SECURITY\_DESCRIPTOR](/windows/win32/api/winnt/ns-winnt-security_descriptor) structure that contains a security descriptor for the new key. If *pSecurityDescriptor* is **NULL**, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
     * @param {Pointer<ORHKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. Use the [**ORCloseKey**](orclosekey.md) function to close the key after you have finished using the handle.
     * @param {Pointer<Integer>} pdwDisposition A pointer to a variable that receives one of the following disposition values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                          | Meaning                                                                 |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
     * | <span id="REG_CREATED_NEW_KEY"></span><span id="reg_created_new_key"></span><dl> <dt>**REG\_CREATED\_NEW\_KEY**</dt> <dt>0x00000001L</dt> </dl>             | The key did not exist and was created.<br/>                       |
     * | <span id="REG_OPENED_EXISTING_KEY"></span><span id="reg_opened_existing_key"></span><dl> <dt>**REG\_OPENED\_EXISTING\_KEY**</dt> <dt>0x00000002L</dt> </dl> | The key existed and was simply opened without being changed.<br/> |
     * 
     * 
     * 
     *  
     * 
     * If *pdwDisposition* is **NULL**, no disposition information is returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If the *dwOptions* parameter is set with **REG\_OPTION\_CREATE\_LINK** but **REG\_OPTION\_NON\_VOLATILE** is clear, or if the handle to be returned would be a handle to the root key of the hive, the function returns ERROR\_INVALID\_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orcreatekey
     */
    static ORCreateKey(KeyHandle, lpSubKey, lpClass, dwOptions, pSecurityDescriptor, phkResult, pdwDisposition) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
        lpClass := lpClass is String ? StrPtr(lpClass) : lpClass
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        pdwDispositionMarshal := pdwDisposition is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORCreateKey", "ptr", KeyHandle, "ptr", lpSubKey, "ptr", lpClass, "uint", dwOptions, "ptr", pSecurityDescriptor, "ptr", phkResult, pdwDispositionMarshal, pdwDisposition, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values from an offline registry hive.
     * @remarks
     * If the specified registry key exists, it is marked as deleted. A deleted key is not removed until the last handle to it is closed.
     * 
     * The key to be deleted must not have subkeys. To delete a key and all its subkeys, use the [**OREnumKey**](orenumkey.md) function to enumerate the subkeys and delete them individually.
     * 
     * Only the [**ORCloseKey**](orclosekey.md) function may be called on a deleted key; all other offline registry operations fail. If the deleted key was explicitly created by calling [**ORCreateKey**](orcreatekey.md), resources associated with the key are released when the last handle to the deleted key is closed.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive. This handle is returned by the [**ORCreateKey**](orcreatekey.md) or [**OROpenKey**](oropenkey.md) function.
     * @param {PWSTR} lpSubKey The name of the key to be deleted. It must be a subkey of the key that *Handle* identifies, but it cannot have subkeys.
     * 
     * If the subkey does not exist, the function returns ERROR\_NOT\_FOUND.
     * 
     * If this parameter is **NULL**, the function deletes the key specified by the *Handle* parameter. If the key specified by the *Handle* parameter is the root key of the hive, the function returns ERROR\_INVALID\_PARAMETER.
     * 
     * Key names are not case sensitive.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error. Possible error codes include the following:
     * 
     * -   If the specified subkey does not exist, the function returns ERROR\_FILE\_NOT\_FOUND.
     * -   If the specified subkey is the root key of the registry hive, the function returns ERROR\_INVALID\_PARAMETER.
     * -   If the specified subkey has subkeys, the function returns ERROR\_KEY\_HAS\_CHILDREN.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ordeletekey
     */
    static ORDeleteKey(Handle, lpSubKey) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("OFFREG.dll\ORDeleteKey", "ptr", Handle, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Retrieves information about the specified registry key in an offline registry hive.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {PWSTR} lpClass A pointer to a buffer that receives the key class. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcClass A pointer to a variable that specifies the size of the buffer pointed to by the *lpClass* parameter, in characters.
     * 
     * The size should include the terminating null character. When the function returns, this variable contains the size of the class string that is stored in the buffer. The count returned does not include the terminating null character. If the buffer is not big enough, the function returns ERROR\_MORE\_DATA, and the variable contains the size of the string, in characters, without counting the terminating null character.
     * 
     * If *lpClass* is **NULL**, *lpcClass* can be **NULL**.
     * 
     * If the *lpClass* parameter is a valid address, but the *lpcClass* parameter is not (for example, if the *lpcClass* parameter is **NULL**) then the function returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer<Integer>} lpcSubKeys A pointer to a variable that receives the number of subkeys that are contained by the specified key. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcMaxSubKeyLen A pointer to a variable that receives the size of the key's subkey with the longest name, in Unicode characters, not including the terminating null character. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcMaxClassLen A pointer to a variable that receives the size of the longest string that specifies a subkey class, in Unicode characters. The count returned does not include the terminating null character. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcValues A pointer to a variable that receives the number of values that are associated with the key. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcMaxValueNameLen A pointer to a variable that receives the size of the key's longest value name, in Unicode characters. The size does not include the terminating null character. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcMaxValueLen A pointer to a variable that receives the size of the longest data component among the key's values, in bytes. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcbSecurityDescriptor A pointer to a variable that receives the size of the key's security descriptor, in bytes. This parameter can be **NULL**.
     * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to a [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure that receives the last write time. This parameter can be **NULL**.
     * 
     * The function sets the members of the [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure to indicate the last time that the key or any of its value entries is modified.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If the *lpClass* buffer is too small to receive the name of the class, the function returns ERROR\_MORE\_DATA.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orqueryinfokey
     */
    static ORQueryInfoKey(Handle, lpClass, lpcClass, lpcSubKeys, lpcMaxSubKeyLen, lpcMaxClassLen, lpcValues, lpcMaxValueNameLen, lpcMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

        lpcClassMarshal := lpcClass is VarRef ? "uint*" : "ptr"
        lpcSubKeysMarshal := lpcSubKeys is VarRef ? "uint*" : "ptr"
        lpcMaxSubKeyLenMarshal := lpcMaxSubKeyLen is VarRef ? "uint*" : "ptr"
        lpcMaxClassLenMarshal := lpcMaxClassLen is VarRef ? "uint*" : "ptr"
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lpcMaxValueNameLenMarshal := lpcMaxValueNameLen is VarRef ? "uint*" : "ptr"
        lpcMaxValueLenMarshal := lpcMaxValueLen is VarRef ? "uint*" : "ptr"
        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORQueryInfoKey", "ptr", Handle, "ptr", lpClass, lpcClassMarshal, lpcClass, lpcSubKeysMarshal, lpcSubKeys, lpcMaxSubKeyLenMarshal, lpcMaxSubKeyLen, lpcMaxClassLenMarshal, lpcMaxClassLen, lpcValuesMarshal, lpcValues, lpcMaxValueNameLenMarshal, lpcMaxValueNameLen, lpcMaxValueLenMarshal, lpcMaxValueLen, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "ptr", lpftLastWriteTime, "uint")
        return result
    }

    /**
     * Enumerates the subkeys of the specified open registry key in an offline registry hive. The function retrieves information about one subkey each time it is called.
     * @remarks
     * To enumerate subkeys, an application should initially call the **OREnumKey** function with the *dwIndex* parameter set to zero. The application should then increment the *dwIndex* parameter and call **OREnumKey** until there are no more subkeys (meaning the function returns ERROR\_NO\_MORE\_ITEMS).
     * 
     * The application can also set *dwIndex* to the index of the last subkey on the first call to the function and decrement the index until the subkey with the index 0 is enumerated. To retrieve the index of the last subkey, use the [**ORQueryInfoKey**](/windows/win32/api/winreg/nf-winreg-regqueryinfokeya) function.
     * 
     * While an application is using the **OREnumKey** function, it should not make calls to any offline registry functions that might change the key being enumerated.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {Integer} dwIndex The index of the subkey to retrieve. This parameter should be zero for the first call to the function and then incremented for subsequent calls.
     * 
     * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
     * @param {PWSTR} lpName A pointer to a buffer that receives the name of the subkey, including the terminating null character. The function copies only the name of the subkey, not the full key hierarchy, to the buffer. If the function fails, no information is copied to this buffer.
     * 
     * For more information, see [Registry Element Size Limits](../sysinfo/registry-element-size-limits.md).
     * @param {Pointer<Integer>} lpcName A pointer to a variable that specifies the size of the buffer specified by the *lpName* parameter, in **WCHARs**. This size should include the terminating null character. If the function succeeds, the variable pointed to by *lpcName* contains the number of characters stored in the buffer, not including the terminating null character.
     * @param {PWSTR} lpClass A pointer to a buffer that receives the null-terminated class string of the enumerated subkey. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcClass A pointer to a variable that specifies the size of the buffer specified by the *lpClass* parameter, in **WCHARs**. The size should include the terminating null character. If the function succeeds, *lpcClass* contains the number of characters stored in the buffer, not including the terminating null character. This parameter can be **NULL** only if *lpClass* is **NULL**.
     * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure that receives the time at which the enumerated subkey was last written. This parameter can be **NULL**.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error. Possible error codes include the following:
     * 
     * -   If the *lpName* buffer is too small to receive the name of the key, the function returns ERROR\_MORE\_DATA.
     * -   If there are no more subkeys available, the function returns ERROR\_NO\_MORE\_ITEMS.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orenumkey
     */
    static OREnumKey(Handle, dwIndex, lpName, lpcName, lpClass, lpcClass, lpftLastWriteTime) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

        lpcNameMarshal := lpcName is VarRef ? "uint*" : "ptr"
        lpcClassMarshal := lpcClass is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\OREnumKey", "ptr", Handle, "uint", dwIndex, "ptr", lpName, lpcNameMarshal, lpcName, "ptr", lpClass, lpcClassMarshal, lpcClass, "ptr", lpftLastWriteTime, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor protecting the specified open registry key in an offline registry hive.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {Integer} SecurityInformation A [SECURITY\_INFORMATION](../secauthz/security-information.md) value that indicates the requested security information.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a buffer that receives a copy of the requested security descriptor. This parameter can be **NULL**.
     * @param {Pointer<Integer>} lpcbSecurityDescriptor A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the *pSecurityDescriptor* parameter. When the function returns, the variable contains the number of bytes written to the buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR\_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If the buffer specified by the *pSecurityDescriptor* parameter is too small, the function returns ERROR\_INSUFFICIENT\_BUFFER and the *lpcbSecurityDescriptor* parameter contains the number of bytes required for the requested security descriptor.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orgetkeysecurity
     */
    static ORGetKeySecurity(Handle, SecurityInformation, pSecurityDescriptor, lpcbSecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetKeySecurity", "ptr", Handle, "uint", SecurityInformation, "ptr", pSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the security of an open registry key in an offline registry hive.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {Integer} SecurityInformation Bit flags that indicate the type of security information to set. This parameter can be a combination of the [SECURITY\_INFORMATION](../secauthz/security-information.md) bit flags.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a [SECURITY\_DESCRIPTOR](/windows/win32/api/winnt/ns-winnt-security_descriptor) structure that specifies the security attributes to set for the specified key.
     * @returns {Integer} If the function succeeds, the function returns ERROR\_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orsetkeysecurity
     */
    static ORSetKeySecurity(Handle, SecurityInformation, pSecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("OFFREG.dll\ORSetKeySecurity", "ptr", Handle, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves the virtual flags on the specified open registry key in an offline registry hive.
     * @remarks
     * Registry virtualization is an interim application compatibility technology that enables registry write operations that have global impact to be redirected to per-user locations. This redirection is transparent to applications reading from or writing to the registry.
     * 
     * Registry virtualization is supported starting with Windows Vista. However, Microsoft intends to remove it from future versions of the Windows operating system as more applications are made compatible with Windows Vista. Therefore, applications should not depend on the behavior of registry virtualization in the system.
     * 
     * Registry virtualization is enabled only for the following:
     * 
     * -   32-bit interactive processes
     * -   Keys in **HKEY\_LOCAL\_MACHINE\\Software**
     * -   Keys that an administrator can write to
     * 
     * For more information, see [Registry Virtualization](../sysinfo/registry-virtualization.md).
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {Pointer<Integer>} pdwFlags A pointer to a variable to receive the virtualization flags set for the key. After the function returns, this parameter can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                    | Meaning                                                                                                                                                                                                                                                                                                                                       |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="REG_KEY_DONT_SILENT_FAIL"></span><span id="reg_key_dont_silent_fail"></span><dl> <dt>**REG\_KEY\_DONT\_SILENT\_FAIL**</dt> <dt>4</dt> </dl> | If this flag is set and an Open operation fails on a key that has virtualization enabled, the registry does not attempt to reopen the key. If this flag is clear, the registry attempts to reopen the key with MAXIMUM\_ALLOWED access.<br/>                                                                                            |
     * | <span id="REG_KEY_DONT_VIRTUALIZE"></span><span id="reg_key_dont_virtualize"></span><dl> <dt>**REG\_KEY\_DONT\_VIRTUALIZE**</dt> <dt>2</dt> </dl>     | If this flag is set and a Create Key operation fails because the caller does not have the KEY\_CREATE\_SUB\_KEY right on the parent key, the registry fails the Create operation. If this flag is clear, the registry attempts to create the key in the virtual store. The caller must have the KEY\_READ right on the parent key.<br/> |
     * | <span id="REG_KEY_RECURSE_FLAG"></span><span id="reg_key_recurse_flag"></span><dl> <dt>**REG\_KEY\_RECURSE\_FLAG**</dt> <dt>8</dt> </dl>              | If this flag is set, registry virtualization flags are propagated from the parent key. If this flag is clear, registry virtualization flags are not propagated.<br/>                                                                                                                                                                    |
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orgetvirtualflags
     */
    static ORGetVirtualFlags(Handle, pdwFlags) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetVirtualFlags", "ptr", Handle, pdwFlagsMarshal, pdwFlags, "uint")
        return result
    }

    /**
     * Sets virtualization flags on the specified open registry key in an offline registry hive.
     * @remarks
     * Registry virtualization is an interim application compatibility technology that enables registry write operations that have global impact to be redirected to per-user locations. This redirection is transparent to applications reading from or writing to the registry.
     * 
     * Registry virtualization is supported starting with Windows Vista. However, Microsoft intends to remove it from future versions of the Windows operating system as more applications are made compatible with Windows Vista. Therefore, applications should not depend on the behavior of registry virtualization in the system.
     * 
     * Registry virtualization is enabled only for the following:
     * 
     * -   32-bit interactive processes
     * -   Keys in **HKEY\_LOCAL\_MACHINE\\Software**
     * -   Keys that an administrator can write to
     * 
     * For more information, see [Registry Virtualization](../sysinfo/registry-virtualization.md).
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {Integer} dwFlags This parameter controls the behavior of the registry when a Create or Open operation fails on a key in a virtualized hive. This parameter can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                    | Meaning                                                                                                                                                                                                                                                                                                                                       |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="REG_KEY_DONT_SILENT_FAIL"></span><span id="reg_key_dont_silent_fail"></span><dl> <dt>**REG\_KEY\_DONT\_SILENT\_FAIL**</dt> <dt>4</dt> </dl> | If this flag is set and an Open operation fails on a key for which virtualization is enabled, the registry does not attempt to reopen the key. If this flag is clear, the registry attempts to reopen the key with the MAXIMUM\_ALLOWED access.<br/>                                                                                    |
     * | <span id="REG_KEY_DONT_VIRTUALIZE"></span><span id="reg_key_dont_virtualize"></span><dl> <dt>**REG\_KEY\_DONT\_VIRTUALIZE**</dt> <dt>2</dt> </dl>     | If this flag is set and a Create Key operation fails because the caller does not have the KEY\_CREATE\_SUB\_KEY right on the parent key, the registry fails the Create operation. If this flag is clear, the registry attempts to create the key in the virtual store. The caller must have the KEY\_READ right on the parent key.<br/> |
     * | <span id="REG_KEY_RECURSE_FLAG"></span><span id="reg_key_recurse_flag"></span><dl> <dt>**REG\_KEY\_RECURSE\_FLAG**</dt> <dt>8</dt> </dl>              | If this flag is set, registry virtualization flags are propagated from the parent key. If this flag is clear, registry virtualization flags are not propagated.<br/>                                                                                                                                                                    |
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orsetvirtualflags
     */
    static ORSetVirtualFlags(Handle, dwFlags) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("OFFREG.dll\ORSetVirtualFlags", "ptr", Handle, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Removes a named value from the specified registry key in an offline registry hive.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {PWSTR} lpValueName The registry value to be removed. If this parameter is **NULL** or an empty string, the default unnamed value set by the [**ORSetValue**](orsetvalue.md) function is removed.
     * 
     * Value names are not case sensitive.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ordeletevalue
     */
    static ORDeleteValue(Handle, lpValueName) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

        result := DllCall("OFFREG.dll\ORDeleteValue", "ptr", Handle, "ptr", lpValueName, "uint")
        return result
    }

    /**
     * Retrieves the type and data for the specified registry value in an offline registry hive.
     * @remarks
     * An application typically calls the [**OREnumValue**](orenumvalue.md) function to determine the value names and then calls the **ORGetValue** function to retrieve the data for the names.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {PWSTR} lpSubKey The name of the registry key. This key must be a subkey of the key specified by the *Handle* parameter. This parameter can be **NULL**.
     * 
     * Key names are not case sensitive.
     * @param {PWSTR} lpValue The name of the registry value. If this parameter is **NULL** or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any. For more information, see [Registry Element Size Limits](../sysinfo/registry-element-size-limits.md).
     * 
     * Keys do not automatically have an unnamed or default value. Unnamed values can be of any type.
     * 
     * Value names are not case sensitive.
     * @param {Pointer<Integer>} pdwType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see [Registry Value Types](../sysinfo/registry-value-types.md). This parameter can be **NULL** if the type is not required.
     * @param {Pointer} pvData A pointer to a buffer that receives the value's data. This parameter can be **NULL** if the data is not required.
     * 
     * If the data is a string, the function checks for a terminating null character. If one is not found, the string is stored with a null terminator if the buffer is large enough to accommodate the extra character. Otherwise, the function fails and returns ERROR\_MORE\_DATA.
     * @param {Pointer<Integer>} pcbData A pointer to a variable that specifies the size of the buffer pointed to by the *pvData* parameter, in bytes. When the function returns, this variable contains the size of the data copied to *pvData*.
     * 
     * The *pcbData* parameter can be **NULL** only if *pvData* is **NULL**.
     * 
     * If the data has the REG\_SZ, REG\_MULTI\_SZ or REG\_EXPAND\_SZ type, this size includes any terminating null character or characters. For more information, see Remarks.
     * 
     * If the buffer specified by *pvData* parameter is not large enough to hold the data, the function returns ERROR\_MORE\_DATA and stores the required buffer size in the variable pointed to by *pcbData*. In this case, the contents of the *pvData* buffer are undefined.
     * 
     * If *pvData* is **NULL**, and *pcbData* is non-**NULL**, the function returns ERROR\_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by *pcbData*. This enables an application to determine the best way to allocate a buffer for the value's data.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orgetvalue
     */
    static ORGetValue(Handle, lpSubKey, lpValue, pdwType, pvData, pcbData) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
        lpValue := lpValue is String ? StrPtr(lpValue) : lpValue

        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetValue", "ptr", Handle, "ptr", lpSubKey, "ptr", lpValue, pdwTypeMarshal, pdwType, "ptr", pvData, pcbDataMarshal, pcbData, "uint")
        return result
    }

    /**
     * Sets the data for the value of a specified registry key in an offline registry hive.
     * @remarks
     * Value sizes are limited by available memory. Long values (more than 2048 bytes) should be stored as files with the file names stored in the registry. This helps the registry perform efficiently. Application elements such as icons, bitmaps, and executable files should be stored as files and not be placed in the registry.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {PWSTR} lpValueName The name of the value to be set. If a value with this name is not already present in the key, the function adds it to the key.
     * 
     * If *lpValueName* is **NULL** or an empty string, "", the function sets the type and data for the key's unnamed or default value.
     * 
     * For more information, see [Registry Element Size Limits](../sysinfo/registry-element-size-limits.md).
     * 
     * Registry keys do not have default values, but they can have one unnamed value, which can be of any type.
     * @param {Integer} dwType The type of data pointed to by the *lpData* parameter. For a list of the possible types, see [Registry Value Types](../sysinfo/registry-value-types.md).
     * @param {Pointer} lpData The data to be stored.
     * 
     * For string-based types, such as REG\_SZ, the string must be null-terminated. For the REG\_MULTI\_SZ data type, the string must be terminated with two null characters.
     * @param {Integer} cbData The size of the information pointed to by the *lpData* parameter, in bytes. If the data is of type REG\_SZ, REG\_EXPAND\_SZ, or REG\_MULTI\_SZ, *cbData* must include the size of the terminating null character or characters.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orsetvalue
     */
    static ORSetValue(Handle, lpValueName, dwType, lpData, cbData) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

        result := DllCall("OFFREG.dll\ORSetValue", "ptr", Handle, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Enumerates the values for the specified open registry key in an offline registry hive. The function retrieves information for one value under the specified key each time the function is called.
     * @remarks
     * To enumerate values, an application should initially call the **OREnumValue** function with the *dwIndex* parameter set to zero. The application should then increment *dwIndex* and call the **OREnumValue** function until there are no more values (until the function returns ERROR\_NO\_MORE\_ITEMS).
     * 
     * The application can also set *dwIndex* to the index of the last value on the first call to the function and decrement the index until the value with index 0 is enumerated. To retrieve the index of the last value, use the [**ORQueryInfoKey**](orqueryinfokey.md) function.
     * 
     * While using **OREnumValue**, an application should not call any offline registry functions that might change the key being queried.
     * 
     * If the data has the REG\_SZ, REG\_MULTI\_SZ or REG\_EXPAND\_SZ type, the string may not have been stored with the proper null-terminating characters. Therefore, even if the function returns ERROR\_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG\_MULTI\_SZ strings should have two null-terminating characters.)
     * 
     * To determine the maximum size of the name and data buffers, use the [**ORQueryInfoKey**](orqueryinfokey.md) function.
     * @param {ORHKEY} Handle A handle to an open registry key in an offline registry hive.
     * @param {Integer} dwIndex The index of the value to be retrieved. This parameter should be zero for the first call to the function and then be incremented for subsequent calls.
     * 
     * Because values are not ordered, any new value will have an arbitrary index. This means that the function may return values in any order.
     * @param {PWSTR} lpValueName A pointer to a buffer that receives the name of the value as a null-terminated string. This buffer must be large enough to include the terminating null character.
     * 
     * For more information, see [Registry Element Size Limits](../sysinfo/registry-element-size-limits.md).
     * @param {Pointer<Integer>} lpcValueName A pointer to a variable that specifies the size of the buffer pointed to by the *lpValueName* parameter, in characters. When the function returns, the variable receives the number of characters stored in the buffer, not including the terminating null character.
     * @param {Pointer<Integer>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see [Registry Value Types](../sysinfo/registry-value-types.md). The *lpType* parameter can be **NULL** if the type code is not required.
     * @param {Pointer} lpData A pointer to a buffer that receives the data for the value entry. This parameter can be **NULL** if the data is not required.
     * 
     * If *lpData* is **NULL** and *lpcbData* is non-**NULL**, the function stores the size of the data, in bytes, in the variable pointed to by *lpcbData*. This enables an application to determine the best way to allocate a buffer for the data.
     * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the *lpData* parameter, in bytes. When the function returns, the variable receives the number of bytes stored in the buffer.
     * 
     * This parameter can be **NULL** only if *lpData* is **NULL**.
     * 
     * If the data has the REG\_SZ, REG\_MULTI\_SZ or REG\_EXPAND\_SZ type, this size includes any terminating null character or characters. For more information, see Remarks.
     * 
     * If the buffer specified by *lpData* is not large enough to hold the data, the function returns ERROR\_MORE\_DATA and stores the required buffer size in the variable pointed to by *lpcbData*. In this case, the contents of *lpData* are undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) function with the FORMAT\_MESSAGE\_FROM\_SYSTEM flag to get a generic description of the error.
     * 
     * If the *lpData* buffer is too small to receive the value, the function returns ERROR\_MORE\_DATA.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/orenumvalue
     */
    static OREnumValue(Handle, dwIndex, lpValueName, lpcValueName, lpType, lpData, lpcbData) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

        lpcValueNameMarshal := lpcValueName is VarRef ? "uint*" : "ptr"
        lpTypeMarshal := lpType is VarRef ? "uint*" : "ptr"
        lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\OREnumValue", "ptr", Handle, "uint", dwIndex, "ptr", lpValueName, lpcValueNameMarshal, lpcValueName, lpTypeMarshal, lpType, "ptr", lpData, lpcbDataMarshal, lpcbData, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpNewName 
     * @returns {Integer} 
     */
    static ORRenameKey(Handle, lpNewName) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpNewName := lpNewName is String ? StrPtr(lpNewName) : lpNewName

        result := DllCall("OFFREG.dll\ORRenameKey", "ptr", Handle, "ptr", lpNewName, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ORStart() {
        result := DllCall("OFFREG.dll\ORStart", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ORShutdown() {
        result := DllCall("OFFREG.dll\ORShutdown", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ORHKEY>} HiveHandles 
     * @param {Integer} HiveCount 
     * @param {Pointer<ORHKEY>} phkResult 
     * @returns {Integer} 
     */
    static ORMergeHives(HiveHandles, HiveCount, phkResult) {
        result := DllCall("OFFREG.dll\ORMergeHives", "ptr", HiveHandles, "uint", HiveCount, "ptr", phkResult, "uint")
        return result
    }

;@endregion Methods
}

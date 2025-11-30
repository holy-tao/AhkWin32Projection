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
     * 
     * @param {Pointer<Integer>} pdwMajorVersion 
     * @param {Pointer<Integer>} pdwMinorVersion 
     * @returns {Integer} 
     */
    static ORGetVersion(pdwMajorVersion, pdwMinorVersion) {
        pdwMajorVersionMarshal := pdwMajorVersion is VarRef ? "uint*" : "ptr"
        pdwMinorVersionMarshal := pdwMinorVersion is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetVersion", pdwMajorVersionMarshal, pdwMajorVersion, pdwMinorVersionMarshal, pdwMinorVersion, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} FilePath 
     * @param {Pointer<ORHKEY>} HORKey 
     * @returns {Integer} 
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
     * 
     * @param {Pointer<ORHKEY>} HORKey 
     * @returns {Integer} 
     */
    static ORCreateHive(HORKey) {
        result := DllCall("OFFREG.dll\ORCreateHive", "ptr", HORKey, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @returns {Integer} 
     */
    static ORCloseHive(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("OFFREG.dll\ORCloseHive", "ptr", Handle, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} HORKey 
     * @param {PWSTR} HivePath 
     * @param {Integer} OsMajorVersion 
     * @param {Integer} OsMinorVersion 
     * @returns {Integer} 
     */
    static ORSaveHive(HORKey, HivePath, OsMajorVersion, OsMinorVersion) {
        HORKey := HORKey is Win32Handle ? NumGet(HORKey, "ptr") : HORKey
        HivePath := HivePath is String ? StrPtr(HivePath) : HivePath

        result := DllCall("OFFREG.dll\ORSaveHive", "ptr", HORKey, "ptr", HivePath, "uint", OsMajorVersion, "uint", OsMinorVersion, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpSubKey 
     * @param {Pointer<ORHKEY>} phkResult 
     * @returns {Integer} 
     */
    static OROpenKey(Handle, lpSubKey, phkResult) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("OFFREG.dll\OROpenKey", "ptr", Handle, "ptr", lpSubKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} KeyHandle 
     * @returns {Integer} 
     */
    static ORCloseKey(KeyHandle) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle

        result := DllCall("OFFREG.dll\ORCloseKey", "ptr", KeyHandle, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} KeyHandle 
     * @param {PWSTR} lpSubKey 
     * @param {PWSTR} lpClass 
     * @param {Integer} dwOptions 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {Pointer<ORHKEY>} phkResult 
     * @param {Pointer<Integer>} pdwDisposition 
     * @returns {Integer} 
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
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpSubKey 
     * @returns {Integer} 
     */
    static ORDeleteKey(Handle, lpSubKey) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("OFFREG.dll\ORDeleteKey", "ptr", Handle, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpClass 
     * @param {Pointer<Integer>} lpcClass 
     * @param {Pointer<Integer>} lpcSubKeys 
     * @param {Pointer<Integer>} lpcMaxSubKeyLen 
     * @param {Pointer<Integer>} lpcMaxClassLen 
     * @param {Pointer<Integer>} lpcValues 
     * @param {Pointer<Integer>} lpcMaxValueNameLen 
     * @param {Pointer<Integer>} lpcMaxValueLen 
     * @param {Pointer<Integer>} lpcbSecurityDescriptor 
     * @param {Pointer<FILETIME>} lpftLastWriteTime 
     * @returns {Integer} 
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
     * 
     * @param {ORHKEY} Handle 
     * @param {Integer} dwIndex 
     * @param {PWSTR} lpName 
     * @param {Pointer<Integer>} lpcName 
     * @param {PWSTR} lpClass 
     * @param {Pointer<Integer>} lpcClass 
     * @param {Pointer<FILETIME>} lpftLastWriteTime 
     * @returns {Integer} 
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
     * 
     * @param {ORHKEY} Handle 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {Pointer<Integer>} lpcbSecurityDescriptor 
     * @returns {Integer} 
     */
    static ORGetKeySecurity(Handle, SecurityInformation, pSecurityDescriptor, lpcbSecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetKeySecurity", "ptr", Handle, "uint", SecurityInformation, "ptr", pSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @returns {Integer} 
     */
    static ORSetKeySecurity(Handle, SecurityInformation, pSecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("OFFREG.dll\ORSetKeySecurity", "ptr", Handle, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {Integer} 
     */
    static ORGetVirtualFlags(Handle, pdwFlags) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("OFFREG.dll\ORGetVirtualFlags", "ptr", Handle, pdwFlagsMarshal, pdwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static ORSetVirtualFlags(Handle, dwFlags) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("OFFREG.dll\ORSetVirtualFlags", "ptr", Handle, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpValueName 
     * @returns {Integer} 
     */
    static ORDeleteValue(Handle, lpValueName) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

        result := DllCall("OFFREG.dll\ORDeleteValue", "ptr", Handle, "ptr", lpValueName, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpSubKey 
     * @param {PWSTR} lpValue 
     * @param {Pointer<Integer>} pdwType 
     * @param {Pointer} pvData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {Integer} 
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
     * 
     * @param {ORHKEY} Handle 
     * @param {PWSTR} lpValueName 
     * @param {Integer} dwType 
     * @param {Pointer} lpData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     */
    static ORSetValue(Handle, lpValueName, dwType, lpData, cbData) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

        result := DllCall("OFFREG.dll\ORSetValue", "ptr", Handle, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * 
     * @param {ORHKEY} Handle 
     * @param {Integer} dwIndex 
     * @param {PWSTR} lpValueName 
     * @param {Pointer<Integer>} lpcValueName 
     * @param {Pointer<Integer>} lpType 
     * @param {Pointer} lpData 
     * @param {Pointer<Integer>} lpcbData 
     * @returns {Integer} 
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

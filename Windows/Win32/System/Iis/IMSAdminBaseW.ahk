#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IMSAdminBaseW extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSAdminBaseW
     * @type {Guid}
     */
    static IID => Guid("{70b51430-b6ca-11d0-b9b9-00a0c922e750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddKey", "DeleteKey", "DeleteChildKeys", "EnumKeys", "CopyKey", "RenameKey", "SetData", "GetData", "DeleteData", "EnumData", "GetAllData", "DeleteAllData", "CopyData", "GetDataPaths", "OpenKey", "CloseKey", "ChangePermissions", "SaveData", "GetHandleInfo", "GetSystemChangeNumber", "GetDataSetNumber", "SetLastChangeTime", "GetLastChangeTime", "KeyExchangePhase1", "KeyExchangePhase2", "Backup", "Restore", "EnumBackups", "DeleteBackup", "UnmarshalInterface", "GetServerGuid"]

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {HRESULT} 
     */
    AddKey(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(3, this, "uint", hMDHandle, "ptr", pszMDPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {HRESULT} 
     */
    DeleteKey(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(4, this, "uint", hMDHandle, "ptr", pszMDPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {HRESULT} 
     */
    DeleteChildKeys(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(5, this, "uint", hMDHandle, "ptr", pszMDPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {PWSTR} pszMDName 
     * @param {Integer} dwMDEnumObjectIndex 
     * @returns {HRESULT} 
     */
    EnumKeys(hMDHandle, pszMDPath, pszMDName, dwMDEnumObjectIndex) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszMDName := pszMDName is String ? StrPtr(pszMDName) : pszMDName

        result := ComCall(6, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pszMDName, "uint", dwMDEnumObjectIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDSourceHandle 
     * @param {PWSTR} pszMDSourcePath 
     * @param {Integer} hMDDestHandle 
     * @param {PWSTR} pszMDDestPath 
     * @param {BOOL} bMDOverwriteFlag 
     * @param {BOOL} bMDCopyFlag 
     * @returns {HRESULT} 
     */
    CopyKey(hMDSourceHandle, pszMDSourcePath, hMDDestHandle, pszMDDestPath, bMDOverwriteFlag, bMDCopyFlag) {
        pszMDSourcePath := pszMDSourcePath is String ? StrPtr(pszMDSourcePath) : pszMDSourcePath
        pszMDDestPath := pszMDDestPath is String ? StrPtr(pszMDDestPath) : pszMDDestPath

        result := ComCall(7, this, "uint", hMDSourceHandle, "ptr", pszMDSourcePath, "uint", hMDDestHandle, "ptr", pszMDDestPath, "int", bMDOverwriteFlag, "int", bMDCopyFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {PWSTR} pszMDNewName 
     * @returns {HRESULT} 
     */
    RenameKey(hMDHandle, pszMDPath, pszMDNewName) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszMDNewName := pszMDNewName is String ? StrPtr(pszMDNewName) : pszMDNewName

        result := ComCall(8, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pszMDNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<METADATA_RECORD>} pmdrMDData 
     * @returns {HRESULT} 
     */
    SetData(hMDHandle, pszMDPath, pmdrMDData) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(9, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pmdrMDData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<METADATA_RECORD>} pmdrMDData 
     * @param {Pointer<Integer>} pdwMDRequiredDataLen 
     * @returns {HRESULT} 
     */
    GetData(hMDHandle, pszMDPath, pmdrMDData, pdwMDRequiredDataLen) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(10, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pmdrMDData, "uint*", pdwMDRequiredDataLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDIdentifier 
     * @param {Integer} dwMDDataType 
     * @returns {HRESULT} 
     */
    DeleteData(hMDHandle, pszMDPath, dwMDIdentifier, dwMDDataType) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(11, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", dwMDIdentifier, "uint", dwMDDataType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<METADATA_RECORD>} pmdrMDData 
     * @param {Integer} dwMDEnumDataIndex 
     * @param {Pointer<Integer>} pdwMDRequiredDataLen 
     * @returns {HRESULT} 
     */
    EnumData(hMDHandle, pszMDPath, pmdrMDData, dwMDEnumDataIndex, pdwMDRequiredDataLen) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(12, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pmdrMDData, "uint", dwMDEnumDataIndex, "uint*", pdwMDRequiredDataLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDAttributes 
     * @param {Integer} dwMDUserType 
     * @param {Integer} dwMDDataType 
     * @param {Pointer<Integer>} pdwMDNumDataEntries 
     * @param {Pointer<Integer>} pdwMDDataSetNumber 
     * @param {Integer} dwMDBufferSize 
     * @param {Pointer<Integer>} pbMDBuffer 
     * @param {Pointer<Integer>} pdwMDRequiredBufferSize 
     * @returns {HRESULT} 
     */
    GetAllData(hMDHandle, pszMDPath, dwMDAttributes, dwMDUserType, dwMDDataType, pdwMDNumDataEntries, pdwMDDataSetNumber, dwMDBufferSize, pbMDBuffer, pdwMDRequiredBufferSize) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(13, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", dwMDAttributes, "uint", dwMDUserType, "uint", dwMDDataType, "uint*", pdwMDNumDataEntries, "uint*", pdwMDDataSetNumber, "uint", dwMDBufferSize, "char*", pbMDBuffer, "uint*", pdwMDRequiredBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDUserType 
     * @param {Integer} dwMDDataType 
     * @returns {HRESULT} 
     */
    DeleteAllData(hMDHandle, pszMDPath, dwMDUserType, dwMDDataType) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(14, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", dwMDUserType, "uint", dwMDDataType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDSourceHandle 
     * @param {PWSTR} pszMDSourcePath 
     * @param {Integer} hMDDestHandle 
     * @param {PWSTR} pszMDDestPath 
     * @param {Integer} dwMDAttributes 
     * @param {Integer} dwMDUserType 
     * @param {Integer} dwMDDataType 
     * @param {BOOL} bMDCopyFlag 
     * @returns {HRESULT} 
     */
    CopyData(hMDSourceHandle, pszMDSourcePath, hMDDestHandle, pszMDDestPath, dwMDAttributes, dwMDUserType, dwMDDataType, bMDCopyFlag) {
        pszMDSourcePath := pszMDSourcePath is String ? StrPtr(pszMDSourcePath) : pszMDSourcePath
        pszMDDestPath := pszMDDestPath is String ? StrPtr(pszMDDestPath) : pszMDDestPath

        result := ComCall(15, this, "uint", hMDSourceHandle, "ptr", pszMDSourcePath, "uint", hMDDestHandle, "ptr", pszMDDestPath, "uint", dwMDAttributes, "uint", dwMDUserType, "uint", dwMDDataType, "int", bMDCopyFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDIdentifier 
     * @param {Integer} dwMDDataType 
     * @param {Integer} dwMDBufferSize 
     * @param {PWSTR} pszBuffer 
     * @param {Pointer<Integer>} pdwMDRequiredBufferSize 
     * @returns {HRESULT} 
     */
    GetDataPaths(hMDHandle, pszMDPath, dwMDIdentifier, dwMDDataType, dwMDBufferSize, pszBuffer, pdwMDRequiredBufferSize) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(16, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", dwMDIdentifier, "uint", dwMDDataType, "uint", dwMDBufferSize, "ptr", pszBuffer, "uint*", pdwMDRequiredBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDAccessRequested 
     * @param {Integer} dwMDTimeOut 
     * @param {Pointer<Integer>} phMDNewHandle 
     * @returns {HRESULT} 
     */
    OpenKey(hMDHandle, pszMDPath, dwMDAccessRequested, dwMDTimeOut, phMDNewHandle) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(17, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", dwMDAccessRequested, "uint", dwMDTimeOut, "uint*", phMDNewHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @returns {HRESULT} 
     */
    CloseKey(hMDHandle) {
        result := ComCall(18, this, "uint", hMDHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {Integer} dwMDTimeOut 
     * @param {Integer} dwMDAccessRequested 
     * @returns {HRESULT} 
     */
    ChangePermissions(hMDHandle, dwMDTimeOut, dwMDAccessRequested) {
        result := ComCall(19, this, "uint", hMDHandle, "uint", dwMDTimeOut, "uint", dwMDAccessRequested, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveData() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {Pointer<METADATA_HANDLE_INFO>} pmdhiInfo 
     * @returns {HRESULT} 
     */
    GetHandleInfo(hMDHandle, pmdhiInfo) {
        result := ComCall(21, this, "uint", hMDHandle, "ptr", pmdhiInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSystemChangeNumber 
     * @returns {HRESULT} 
     */
    GetSystemChangeNumber(pdwSystemChangeNumber) {
        result := ComCall(22, this, "uint*", pdwSystemChangeNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<Integer>} pdwMDDataSetNumber 
     * @returns {HRESULT} 
     */
    GetDataSetNumber(hMDHandle, pszMDPath, pdwMDDataSetNumber) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(23, this, "uint", hMDHandle, "ptr", pszMDPath, "uint*", pdwMDDataSetNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<FILETIME>} pftMDLastChangeTime 
     * @param {BOOL} bLocalTime 
     * @returns {HRESULT} 
     */
    SetLastChangeTime(hMDHandle, pszMDPath, pftMDLastChangeTime, bLocalTime) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(24, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pftMDLastChangeTime, "int", bLocalTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<FILETIME>} pftMDLastChangeTime 
     * @param {BOOL} bLocalTime 
     * @returns {HRESULT} 
     */
    GetLastChangeTime(hMDHandle, pszMDPath, pftMDLastChangeTime, bLocalTime) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(25, this, "uint", hMDHandle, "ptr", pszMDPath, "ptr", pftMDLastChangeTime, "int", bLocalTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    KeyExchangePhase1() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    KeyExchangePhase2() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     */
    Backup(pszMDBackupLocation, dwMDVersion, dwMDFlags) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        result := ComCall(28, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "uint", dwMDFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     */
    Restore(pszMDBackupLocation, dwMDVersion, dwMDFlags) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        result := ComCall(29, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "uint", dwMDFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Pointer<Integer>} pdwMDVersion 
     * @param {Pointer<FILETIME>} pftMDBackupTime 
     * @param {Integer} dwMDEnumIndex 
     * @returns {HRESULT} 
     */
    EnumBackups(pszMDBackupLocation, pdwMDVersion, pftMDBackupTime, dwMDEnumIndex) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        result := ComCall(30, this, "ptr", pszMDBackupLocation, "uint*", pdwMDVersion, "ptr", pftMDBackupTime, "uint", dwMDEnumIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @returns {HRESULT} 
     */
    DeleteBackup(pszMDBackupLocation, dwMDVersion) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        result := ComCall(31, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSAdminBaseW>} piadmbwInterface 
     * @returns {HRESULT} 
     */
    UnmarshalInterface(piadmbwInterface) {
        result := ComCall(32, this, "ptr*", piadmbwInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetServerGuid() {
        result := ComCall(33, this, "HRESULT")
        return result
    }
}

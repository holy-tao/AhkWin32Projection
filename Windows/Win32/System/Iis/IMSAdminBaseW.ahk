#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\METADATA_HANDLE_INFO.ahk" { METADATA_HANDLE_INFO }
#Import ".\METADATA_RECORD.ahk" { METADATA_RECORD }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct IMSAdminBaseW extends IUnknown {
    /**
     * The interface identifier for IMSAdminBaseW
     * @type {Guid}
     */
    static IID := Guid("{70b51430-b6ca-11d0-b9b9-00a0c922e750}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSAdminBaseW interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddKey                : IntPtr
        DeleteKey             : IntPtr
        DeleteChildKeys       : IntPtr
        EnumKeys              : IntPtr
        CopyKey               : IntPtr
        RenameKey             : IntPtr
        SetData               : IntPtr
        GetData               : IntPtr
        DeleteData            : IntPtr
        EnumData              : IntPtr
        GetAllData            : IntPtr
        DeleteAllData         : IntPtr
        CopyData              : IntPtr
        GetDataPaths          : IntPtr
        OpenKey               : IntPtr
        CloseKey              : IntPtr
        ChangePermissions     : IntPtr
        SaveData              : IntPtr
        GetHandleInfo         : IntPtr
        GetSystemChangeNumber : IntPtr
        GetDataSetNumber      : IntPtr
        SetLastChangeTime     : IntPtr
        GetLastChangeTime     : IntPtr
        KeyExchangePhase1     : IntPtr
        KeyExchangePhase2     : IntPtr
        Backup                : IntPtr
        Restore               : IntPtr
        EnumBackups           : IntPtr
        DeleteBackup          : IntPtr
        UnmarshalInterface    : IntPtr
        GetServerGuid         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSAdminBaseW.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {HRESULT} 
     */
    AddKey(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(3, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {HRESULT} 
     */
    DeleteKey(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(4, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {HRESULT} 
     */
    DeleteChildKeys(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(5, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {PWSTR} pszMDName 
     * @param {Integer} dwMDEnumObjectIndex 
     * @returns {HRESULT} 
     */
    EnumKeys(hMDHandle, pszMDPath, pszMDName, dwMDEnumObjectIndex) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszMDName := pszMDName is String ? StrPtr(pszMDName) : pszMDName

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(6, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, "ptr", pszMDName, UInt32, dwMDEnumObjectIndex, "HRESULT")
        return result
    }

    /**
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

        pszMDSourcePathMarshal := pszMDSourcePath == 0 ? IntPtr : PWSTR
        pszMDDestPathMarshal := pszMDDestPath == 0 ? IntPtr : PWSTR

        result := ComCall(7, this, UInt32, hMDSourceHandle, pszMDSourcePathMarshal, pszMDSourcePath, UInt32, hMDDestHandle, pszMDDestPathMarshal, pszMDDestPath, BOOL, bMDOverwriteFlag, BOOL, bMDCopyFlag, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {PWSTR} pszMDNewName 
     * @returns {HRESULT} 
     */
    RenameKey(hMDHandle, pszMDPath, pszMDNewName) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszMDNewName := pszMDNewName is String ? StrPtr(pszMDNewName) : pszMDNewName

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR
        pszMDNewNameMarshal := pszMDNewName == 0 ? IntPtr : PWSTR

        result := ComCall(8, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, pszMDNewNameMarshal, pszMDNewName, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<METADATA_RECORD>} pmdrMDData 
     * @returns {HRESULT} 
     */
    SetData(hMDHandle, pszMDPath, pmdrMDData) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        result := ComCall(9, this, UInt32, hMDHandle, "ptr", pszMDPath, METADATA_RECORD.Ptr, pmdrMDData, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<METADATA_RECORD>} pmdrMDData 
     * @param {Pointer<Integer>} pdwMDRequiredDataLen 
     * @returns {HRESULT} 
     */
    GetData(hMDHandle, pszMDPath, pmdrMDData, pdwMDRequiredDataLen) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pdwMDRequiredDataLenMarshal := pdwMDRequiredDataLen is VarRef ? "uint*" : IntPtr

        result := ComCall(10, this, UInt32, hMDHandle, "ptr", pszMDPath, METADATA_RECORD.Ptr, pmdrMDData, pdwMDRequiredDataLenMarshal, pdwMDRequiredDataLen, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDIdentifier 
     * @param {Integer} dwMDDataType 
     * @returns {HRESULT} 
     */
    DeleteData(hMDHandle, pszMDPath, dwMDIdentifier, dwMDDataType) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(11, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, UInt32, dwMDIdentifier, UInt32, dwMDDataType, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<METADATA_RECORD>} pmdrMDData 
     * @param {Integer} dwMDEnumDataIndex 
     * @param {Pointer<Integer>} pdwMDRequiredDataLen 
     * @returns {HRESULT} 
     */
    EnumData(hMDHandle, pszMDPath, pmdrMDData, dwMDEnumDataIndex, pdwMDRequiredDataLen) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pdwMDRequiredDataLenMarshal := pdwMDRequiredDataLen is VarRef ? "uint*" : IntPtr

        result := ComCall(12, this, UInt32, hMDHandle, "ptr", pszMDPath, METADATA_RECORD.Ptr, pmdrMDData, UInt32, dwMDEnumDataIndex, pdwMDRequiredDataLenMarshal, pdwMDRequiredDataLen, "HRESULT")
        return result
    }

    /**
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

        pdwMDNumDataEntriesMarshal := pdwMDNumDataEntries is VarRef ? "uint*" : IntPtr
        pdwMDDataSetNumberMarshal := pdwMDDataSetNumber is VarRef ? "uint*" : IntPtr
        pbMDBufferMarshal := pbMDBuffer is VarRef ? "char*" : IntPtr
        pdwMDRequiredBufferSizeMarshal := pdwMDRequiredBufferSize is VarRef ? "uint*" : IntPtr

        result := ComCall(13, this, UInt32, hMDHandle, "ptr", pszMDPath, UInt32, dwMDAttributes, UInt32, dwMDUserType, UInt32, dwMDDataType, pdwMDNumDataEntriesMarshal, pdwMDNumDataEntries, pdwMDDataSetNumberMarshal, pdwMDDataSetNumber, UInt32, dwMDBufferSize, pbMDBufferMarshal, pbMDBuffer, pdwMDRequiredBufferSizeMarshal, pdwMDRequiredBufferSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDUserType 
     * @param {Integer} dwMDDataType 
     * @returns {HRESULT} 
     */
    DeleteAllData(hMDHandle, pszMDPath, dwMDUserType, dwMDDataType) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(14, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, UInt32, dwMDUserType, UInt32, dwMDDataType, "HRESULT")
        return result
    }

    /**
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

        pszMDSourcePathMarshal := pszMDSourcePath == 0 ? IntPtr : PWSTR
        pszMDDestPathMarshal := pszMDDestPath == 0 ? IntPtr : PWSTR

        result := ComCall(15, this, UInt32, hMDSourceHandle, pszMDSourcePathMarshal, pszMDSourcePath, UInt32, hMDDestHandle, pszMDDestPathMarshal, pszMDDestPath, UInt32, dwMDAttributes, UInt32, dwMDUserType, UInt32, dwMDDataType, BOOL, bMDCopyFlag, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDIdentifier 
     * @param {Integer} dwMDDataType 
     * @param {Integer} dwMDBufferSize 
     * @param {PWSTR} pszBuffer 
     * @returns {Integer} 
     */
    GetDataPaths(hMDHandle, pszMDPath, dwMDIdentifier, dwMDDataType, dwMDBufferSize, pszBuffer) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(16, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, UInt32, dwMDIdentifier, UInt32, dwMDDataType, UInt32, dwMDBufferSize, "ptr", pszBuffer, "uint*", &pdwMDRequiredBufferSize := 0, "HRESULT")
        return pdwMDRequiredBufferSize
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} dwMDAccessRequested 
     * @param {Integer} dwMDTimeOut 
     * @returns {Integer} 
     */
    OpenKey(hMDHandle, pszMDPath, dwMDAccessRequested, dwMDTimeOut) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(17, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, UInt32, dwMDAccessRequested, UInt32, dwMDTimeOut, "uint*", &phMDNewHandle := 0, "HRESULT")
        return phMDNewHandle
    }

    /**
     * @param {Integer} hMDHandle 
     * @returns {HRESULT} 
     */
    CloseKey(hMDHandle) {
        result := ComCall(18, this, UInt32, hMDHandle, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {Integer} dwMDTimeOut 
     * @param {Integer} dwMDAccessRequested 
     * @returns {HRESULT} 
     */
    ChangePermissions(hMDHandle, dwMDTimeOut, dwMDAccessRequested) {
        result := ComCall(19, this, UInt32, hMDHandle, UInt32, dwMDTimeOut, UInt32, dwMDAccessRequested, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    SaveData() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @returns {METADATA_HANDLE_INFO} 
     */
    GetHandleInfo(hMDHandle) {
        pmdhiInfo := METADATA_HANDLE_INFO()
        result := ComCall(21, this, UInt32, hMDHandle, METADATA_HANDLE_INFO.Ptr, pmdhiInfo, "HRESULT")
        return pmdhiInfo
    }

    /**
     * @returns {Integer} 
     */
    GetSystemChangeNumber() {
        result := ComCall(22, this, "uint*", &pdwSystemChangeNumber := 0, "HRESULT")
        return pdwSystemChangeNumber
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @returns {Integer} 
     */
    GetDataSetNumber(hMDHandle, pszMDPath) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(23, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, "uint*", &pdwMDDataSetNumber := 0, "HRESULT")
        return pdwMDDataSetNumber
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Pointer<FILETIME>} pftMDLastChangeTime 
     * @param {BOOL} bLocalTime 
     * @returns {HRESULT} 
     */
    SetLastChangeTime(hMDHandle, pszMDPath, pftMDLastChangeTime, bLocalTime) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        result := ComCall(24, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, FILETIME.Ptr, pftMDLastChangeTime, BOOL, bLocalTime, "HRESULT")
        return result
    }

    /**
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {BOOL} bLocalTime 
     * @returns {FILETIME} 
     */
    GetLastChangeTime(hMDHandle, pszMDPath, bLocalTime) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath

        pszMDPathMarshal := pszMDPath == 0 ? IntPtr : PWSTR

        pftMDLastChangeTime := FILETIME()
        result := ComCall(25, this, UInt32, hMDHandle, pszMDPathMarshal, pszMDPath, FILETIME.Ptr, pftMDLastChangeTime, BOOL, bLocalTime, "HRESULT")
        return pftMDLastChangeTime
    }

    /**
     * @returns {HRESULT} 
     */
    KeyExchangePhase1() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    KeyExchangePhase2() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * Learn more about: Backup and Restore Parameters
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/backup-and-restore-parameters
     */
    Backup(pszMDBackupLocation, dwMDVersion, dwMDFlags) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        pszMDBackupLocationMarshal := pszMDBackupLocation == 0 ? IntPtr : PWSTR

        result := ComCall(28, this, pszMDBackupLocationMarshal, pszMDBackupLocation, UInt32, dwMDVersion, UInt32, dwMDFlags, "HRESULT")
        return result
    }

    /**
     * Initiates a system restore.
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/restore-systemrestore
     */
    Restore(pszMDBackupLocation, dwMDVersion, dwMDFlags) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        pszMDBackupLocationMarshal := pszMDBackupLocation == 0 ? IntPtr : PWSTR

        result := ComCall(29, this, pszMDBackupLocationMarshal, pszMDBackupLocation, UInt32, dwMDVersion, UInt32, dwMDFlags, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Pointer<Integer>} pdwMDVersion 
     * @param {Pointer<FILETIME>} pftMDBackupTime 
     * @param {Integer} dwMDEnumIndex 
     * @returns {HRESULT} 
     */
    EnumBackups(pszMDBackupLocation, pdwMDVersion, pftMDBackupTime, dwMDEnumIndex) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        pdwMDVersionMarshal := pdwMDVersion is VarRef ? "uint*" : IntPtr

        result := ComCall(30, this, "ptr", pszMDBackupLocation, pdwMDVersionMarshal, pdwMDVersion, FILETIME.Ptr, pftMDBackupTime, UInt32, dwMDEnumIndex, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @returns {HRESULT} 
     */
    DeleteBackup(pszMDBackupLocation, dwMDVersion) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation

        pszMDBackupLocationMarshal := pszMDBackupLocation == 0 ? IntPtr : PWSTR

        result := ComCall(31, this, pszMDBackupLocationMarshal, pszMDBackupLocation, UInt32, dwMDVersion, "HRESULT")
        return result
    }

    /**
     * @returns {IMSAdminBaseW} 
     */
    UnmarshalInterface() {
        result := ComCall(32, this, "ptr*", &piadmbwInterface := 0, "HRESULT")
        return IMSAdminBaseW(piadmbwInterface)
    }

    /**
     * @returns {HRESULT} 
     */
    GetServerGuid() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IMSAdminBaseW.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddKey := CallbackCreate(ObjBindMethod(implObj, "AddKey"), flags, 3)
        this.vtbl.DeleteKey := CallbackCreate(ObjBindMethod(implObj, "DeleteKey"), flags, 3)
        this.vtbl.DeleteChildKeys := CallbackCreate(ObjBindMethod(implObj, "DeleteChildKeys"), flags, 3)
        this.vtbl.EnumKeys := CallbackCreate(ObjBindMethod(implObj, "EnumKeys"), flags, 5)
        this.vtbl.CopyKey := CallbackCreate(ObjBindMethod(implObj, "CopyKey"), flags, 7)
        this.vtbl.RenameKey := CallbackCreate(ObjBindMethod(implObj, "RenameKey"), flags, 4)
        this.vtbl.SetData := CallbackCreate(ObjBindMethod(implObj, "SetData"), flags, 4)
        this.vtbl.GetData := CallbackCreate(ObjBindMethod(implObj, "GetData"), flags, 5)
        this.vtbl.DeleteData := CallbackCreate(ObjBindMethod(implObj, "DeleteData"), flags, 5)
        this.vtbl.EnumData := CallbackCreate(ObjBindMethod(implObj, "EnumData"), flags, 6)
        this.vtbl.GetAllData := CallbackCreate(ObjBindMethod(implObj, "GetAllData"), flags, 11)
        this.vtbl.DeleteAllData := CallbackCreate(ObjBindMethod(implObj, "DeleteAllData"), flags, 5)
        this.vtbl.CopyData := CallbackCreate(ObjBindMethod(implObj, "CopyData"), flags, 9)
        this.vtbl.GetDataPaths := CallbackCreate(ObjBindMethod(implObj, "GetDataPaths"), flags, 8)
        this.vtbl.OpenKey := CallbackCreate(ObjBindMethod(implObj, "OpenKey"), flags, 6)
        this.vtbl.CloseKey := CallbackCreate(ObjBindMethod(implObj, "CloseKey"), flags, 2)
        this.vtbl.ChangePermissions := CallbackCreate(ObjBindMethod(implObj, "ChangePermissions"), flags, 4)
        this.vtbl.SaveData := CallbackCreate(ObjBindMethod(implObj, "SaveData"), flags, 1)
        this.vtbl.GetHandleInfo := CallbackCreate(ObjBindMethod(implObj, "GetHandleInfo"), flags, 3)
        this.vtbl.GetSystemChangeNumber := CallbackCreate(ObjBindMethod(implObj, "GetSystemChangeNumber"), flags, 2)
        this.vtbl.GetDataSetNumber := CallbackCreate(ObjBindMethod(implObj, "GetDataSetNumber"), flags, 4)
        this.vtbl.SetLastChangeTime := CallbackCreate(ObjBindMethod(implObj, "SetLastChangeTime"), flags, 5)
        this.vtbl.GetLastChangeTime := CallbackCreate(ObjBindMethod(implObj, "GetLastChangeTime"), flags, 5)
        this.vtbl.KeyExchangePhase1 := CallbackCreate(ObjBindMethod(implObj, "KeyExchangePhase1"), flags, 1)
        this.vtbl.KeyExchangePhase2 := CallbackCreate(ObjBindMethod(implObj, "KeyExchangePhase2"), flags, 1)
        this.vtbl.Backup := CallbackCreate(ObjBindMethod(implObj, "Backup"), flags, 4)
        this.vtbl.Restore := CallbackCreate(ObjBindMethod(implObj, "Restore"), flags, 4)
        this.vtbl.EnumBackups := CallbackCreate(ObjBindMethod(implObj, "EnumBackups"), flags, 5)
        this.vtbl.DeleteBackup := CallbackCreate(ObjBindMethod(implObj, "DeleteBackup"), flags, 3)
        this.vtbl.UnmarshalInterface := CallbackCreate(ObjBindMethod(implObj, "UnmarshalInterface"), flags, 2)
        this.vtbl.GetServerGuid := CallbackCreate(ObjBindMethod(implObj, "GetServerGuid"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddKey)
        CallbackFree(this.vtbl.DeleteKey)
        CallbackFree(this.vtbl.DeleteChildKeys)
        CallbackFree(this.vtbl.EnumKeys)
        CallbackFree(this.vtbl.CopyKey)
        CallbackFree(this.vtbl.RenameKey)
        CallbackFree(this.vtbl.SetData)
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.DeleteData)
        CallbackFree(this.vtbl.EnumData)
        CallbackFree(this.vtbl.GetAllData)
        CallbackFree(this.vtbl.DeleteAllData)
        CallbackFree(this.vtbl.CopyData)
        CallbackFree(this.vtbl.GetDataPaths)
        CallbackFree(this.vtbl.OpenKey)
        CallbackFree(this.vtbl.CloseKey)
        CallbackFree(this.vtbl.ChangePermissions)
        CallbackFree(this.vtbl.SaveData)
        CallbackFree(this.vtbl.GetHandleInfo)
        CallbackFree(this.vtbl.GetSystemChangeNumber)
        CallbackFree(this.vtbl.GetDataSetNumber)
        CallbackFree(this.vtbl.SetLastChangeTime)
        CallbackFree(this.vtbl.GetLastChangeTime)
        CallbackFree(this.vtbl.KeyExchangePhase1)
        CallbackFree(this.vtbl.KeyExchangePhase2)
        CallbackFree(this.vtbl.Backup)
        CallbackFree(this.vtbl.Restore)
        CallbackFree(this.vtbl.EnumBackups)
        CallbackFree(this.vtbl.DeleteBackup)
        CallbackFree(this.vtbl.UnmarshalInterface)
        CallbackFree(this.vtbl.GetServerGuid)
    }
}

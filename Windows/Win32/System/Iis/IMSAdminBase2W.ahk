#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\IMSAdminBaseW.ahk" { IMSAdminBaseW }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct IMSAdminBase2W extends IMSAdminBaseW {
    /**
     * The interface identifier for IMSAdminBase2W
     * @type {Guid}
     */
    static IID := Guid("{8298d101-f992-43b7-8eca-5052d885b995}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSAdminBase2W interfaces
    */
    struct Vtbl extends IMSAdminBaseW.Vtbl {
        BackupWithPasswd  : IntPtr
        RestoreWithPasswd : IntPtr
        Export            : IntPtr
        Import            : IntPtr
        RestoreHistory    : IntPtr
        EnumHistory       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSAdminBase2W.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @param {PWSTR} pszPasswd 
     * @returns {HRESULT} 
     */
    BackupWithPasswd(pszMDBackupLocation, dwMDVersion, dwMDFlags, pszPasswd) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd

        result := ComCall(34, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "uint", dwMDFlags, "ptr", pszPasswd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @param {PWSTR} pszPasswd 
     * @returns {HRESULT} 
     */
    RestoreWithPasswd(pszMDBackupLocation, dwMDVersion, dwMDFlags, pszPasswd) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd

        result := ComCall(35, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "uint", dwMDFlags, "ptr", pszPasswd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPasswd 
     * @param {PWSTR} pszFileName 
     * @param {PWSTR} pszSourcePath 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     */
    Export(pszPasswd, pszFileName, pszSourcePath, dwMDFlags) {
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszSourcePath := pszSourcePath is String ? StrPtr(pszSourcePath) : pszSourcePath

        result := ComCall(36, this, "ptr", pszPasswd, "ptr", pszFileName, "ptr", pszSourcePath, "uint", dwMDFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPasswd 
     * @param {PWSTR} pszFileName 
     * @param {PWSTR} pszSourcePath 
     * @param {PWSTR} pszDestPath 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     */
    Import(pszPasswd, pszFileName, pszSourcePath, pszDestPath, dwMDFlags) {
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszSourcePath := pszSourcePath is String ? StrPtr(pszSourcePath) : pszSourcePath
        pszDestPath := pszDestPath is String ? StrPtr(pszDestPath) : pszDestPath

        result := ComCall(37, this, "ptr", pszPasswd, "ptr", pszFileName, "ptr", pszSourcePath, "ptr", pszDestPath, "uint", dwMDFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDHistoryLocation 
     * @param {Integer} dwMDMajorVersion 
     * @param {Integer} dwMDMinorVersion 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     */
    RestoreHistory(pszMDHistoryLocation, dwMDMajorVersion, dwMDMinorVersion, dwMDFlags) {
        pszMDHistoryLocation := pszMDHistoryLocation is String ? StrPtr(pszMDHistoryLocation) : pszMDHistoryLocation

        result := ComCall(38, this, "ptr", pszMDHistoryLocation, "uint", dwMDMajorVersion, "uint", dwMDMinorVersion, "uint", dwMDFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDHistoryLocation 
     * @param {Pointer<Integer>} pdwMDMajorVersion 
     * @param {Pointer<Integer>} pdwMDMinorVersion 
     * @param {Pointer<FILETIME>} pftMDHistoryTime 
     * @param {Integer} dwMDEnumIndex 
     * @returns {HRESULT} 
     */
    EnumHistory(pszMDHistoryLocation, pdwMDMajorVersion, pdwMDMinorVersion, pftMDHistoryTime, dwMDEnumIndex) {
        pszMDHistoryLocation := pszMDHistoryLocation is String ? StrPtr(pszMDHistoryLocation) : pszMDHistoryLocation

        pdwMDMajorVersionMarshal := pdwMDMajorVersion is VarRef ? "uint*" : "ptr"
        pdwMDMinorVersionMarshal := pdwMDMinorVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "ptr", pszMDHistoryLocation, pdwMDMajorVersionMarshal, pdwMDMajorVersion, pdwMDMinorVersionMarshal, pdwMDMinorVersion, FILETIME.Ptr, pftMDHistoryTime, "uint", dwMDEnumIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSAdminBase2W.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BackupWithPasswd := CallbackCreate(GetMethod(implObj, "BackupWithPasswd"), flags, 5)
        this.vtbl.RestoreWithPasswd := CallbackCreate(GetMethod(implObj, "RestoreWithPasswd"), flags, 5)
        this.vtbl.Export := CallbackCreate(GetMethod(implObj, "Export"), flags, 5)
        this.vtbl.Import := CallbackCreate(GetMethod(implObj, "Import"), flags, 6)
        this.vtbl.RestoreHistory := CallbackCreate(GetMethod(implObj, "RestoreHistory"), flags, 5)
        this.vtbl.EnumHistory := CallbackCreate(GetMethod(implObj, "EnumHistory"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BackupWithPasswd)
        CallbackFree(this.vtbl.RestoreWithPasswd)
        CallbackFree(this.vtbl.Export)
        CallbackFree(this.vtbl.Import)
        CallbackFree(this.vtbl.RestoreHistory)
        CallbackFree(this.vtbl.EnumHistory)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
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
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @param {PWSTR} pszPasswd 
     * @returns {HRESULT} 
     */
    BackupWithPasswd(pszMDBackupLocation, dwMDVersion, dwMDFlags, pszPasswd) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd

        pszMDBackupLocationMarshal := pszMDBackupLocation == 0 ? IntPtr : PWSTR
        pszPasswdMarshal := pszPasswd == 0 ? IntPtr : PWSTR

        result := ComCall(34, this, pszMDBackupLocationMarshal, pszMDBackupLocation, UInt32, dwMDVersion, UInt32, dwMDFlags, pszPasswdMarshal, pszPasswd, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszMDBackupLocation 
     * @param {Integer} dwMDVersion 
     * @param {Integer} dwMDFlags 
     * @param {PWSTR} pszPasswd 
     * @returns {HRESULT} 
     */
    RestoreWithPasswd(pszMDBackupLocation, dwMDVersion, dwMDFlags, pszPasswd) {
        pszMDBackupLocation := pszMDBackupLocation is String ? StrPtr(pszMDBackupLocation) : pszMDBackupLocation
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd

        pszMDBackupLocationMarshal := pszMDBackupLocation == 0 ? IntPtr : PWSTR
        pszPasswdMarshal := pszPasswd == 0 ? IntPtr : PWSTR

        result := ComCall(35, this, pszMDBackupLocationMarshal, pszMDBackupLocation, UInt32, dwMDVersion, UInt32, dwMDFlags, pszPasswdMarshal, pszPasswd, "HRESULT")
        return result
    }

    /**
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

        pszPasswdMarshal := pszPasswd == 0 ? IntPtr : PWSTR
        pszFileNameMarshal := pszFileName == 0 ? IntPtr : PWSTR
        pszSourcePathMarshal := pszSourcePath == 0 ? IntPtr : PWSTR

        result := ComCall(36, this, pszPasswdMarshal, pszPasswd, pszFileNameMarshal, pszFileName, pszSourcePathMarshal, pszSourcePath, UInt32, dwMDFlags, "HRESULT")
        return result
    }

    /**
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

        pszPasswdMarshal := pszPasswd == 0 ? IntPtr : PWSTR
        pszFileNameMarshal := pszFileName == 0 ? IntPtr : PWSTR
        pszSourcePathMarshal := pszSourcePath == 0 ? IntPtr : PWSTR
        pszDestPathMarshal := pszDestPath == 0 ? IntPtr : PWSTR

        result := ComCall(37, this, pszPasswdMarshal, pszPasswd, pszFileNameMarshal, pszFileName, pszSourcePathMarshal, pszSourcePath, pszDestPathMarshal, pszDestPath, UInt32, dwMDFlags, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszMDHistoryLocation 
     * @param {Integer} dwMDMajorVersion 
     * @param {Integer} dwMDMinorVersion 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} 
     */
    RestoreHistory(pszMDHistoryLocation, dwMDMajorVersion, dwMDMinorVersion, dwMDFlags) {
        pszMDHistoryLocation := pszMDHistoryLocation is String ? StrPtr(pszMDHistoryLocation) : pszMDHistoryLocation

        pszMDHistoryLocationMarshal := pszMDHistoryLocation == 0 ? IntPtr : PWSTR

        result := ComCall(38, this, pszMDHistoryLocationMarshal, pszMDHistoryLocation, UInt32, dwMDMajorVersion, UInt32, dwMDMinorVersion, UInt32, dwMDFlags, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszMDHistoryLocation 
     * @param {Pointer<Integer>} pdwMDMajorVersion 
     * @param {Pointer<Integer>} pdwMDMinorVersion 
     * @param {Pointer<FILETIME>} pftMDHistoryTime 
     * @param {Integer} dwMDEnumIndex 
     * @returns {HRESULT} 
     */
    EnumHistory(pszMDHistoryLocation, pdwMDMajorVersion, pdwMDMinorVersion, pftMDHistoryTime, dwMDEnumIndex) {
        pszMDHistoryLocation := pszMDHistoryLocation is String ? StrPtr(pszMDHistoryLocation) : pszMDHistoryLocation

        pdwMDMajorVersionMarshal := pdwMDMajorVersion is VarRef ? "uint*" : IntPtr
        pdwMDMinorVersionMarshal := pdwMDMinorVersion is VarRef ? "uint*" : IntPtr

        result := ComCall(39, this, "ptr", pszMDHistoryLocation, pdwMDMajorVersionMarshal, pdwMDMajorVersion, pdwMDMinorVersionMarshal, pdwMDMinorVersion, FILETIME.Ptr, pftMDHistoryTime, UInt32, dwMDEnumIndex, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IMSAdminBase2W.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BackupWithPasswd := CallbackCreate(ObjBindMethod(implObj, "BackupWithPasswd"), flags, 5)
        this.vtbl.RestoreWithPasswd := CallbackCreate(ObjBindMethod(implObj, "RestoreWithPasswd"), flags, 5)
        this.vtbl.Export := CallbackCreate(ObjBindMethod(implObj, "Export"), flags, 5)
        this.vtbl.Import := CallbackCreate(ObjBindMethod(implObj, "Import"), flags, 6)
        this.vtbl.RestoreHistory := CallbackCreate(ObjBindMethod(implObj, "RestoreHistory"), flags, 5)
        this.vtbl.EnumHistory := CallbackCreate(ObjBindMethod(implObj, "EnumHistory"), flags, 6)
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

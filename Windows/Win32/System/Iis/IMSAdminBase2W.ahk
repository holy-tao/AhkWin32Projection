#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSAdminBaseW.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IMSAdminBase2W extends IMSAdminBaseW{
    /**
     * The interface identifier for IMSAdminBase2W
     * @type {Guid}
     */
    static IID => Guid("{8298d101-f992-43b7-8eca-5052d885b995}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

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

        result := ComCall(34, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "uint", dwMDFlags, "ptr", pszPasswd, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(35, this, "ptr", pszMDBackupLocation, "uint", dwMDVersion, "uint", dwMDFlags, "ptr", pszPasswd, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(36, this, "ptr", pszPasswd, "ptr", pszFileName, "ptr", pszSourcePath, "uint", dwMDFlags, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(37, this, "ptr", pszPasswd, "ptr", pszFileName, "ptr", pszSourcePath, "ptr", pszDestPath, "uint", dwMDFlags, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(38, this, "ptr", pszMDHistoryLocation, "uint", dwMDMajorVersion, "uint", dwMDMinorVersion, "uint", dwMDFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszMDHistoryLocation 
     * @param {Pointer<UInt32>} pdwMDMajorVersion 
     * @param {Pointer<UInt32>} pdwMDMinorVersion 
     * @param {Pointer<FILETIME>} pftMDHistoryTime 
     * @param {Integer} dwMDEnumIndex 
     * @returns {HRESULT} 
     */
    EnumHistory(pszMDHistoryLocation, pdwMDMajorVersion, pdwMDMinorVersion, pftMDHistoryTime, dwMDEnumIndex) {
        pszMDHistoryLocation := pszMDHistoryLocation is String ? StrPtr(pszMDHistoryLocation) : pszMDHistoryLocation

        result := ComCall(39, this, "ptr", pszMDHistoryLocation, "uint*", pdwMDMajorVersion, "uint*", pdwMDMinorVersion, "ptr", pftMDHistoryTime, "uint", dwMDEnumIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

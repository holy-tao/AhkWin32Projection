#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSAdminBaseW.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IMSAdminBase2W extends IMSAdminBaseW{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BackupWithPasswd", "RestoreWithPasswd", "Export", "Import", "RestoreHistory", "EnumHistory"]

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
     * An application-defined callback function used with ReadEncryptedFileRaw.
     * @remarks
     * You can use the application-defined context block for internal tracking of information such as the file handle 
     *      and the current offset in the file.
     * @param {PWSTR} pszPasswd 
     * @param {PWSTR} pszFileName 
     * @param {PWSTR} pszSourcePath 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} If the function succeeds, it must set the return value to <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, set the return value to a nonzero error code defined in WinError.h. For 
     *        example, if this function fails because an API that it calls fails, you can set the return value to the value 
     *        returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for the failed API.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_export_func
     */
    Export(pszPasswd, pszFileName, pszSourcePath, dwMDFlags) {
        pszPasswd := pszPasswd is String ? StrPtr(pszPasswd) : pszPasswd
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszSourcePath := pszSourcePath is String ? StrPtr(pszSourcePath) : pszSourcePath

        result := ComCall(36, this, "ptr", pszPasswd, "ptr", pszFileName, "ptr", pszSourcePath, "uint", dwMDFlags, "HRESULT")
        return result
    }

    /**
     * An application-defined callback function used with WriteEncryptedFileRaw. The system calls ImportCallback one or more times, each time to retrieve a portion of a backup file's data.
     * @remarks
     * The system calls the <b>ImportCallback</b> function until the 
     *      callback function indicates there is no more data to restore. To indicate that there is no more data to be 
     *      restored, set <i>*ulLength</i> to 0 and use a return code of 
     *      <b>ERROR_SUCCESS</b>. You can use the application-defined context block for internal tracking 
     *      of information such as the file handle and the current offset in the file.
     * @param {PWSTR} pszPasswd 
     * @param {PWSTR} pszFileName 
     * @param {PWSTR} pszSourcePath 
     * @param {PWSTR} pszDestPath 
     * @param {Integer} dwMDFlags 
     * @returns {HRESULT} If the function succeeds, it must set the return value to <b>ERROR_SUCCESS</b>, and set 
     *        the value pointed to by the <i>ulLength</i> parameter to the number of bytes copied into 
     *        <i>pbData</i>.
     * 
     * When the end of the backup file is reached, set <i>ulLength</i> to zero to tell the system 
     *        that the entire file has been processed.
     * 
     * If the function fails, set the return value to a nonzero error code defined in WinError.h. For 
     *        example, if this function fails because an API that it calls fails, you can set the return value to the value 
     *        returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for the failed API.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_import_func
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

        result := ComCall(39, this, "ptr", pszMDHistoryLocation, pdwMDMajorVersionMarshal, pdwMDMajorVersion, pdwMDMinorVersionMarshal, pdwMDMinorVersion, "ptr", pftMDHistoryTime, "uint", dwMDEnumIndex, "HRESULT")
        return result
    }
}

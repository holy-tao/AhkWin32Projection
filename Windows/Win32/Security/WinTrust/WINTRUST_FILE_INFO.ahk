#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The WINTRUST_FILE_INFO structure is used when calling WinVerifyTrust to verify an individual file.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_file_info
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_FILE_INFO {
    #StructPack 8

    /**
     * Count of bytes in this structure.
     */
    cbStruct : UInt32

    /**
     * Full path and file name of the file to be verified. This parameter cannot be <b>NULL</b>.
     */
    pcwszFilePath : PWSTR

    /**
     * Optional. File handle to the open file to be verified. This handle must be to a file that has at least read permission. This member can be set to <b>NULL</b>.
     */
    hFile : HANDLE

    /**
     * Optional. Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the subject type. This member can be set to <b>NULL</b>.
     */
    pgKnownSubject : Guid.Ptr

}

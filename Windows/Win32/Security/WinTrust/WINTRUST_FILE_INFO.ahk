#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINTRUST_FILE_INFO structure is used when calling WinVerifyTrust to verify an individual file.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_file_info
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_FILE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Count of bytes in this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Full path and file name of the file to be verified. This parameter cannot be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    pcwszFilePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional. File handle to the open file to be verified. This handle must be to a file that has at least read permission. This member can be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    hFile {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional. Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the subject type. This member can be set to <b>NULL</b>.
     * @type {Pointer<Guid>}
     */
    pgKnownSubject {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

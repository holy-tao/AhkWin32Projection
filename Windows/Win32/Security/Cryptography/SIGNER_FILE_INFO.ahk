#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies a file to sign.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-file-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_FILE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated string that contains the name of the file to sign.
     */
    pwszFileName : PWSTR

    /**
     * An open handle to the file specified by the **pwszFileName** member. If this member contains a valid handle, this handle is used to access the file. This member can be set to **NULL**.
     */
    hFile : HANDLE

}

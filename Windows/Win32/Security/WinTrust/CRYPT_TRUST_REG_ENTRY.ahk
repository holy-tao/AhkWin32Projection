#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Identifies a provider function by DLL name and function name.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_trust_reg_entry
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_TRUST_REG_ENTRY {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to a null-terminated string for the DLL name.
     */
    pwszDLLName : PWSTR

    /**
     * A pointer to a null-terminated string for the function name.
     */
    pwszFunctionName : PWSTR

}

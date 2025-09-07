#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Identifies a provider function by DLL name and function name.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_trust_reg_entry
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_TRUST_REG_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string for the DLL name.
     * @type {PWSTR}
     */
    pwszDLLName{
        get {
            if(!this.HasProp("__pwszDLLName"))
                this.__pwszDLLName := PWSTR(this.ptr + 8)
            return this.__pwszDLLName
        }
    }

    /**
     * A pointer to a null-terminated string for the function name.
     * @type {PWSTR}
     */
    pwszFunctionName{
        get {
            if(!this.HasProp("__pwszFunctionName"))
                this.__pwszFunctionName := PWSTR(this.ptr + 16)
            return this.__pwszFunctionName
        }
    }
}

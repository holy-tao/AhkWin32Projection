#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PROVIDOR\_INFO\_1 structure identifies a print provider.
 * @see https://learn.microsoft.com/windows/win32/printdocs/providor-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PROVIDOR_INFO_1W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that is the name of the print provider.
     * @type {Pointer<PWSTR>}
     */
    pName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated environment string specifying the environment the provider dynamic-link library (DLL) is designed to run in.
     * @type {Pointer<PWSTR>}
     */
    pEnvironment {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that is the name of the provider .dll.
     * @type {Pointer<PWSTR>}
     */
    pDLLName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

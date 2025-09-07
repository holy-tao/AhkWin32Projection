#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 0)
            return this.__pName
        }
    }

    /**
     * Pointer to a null-terminated environment string specifying the environment the provider dynamic-link library (DLL) is designed to run in.
     * @type {PWSTR}
     */
    pEnvironment{
        get {
            if(!this.HasProp("__pEnvironment"))
                this.__pEnvironment := PWSTR(this.ptr + 8)
            return this.__pEnvironment
        }
    }

    /**
     * Pointer to a null-terminated string that is the name of the provider .dll.
     * @type {PWSTR}
     */
    pDLLName{
        get {
            if(!this.HasProp("__pDLLName"))
                this.__pDLLName := PWSTR(this.ptr + 16)
            return this.__pDLLName
        }
    }
}

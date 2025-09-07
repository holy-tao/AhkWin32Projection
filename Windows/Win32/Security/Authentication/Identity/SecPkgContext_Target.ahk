#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Holds target information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_target
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_Target extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length (in bytes) of the target array.
     * @type {Integer}
     */
    TargetLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array containing the target information.
     * @type {PSTR}
     */
    Target{
        get {
            if(!this.HasProp("__Target"))
                this.__Target := PSTR(this.ptr + 8)
            return this.__Target
        }
    }
}

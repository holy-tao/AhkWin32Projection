#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_Lifespan structure indicates the life span of a security context. The QueryContextAttributes (General) function uses this structure.
 * @remarks
 * 
 * It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return these values in local time.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_lifespan
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_Lifespan extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Time at which the context was established.
     * @type {Integer}
     */
    tsStart {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Time at which the context will expire.
     * @type {Integer}
     */
    tsExpiry {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}

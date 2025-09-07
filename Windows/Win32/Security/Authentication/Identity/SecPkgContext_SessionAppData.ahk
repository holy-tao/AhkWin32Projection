#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Stores application data for a session context.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_sessionappdata
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_SessionAppData extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Count of bytes used by <b>pbAppData</b>.
     * @type {Integer}
     */
    cbAppData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a <b>BYTE</b> that represents the session application data.
     * @type {Pointer<Byte>}
     */
    pbAppData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to send a cookie for server validation and bypass point-to-point (PPP) authentication.
 * @see https://docs.microsoft.com/windows/win32/api//ras/ns-ras-rasdevspecificinfo
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASDEVSPECIFICINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the cookie in <b>pbDevSpecificInfo</b>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a BLOB that contains the authentication cookie.
     * @type {Pointer<Integer>}
     */
    pbDevSpecificInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

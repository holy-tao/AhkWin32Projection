#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_CACHE_PSDB_PROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pAdapterFamily {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pPsdbPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

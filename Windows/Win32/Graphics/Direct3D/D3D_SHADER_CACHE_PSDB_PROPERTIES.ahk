#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    pAdapterFamily{
        get {
            if(!this.HasProp("__pAdapterFamily"))
                this.__pAdapterFamily := PWSTR(this.ptr + 0)
            return this.__pAdapterFamily
        }
    }

    /**
     * @type {PWSTR}
     */
    pPsdbPath{
        get {
            if(!this.HasProp("__pPsdbPath"))
                this.__pPsdbPath := PWSTR(this.ptr + 8)
            return this.__pPsdbPath
        }
    }
}

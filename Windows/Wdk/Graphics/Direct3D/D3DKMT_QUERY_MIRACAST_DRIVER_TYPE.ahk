#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERY_MIRACAST_DRIVER_TYPE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MiracastDriverType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

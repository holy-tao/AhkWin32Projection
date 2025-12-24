#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_UMD_DRIVER_VERSION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DriverVersion {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}

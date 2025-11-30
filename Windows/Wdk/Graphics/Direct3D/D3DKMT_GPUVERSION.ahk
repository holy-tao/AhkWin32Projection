#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_GPUVERSION extends Win32Struct
{
    static sizeof => 132

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PhysicalAdapterIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    BiosVersion {
        get => StrGet(this.ptr + 4, 31, "UTF-16")
        set => StrPut(value, this.ptr + 4, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    GpuArchitecture {
        get => StrGet(this.ptr + 68, 31, "UTF-16")
        set => StrPut(value, this.ptr + 68, 31, "UTF-16")
    }
}

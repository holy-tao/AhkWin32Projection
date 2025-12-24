#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_GPUVERSION extends Win32Struct
{
    static sizeof => 128

    static packingSize => 2

    /**
     * @type {String}
     */
    BiosVersion {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    GpuArchitecture {
        get => StrGet(this.ptr + 64, 31, "UTF-16")
        set => StrPut(value, this.ptr + 64, 31, "UTF-16")
    }
}

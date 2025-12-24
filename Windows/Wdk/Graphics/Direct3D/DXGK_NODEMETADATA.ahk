#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_NODEMETADATA extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EngineType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {String}
     */
    FriendlyName {
        get => StrGet(this.ptr + 4, 31, "UTF-16")
        set => StrPut(value, this.ptr + 4, 31, "UTF-16")
    }

    /**
     * @type {Pointer<DXGK_NODEMETADATA_FLAGS>}
     */
    Flags {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {BOOLEAN}
     */
    GpuMmuSupported {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }

    /**
     * @type {BOOLEAN}
     */
    IoMmuSupported {
        get => NumGet(this, 81, "char")
        set => NumPut("char", value, this, 81)
    }
}

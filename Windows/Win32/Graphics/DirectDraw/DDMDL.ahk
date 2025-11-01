#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDMDL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<DDMDL>}
     */
    MdlNext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MdlSize {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MdlFlags {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * @type {Pointer}
     */
    Process {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    lpMappedSystemVa {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    lpStartVa {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ByteCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ByteOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}

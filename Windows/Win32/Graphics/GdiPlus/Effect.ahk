#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A function is the building block for a shader created in the high-level language. If you prefer to write shaders in a C-style language instead of in assembly language, you will want to write functions.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/functions
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Effect extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    lpVtbl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<IntPtr>}
     */
    nativeEffect {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    auxDataSize {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    auxData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    useAuxData {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}

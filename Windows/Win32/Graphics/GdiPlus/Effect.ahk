#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Effect class serves as a base class for eleven classes that you can use to apply effects and adjustments to bitmaps. The following classes descend from Effect.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/nl-gdipluseffects-effect
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Effect extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<Pointer<Void>>}
     */
    lpVtbl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<CGpEffect>}
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
     * @type {BOOL}
     */
    useAuxData {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}

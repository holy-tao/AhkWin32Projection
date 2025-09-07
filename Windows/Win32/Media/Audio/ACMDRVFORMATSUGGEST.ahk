#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ACMDRVFORMATSUGGEST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fdwSuggest {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxSrc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbwfxSrc {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxDst {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cbwfxDst {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

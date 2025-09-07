#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HACMSTREAM.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ACMDRVSTREAMINSTANCE extends Win32Struct
{
    static sizeof => 68

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxSrc {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxDst {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<WAVEFILTER>}
     */
    pwfltr {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {Pointer}
     */
    dwInstance {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    fdwOpen {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    fdwDriver {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    dwDriver {
        get => NumGet(this, 52, "ptr")
        set => NumPut("ptr", value, this, 52)
    }

    /**
     * @type {HACMSTREAM}
     */
    has{
        get {
            if(!this.HasProp("__has"))
                this.__has := HACMSTREAM(this.ptr + 60)
            return this.__has
        }
    }
}

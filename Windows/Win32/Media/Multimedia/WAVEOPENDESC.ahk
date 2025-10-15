#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\HWAVE.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class WAVEOPENDESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {HWAVE}
     */
    hWave{
        get {
            if(!this.HasProp("__hWave"))
                this.__hWave := HWAVE(this.ptr + 0)
            return this.__hWave
        }
    }

    /**
     * @type {Pointer<WAVEFORMAT>}
     */
    lpFormat {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    dwInstance {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uMappedDeviceID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    dnDevNode {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

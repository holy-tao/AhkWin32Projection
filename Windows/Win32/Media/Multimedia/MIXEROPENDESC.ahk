#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\HMIXER.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MIXEROPENDESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {HMIXER}
     */
    hmx{
        get {
            if(!this.HasProp("__hmx"))
                this.__hmx := HMIXER(0, this)
            return this.__hmx
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pReserved0 {
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
     * @type {Pointer}
     */
    dnDevNode {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

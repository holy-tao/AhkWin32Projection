#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DCICMD.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DCIENUMINPUT extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {DCICMD}
     */
    cmd{
        get {
            if(!this.HasProp("__cmd"))
                this.__cmd := DCICMD(this.ptr + 0)
            return this.__cmd
        }
    }

    /**
     * @type {RECT}
     */
    rSrc{
        get {
            if(!this.HasProp("__rSrc"))
                this.__rSrc := RECT(this.ptr + 24)
            return this.__rSrc
        }
    }

    /**
     * @type {RECT}
     */
    rDst{
        get {
            if(!this.HasProp("__rDst"))
                this.__rDst := RECT(this.ptr + 40)
            return this.__rDst
        }
    }

    /**
     * @type {Pointer}
     */
    EnumCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}

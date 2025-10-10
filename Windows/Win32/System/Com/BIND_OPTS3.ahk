#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIND_OPTS.ahk
#Include .\BIND_OPTS2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BIND_OPTS3 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {BIND_OPTS2}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := BIND_OPTS2(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    hwnd {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

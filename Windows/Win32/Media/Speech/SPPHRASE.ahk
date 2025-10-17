#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPPHRASERULE.ahk
#Include .\SPPHRASE_50.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPHRASE extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {SPPHRASE_50}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := SPPHRASE_50(0, this)
            return this.__Base
        }
    }

    /**
     * @type {PWSTR}
     */
    pSML {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<SPSEMANTICERRORINFO>}
     */
    pSemanticErrorInfo {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }
}

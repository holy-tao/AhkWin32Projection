#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPSEMANTICERRORINFO.ahk
#Include .\SPPHRASERULE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPPHRASEREPLACEMENT.ahk
#Include .\SPPHRASE_50.ahk
#Include .\SPPHRASEPROPERTY.ahk
#Include .\SPPHRASEELEMENT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPPHRASE extends Win32Struct {
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {SPPHRASE_50}
     */
    Base {
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
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<SPSEMANTICERRORINFO>}
     */
    pSemanticErrorInfo {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}

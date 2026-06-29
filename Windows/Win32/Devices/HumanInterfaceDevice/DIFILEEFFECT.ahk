#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIEFFECT.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIFILEEFFECT extends Win32Struct {
    static sizeof => 296

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    GuidEffect {
        get {
            if(!this.HasProp("__GuidEffect"))
                this.__GuidEffect := Guid(4, this)
            return this.__GuidEffect
        }
    }

    /**
     * @type {Pointer<DIEFFECT>}
     */
    lpDiEffect {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {String}
     */
    szFriendlyName {
        get => StrGet(this.ptr + 32, 259, "UTF-8")
        set => StrPut(value, this.ptr + 32, 259, "UTF-8")
    }
}

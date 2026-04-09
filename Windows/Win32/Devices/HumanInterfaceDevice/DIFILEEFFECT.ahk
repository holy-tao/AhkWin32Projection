#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIEFFECT.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIFILEEFFECT extends Win32Struct {
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    GuidEffect {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DIEFFECT>}
     */
    lpDiEffect {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {String}
     */
    szFriendlyName {
        get => StrGet(this.ptr + 24, 259, "UTF-8")
        set => StrPut(value, this.ptr + 24, 259, "UTF-8")
    }
}

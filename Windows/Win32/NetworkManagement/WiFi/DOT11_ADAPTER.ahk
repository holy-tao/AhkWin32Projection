#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DOT11_CURRENT_OPERATION_MODE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_ADAPTER extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    gAdapterId {
        get {
            if(!this.HasProp("__gAdapterId"))
                this.__gAdapterId := Guid(0, this)
            return this.__gAdapterId
        }
    }

    /**
     * @type {PWSTR}
     */
    pszDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {DOT11_CURRENT_OPERATION_MODE}
     */
    Dot11CurrentOpMode {
        get {
            if(!this.HasProp("__Dot11CurrentOpMode"))
                this.__Dot11CurrentOpMode := DOT11_CURRENT_OPERATION_MODE(24, this)
            return this.__Dot11CurrentOpMode
        }
    }
}

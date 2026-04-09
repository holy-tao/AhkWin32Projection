#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_CURRENT_OPERATION_MODE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_ADAPTER extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    gAdapterId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {DOT11_CURRENT_OPERATION_MODE}
     */
    Dot11CurrentOpMode {
        get {
            if(!this.HasProp("__Dot11CurrentOpMode"))
                this.__Dot11CurrentOpMode := DOT11_CURRENT_OPERATION_MODE(16, this)
            return this.__Dot11CurrentOpMode
        }
    }
}

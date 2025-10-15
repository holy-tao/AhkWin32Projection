#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DOT11_CURRENT_OPERATION_MODE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ADAPTER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    gAdapterId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszDescription{
        get {
            if(!this.HasProp("__pszDescription"))
                this.__pszDescription := PWSTR(this.ptr + 8)
            return this.__pszDescription
        }
    }

    /**
     * @type {DOT11_CURRENT_OPERATION_MODE}
     */
    Dot11CurrentOpMode{
        get {
            if(!this.HasProp("__Dot11CurrentOpMode"))
                this.__Dot11CurrentOpMode := DOT11_CURRENT_OPERATION_MODE(this.ptr + 16)
            return this.__Dot11CurrentOpMode
        }
    }
}

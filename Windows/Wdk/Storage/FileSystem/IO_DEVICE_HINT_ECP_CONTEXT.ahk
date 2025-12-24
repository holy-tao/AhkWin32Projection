#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class IO_DEVICE_HINT_ECP_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    TargetDevice {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {UNICODE_STRING}
     */
    RemainingName{
        get {
            if(!this.HasProp("__RemainingName"))
                this.__RemainingName := UNICODE_STRING(8, this)
            return this.__RemainingName
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STREAMING_CONTROL_REQUEST_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_STREAMING_CONTROL extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {STREAMING_CONTROL_REQUEST_TYPE}
     */
    RequestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

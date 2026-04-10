#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EDeviceControlUseType.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIOENGINE_DEVICECONTROLS extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {EDeviceControlUseType}
     */
    Volume {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {EDeviceControlUseType}
     */
    Mute {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {EDeviceControlUseType}
     */
    PeakMeter {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

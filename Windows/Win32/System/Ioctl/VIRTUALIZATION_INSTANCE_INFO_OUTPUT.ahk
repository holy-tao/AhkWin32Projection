#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class VIRTUALIZATION_INSTANCE_INFO_OUTPUT extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    VirtualizationInstanceID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

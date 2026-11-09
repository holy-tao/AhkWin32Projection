#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_INJECT_POISON_INPUT extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    InjectPoisonPhysicalAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

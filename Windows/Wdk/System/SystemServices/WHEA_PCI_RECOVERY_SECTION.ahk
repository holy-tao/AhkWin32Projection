#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCI_RECOVERY_SECTION extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {Integer}
     */
    SignalType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    RecoveryAttempted {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    RecoveryStatus {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}

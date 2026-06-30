#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk
#Include ..\..\..\Win32\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_SRAR_DETAIL_EVENT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RecoveryContextFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RecoveryContextPa {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {NTSTATUS}
     */
    PageOfflineStatus {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    KernelConsumerError {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }
}

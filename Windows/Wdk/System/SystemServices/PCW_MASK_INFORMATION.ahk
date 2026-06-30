#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\KEVENT.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk
#Include ..\..\Foundation\PPCW_BUFFER.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCW_MASK_INFORMATION extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CounterMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    InstanceMask {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    CollectMultiple {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {PPCW_BUFFER}
     */
    Buffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<KEVENT>}
     */
    CancelEvent {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

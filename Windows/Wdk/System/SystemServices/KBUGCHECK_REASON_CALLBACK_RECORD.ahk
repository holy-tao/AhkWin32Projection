#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KBUGCHECK_CALLBACK_REASON.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KBUGCHECK_REASON_CALLBACK_RECORD extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Entry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PKBUGCHECK_REASON_CALLBACK_ROUTINE>}
     */
    CallbackRoutine {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Component {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    Checksum {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {KBUGCHECK_CALLBACK_REASON}
     */
    Reason {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }
}

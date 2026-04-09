#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EXCEPTION_REGISTRATION_RECORD.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 */
class EXCEPTION_REGISTRATION_RECORD extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<EXCEPTION_REGISTRATION_RECORD>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<EXCEPTION_ROUTINE>}
     */
    Handler {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

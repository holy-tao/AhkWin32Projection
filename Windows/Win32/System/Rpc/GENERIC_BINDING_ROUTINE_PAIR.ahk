#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GENERIC_BINDING_ROUTINE.ahk
#Include .\GENERIC_UNBIND_ROUTINE.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class GENERIC_BINDING_ROUTINE_PAIR extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<GENERIC_BINDING_ROUTINE>}
     */
    pfnBind {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<GENERIC_UNBIND_ROUTINE>}
     */
    pfnUnbind {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

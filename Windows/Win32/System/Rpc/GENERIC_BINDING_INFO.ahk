#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class GENERIC_BINDING_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    pObj {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<GENERIC_BINDING_ROUTINE>}
     */
    pfnBind {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<GENERIC_UNBIND_ROUTINE>}
     */
    pfnUnbind {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

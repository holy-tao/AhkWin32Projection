#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class USER_MARSHAL_ROUTINE_QUADRUPLE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<USER_MARSHAL_SIZING_ROUTINE>}
     */
    pfnBufferSize {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<USER_MARSHAL_MARSHALLING_ROUTINE>}
     */
    pfnMarshall {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<USER_MARSHAL_UNMARSHALLING_ROUTINE>}
     */
    pfnUnmarshall {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<USER_MARSHAL_FREEING_ROUTINE>}
     */
    pfnFree {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

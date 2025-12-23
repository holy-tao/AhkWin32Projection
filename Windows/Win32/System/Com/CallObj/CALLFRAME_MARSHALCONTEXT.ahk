#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the context in which marshalling should be carried out.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAME_MARSHALCONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <b>TRUE</b> if the in parameter values are to be marshaled and <b>FALSE</b> if the out parameter values are to be marshaled. The in parameter values are marshaled on the client side and the out parameter values are marshaled on the server side.
     * @type {BOOLEAN}
     */
    fIn {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Context in which unmarshaling is to be carried out.
     * @type {Integer}
     */
    dwDestContext {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Context in which unmarshaling is to be carried out.
     * @type {Pointer<Void>}
     */
    pvDestContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This parameter should be <b>NULL</b>.
     * @type {IUnknown}
     */
    punkReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The transfer syntax for which the marshalling should occur.
     * @type {Pointer<Guid>}
     */
    guidTransferSyntax {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

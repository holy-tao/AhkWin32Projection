#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RPC_VERSION.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_SYNTAX_IDENTIFIER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    SyntaxGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {RPC_VERSION}
     */
    SyntaxVersion{
        get {
            if(!this.HasProp("__SyntaxVersion"))
                this.__SyntaxVersion := RPC_VERSION(this.ptr + 8)
            return this.__SyntaxVersion
        }
    }
}

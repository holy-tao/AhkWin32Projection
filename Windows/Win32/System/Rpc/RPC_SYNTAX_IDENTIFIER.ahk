#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RPC_VERSION.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_SYNTAX_IDENTIFIER extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    SyntaxGUID {
        get {
            if(!this.HasProp("__SyntaxGUID"))
                this.__SyntaxGUID := Guid(0, this)
            return this.__SyntaxGUID
        }
    }

    /**
     * @type {RPC_VERSION}
     */
    SyntaxVersion {
        get {
            if(!this.HasProp("__SyntaxVersion"))
                this.__SyntaxVersion := RPC_VERSION(16, this)
            return this.__SyntaxVersion
        }
    }
}

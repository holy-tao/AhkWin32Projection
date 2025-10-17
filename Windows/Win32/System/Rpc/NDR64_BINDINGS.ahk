#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_BIND_PRIMITIVE.ahk
#Include .\NDR64_BIND_GENERIC.ahk
#Include .\NDR64_BIND_CONTEXT.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_BINDINGS extends Win32Struct
{
    static sizeof => 18

    static packingSize => 6

    /**
     * @type {NDR64_BIND_PRIMITIVE}
     */
    Primitive{
        get {
            if(!this.HasProp("__Primitive"))
                this.__Primitive := NDR64_BIND_PRIMITIVE(0, this)
            return this.__Primitive
        }
    }

    /**
     * @type {NDR64_BIND_GENERIC}
     */
    Generic{
        get {
            if(!this.HasProp("__Generic"))
                this.__Generic := NDR64_BIND_GENERIC(0, this)
            return this.__Generic
        }
    }

    /**
     * @type {NDR64_BIND_CONTEXT}
     */
    Context{
        get {
            if(!this.HasProp("__Context"))
                this.__Context := NDR64_BIND_CONTEXT(0, this)
            return this.__Context
        }
    }
}

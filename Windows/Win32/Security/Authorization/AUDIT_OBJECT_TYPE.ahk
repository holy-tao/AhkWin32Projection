#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUDIT_OBJECT_TYPE extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ObjectType {
        get {
            if(!this.HasProp("__ObjectType"))
                this.__ObjectType := Guid(0, this)
            return this.__ObjectType
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    AccessMask {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class KTMOBJECT_CURSOR extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    LastQuery {
        get {
            if(!this.HasProp("__LastQuery"))
                this.__LastQuery := Guid(0, this)
            return this.__LastQuery
        }
    }

    /**
     * @type {Integer}
     */
    ObjectIdCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Pointer>}
     */
    ObjectIds {
        get {
            if(!this.HasProp("__ObjectIdsProxyArray"))
                this.__ObjectIdsProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "ptr")
            return this.__ObjectIdsProxyArray
        }
    }
}

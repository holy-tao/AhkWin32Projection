#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class KTMOBJECT_CURSOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    LastQuery {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ObjectIdCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Guid>}
     */
    ObjectIds{
        get {
            if(!this.HasProp("__ObjectIdsProxyArray"))
                this.__ObjectIdsProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "ptr")
            return this.__ObjectIdsProxyArray
        }
    }
}

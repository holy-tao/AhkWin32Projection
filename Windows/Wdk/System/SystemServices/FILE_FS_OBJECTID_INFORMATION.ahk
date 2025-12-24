#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class FILE_FS_OBJECTID_INFORMATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    ObjectId{
        get {
            if(!this.HasProp("__ObjectIdProxyArray"))
                this.__ObjectIdProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__ObjectIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ExtendedInfo{
        get {
            if(!this.HasProp("__ExtendedInfoProxyArray"))
                this.__ExtendedInfoProxyArray := Win32FixedArray(this.ptr + 16, 48, Primitive, "char")
            return this.__ExtendedInfoProxyArray
        }
    }
}

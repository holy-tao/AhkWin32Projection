#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_OBJECTID_INFORMATION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FileReference {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ObjectId{
        get {
            if(!this.HasProp("__ObjectIdProxyArray"))
                this.__ObjectIdProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__ObjectIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    BirthVolumeId{
        get {
            if(!this.HasProp("__BirthVolumeIdProxyArray"))
                this.__BirthVolumeIdProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__BirthVolumeIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    BirthObjectId{
        get {
            if(!this.HasProp("__BirthObjectIdProxyArray"))
                this.__BirthObjectIdProxyArray := Win32FixedArray(this.ptr + 40, 16, Primitive, "char")
            return this.__BirthObjectIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DomainId{
        get {
            if(!this.HasProp("__DomainIdProxyArray"))
                this.__DomainIdProxyArray := Win32FixedArray(this.ptr + 56, 16, Primitive, "char")
            return this.__DomainIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ExtendedInfo{
        get {
            if(!this.HasProp("__ExtendedInfoProxyArray"))
                this.__ExtendedInfoProxyArray := Win32FixedArray(this.ptr + 24, 48, Primitive, "char")
            return this.__ExtendedInfoProxyArray
        }
    }
}

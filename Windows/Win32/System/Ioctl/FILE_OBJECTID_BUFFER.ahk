#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an object identifier and user-defined metadata associated with the object identifier.
 * @remarks
 * Object identifiers are used  to track  files and directories. They are invisible to most applications and should never be modified by applications. Modifying an object identifier can result in the loss of data from portions of a file, up to and including entire volumes of data.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_objectid_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_OBJECTID_BUFFER extends Win32Struct {
    static sizeof => 64

    static packingSize => 1

    /**
     * The identifier that uniquely identifies the file or directory within the volume on which it resides.
     * @type {Array<Integer>}
     */
    ObjectId {
        get {
            if(!this.HasProp("__ObjectIdProxyArray"))
                this.__ObjectIdProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__ObjectIdProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    BirthVolumeId {
        get {
            if(!this.HasProp("__BirthVolumeIdProxyArray"))
                this.__BirthVolumeIdProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__BirthVolumeIdProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    BirthObjectId {
        get {
            if(!this.HasProp("__BirthObjectIdProxyArray"))
                this.__BirthObjectIdProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__BirthObjectIdProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    DomainId {
        get {
            if(!this.HasProp("__DomainIdProxyArray"))
                this.__DomainIdProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__DomainIdProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ExtendedInfo {
        get {
            if(!this.HasProp("__ExtendedInfoProxyArray"))
                this.__ExtendedInfoProxyArray := Win32FixedArray(this.ptr + 16, 48, Primitive, "char")
            return this.__ExtendedInfoProxyArray
        }
    }
}

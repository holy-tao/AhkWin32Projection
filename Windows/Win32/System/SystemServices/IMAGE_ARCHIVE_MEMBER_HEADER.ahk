#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_ARCHIVE_MEMBER_HEADER extends Win32Struct {
    static sizeof => 60

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Name {
        get {
            if(!this.HasProp("__NameProxyArray"))
                this.__NameProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__NameProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Date {
        get {
            if(!this.HasProp("__DateProxyArray"))
                this.__DateProxyArray := Win32FixedArray(this.ptr + 16, 12, Primitive, "char")
            return this.__DateProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    UserID {
        get {
            if(!this.HasProp("__UserIDProxyArray"))
                this.__UserIDProxyArray := Win32FixedArray(this.ptr + 28, 6, Primitive, "char")
            return this.__UserIDProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    GroupID {
        get {
            if(!this.HasProp("__GroupIDProxyArray"))
                this.__GroupIDProxyArray := Win32FixedArray(this.ptr + 34, 6, Primitive, "char")
            return this.__GroupIDProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Mode {
        get {
            if(!this.HasProp("__ModeProxyArray"))
                this.__ModeProxyArray := Win32FixedArray(this.ptr + 40, 8, Primitive, "char")
            return this.__ModeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Size {
        get {
            if(!this.HasProp("__SizeProxyArray"))
                this.__SizeProxyArray := Win32FixedArray(this.ptr + 48, 10, Primitive, "char")
            return this.__SizeProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    EndHeader {
        get {
            if(!this.HasProp("__EndHeaderProxyArray"))
                this.__EndHeaderProxyArray := Win32FixedArray(this.ptr + 58, 2, Primitive, "char")
            return this.__EndHeaderProxyArray
        }
    }
}

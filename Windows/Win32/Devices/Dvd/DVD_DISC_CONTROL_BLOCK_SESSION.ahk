#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_DISC_CONTROL_BLOCK_HEADER.ahk
#Include .\DVD_DISC_CONTROL_BLOCK_SESSION_ITEM.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
class DVD_DISC_CONTROL_BLOCK_SESSION extends Win32Struct {
    static sizeof => 32768

    static packingSize => 1

    /**
     * @type {DVD_DISC_CONTROL_BLOCK_HEADER}
     */
    header {
        get {
            if(!this.HasProp("__header"))
                this.__header := DVD_DISC_CONTROL_BLOCK_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * @type {Array<Integer>}
     */
    SessionNumber {
        get {
            if(!this.HasProp("__SessionNumberProxyArray"))
                this.__SessionNumberProxyArray := Win32FixedArray(this.ptr + 40, 2, Primitive, "char")
            return this.__SessionNumberProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 42, 22, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    DiscID {
        get {
            if(!this.HasProp("__DiscIDProxyArray"))
                this.__DiscIDProxyArray := Win32FixedArray(this.ptr + 64, 32, Primitive, "char")
            return this.__DiscIDProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 96, 32, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {DVD_DISC_CONTROL_BLOCK_SESSION_ITEM}
     */
    SessionItem {
        get {
            if(!this.HasProp("__SessionItemProxyArray"))
                this.__SessionItemProxyArray := Win32FixedArray(this.ptr + 128, 504, DVD_DISC_CONTROL_BLOCK_SESSION_ITEM, "")
            return this.__SessionItemProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved2 {
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 8192, 24576, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}

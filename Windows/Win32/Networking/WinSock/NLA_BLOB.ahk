#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NLA_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    nextOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    rawData{
        get {
            if(!this.HasProp("__rawDataProxyArray"))
                this.__rawDataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__rawDataProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwSpeed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<SByte>}
     */
    adapterName{
        get {
            if(!this.HasProp("__adapterNameProxyArray"))
                this.__adapterNameProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__adapterNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    information{
        get {
            if(!this.HasProp("__informationProxyArray"))
                this.__informationProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__informationProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    internet {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    speed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    type1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    state {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    machineName {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    sharedAdapterName {
        get => StrGet(this.ptr + 536, 255, "UTF-16")
        set => StrPut(value, this.ptr + 536, 255, "UTF-16")
    }
}

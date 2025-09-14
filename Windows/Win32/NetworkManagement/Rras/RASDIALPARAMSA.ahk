#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASDIALPARAMSA extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    szEntryName{
        get {
            if(!this.HasProp("__szEntryNameProxyArray"))
                this.__szEntryNameProxyArray := Win32FixedArray(this.ptr + 4, 257, Primitive, "char")
            return this.__szEntryNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szPhoneNumber{
        get {
            if(!this.HasProp("__szPhoneNumberProxyArray"))
                this.__szPhoneNumberProxyArray := Win32FixedArray(this.ptr + 261, 129, Primitive, "char")
            return this.__szPhoneNumberProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szCallbackNumber{
        get {
            if(!this.HasProp("__szCallbackNumberProxyArray"))
                this.__szCallbackNumberProxyArray := Win32FixedArray(this.ptr + 390, 129, Primitive, "char")
            return this.__szCallbackNumberProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szUserName{
        get {
            if(!this.HasProp("__szUserNameProxyArray"))
                this.__szUserNameProxyArray := Win32FixedArray(this.ptr + 519, 257, Primitive, "char")
            return this.__szUserNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szPassword{
        get {
            if(!this.HasProp("__szPasswordProxyArray"))
                this.__szPasswordProxyArray := Win32FixedArray(this.ptr + 776, 257, Primitive, "char")
            return this.__szPasswordProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDomain{
        get {
            if(!this.HasProp("__szDomainProxyArray"))
                this.__szDomainProxyArray := Win32FixedArray(this.ptr + 1033, 16, Primitive, "char")
            return this.__szDomainProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwSubEntry {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * @type {Pointer}
     */
    dwCallbackId {
        get => NumGet(this, 1056, "ptr")
        set => NumPut("ptr", value, this, 1056)
    }

    /**
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    szEncPassword {
        get => NumGet(this, 1072, "ptr")
        set => NumPut("ptr", value, this, 1072)
    }
}

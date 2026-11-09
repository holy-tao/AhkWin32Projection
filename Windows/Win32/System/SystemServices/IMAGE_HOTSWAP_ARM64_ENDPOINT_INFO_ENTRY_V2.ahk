#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_HOTSWAP_ARM64_ENDPOINT_INFO_CC_RETURN.ahk
#Include .\IMAGE_HOTSWAP_ENDPOINT_INFO_ENTRY_COMMON.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_HOTSWAP_ARM64_ENDPOINT_INFO_ENTRY_V2 extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {IMAGE_HOTSWAP_ENDPOINT_INFO_ENTRY_COMMON}
     */
    Common {
        get {
            if(!this.HasProp("__Common"))
                this.__Common := IMAGE_HOTSWAP_ENDPOINT_INFO_ENTRY_COMMON(0, this)
            return this.__Common
        }
    }

    /**
     * @type {Integer}
     */
    IntArgs {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    FloatArgs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ArgStackSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {IMAGE_HOTSWAP_ARM64_ENDPOINT_INFO_CC_RETURN}
     */
    ReturnType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Array<Integer>}
     */
    Name {
        get {
            if(!this.HasProp("__NameProxyArray"))
                this.__NameProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__NameProxyArray
        }
    }
}

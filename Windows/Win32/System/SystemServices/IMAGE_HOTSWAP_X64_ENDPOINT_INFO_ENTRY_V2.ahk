#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_HOTSWAP_ENDPOINT_INFO_ENTRY_COMMON.ahk
#Include .\IMAGE_HOTSWAP_X64_ENDPOINT_INFO_CC_REG.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_HOTSWAP_X64_ENDPOINT_INFO_ENTRY_V2 extends Win32Struct {
    static sizeof => 44

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
     * @type {Array<IMAGE_HOTSWAP_X64_ENDPOINT_INFO_CC_REG>}
     */
    ArgRegs {
        get {
            if(!this.HasProp("__ArgRegsProxyArray"))
                this.__ArgRegsProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "int")
            return this.__ArgRegsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ArgStackSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {IMAGE_HOTSWAP_X64_ENDPOINT_INFO_CC_REG}
     */
    RetReg {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    Name {
        get {
            if(!this.HasProp("__NameProxyArray"))
                this.__NameProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__NameProxyArray
        }
    }
}

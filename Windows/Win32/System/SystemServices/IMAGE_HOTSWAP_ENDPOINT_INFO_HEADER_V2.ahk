#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_HOTSWAP_ENDPOINT_INFO_HEADER_COMMON.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_HOTSWAP_ENDPOINT_INFO_HEADER_V2 extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {IMAGE_HOTSWAP_ENDPOINT_INFO_HEADER_COMMON}
     */
    Common {
        get {
            if(!this.HasProp("__Common"))
                this.__Common := IMAGE_HOTSWAP_ENDPOINT_INFO_HEADER_COMMON(0, this)
            return this.__Common
        }
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

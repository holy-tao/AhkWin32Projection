#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_MEMORY_CORRECTABLE_ERROR_DATA.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_MEMORY_CORRECTABLE_ERROR_SECTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_MEMORY_CORRECTABLE_ERROR_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<WHEA_MEMORY_CORRECTABLE_ERROR_DATA>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__DataProxyArray
        }
    }
}

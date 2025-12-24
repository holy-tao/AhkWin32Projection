#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_NMI_ERROR_SECTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__DataProxyArray
        }
    }

    /**
     * @type {Pointer<WHEA_NMI_ERROR_SECTION_FLAGS>}
     */
    Flags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

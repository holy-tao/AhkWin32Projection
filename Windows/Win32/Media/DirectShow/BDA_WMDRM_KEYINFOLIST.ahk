#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_WMDRM_KEYINFOLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulKeyuuidBufferLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Guid>}
     */
    argKeyuuidBuffer{
        get {
            if(!this.HasProp("__argKeyuuidBufferProxyArray"))
                this.__argKeyuuidBufferProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__argKeyuuidBufferProxyArray
        }
    }
}

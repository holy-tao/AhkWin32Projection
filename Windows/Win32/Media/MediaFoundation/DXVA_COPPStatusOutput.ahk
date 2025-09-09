#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_COPPStatusOutput extends Win32Struct
{
    static sizeof => 4088

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    macKDI {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    COPPStatus{
        get {
            if(!this.HasProp("__COPPStatusProxyArray"))
                this.__COPPStatusProxyArray := Win32FixedArray(this.ptr + 12, 4076, Primitive, "char")
            return this.__COPPStatusProxyArray
        }
    }
}

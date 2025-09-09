#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_PID_MAP extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MediaSampleContent {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulcPIDs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    aulPIDs{
        get {
            if(!this.HasProp("__aulPIDsProxyArray"))
                this.__aulPIDsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__aulPIDsProxyArray
        }
    }
}

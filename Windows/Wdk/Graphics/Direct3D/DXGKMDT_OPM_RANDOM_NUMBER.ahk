#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_RANDOM_NUMBER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    abRandomNumber{
        get {
            if(!this.HasProp("__abRandomNumberProxyArray"))
                this.__abRandomNumberProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__abRandomNumberProxyArray
        }
    }
}

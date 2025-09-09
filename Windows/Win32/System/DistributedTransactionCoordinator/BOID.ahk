#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class BOID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    rgb{
        get {
            if(!this.HasProp("__rgbProxyArray"))
                this.__rgbProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__rgbProxyArray
        }
    }
}

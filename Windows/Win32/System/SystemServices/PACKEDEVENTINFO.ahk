#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PACKEDEVENTINFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulNumEventsForLogFile {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    ulOffsets{
        get {
            if(!this.HasProp("__ulOffsetsProxyArray"))
                this.__ulOffsetsProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__ulOffsetsProxyArray
        }
    }
}

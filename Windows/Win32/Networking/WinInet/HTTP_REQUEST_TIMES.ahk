#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_REQUEST_TIMES extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cTimes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt64>}
     */
    rgTimes{
        get {
            if(!this.HasProp("__rgTimesProxyArray"))
                this.__rgTimesProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "uint")
            return this.__rgTimesProxyArray
        }
    }
}

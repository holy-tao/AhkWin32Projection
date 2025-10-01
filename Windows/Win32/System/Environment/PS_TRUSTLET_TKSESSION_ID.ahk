#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class PS_TRUSTLET_TKSESSION_ID extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    SessionId{
        get {
            if(!this.HasProp("__SessionIdProxyArray"))
                this.__SessionIdProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__SessionIdProxyArray
        }
    }
}

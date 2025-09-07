#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_TS_SELECTORINFO_ISDBS_EXT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    bTMCC{
        get {
            if(!this.HasProp("__bTMCCProxyArray"))
                this.__bTMCCProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__bTMCCProxyArray
        }
    }
}

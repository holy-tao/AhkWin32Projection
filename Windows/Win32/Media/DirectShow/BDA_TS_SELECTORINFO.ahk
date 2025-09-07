#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_TS_SELECTORINFO extends Win32Struct
{
    static sizeof => 14

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bTSInfolength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    bReserved{
        get {
            if(!this.HasProp("__bReservedProxyArray"))
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidNetworkType {
        get => NumGet(this, 3, "ptr")
        set => NumPut("ptr", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bTSIDCount {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Array<UInt16>}
     */
    usTSID{
        get {
            if(!this.HasProp("__usTSIDProxyArray"))
                this.__usTSIDProxyArray := Win32FixedArray(this.ptr + 12, 2, Primitive, "ushort")
            return this.__usTSIDProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_TS_SELECTORINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 1, 2, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidNetworkType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bTSIDCount {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<UInt16>}
     */
    usTSID{
        get {
            if(!this.HasProp("__usTSIDProxyArray"))
                this.__usTSIDProxyArray := Win32FixedArray(this.ptr + 18, 1, Primitive, "ushort")
            return this.__usTSIDProxyArray
        }
    }
}

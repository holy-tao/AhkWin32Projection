#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SVCB_PARAM_UNKNOWN extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    pbSvcParamValue{
        get {
            if(!this.HasProp("__pbSvcParamValueProxyArray"))
                this.__pbSvcParamValueProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__pbSvcParamValueProxyArray
        }
    }
}

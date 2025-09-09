#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SVCB_PARAM_MANDATORY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    cMandatoryKeys {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<UInt16>}
     */
    rgwMandatoryKeys{
        get {
            if(!this.HasProp("__rgwMandatoryKeysProxyArray"))
                this.__rgwMandatoryKeysProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "ushort")
            return this.__rgwMandatoryKeysProxyArray
        }
    }
}

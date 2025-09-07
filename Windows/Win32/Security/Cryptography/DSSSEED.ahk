#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds the seed and counter values that can be used to verify the primes of the DSS public key.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-dssseed
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class DSSSEED extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A <b>DWORD</b> containing the counter value. If the counter value is 0xFFFFFFFF, the seed and counter values are not available.
     * @type {Integer}
     */
    counter {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>BYTE</b> string containing the seed value.
     * @type {Array<Byte>}
     */
    seed{
        get {
            if(!this.HasProp("__seedProxyArray"))
                this.__seedProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__seedProxyArray
        }
    }
}

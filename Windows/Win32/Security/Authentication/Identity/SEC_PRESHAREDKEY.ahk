#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the pre-shared key information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_presharedkey
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_PRESHAREDKEY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The size of the PSK.
     * @type {Integer}
     */
    KeySize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The PSK.
     * @type {Array<Byte>}
     */
    Key{
        get {
            if(!this.HasProp("__KeyProxyArray"))
                this.__KeyProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__KeyProxyArray
        }
    }
}

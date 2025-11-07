#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an array of exactly 16 bytes.
 * @remarks
 * 
 * This data type  is useful for IPv6 addresses.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwp_byte_array16
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_BYTE_ARRAY16 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Array of 16 bytes.
     * @type {Array<Byte>}
     */
    byteArray16{
        get {
            if(!this.HasProp("__byteArray16ProxyArray"))
                this.__byteArray16ProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__byteArray16ProxyArray
        }
    }
}

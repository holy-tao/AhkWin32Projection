#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an array of exactly 6 bytes. Reserved.
 * @remarks
 * This structure is reserved.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_byte_array6
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_BYTE_ARRAY6 extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * Array of 6 bytes.
     * @type {Array<Byte>}
     */
    byteArray6{
        get {
            if(!this.HasProp("__byteArray6ProxyArray"))
                this.__byteArray6ProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__byteArray6ProxyArray
        }
    }
}

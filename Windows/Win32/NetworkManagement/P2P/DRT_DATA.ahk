#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DRT_DATA structure contains a data blob. This structure is used by several DRT functions.
 * @see https://docs.microsoft.com/windows/win32/api//drt/ns-drt-drt_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a byte array that contains the common data.
     * @type {Pointer<Byte>}
     */
    pb {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

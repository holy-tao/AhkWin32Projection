#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IntServServiceHdr structure is a header for Integrated Services service objects.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-intservservicehdr
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IntServServiceHdr extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Service number of the attached object.
     * @type {Integer}
     */
    issh_service {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Flags for the corresponding service object.
     * @type {Integer}
     */
    issh_flags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Number of 32-bit WORDs in the object, excluding this header object.
     * @type {Integer}
     */
    issh_len32b {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}

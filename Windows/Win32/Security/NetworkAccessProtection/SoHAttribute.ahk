#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the SoH protocol between the SHA/SHV and the NAP system.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-sohattribute
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class SoHAttribute extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">SoHAttributeType</a> value that defines the attribute type contained in <b>value</b>.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The size, in bytes, of the SoH attribute pointed to by <b>value</b> and has a range of 0 to <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxSoHAttributeSize</a>.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributevalue-union">SoHAttributeValue</a> structure that contains the SoH attribute value as defined by <b>type</b>.
     * @type {Pointer<Byte>}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

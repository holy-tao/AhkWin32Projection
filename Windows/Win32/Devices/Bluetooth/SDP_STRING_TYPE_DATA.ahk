#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SDP_STRING_TYPE_DATA structure stores information about SDP string types.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-sdp_string_type_data
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class SDP_STRING_TYPE_DATA extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Specifies how the string is encoded according to ISO 639:1988 (E/F): Code for the representation of the names of languages.
     * @type {Integer}
     */
    encoding {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * MIBE number from the IANA database.
     * @type {Integer}
     */
    mibeNum {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Identifier of the base attribute in which the string is to be found in the record.
     * @type {Integer}
     */
    attributeId {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}

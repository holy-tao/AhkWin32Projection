#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SDP_STRING_TYPE_DATA structure stores information about SDP string types.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-sdp_string_type_data
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SDP_STRING_TYPE_DATA {
    #StructPack 2

    /**
     * Specifies how the string is encoded according to ISO 639:1988 (E/F): Code for the representation of the names of languages.
     */
    encoding : UInt16

    /**
     * MIBE number from the IANA database.
     */
    mibeNum : UInt16

    /**
     * Identifier of the base attribute in which the string is to be found in the record.
     */
    attributeId : UInt16

}

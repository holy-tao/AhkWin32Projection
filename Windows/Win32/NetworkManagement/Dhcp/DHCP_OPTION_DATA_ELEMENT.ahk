#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWORD_DWORD.ahk" { DWORD_DWORD }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }
#Import ".\DHCP_OPTION_DATA_TYPE.ahk" { DHCP_OPTION_DATA_TYPE }

/**
 * The DHCP_OPTION_DATA_ELEMENT structure defines a data element present (either singly or as a member of an array) within a DHCP_OPTION_DATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data_element
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_DATA_ELEMENT {
    #StructPack 8


    struct DHCP_OPTION_ELEMENT_UNION {
        ByteOption : Int8

        static __New() {
            DefineProp(this.Prototype, 'WordOption', { type: UInt16, offset: 0 })
            DefineProp(this.Prototype, 'DWordOption', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'DWordDWordOption', { type: DWORD_DWORD, offset: 0 })
            DefineProp(this.Prototype, 'IpAddressOption', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'StringDataOption', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'BinaryDataOption', { type: DHCP_BINARY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'EncapsulatedDataOption', { type: DHCP_BINARY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Ipv6AddressDataOption', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_data_type">DHCP_OPTION_DATA_TYPE</a> enumeration value that indicates the type of data that is present in the subsequent field, <b>Element</b>.
     */
    OptionType : DHCP_OPTION_DATA_TYPE

    Element : DHCP_OPTION_DATA_ELEMENT.DHCP_OPTION_ELEMENT_UNION

}

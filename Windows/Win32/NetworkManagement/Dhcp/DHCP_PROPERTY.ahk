#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_PROPERTY_ID.ahk" { DHCP_PROPERTY_ID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_PROPERTY_TYPE.ahk" { DHCP_PROPERTY_TYPE }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_PROPERTY {
    #StructPack 8


    struct _DHCP_PROPERTY_VALUE_UNION {
        ByteValue : Int8

        static __New() {
            DefineProp(this.Prototype, 'WordValue', { type: UInt16, offset: 0 })
            DefineProp(this.Prototype, 'DWordValue', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'StringValue', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'BinaryValue', { type: DHCP_BINARY_DATA, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ID : DHCP_PROPERTY_ID

    Type : DHCP_PROPERTY_TYPE

    Value : DHCP_PROPERTY._DHCP_PROPERTY_VALUE_UNION

}

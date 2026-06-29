#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ADDRESSING_VERSION.ahk" { WS_ADDRESSING_VERSION }

/**
 * Information about a mapping between a WS_ENDPOINT_ADDRESS and an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_address_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENDPOINT_ADDRESS_DESCRIPTION {
    #StructPack 4

    /**
     * The WS-Addressing version to use when serializing the endpoint address.
     */
    addressingVersion : WS_ADDRESSING_VERSION

}

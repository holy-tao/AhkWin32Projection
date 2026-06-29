#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT.ahk" { SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT }

/**
 * Stores a list of application protocols.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocol_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_APPLICATION_PROTOCOL_LIST {
    #StructPack 4

    /**
     * The protocol negotiation extension type to use with this list of protocols.
     */
    ProtoNegoExt : SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT

    /**
     * The size (in bytes) of the protocol list.
     */
    ProtocolListSize : UInt16

    /**
     * A list of 8-bit length-prefixed application protocol IDs, most preferred first.
     */
    ProtocolList : Int8[1]

}

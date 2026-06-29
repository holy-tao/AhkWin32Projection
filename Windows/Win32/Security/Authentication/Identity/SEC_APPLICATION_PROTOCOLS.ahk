#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT.ahk" { SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT }
#Import ".\SEC_APPLICATION_PROTOCOL_LIST.ahk" { SEC_APPLICATION_PROTOCOL_LIST }

/**
 * Stores an array of application protocol lists.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocols
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_APPLICATION_PROTOCOLS {
    #StructPack 4

    /**
     * The size (in bytes) of the protocol ID lists array.
     */
    ProtocolListsSize : UInt32

    /**
     * The array of protocol ID lists.
     */
    ProtocolLists : SEC_APPLICATION_PROTOCOL_LIST[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT.ahk" { SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT }
#Import ".\SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS.ahk" { SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS }

/**
 * Contains information about the application protocol of the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_applicationprotocol
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_ApplicationProtocol {
    #StructPack 4

    /**
     * The application protocol negotiation status.
     */
    ProtoNegoStatus : SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS

    /**
     * The protocol negotiation extension type corresponding to this protocol ID.
     */
    ProtoNegoExt : SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT

    /**
     * The size (in bytes) of the application protocol ID.
     */
    ProtocolIdSize : Int8

    /**
     * A byte string representing the negotiated application protocol ID.
     */
    ProtocolId : Int8[255]

}

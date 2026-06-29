#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WTS_CERT_TYPE.ahk" { WTS_CERT_TYPE }

/**
 * Contains information about the licensing capabilities of the client.
 * @remarks
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestlicensingcapabilities">RequestLicensingCapabilities</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_license_capabilities
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_LICENSE_CAPABILITIES {
    #StructPack 4

    KeyExchangeAlg : UInt32

    /**
     * An integer that specifies the supported licensing protocol. This must be <b>WTS_LICENSE_CURRENT_PROTOCOL_VERSION</b>.
     */
    ProtocolVer : UInt32

    /**
     * A Boolean value that specifies whether the client will authenticate the server.
     */
    fAuthenticateServer : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_cert_type">WTS_CERT_TYPE</a> enumeration value that specifies the type of the certificate used to obtain the license.
     */
    CertType : WTS_CERT_TYPE

    /**
     * An integer that contains the size, in bytes, of the client name specified by the <b>rgbClientName</b> member.
     */
    cbClientName : UInt32

    /**
     * The client name, including a terminating null character.
     */
    rgbClientName : Int8[42]

}

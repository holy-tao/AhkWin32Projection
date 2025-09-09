#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the licensing capabilities of the client.
 * @remarks
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestlicensingcapabilities">RequestLicensingCapabilities</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_license_capabilities
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_LICENSE_CAPABILITIES extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    KeyExchangeAlg {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An integer that specifies the supported licensing protocol. This must be <b>WTS_LICENSE_CURRENT_PROTOCOL_VERSION</b>.
     * @type {Integer}
     */
    ProtocolVer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A Boolean value that specifies whether the client will authenticate the server.
     * @type {Integer}
     */
    fAuthenticateServer {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_cert_type">WTS_CERT_TYPE</a> enumeration value that specifies the type of the certificate used to obtain the license.
     * @type {Integer}
     */
    CertType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An integer that contains the size, in bytes, of the client name specified by the <b>rgbClientName</b> member.
     * @type {Integer}
     */
    cbClientName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The client name, including a terminating null character.
     * @type {Array<Byte>}
     */
    rgbClientName{
        get {
            if(!this.HasProp("__rgbClientNameProxyArray"))
                this.__rgbClientNameProxyArray := Win32FixedArray(this.ptr + 20, 42, Primitive, "char")
            return this.__rgbClientNameProxyArray
        }
    }
}

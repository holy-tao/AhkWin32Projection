#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies channel binding information for a security context.
 * @remarks
 * Schannel sets  to zero the value of all members of this structure other than <b>cbApplicationDataLength</b> and <b>dwApplicationDataOffset</b>.
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Security support providers</a> (SSPs) other than Schannel should use the values of this structure obtained by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesw">QueryContextAttributes (Schannel)</a> function  to pass as a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure of type <b>SECBUFFER_CHANNEL_BINDINGS</b> as one of the buffers in the <i>pInput</i> parameter of a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
  * 
  * An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) other than Schannel should obtain the channel binding information specified by this structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesw">QueryContextAttributes (Schannel)</a> function on the Schannel context that the client used to authenticate. Pass this channel binding information as a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure of type <b>SECBUFFER_CHANNEL_BINDINGS</b> to the <i>pInput</i> parameter of a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
  * 
  *  If the value of the <i>ulAttribute</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesw">QueryContextAttributes (Schannel)</a> function is <b>SECPKG_ATTR_UNIQUE_BINDINGS</b>, the channel binding data specified by this structure begins with "tls-unique:".
  * 
  * If the value of the <i>ulAttribute</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesw">QueryContextAttributes (Schannel)</a> function is <b>SECPKG_ATTR_ENDPOINT_BINDINGS</b>, the channel binding data specified by this structure begins with "tls-server-end-point:".
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_channel_bindings
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_CHANNEL_BINDINGS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The type of  address (for example, HTTP) specified for the client.
     * @type {Integer}
     */
    dwInitiatorAddrType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the data that specifies the client address.
     * @type {Integer}
     */
    cbInitiatorLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes from the beginning of this structure to the beginning of the data that specifies the client address.
     * @type {Integer}
     */
    dwInitiatorOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The type of  address (for example, SPN) specified for the server.
     * @type {Integer}
     */
    dwAcceptorAddrType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size, in bytes, of the data that specifies the server address.
     * @type {Integer}
     */
    cbAcceptorLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of bytes from the beginning of this structure to the beginning of the data that specifies the server address.
     * @type {Integer}
     */
    dwAcceptorOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The size, in bytes, of the channel binding data.
     * @type {Integer}
     */
    cbApplicationDataLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The size, in  bytes, of this structure. The channel binding data immediately follows this structure.
     * @type {Integer}
     */
    dwApplicationDataOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains input data for the ID3D11VideoContext::ConfigureAuthenticatedChannel method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CONFIGURE_INPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_omac">D3D11_OMAC</a> structure that contains a Message Authentication Code (MAC) of the data. The driver uses AES-based one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     * @type {D3D11_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := D3D11_OMAC(0, this)
            return this.__omac
        }
    }

    /**
     * A GUID that specifies the command. The following GUIDs are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_CONFIGURE_CRYPTO_SESSION"></a><a id="d3d11_authenticated_configure_crypto_session"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_CONFIGURE_CRYPTO_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Associates a cryptographic session with a decoder device and a Direct3D device.
     * 
     * 
     * 
     * Input data: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_crypto_session_input">D3D11_AUTHENTICATED_CONFIGURE_CRYPTO_SESSION_INPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_CONFIGURE_ENCRYPTION_WHEN_ACCESSIBLE"></a><a id="d3d11_authenticated_configure_encryption_when_accessible"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_CONFIGURE_ENCRYPTION_WHEN_ACCESSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the level of encryption that is performed before protected content becomes accessible to the CPU or bus.
     * 
     * 
     * 
     * Input data: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_accessible_encryption_input">D3D11_AUTHENTICATED_CONFIGURE_ACCESSIBLE_ENCRYPTION_INPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_CONFIGURE_INITIALIZE"></a><a id="d3d11_authenticated_configure_initialize"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_CONFIGURE_INITIALIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Initializes the authenticated channel.
     * 
     * 
     * 
     * Input data: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_initialize_input">D3D11_AUTHENTICATED_CONFIGURE_INITIALIZE_INPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_CONFIGURE_PROTECTION"></a><a id="d3d11_authenticated_configure_protection"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_CONFIGURE_PROTECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables or disables protection for the device.
     * 
     * 
     * 
     * Input data: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_protection_input">D3D11_AUTHENTICATED_CONFIGURE_PROTECTION_INPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE"></a><a id="d3d11_authenticated_configure_shared_resource"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables a process to open a shared resource, or disables a process from opening shared resources.
     * 
     * 
     * 
     * Input data: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_shared_resource_input">D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE_INPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    ConfigureType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A handle to the authenticated channel. To get the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getchannelhandle">ID3D11AuthenticatedChannel::GetChannelHandle</a> method.
     * @type {HANDLE}
     */
    hChannel{
        get {
            if(!this.HasProp("__hChannel"))
                this.__hChannel := HANDLE(24, this)
            return this.__hChannel
        }
    }

    /**
     * The query sequence number. At the start of the session, generate a cryptographically secure 32-bit random number to use as the starting sequence number. For each query, increment the sequence number by 1.
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

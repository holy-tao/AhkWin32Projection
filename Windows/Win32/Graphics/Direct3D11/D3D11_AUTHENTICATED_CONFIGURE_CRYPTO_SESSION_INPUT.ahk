#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_CRYPTO_SESSION command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_crypto_session_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CONFIGURE_CRYPTO_SESSION_INPUT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure that contains the command GUID and other data.
     * @type {D3D11_AUTHENTICATED_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3D11_AUTHENTICATED_CONFIGURE_INPUT(0, this)
            return this.__Parameters
        }
    }

    /**
     * A handle to the decoder device. Get this from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodecoder-getdriverhandle">ID3D11VideoDecoder::GetDriverHandle</a>.
     * @type {HANDLE}
     */
    DecoderHandle{
        get {
            if(!this.HasProp("__DecoderHandle"))
                this.__DecoderHandle := HANDLE(40, this)
            return this.__DecoderHandle
        }
    }

    /**
     * A handle to the cryptographic session. Get this from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11cryptosession-getcryptosessionhandle">ID3D11CryptoSession::GetCryptoSessionHandle</a>.
     * @type {HANDLE}
     */
    CryptoSessionHandle{
        get {
            if(!this.HasProp("__CryptoSessionHandle"))
                this.__CryptoSessionHandle := HANDLE(48, this)
            return this.__CryptoSessionHandle
        }
    }

    /**
     * A handle to the Direct3D device. Get this from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-queryauthenticatedchannel">D3D11VideoContext::QueryAuthenticatedChannel</a> using <b>D3D11_AUTHENTICATED_QUERY_DEVICE_HANDLE</b>.
     * @type {HANDLE}
     */
    DeviceHandle{
        get {
            if(!this.HasProp("__DeviceHandle"))
                this.__DeviceHandle := HANDLE(56, this)
            return this.__DeviceHandle
        }
    }
}

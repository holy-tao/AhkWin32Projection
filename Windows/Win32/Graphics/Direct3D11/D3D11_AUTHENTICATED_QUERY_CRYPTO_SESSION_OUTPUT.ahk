#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION query.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_query_crypto_session_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION_OUTPUT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3D11_AUTHENTICATED_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3D11_AUTHENTICATED_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * A handle to a decoder device.
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
     * A handle to the cryptographic session that is associated with the decoder device.
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
     * A handle to the Direct3D device that is associated with the decoder device.
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

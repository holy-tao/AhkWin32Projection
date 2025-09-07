#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the status of an ID3D11CryptoSession interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_crypto_session_status
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CRYPTO_SESSION_STATUS{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> is in a functional state.
     * @type {Integer (Int32)}
     */
    static D3D11_CRYPTO_SESSION_STATUS_OK => 0

    /**
     * The underlying hardware key for the specified <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> has become lost.
     * @type {Integer (Int32)}
     */
    static D3D11_CRYPTO_SESSION_STATUS_KEY_LOST => 1

    /**
     * The underlying hardware key for the specified <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> has become lost and protected content has become corrupted.
     * @type {Integer (Int32)}
     */
    static D3D11_CRYPTO_SESSION_STATUS_KEY_AND_CONTENT_LOST => 2
}

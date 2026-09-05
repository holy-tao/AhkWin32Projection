#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the status of an ID3D11CryptoSession interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_crypto_session_status
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_CRYPTO_SESSION_STATUS extends Win32Enum {

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> is in a functional state.
     * Native name: D3D11_CRYPTO_SESSION_STATUS_OK
     * @type {Integer (Int32)}
     */
    static OK => 0

    /**
     * The underlying hardware key for the specified <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> has become lost.
     * Native name: D3D11_CRYPTO_SESSION_STATUS_KEY_LOST
     * @type {Integer (Int32)}
     */
    static KEY_LOST => 1

    /**
     * The underlying hardware key for the specified <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> has become lost and protected content has become corrupted.
     * Native name: D3D11_CRYPTO_SESSION_STATUS_KEY_AND_CONTENT_LOST
     * @type {Integer (Int32)}
     */
    static KEY_AND_CONTENT_LOST => 2
}

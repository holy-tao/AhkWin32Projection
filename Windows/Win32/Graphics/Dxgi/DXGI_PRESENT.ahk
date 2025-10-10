#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_PRESENT{

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_TEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_DO_NOT_SEQUENCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_RESTART => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_DO_NOT_WAIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_STEREO_PREFER_RIGHT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_STEREO_TEMPORARY_MONO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_RESTRICT_TO_OUTPUT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_USE_DURATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_PRESENT_ALLOW_TEARING => 512
}

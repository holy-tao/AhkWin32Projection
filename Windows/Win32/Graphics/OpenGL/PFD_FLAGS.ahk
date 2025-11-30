#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class PFD_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_DOUBLEBUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_STEREO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_DRAW_TO_WINDOW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_DRAW_TO_BITMAP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SUPPORT_GDI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SUPPORT_OPENGL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_GENERIC_FORMAT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_NEED_PALETTE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_NEED_SYSTEM_PALETTE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SWAP_EXCHANGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SWAP_COPY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SWAP_LAYER_BUFFERS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_GENERIC_ACCELERATED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SUPPORT_DIRECTDRAW => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_DIRECT3D_ACCELERATED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_SUPPORT_COMPOSITION => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_DEPTH_DONTCARE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_DOUBLEBUFFER_DONTCARE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PFD_STEREO_DONTCARE => 2147483648
}

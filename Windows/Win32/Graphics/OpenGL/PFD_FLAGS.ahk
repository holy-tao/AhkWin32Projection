#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
class PFD_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PFD_DOUBLEBUFFER
     * @type {Integer (UInt32)}
     */
    static DOUBLEBUFFER => 1

    /**
     * Native name: PFD_STEREO
     * @type {Integer (UInt32)}
     */
    static STEREO => 2

    /**
     * Native name: PFD_DRAW_TO_WINDOW
     * @type {Integer (UInt32)}
     */
    static DRAW_TO_WINDOW => 4

    /**
     * Native name: PFD_DRAW_TO_BITMAP
     * @type {Integer (UInt32)}
     */
    static DRAW_TO_BITMAP => 8

    /**
     * Native name: PFD_SUPPORT_GDI
     * @type {Integer (UInt32)}
     */
    static SUPPORT_GDI => 16

    /**
     * Native name: PFD_SUPPORT_OPENGL
     * @type {Integer (UInt32)}
     */
    static SUPPORT_OPENGL => 32

    /**
     * Native name: PFD_GENERIC_FORMAT
     * @type {Integer (UInt32)}
     */
    static GENERIC_FORMAT => 64

    /**
     * Native name: PFD_NEED_PALETTE
     * @type {Integer (UInt32)}
     */
    static NEED_PALETTE => 128

    /**
     * Native name: PFD_NEED_SYSTEM_PALETTE
     * @type {Integer (UInt32)}
     */
    static NEED_SYSTEM_PALETTE => 256

    /**
     * Native name: PFD_SWAP_EXCHANGE
     * @type {Integer (UInt32)}
     */
    static SWAP_EXCHANGE => 512

    /**
     * Native name: PFD_SWAP_COPY
     * @type {Integer (UInt32)}
     */
    static SWAP_COPY => 1024

    /**
     * Native name: PFD_SWAP_LAYER_BUFFERS
     * @type {Integer (UInt32)}
     */
    static SWAP_LAYER_BUFFERS => 2048

    /**
     * Native name: PFD_GENERIC_ACCELERATED
     * @type {Integer (UInt32)}
     */
    static GENERIC_ACCELERATED => 4096

    /**
     * Native name: PFD_SUPPORT_DIRECTDRAW
     * @type {Integer (UInt32)}
     */
    static SUPPORT_DIRECTDRAW => 8192

    /**
     * Native name: PFD_DIRECT3D_ACCELERATED
     * @type {Integer (UInt32)}
     */
    static DIRECT3D_ACCELERATED => 16384

    /**
     * Native name: PFD_SUPPORT_COMPOSITION
     * @type {Integer (UInt32)}
     */
    static SUPPORT_COMPOSITION => 32768

    /**
     * Native name: PFD_DEPTH_DONTCARE
     * @type {Integer (UInt32)}
     */
    static DEPTH_DONTCARE => 536870912

    /**
     * Native name: PFD_DOUBLEBUFFER_DONTCARE
     * @type {Integer (UInt32)}
     */
    static DOUBLEBUFFER_DONTCARE => 1073741824

    /**
     * Native name: PFD_STEREO_DONTCARE
     * @type {Integer (UInt32)}
     */
    static STEREO_DONTCARE => 2147483648
}

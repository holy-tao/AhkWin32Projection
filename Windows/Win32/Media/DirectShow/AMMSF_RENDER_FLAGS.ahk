#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AMMSF_RENDER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: AMMSF_RENDERTYPEMASK
     * @type {Integer (Int32)}
     */
    static RENDERTYPEMASK => 3

    /**
     * Native name: AMMSF_RENDERTOEXISTING
     * @type {Integer (Int32)}
     */
    static RENDERTOEXISTING => 0

    /**
     * Native name: AMMSF_RENDERALLSTREAMS
     * @type {Integer (Int32)}
     */
    static RENDERALLSTREAMS => 1

    /**
     * Native name: AMMSF_NORENDER
     * @type {Integer (Int32)}
     */
    static NORENDER => 2

    /**
     * Native name: AMMSF_NOCLOCK
     * @type {Integer (Int32)}
     */
    static NOCLOCK => 4

    /**
     * Native name: AMMSF_RUN
     * @type {Integer (Int32)}
     */
    static RUN => 8
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_INTERLEAVE_FORMAT extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_INTERLEAVE_FORMAT_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * Native name: DXGKMDT_OPM_INTERLEAVE_FORMAT_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static PROGRESSIVE => 2

    /**
     * Native name: DXGKMDT_OPM_INTERLEAVE_FORMAT_INTERLEAVED_EVEN_FIRST
     * @type {Integer (Int32)}
     */
    static INTERLEAVED_EVEN_FIRST => 3

    /**
     * Native name: DXGKMDT_OPM_INTERLEAVE_FORMAT_INTERLEAVED_ODD_FIRST
     * @type {Integer (Int32)}
     */
    static INTERLEAVED_ODD_FIRST => 4
}

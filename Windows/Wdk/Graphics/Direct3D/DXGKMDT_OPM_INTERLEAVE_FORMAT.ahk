#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_INTERLEAVE_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_PROGRESSIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_INTERLEAVED_EVEN_FIRST => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_INTERLEAVE_FORMAT_INTERLEAVED_ODD_FIRST => 4
}

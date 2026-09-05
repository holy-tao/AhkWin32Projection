#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE_APERTURE
     * @type {Integer (Int32)}
     */
    static APERTURE => 0

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE_MEMORY
     * @type {Integer (Int32)}
     */
    static MEMORY => 1

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE_SYSMEM
     * @type {Integer (Int32)}
     */
    static SYSMEM => 2
}

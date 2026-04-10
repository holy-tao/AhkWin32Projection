#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE_APERTURE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE_MEMORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT_TYPE_SYSMEM => 2
}

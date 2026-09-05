#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MEMORY_SEGMENT_GROUP extends Win32Enum {

    /**
     * Native name: D3DKMT_MEMORY_SEGMENT_GROUP_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 0

    /**
     * Native name: D3DKMT_MEMORY_SEGMENT_GROUP_NON_LOCAL
     * @type {Integer (Int32)}
     */
    static NON_LOCAL => 1
}

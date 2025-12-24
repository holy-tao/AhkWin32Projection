#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MEMORY_SEGMENT_GROUP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MEMORY_SEGMENT_GROUP_LOCAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MEMORY_SEGMENT_GROUP_NON_LOCAL => 1
}

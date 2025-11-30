#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class MODIFY_WORLD_TRANSFORM_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MWT_IDENTITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MWT_LEFTMULTIPLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MWT_RIGHTMULTIPLY => 3
}

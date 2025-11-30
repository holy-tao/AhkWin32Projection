#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class ICONEFFECT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ICE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICE_GLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICE_SHADOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICE_PULSE => 3

    /**
     * @type {Integer (Int32)}
     */
    static ICE_ALPHA => 4
}

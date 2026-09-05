#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CombineMode extends Win32Enum {

    /**
     * Native name: CombineModeReplace
     * @type {Integer (Int32)}
     */
    static Replace => 0

    /**
     * Native name: CombineModeIntersect
     * @type {Integer (Int32)}
     */
    static Intersect => 1

    /**
     * Native name: CombineModeUnion
     * @type {Integer (Int32)}
     */
    static Union => 2

    /**
     * Native name: CombineModeXor
     * @type {Integer (Int32)}
     */
    static Xor => 3

    /**
     * Native name: CombineModeExclude
     * @type {Integer (Int32)}
     */
    static Exclude => 4

    /**
     * Native name: CombineModeComplement
     * @type {Integer (Int32)}
     */
    static Complement => 5
}

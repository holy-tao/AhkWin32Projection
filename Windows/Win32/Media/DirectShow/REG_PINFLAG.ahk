#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class REG_PINFLAG extends Win32BitflagEnum {

    /**
     * Native name: REG_PINFLAG_B_ZERO
     * @type {Integer (Int32)}
     */
    static B_ZERO => 1

    /**
     * Native name: REG_PINFLAG_B_RENDERER
     * @type {Integer (Int32)}
     */
    static B_RENDERER => 2

    /**
     * Native name: REG_PINFLAG_B_MANY
     * @type {Integer (Int32)}
     */
    static B_MANY => 4

    /**
     * Native name: REG_PINFLAG_B_OUTPUT
     * @type {Integer (Int32)}
     */
    static B_OUTPUT => 8
}

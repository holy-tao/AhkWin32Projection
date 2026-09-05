#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class RECO_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: RECO_PASTE
     * @type {Integer (UInt32)}
     */
    static PASTE => 0

    /**
     * Native name: RECO_DROP
     * @type {Integer (UInt32)}
     */
    static DROP => 1

    /**
     * Native name: RECO_COPY
     * @type {Integer (UInt32)}
     */
    static COPY => 2

    /**
     * Native name: RECO_CUT
     * @type {Integer (UInt32)}
     */
    static CUT => 3

    /**
     * Native name: RECO_DRAG
     * @type {Integer (UInt32)}
     */
    static DRAG => 4
}

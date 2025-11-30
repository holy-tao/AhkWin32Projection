#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class RECO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RECO_PASTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RECO_DROP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RECO_COPY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RECO_CUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RECO_DRAG => 4
}

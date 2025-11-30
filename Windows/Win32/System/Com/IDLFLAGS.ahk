#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDLFLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FIN => 1

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FOUT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FLCID => 4

    /**
     * @type {Integer (UInt16)}
     */
    static IDLFLAG_FRETVAL => 8
}

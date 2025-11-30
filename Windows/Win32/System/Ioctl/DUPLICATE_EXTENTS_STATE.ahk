#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DUPLICATE_EXTENTS_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FileSnapStateInactive => 0

    /**
     * @type {Integer (Int32)}
     */
    static FileSnapStateSource => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileSnapStateTarget => 2
}

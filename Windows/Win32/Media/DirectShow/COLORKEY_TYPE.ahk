#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COLORKEY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CK_NOCOLORKEY => 0

    /**
     * @type {Integer (Int32)}
     */
    static CK_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static CK_RGB => 2
}

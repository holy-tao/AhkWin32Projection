#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPIDSPTSI extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_ActiveOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_ActiveLength => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_SelectionOffset => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPIDSPTSI_SelectionLength => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPIDSPTSI extends Win32Enum {

    /**
     * Native name: DISPIDSPTSI_ActiveOffset
     * @type {Integer (Int32)}
     */
    static ActiveOffset => 1

    /**
     * Native name: DISPIDSPTSI_ActiveLength
     * @type {Integer (Int32)}
     */
    static ActiveLength => 2

    /**
     * Native name: DISPIDSPTSI_SelectionOffset
     * @type {Integer (Int32)}
     */
    static SelectionOffset => 3

    /**
     * Native name: DISPIDSPTSI_SelectionLength
     * @type {Integer (Int32)}
     */
    static SelectionLength => 4
}

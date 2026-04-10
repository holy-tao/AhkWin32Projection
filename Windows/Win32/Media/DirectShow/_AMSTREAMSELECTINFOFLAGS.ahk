#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class _AMSTREAMSELECTINFOFLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static AMSTREAMSELECTINFO_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMSTREAMSELECTINFO_EXCLUSIVE => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class SSUPDATE_TYPE extends Win32Enum {

    /**
     * Native name: SSUPDATE_ASYNC
     * @type {Integer (Int32)}
     */
    static ASYNC => 1

    /**
     * Native name: SSUPDATE_CONTINUOUS
     * @type {Integer (Int32)}
     */
    static CONTINUOUS => 2
}

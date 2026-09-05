#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.UpdateAgent
 */
class DownloadType extends Win32Enum {

    /**
     * Native name: downloadTypeFull
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * Native name: downloadTypeUpdateBootstrapper
     * @type {Integer (Int32)}
     */
    static UpdateBootstrapper => 1
}

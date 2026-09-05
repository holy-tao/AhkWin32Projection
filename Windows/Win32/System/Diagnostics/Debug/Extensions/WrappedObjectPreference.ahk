#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class WrappedObjectPreference extends Win32Enum {

    /**
     * Native name: WrappedObjectNameResolution
     * @type {Integer (Int32)}
     */
    static NameResolution => 0

    /**
     * Native name: WrappedObjectGeneralProxy
     * @type {Integer (Int32)}
     */
    static GeneralProxy => 1
}

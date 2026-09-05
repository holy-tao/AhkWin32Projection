#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class OIBDG_FLAGS extends Win32Enum {

    /**
     * Native name: OIBDG_APARTMENTTHREADED
     * @type {Integer (Int32)}
     */
    static APARTMENTTHREADED => 256

    /**
     * Native name: OIBDG_DATAONLY
     * @type {Integer (Int32)}
     */
    static DATAONLY => 4096
}

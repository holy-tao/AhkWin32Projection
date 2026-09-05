#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class LocationKind extends Win32Enum {

    /**
     * Native name: LocationMember
     * @type {Integer (Int32)}
     */
    static Member => 0

    /**
     * Native name: LocationStatic
     * @type {Integer (Int32)}
     */
    static Static => 1

    /**
     * Native name: LocationConstant
     * @type {Integer (Int32)}
     */
    static Constant => 2

    /**
     * Native name: LocationNone
     * @type {Integer (Int32)}
     */
    static None => 3
}

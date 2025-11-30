#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNormalization2Mode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_COMPOSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_DECOMPOSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_FCD => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_COMPOSE_CONTIGUOUS => 3
}

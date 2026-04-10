#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UMessagePatternApostropheMode extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_APOS_DOUBLE_OPTIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_APOS_DOUBLE_REQUIRED => 1
}

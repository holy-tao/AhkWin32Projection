#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorManifestResourceFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static mrVisibilityMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static mrPublic => 1

    /**
     * @type {Integer (Int32)}
     */
    static mrPrivate => 2
}

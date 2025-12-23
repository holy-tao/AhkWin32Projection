#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation.Metadata
 * @version v4.0.30319
 */
class Architecture extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static X86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static X64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Arm64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static All => 7
}

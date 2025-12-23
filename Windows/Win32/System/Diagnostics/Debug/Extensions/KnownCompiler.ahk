#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class KnownCompiler extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CompilerUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static CompilerMSVC => 1

    /**
     * @type {Integer (Int32)}
     */
    static CompilerGCC => 2

    /**
     * @type {Integer (Int32)}
     */
    static CompilerClang => 3

    /**
     * @type {Integer (Int32)}
     */
    static CompilerRustC => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class KnownCompiler extends Win32Enum {

    /**
     * Native name: CompilerUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static CompilerMSVC => 1

    /**
     * @type {Integer (Int32)}
     */
    static CompilerGCC => 2

    /**
     * Native name: CompilerClang
     * @type {Integer (Int32)}
     */
    static Clang => 3

    /**
     * Native name: CompilerRustC
     * @type {Integer (Int32)}
     */
    static RustC => 4
}

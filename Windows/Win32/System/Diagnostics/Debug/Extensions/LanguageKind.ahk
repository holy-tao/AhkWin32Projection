#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class LanguageKind extends Win32Enum {

    /**
     * Native name: LanguageUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static LanguageC => 1

    /**
     * @type {Integer (Int32)}
     */
    static LanguageCPP => 2

    /**
     * Native name: LanguageAssembly
     * @type {Integer (Int32)}
     */
    static Assembly => 3

    /**
     * Native name: LanguageRust
     * @type {Integer (Int32)}
     */
    static Rust => 4
}

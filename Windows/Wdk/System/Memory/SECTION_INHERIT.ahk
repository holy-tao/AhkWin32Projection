#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Memory
 */
class SECTION_INHERIT extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ViewShare => 1

    /**
     * @type {Integer (Int32)}
     */
    static ViewUnmap => 2
}

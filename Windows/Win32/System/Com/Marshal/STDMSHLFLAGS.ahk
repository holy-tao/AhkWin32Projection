#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Marshal
 */
class STDMSHLFLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SMEXF_SERVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SMEXF_HANDLER => 2
}

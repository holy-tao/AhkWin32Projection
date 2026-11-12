#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class PreferredGraphForm extends Win32Enum {

    /**
     * Native name: GraphFormUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: GraphFormGraph
     * @type {Integer (Int32)}
     */
    static Graph => 1

    /**
     * Native name: GraphFormTree
     * @type {Integer (Int32)}
     */
    static Tree => 2

    /**
     * Native name: GraphFormLinearFlow
     * @type {Integer (Int32)}
     */
    static LinearFlow => 3
}

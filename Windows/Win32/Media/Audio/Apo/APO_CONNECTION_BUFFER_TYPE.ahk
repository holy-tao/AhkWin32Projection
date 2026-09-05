#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APO_CONNECTION_BUFFER_TYPE extends Win32Enum {

    /**
     * Native name: APO_CONNECTION_BUFFER_TYPE_ALLOCATED
     * @type {Integer (Int32)}
     */
    static ALLOCATED => 0

    /**
     * Native name: APO_CONNECTION_BUFFER_TYPE_EXTERNAL
     * @type {Integer (Int32)}
     */
    static EXTERNAL => 1

    /**
     * Native name: APO_CONNECTION_BUFFER_TYPE_DEPENDANT
     * @type {Integer (Int32)}
     */
    static DEPENDANT => 2
}

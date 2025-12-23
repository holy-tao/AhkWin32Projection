#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_CONNECTION_BUFFER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static APO_CONNECTION_BUFFER_TYPE_ALLOCATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static APO_CONNECTION_BUFFER_TYPE_EXTERNAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static APO_CONNECTION_BUFFER_TYPE_DEPENDANT => 2
}

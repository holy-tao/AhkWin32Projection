#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APO_REFERENCE_STREAM_PROPERTIES extends Win32BitflagEnum {

    /**
     * Native name: APO_REFERENCE_STREAM_PROPERTIES_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: APO_REFERENCE_STREAM_PROPERTIES_POST_VOLUME_LOOPBACK
     * @type {Integer (Int32)}
     */
    static POST_VOLUME_LOOPBACK => 1
}

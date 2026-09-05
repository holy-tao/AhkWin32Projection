#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class AUDIO_FLOW_TYPE extends Win32Enum {

    /**
     * Native name: AUDIO_FLOW_PULL
     * @type {Integer (Int32)}
     */
    static PULL => 0

    /**
     * Native name: AUDIO_FLOW_PUSH
     * @type {Integer (Int32)}
     */
    static PUSH => 1
}

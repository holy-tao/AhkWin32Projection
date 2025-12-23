#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_FLOW_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_FLOW_PULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static AUDIO_FLOW_PUSH => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_MIDILOOPEDSTREAMING extends Win32Enum {

    /**
     * Native name: KSPROPERTY_MIDILOOPEDSTREAMING_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 0

    /**
     * Native name: KSPROPERTY_MIDILOOPEDSTREAMING_REGISTERS
     * @type {Integer (Int32)}
     */
    static REGISTERS => 1

    /**
     * Native name: KSPROPERTY_MIDILOOPEDSTREAMING_NOTIFICATION_EVENT
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_EVENT => 2
}

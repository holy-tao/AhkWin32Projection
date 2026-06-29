#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_MIDILOOPEDSTREAMING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MIDILOOPEDSTREAMING_BUFFER => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MIDILOOPEDSTREAMING_REGISTERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MIDILOOPEDSTREAMING_NOTIFICATION_EVENT => 2
}

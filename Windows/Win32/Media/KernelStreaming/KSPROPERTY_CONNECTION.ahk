#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CONNECTION {
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
    static KSPROPERTY_CONNECTION_STATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_PRIORITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_DATAFORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_ALLOCATORFRAMING => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_PROPOSEDATAFORMAT => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_ACQUIREORDERING => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_ALLOCATORFRAMING_EX => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CONNECTION_STARTAT => 7
}

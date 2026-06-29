#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
export default struct BROADCAST_SYSTEM_MESSAGE_INFO {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static BSM_ALLCOMPONENTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BSM_ALLDESKTOPS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BSM_APPLICATIONS => 8
}

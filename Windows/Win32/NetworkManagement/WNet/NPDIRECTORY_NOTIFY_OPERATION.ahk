#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NPDIRECTORY_NOTIFY_OPERATION {
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
    static WNDN_MKDIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNDN_RMDIR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNDN_MVDIR => 3
}

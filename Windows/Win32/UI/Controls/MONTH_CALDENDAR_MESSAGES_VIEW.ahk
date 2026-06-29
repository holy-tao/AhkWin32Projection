#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct MONTH_CALDENDAR_MESSAGES_VIEW {
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
    static MCMV_MONTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_YEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_DECADE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_CENTURY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_MAX => 3
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_CELLULAR_CLASS enumerated type defines the type of cellular device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_cellular_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_CELLULAR_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No cellular class.
     * @type {Integer (Int32)}
     */
    static MBN_CELLULAR_CLASS_NONE => 0

    /**
     * GSM cellular class.
     * @type {Integer (Int32)}
     */
    static MBN_CELLULAR_CLASS_GSM => 1

    /**
     * CDMA cellular class.
     * @type {Integer (Int32)}
     */
    static MBN_CELLULAR_CLASS_CDMA => 2
}

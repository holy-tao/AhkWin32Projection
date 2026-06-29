#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SDP_SPECIFICTYPE {
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
    static SDP_ST_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UINT8 => 16

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UINT16 => 272

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UINT32 => 528

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UINT64 => 784

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UINT128 => 1040

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_INT8 => 32

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_INT16 => 288

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_INT32 => 544

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_INT64 => 800

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_INT128 => 1056

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UUID16 => 304

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UUID32 => 544

    /**
     * @type {Integer (Int32)}
     */
    static SDP_ST_UUID128 => 1072
}

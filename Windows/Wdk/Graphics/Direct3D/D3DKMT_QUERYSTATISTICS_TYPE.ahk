#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_TYPE {
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
    static D3DKMT_QUERYSTATISTICS_ADAPTER => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_ADAPTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_NODE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_NODE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_VIDPNSOURCE => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_VIDPNSOURCE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT_GROUP => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PHYSICAL_ADAPTER => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_ADAPTER2 => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT2 => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_ADAPTER2 => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT2 => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT_GROUP2 => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT_USAGE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT_GROUP_USAGE => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_NODE2 => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_NODE2 => 19
}

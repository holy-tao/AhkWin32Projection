#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_ADAPTER
     * @type {Integer (Int32)}
     */
    static ADAPTER => 0

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS
     * @type {Integer (Int32)}
     */
    static PROCESS => 1

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_ADAPTER
     * @type {Integer (Int32)}
     */
    static PROCESS_ADAPTER => 2

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT
     * @type {Integer (Int32)}
     */
    static SEGMENT => 3

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT
     * @type {Integer (Int32)}
     */
    static PROCESS_SEGMENT => 4

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_NODE
     * @type {Integer (Int32)}
     */
    static NODE => 5

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_NODE
     * @type {Integer (Int32)}
     */
    static PROCESS_NODE => 6

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_VIDPNSOURCE
     * @type {Integer (Int32)}
     */
    static VIDPNSOURCE => 7

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_VIDPNSOURCE
     * @type {Integer (Int32)}
     */
    static PROCESS_VIDPNSOURCE => 8

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT_GROUP
     * @type {Integer (Int32)}
     */
    static PROCESS_SEGMENT_GROUP => 9

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PHYSICAL_ADAPTER
     * @type {Integer (Int32)}
     */
    static PHYSICAL_ADAPTER => 10

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_ADAPTER2
     * @type {Integer (Int32)}
     */
    static ADAPTER2 => 11

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT2
     * @type {Integer (Int32)}
     */
    static SEGMENT2 => 12

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_ADAPTER2
     * @type {Integer (Int32)}
     */
    static PROCESS_ADAPTER2 => 13

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT2
     * @type {Integer (Int32)}
     */
    static PROCESS_SEGMENT2 => 14

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT_GROUP2
     * @type {Integer (Int32)}
     */
    static PROCESS_SEGMENT_GROUP2 => 15

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT_USAGE
     * @type {Integer (Int32)}
     */
    static SEGMENT_USAGE => 16

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_SEGMENT_GROUP_USAGE
     * @type {Integer (Int32)}
     */
    static SEGMENT_GROUP_USAGE => 17

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_NODE2
     * @type {Integer (Int32)}
     */
    static NODE2 => 18

    /**
     * Native name: D3DKMT_QUERYSTATISTICS_PROCESS_NODE2
     * @type {Integer (Int32)}
     */
    static PROCESS_NODE2 => 19
}

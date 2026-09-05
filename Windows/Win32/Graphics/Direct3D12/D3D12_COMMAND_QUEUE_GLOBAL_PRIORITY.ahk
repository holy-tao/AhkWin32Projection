#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY extends Win32Enum {

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 0

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_NORMAL_0
     * @type {Integer (Int32)}
     */
    static NORMAL_0 => 2

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_0
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_0 => 18

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_1
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_1 => 19

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_2
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_2 => 20

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_3
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_3 => 21

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_4
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_4 => 22

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_5
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_5 => 23

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_6
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_6 => 24

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_7
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_7 => 25

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_8
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_8 => 26

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_9
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_9 => 27

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_10
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_10 => 28

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_11
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_11 => 29

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_12
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_12 => 30

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_13
     * @type {Integer (Int32)}
     */
    static SOFT_REALTIME_13 => 31

    /**
     * Native name: D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_HARD_REALTIME
     * @type {Integer (Int32)}
     */
    static HARD_REALTIME => 32
}

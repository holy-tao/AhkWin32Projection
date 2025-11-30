#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_NORMAL_0 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_0 => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_1 => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_2 => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_3 => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_4 => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_5 => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_6 => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_7 => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_8 => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_9 => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_10 => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_11 => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_12 => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_SOFT_REALTIME_13 => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_GLOBAL_PRIORITY_HARD_REALTIME => 32
}

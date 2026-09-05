#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_COMMAND_QUEUE_PROCESS_PRIORITY extends Win32Enum {

    /**
     * Native name: D3D12_COMMAND_QUEUE_PROCESS_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: D3D12_COMMAND_QUEUE_PROCESS_PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1
}

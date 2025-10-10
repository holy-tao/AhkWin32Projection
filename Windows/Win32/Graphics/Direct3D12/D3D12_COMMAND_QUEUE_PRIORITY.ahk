#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines priority levels for a command queue.
 * @remarks
 * 
  * This enumeration is used by the <b>Priority</b> member of the
  *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_queue_desc">D3D12_COMMAND_QUEUE_DESC</a>structure.
  *         
  * 
  * An application must be sufficiently privileged in order to create a command queue that has global realtime priority. If the application is not sufficiently privileged or if neither the adapter or driver can provide the necessary preemption, then requests to create a global realtime priority queue fail; such a failure could be due to a lack of hardware support or due to conflicts with other command queue parameters. Requests to create a global realtime command queue won't silently downgrade the priority when it can't be supported; the request succeeds or fails as-is to indicate to the application whether or not the command queue is guaranteed to execute before any other queue.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_command_queue_priority
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_QUEUE_PRIORITY{

    /**
     * Normal priority.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_PRIORITY_NORMAL => 0

    /**
     * High priority.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_PRIORITY_HIGH => 100

    /**
     * Global realtime priority.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME => 10000
}

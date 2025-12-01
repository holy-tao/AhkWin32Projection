#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes dispatch parameters, for use by the compute shader.
 * @remarks
 * The members of this structure serve the same purpose as the parameters of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-dispatch">Dispatch</a>.
 * 
 *  A compiled compute shader defines the set of instructions to execute per thread and the number of threads to run per group. The thread-group parameters  indicate how many thread groups to execute. Each thread group contains the same number of threads, as defined by the compiled compute shader. The thread groups are organized in a three-dimensional grid. The total number of thread groups that the compiled compute shader executes is determined by the following calculation:
 * 
 * 
 * ``` syntax
 * ThreadGroupCountX * ThreadGroupCountY * ThreadGroupCountZ
 * ```
 * 
 * In particular, if any of the values in the thread-group parameters are 0, nothing will happen. 
 * 
 * 
 * The maximum size of any dimension is 65535.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dispatch_arguments
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DISPATCH_ARGUMENTS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size, in thread groups, of the x-dimension of the thread-group grid.
     * @type {Integer}
     */
    ThreadGroupCountX {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in thread groups, of the y-dimension of the thread-group grid.
     * @type {Integer}
     */
    ThreadGroupCountY {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in thread groups, of the z-dimension of the thread-group grid.
     * @type {Integer}
     */
    ThreadGroupCountZ {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

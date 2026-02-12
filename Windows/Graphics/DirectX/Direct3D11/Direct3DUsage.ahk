#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This is a Windows Runtime equivalent of the Desktop [D3D11_USAGE](/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage) enumeration. Identifies expected resource use during rendering. The usage directly reflects whether a resource is accessible by the CPU and/or the graphics processing unit (GPU).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.direct3dusage
 * @namespace Windows.Graphics.DirectX.Direct3D11
 * @version WindowsRuntime 1.4
 */
class Direct3DUsage extends Win32Enum{

    /**
     * A resource that requires read and write access by the GPU.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A resource that can only be read by the GPU. It cannot be written by the GPU, and cannot be accessed at all by the CPU. This type of resource must be initialized when it is created, since it cannot be changed after creation.
     * @type {Integer (Int32)}
     */
    static Immutable => 1

    /**
     * A resource that is accessible by both the GPU (read only) and the CPU (write only). A dynamic resource is a good choice for a resource that will be updated by the CPU at least once per frame.
     * @type {Integer (Int32)}
     */
    static Dynamic => 2

    /**
     * A resource that supports data transfer (copy) from the GPU to the CPU.
     * @type {Integer (Int32)}
     */
    static Staging => 3
}

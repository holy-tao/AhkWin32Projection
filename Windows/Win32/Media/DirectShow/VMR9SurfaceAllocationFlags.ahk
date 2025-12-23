#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9SurfaceAllocationFlags enumeration type is used with the IVMRSurfaceAllocator9::InitializeDevice method to specify surface creation parameters (VMR-9 only).
 * @remarks
 * The VMR9AllocFlag_TextureSurface flag can be combined with the VMR9AllocFlag_DXVATarget and VMR9AllocFlag_3DRenderTarget flags.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9surfaceallocationflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9SurfaceAllocationFlags extends Win32Enum{

    /**
     * Indicates that the surface is a Direct3D render target.
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_3DRenderTarget => 1

    /**
     * Indicates that the render target supports DXVA.
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_DXVATarget => 2

    /**
     * Indicates that the target is a Direct3D texture surface.
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_TextureSurface => 4

    /**
     * Indicates an offscreen surface.
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_OffscreenSurface => 8

    /**
     * In YUV mixing mode, indicates that the mixer can accept RGB formats in addition to the specified YUV format. The allocator-presenter can switch between the formats dynamically. This flag is only valid in YUV mixing mode.
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_RGBDynamicSwitch => 16

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_UsageReserved => 224

    /**
     * Bitwise <b>OR</b> of all flags; not used by applications
     * @type {Integer (Int32)}
     */
    static VMR9AllocFlag_UsageMask => 255
}

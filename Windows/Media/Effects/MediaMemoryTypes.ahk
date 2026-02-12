#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of memory that can be used for a media operation.
 * @remarks
 * If you specify MediaMemoryTypes.GpuAndCpu when setting the memory type for your effect, the system will use either GPU or system memory, whichever is more efficient for the pipeline. When using this value, you must check in the [ProcessFrame](ibasicvideoeffect_processframe_1753355935.md) method to see whether the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) passed into the method contains data and then process the frame accordingly.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.mediamemorytypes
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class MediaMemoryTypes extends Win32Enum{

    /**
     * GPU memory.
     * @type {Integer (Int32)}
     */
    static Gpu => 0

    /**
     * CPU memory.
     * @type {Integer (Int32)}
     */
    static Cpu => 1

    /**
     * Both GPU and CPU memory.
     * @type {Integer (Int32)}
     */
    static GpuAndCpu => 2
}

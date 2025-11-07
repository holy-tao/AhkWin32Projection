#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the amount of artificial slowdown inserted by the debug device to simulate lower-performance graphics adapters.
 * @remarks
 * 
 * The SlowdownFactor is applied by artificially delaying the time it takes for a fence to signal. When SlowdownFactor is non-zero, the time taken for a fence to signal is approximately 1.0 + SlowdownFactor times the length of the nominal timing.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_slowdown_performance_factor
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the amount of slowdown artificially applied, as a factor of the nominal time for the fence to signal. The default value is 0.
     * @type {Float}
     */
    SlowdownFactor {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }
}

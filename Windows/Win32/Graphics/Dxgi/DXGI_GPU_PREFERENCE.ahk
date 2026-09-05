#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The preference of GPU for the app to run on.
 * @remarks
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgifactory6-enumadapterbygpupreference">IDXGIFactory6::EnumAdapterByGpuPreference</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_gpu_preference
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_GPU_PREFERENCE extends Win32Enum {

    /**
     * No preference of GPU.
     * Native name: DXGI_GPU_PREFERENCE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Preference for the minimum-powered GPU (such as an integrated graphics processor, or iGPU).
     * Native name: DXGI_GPU_PREFERENCE_MINIMUM_POWER
     * @type {Integer (Int32)}
     */
    static MINIMUM_POWER => 1

    /**
     * Preference for the highest performing GPU, such as a discrete graphics processor (dGPU) or external graphics processor (xGPU).
     * Native name: DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE
     * @type {Integer (Int32)}
     */
    static HIGH_PERFORMANCE => 2
}

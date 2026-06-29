#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The preference of GPU for the app to run on.
 * @remarks
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgifactory6-enumadapterbygpupreference">IDXGIFactory6::EnumAdapterByGpuPreference</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_gpu_preference
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_GPU_PREFERENCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No preference of GPU.
     * @type {Integer (Int32)}
     */
    static DXGI_GPU_PREFERENCE_UNSPECIFIED => 0

    /**
     * Preference for the minimum-powered GPU (such as an integrated graphics processor, or iGPU).
     * @type {Integer (Int32)}
     */
    static DXGI_GPU_PREFERENCE_MINIMUM_POWER => 1

    /**
     * Preference for the highest performing GPU, such as a discrete graphics processor (dGPU) or external graphics processor (xGPU).
     * @type {Integer (Int32)}
     */
    static DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE => 2
}

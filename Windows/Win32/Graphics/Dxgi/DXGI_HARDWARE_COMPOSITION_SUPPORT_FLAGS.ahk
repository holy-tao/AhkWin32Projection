#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes which levels of hardware composition are supported.
 * @remarks
 * Values of this enumeration are returned from the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgioutput6-checkhardwarecompositionsupport">IDXGIOutput6::CheckHardwareCompositionSupport</a> method in the <i>pFlags</i> out parameter.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_hardware_composition_support_flags
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS{

    /**
     * This flag specifies that swapchain composition can be facilitated in a performant manner using hardware for fullscreen applications.
     * @type {Integer (Int32)}
     */
    static DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_FULLSCREEN => 1

    /**
     * This flag specifies that swapchain composition can be facilitated in a performant manner using hardware for windowed applications.
     * @type {Integer (Int32)}
     */
    static DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_WINDOWED => 2

    /**
     * This flag specifies that swapchain composition facilitated using hardware can cause the cursor to appear stretched.
     * @type {Integer (Int32)}
     */
    static DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_CURSOR_STRETCHED => 4
}

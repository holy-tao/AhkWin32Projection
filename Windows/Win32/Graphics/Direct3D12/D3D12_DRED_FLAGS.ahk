#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants used in the D3D12_DEVICE_REMOVED_EXTENDED_DATA structure to specify control flags for the Direct3D runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRED_FLAGS{

    /**
     * Typically specifies that Device Removed Extended Data (DRED) is disabled, except for when user-initiated feedback is used to produce a repro, or when otherwise enabled by Windows via automatic detection of process-instability issues. This is the default value.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_FLAG_NONE => 0

    /**
     * Forces DRED to be enabled, regardless of the system state.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_FLAG_FORCE_ENABLE => 1

    /**
     * Disables DRED auto breadcrumbs.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_FLAG_DISABLE_AUTOBREADCRUMBS => 2
}

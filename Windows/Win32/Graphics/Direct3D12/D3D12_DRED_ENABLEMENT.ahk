#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify render/compute GPU operations.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_dred_enablement
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRED_ENABLEMENT{

    /**
     * Specifies that a DRED feature is enabled only when DRED is turned on by the system automatically (for example, when a user is reproducing a problem via FeedbackHub).
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED => 0

    /**
     * Specifies that a DRED feature should be force-disabled, regardless of the system state.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_ENABLEMENT_FORCED_OFF => 1

    /**
     * Specifies that a DRED feature should be force-enabled, regardless of the system state.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_ENABLEMENT_FORCED_ON => 2
}

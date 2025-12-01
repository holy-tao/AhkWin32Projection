#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for optional D3D12 Debug Layer features.
 * @remarks
 * This enum is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter">ID3D12DebugDevice1::SetDebugParameter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-getdebugparameter">ID3D12DebugDevice1::GetDebugParameter</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEBUG_FEATURE extends Win32BitflagEnum{

    /**
     * The default. No optional Debug Layer features.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_FEATURE_NONE => 0

    /**
     * The Debug Layer is allowed to deliberately change functional behavior of an application in order to help identify potential errors.  By default, the Debug Layer allows most invalid API usage to run the natural course.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_FEATURE_ALLOW_BEHAVIOR_CHANGING_DEBUG_AIDS => 1

    /**
     * Performs additional resource state validation of resources set in descriptors at the time <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-executecommandlists">ID3D12CommandQueue::ExecuteCommandLists</a> is called.  By design descriptors can be changed even after submitting command lists assuming proper synchronization.  Conservative resource state tracking ignores this allowance and validates all resources used in descriptor tables when <b>ExecuteCommandLists</b> is called.  The result may be false validation errors.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_FEATURE_CONSERVATIVE_RESOURCE_STATE_TRACKING => 2

    /**
     * Disables validation of bundle commands by virtually injecting checks into the calling command list validation paths.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_FEATURE_DISABLE_VIRTUALIZED_BUNDLES_VALIDATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_FEATURE_EMULATE_WINDOWS7 => 8
}

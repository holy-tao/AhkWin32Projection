#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adds GPU-Based Validation and Dependent Command Queue Synchronization to the debug layer.
 * @remarks
 * 
 * This interface is currently in Preview mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debug1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Debug1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Debug1
     * @type {Guid}
     */
    static IID => Guid("{affaa4ca-63fe-4d8e-b8ad-159000af4304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableDebugLayer", "SetEnableGPUBasedValidation", "SetEnableSynchronizedCommandQueueValidation"]

    /**
     * Enables the debug layer.
     * @remarks
     * 
     * This method is identical to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug-enabledebuglayer">ID3D12Debug::EnableDebugLayer</a>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debug1-enabledebuglayer
     */
    EnableDebugLayer() {
        ComCall(3, this)
    }

    /**
     * This method enables or disables GPU-Based Validation (GBV) before creating a device with the debug layer enabled.
     * @remarks
     * 
     * GPU-Based Validation can only be enabled/disabled prior to creating a device.  By default, GPU-Based Validation is disabled.  To disable GPU-Based Validation after initially enabling it the device must be fully released and recreated.  
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d12/using-d3d12-debug-layer-gpu-based-validation">Using D3D12 Debug Layer GPU-Based Validation</a>.
     * 
     * 
     * @param {BOOL} Enable Type: <b>BOOL</b>
     * 
     * TRUE to enable GPU-Based Validation, otherwise FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debug1-setenablegpubasedvalidation
     */
    SetEnableGPUBasedValidation(Enable) {
        ComCall(4, this, "int", Enable)
    }

    /**
     * Enables or disables dependent command queue synchronization when using a D3D12 device with the debug layer enabled.
     * @remarks
     * 
     * Dependent Command Queue Synchronization is a D3D12 Debug Layer feature that gives the debug layer the ability to track resource states more accurately when enabled.  Dependent Command Queue Synchronization is enabled by default.  
     * 
     * When Dependent Command Queue Synchronization is enabled, the debug layer holds back actual submission of GPU work until all outstanding fence <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-wait">Wait</a> conditions are met.  This gives the debug layer the ability to make reasonable assumptions about GPU state (such as resource states) on the CPU-timeline when multiple command queues are potentially doing concurrent work.
     * 
     * With Dependent Command Queue Synchronization disabled, all resource states tracked by the debug layer are cleared each time <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-signal">ID3D12CommandQueue::Signal</a> is called.  This results in significantly less useful resource state validation.
     * 
     * Disabling Dependent Command Queue Synchronization may reduce some debug layer performance overhead when using multiple command queues.  However, it is suggested to leave it enabled unless this overhead is problematic.  Note that applications that use only a single command queue will see no performance changes with Dependent Command Queue Synchronization disabled.
     * 
     * 
     * @param {BOOL} Enable Type: <b>BOOL</b>
     * 
     * TRUE to enable Dependent Command Queue Synchronization, otherwise FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debug1-setenablesynchronizedcommandqueuevalidation
     */
    SetEnableSynchronizedCommandQueueValidation(Enable) {
        ComCall(5, this, "int", Enable)
    }
}

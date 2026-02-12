#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device5.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device5](../d3d12/nn-d3d12-id3d12device5.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nn-d3d12-id3d12device6
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device6 extends ID3D12Device5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device6
     * @type {Guid}
     */
    static IID => Guid("{c70b221b-40e4-4a17-89af-025a0727a6dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBackgroundProcessingMode"]

    /**
     * Sets the mode for driver background processing optimizations.
     * @remarks
     * A graphics driver can use idle-priority background CPU threads to dynamically recompile shader programs. That can improve GPU performance by specializing shader code to better match details of the hardware that it's running on, and/or the context in which it's being used.
     * 
     * As a developer, you don't have to do anything to benefit from this feature (over time, as drivers adopt background processing optimizations, existing shaders will automatically be tuned more efficiently). But, when you're profiling your code, you'll probably want to call **SetBackgroundProcessingMode** to make sure that any driver background processing optimizations have taken place before you take timing measurements. Here's an example.
     * 
     * ```cpp
     * SetBackgroundProcessingMode(
     *     D3D12_BACKGROUND_PROCESSING_MODE_ALLOW_INTRUSIVE_MEASUREMENTS,
     *     D3D_MEASUREMENTS_ACTION_KEEP_ALL,
     *     nullptr, nullptr);
     *  
     * // Here, prime the system by rendering some typical content.
     * // For example, a level flythrough.
     *  
     * SetBackgroundProcessingMode(
     *     D3D12_BACKGROUND_PROCESSING_MODE_ALLOWED,
     *     D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS,
     *     nullptr, nullptr);
     *  
     * // Here, continue rendering. This time with dynamic optimizations applied.
     * // And then take your measurements.
     * ```
     * 
     * [PIX](https://devblogs.microsoft.com/pix/) automatically uses **SetBackgroundProcessingMode**&mdash;first to prime the system,and then to prevent any further changes from taking place in the middle of its analysis. PIX waits on an event (to make sure all background shader recompiles have finished) before it starts taking measurements.
     * @param {Integer} Mode_ Type: **[D3D12_BACKGROUND_PROCESSING_MODE](./ne-d3d12-d3d12_background_processing_mode.md)**
     * 
     * The level of dynamic optimization to apply to GPU work that's subsequently submitted.
     * @param {Integer} MeasurementsAction Type: **[D3D12_MEASUREMENTS_ACTION](./ne-d3d12-d3d12_measurements_action.md)**
     * 
     * The action to take with the results of earlier workload instrumentation.
     * @param {HANDLE} hEventToSignalUponCompletion Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * An optional handle to signal when the function is complete. For example, if *MeasurementsAction* is set to [D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS](./ne-d3d12-d3d12_measurements_action.md), then *hEventToSignalUponCompletion* is signaled when all resulting compilations have finished.
     * @returns {BOOL} Type: **[BOOL](/windows/win32/winprog/windows-data-types)\***
     * 
     * An optional pointer to a Boolean value. The function sets the value to `true` to indicate that you should continue profiling, otherwise, `false`.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12device6-setbackgroundprocessingmode
     */
    SetBackgroundProcessingMode(Mode_, MeasurementsAction, hEventToSignalUponCompletion) {
        hEventToSignalUponCompletion := hEventToSignalUponCompletion is Win32Handle ? NumGet(hEventToSignalUponCompletion, "ptr") : hEventToSignalUponCompletion

        result := ComCall(65, this, "int", Mode_, "int", MeasurementsAction, "ptr", hEventToSignalUponCompletion, "int*", &pbFurtherMeasurementsDesired := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbFurtherMeasurementsDesired
    }
}

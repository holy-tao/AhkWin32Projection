#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify kinds of DXCore adapter states.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate
 * @namespace Windows.Win32.Graphics.DXCore
 */
class DXCoreAdapterState extends Win32Enum {

    /**
     * Specifies the <em>IsDriverUpdateInProgress</em> adapter state, which when `true` indicates that a driver update has been initiated on the adapter but it has not yet completed. If the driver update has already completed, then the adapter will have been invalidated, and your [QueryState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate) call will return a <b>HRESULT</b> of <b>DXGI_ERROR_DEVICE_REMOVED</b>.
     * 
     * When calling [QueryState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate), the <em>IsDriverUpdateInProgress</em> state item has type <b>uint8_t</b>, representing a Boolean value.
     * 
     * <b>Important</b>. This state item is not supported for [SetState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-setstate).
     * @type {Integer (UInt32)}
     */
    static IsDriverUpdateInProgress => 0

    /**
     * Specifies the <em>AdapterMemoryBudget</em> adapter state, which retrieves or requests the adapter memory budget on the adapter.
     * 
     * When calling [QueryState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate), the <em>AdapterMemoryBudget</em> adapter state has type <a href="https://docs.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcoreadaptermemorybudgetnodesegmentgroup">DXCoreAdapterMemoryBudgetNodeSegmentGroup</a> for *inputStateDetails*, and type <a href="https://docs.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcoreadaptermemorybudget">DXCoreAdapterMemoryBudget</a> for *outputBuffer*.
     * 
     * <b>Important</b>. This state item is not supported for [SetState](/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-setstate).
     * Native name: AdapterMemoryBudget
     * @type {Integer (UInt32)}
     */
    static MemoryBudget => 1

    /**
     * Native name: AdapterMemoryUsageBytes
     * @type {Integer (UInt32)}
     */
    static MemoryUsageBytes => 2

    /**
     * Native name: AdapterMemoryUsageByProcessBytes
     * @type {Integer (UInt32)}
     */
    static MemoryUsageByProcessBytes => 3

    /**
     * Native name: AdapterEngineRunningTimeMicroseconds
     * @type {Integer (UInt32)}
     */
    static EngineRunningTimeMicroseconds => 4

    /**
     * Native name: AdapterEngineRunningTimeByProcessMicroseconds
     * @type {Integer (UInt32)}
     */
    static EngineRunningTimeByProcessMicroseconds => 5

    /**
     * Native name: AdapterTemperatureCelsius
     * @type {Integer (UInt32)}
     */
    static TemperatureCelsius => 6

    /**
     * Native name: AdapterInUseProcessCount
     * @type {Integer (UInt32)}
     */
    static InUseProcessCount => 7

    /**
     * Native name: AdapterInUseProcessSet
     * @type {Integer (UInt32)}
     */
    static InUseProcessSet => 8

    /**
     * Native name: AdapterEngineFrequencyHertz
     * @type {Integer (UInt32)}
     */
    static EngineFrequencyHertz => 9

    /**
     * Native name: AdapterMemoryFrequencyHertz
     * @type {Integer (UInt32)}
     */
    static MemoryFrequencyHertz => 10
}

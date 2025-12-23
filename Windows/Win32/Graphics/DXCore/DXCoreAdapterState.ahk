#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify kinds of DXCore adapter states.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreAdapterState extends Win32Enum{

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
     * @type {Integer (UInt32)}
     */
    static AdapterMemoryBudget => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterMemoryUsageBytes => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterMemoryUsageByProcessBytes => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterEngineRunningTimeMicroseconds => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterEngineRunningTimeByProcessMicroseconds => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterTemperatureCelsius => 6

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterInUseProcessCount => 7

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterInUseProcessSet => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterEngineFrequencyHertz => 9

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterMemoryFrequencyHertz => 10
}

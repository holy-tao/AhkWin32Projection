#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify DXCore adapter properties.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterproperty
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreAdapterProperty{

    /**
     * Specifies the <em>InstanceLuid</em> adapter property, which contains a locally unique identifier representing the adapter. This value remains constant for the lifetime of this adapter. The LUID of an adapter changes on reboot, driver upgrade, or device disablement/enablement.
 * 
 * The <em>InstanceLuid</em> adapter property has type <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-luid">LUID</a>.
     * @type {Integer (UInt32)}
     */
    static InstanceLuid => 0

    /**
     * Specifies the <em>DriverVersion</em> adapter property, which contains the driver version, represented in <b>WORD</b>s as a <b>LARGE_INTEGER</b>.
 * 
 * The <em>DriverVersion</em> adapter property has type <b>uint64_t</b>, representing a Boolean value.
     * @type {Integer (UInt32)}
     */
    static DriverVersion => 1

    /**
     * Specifies the <em>DriverDescription</em> adapter property, which contains a NULL-terminated array of <b>CHAR</b>s describing the driver, as specified by the driver, in <a href="https://docs.microsoft.com/windows/win32/intl/unicode">UTF-8</a> encoding.
 * 
 * The <em>DriverDescription</em> adapter property has type <b>char*</b>.
     * @type {Integer (UInt32)}
     */
    static DriverDescription => 2

    /**
     * Specifies the <em>HardwareID</em> adapter property, which represents the PnP hardware ID parts.
 * 
 * The <em>HardwareID</em> adapter property has type <a href="https://docs.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcorehardwareid">DXCoreHardwareID</a>.
     * @type {Integer (UInt32)}
     */
    static HardwareID => 3

    /**
     * Specifies the <em>KmdModelVersion</em> adapter property, which represents the driver model.
 * 
 * The <em>KmdModelVersion</em> adapter property has type <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dkmthk/ne-d3dkmthk-_qai_driverversion">D3DKMT_DRIVERVERSION</a>.
     * @type {Integer (UInt32)}
     */
    static KmdModelVersion => 4

    /**
     * Specifies the <em>ComputePreemptionGranularity</em> adapter property, which represents the compute preemption granularity.
 * 
 * The <em>ComputePreemptionGranularity</em> adapter property has type <b>uint16_t</b>, representing a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dkmdt/ne-d3dkmdt-_d3dkmdt_compute_preemption_granularity">D3DKMDT_COMPUTE_PREEMPTION_GRANULARITY</a> value.
     * @type {Integer (UInt32)}
     */
    static ComputePreemptionGranularity => 5

    /**
     * Specifies the <em>GraphicsPreemptionGranularity</em> adapter property, which represents the graphics preemption granularity.
 * 
 * The <em>GraphicsPreemptionGranularity</em> adapter property has type <b>uint16_t</b>, representing a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dkmdt/ne-d3dkmdt-_d3dkmdt_graphics_preemption_granularity">D3DKMDT_GRAPHICS_PREEMPTION_GRANULARITY</a> value.
     * @type {Integer (UInt32)}
     */
    static GraphicsPreemptionGranularity => 6

    /**
     * Specifies the <em>DedicatedAdapterMemory</em> adapter property, which represents the number of bytes of dedicated adapter memory that are not shared with the CPU.
 * 
 * The <em>DedicatedVideoMemory</em> adapter property has type <b>uint64_t</b>.
     * @type {Integer (UInt32)}
     */
    static DedicatedAdapterMemory => 7

    /**
     * Specifies the <em>DedicatedSystemMemory</em> adapter property, which represents the number of bytes of dedicated system memory that are not shared with the CPU. This memory is allocated from available system memory at boot time.
 * 
 * The <em>DedicatedSystemMemory</em> adapter property has type <b>uint64_t</b>.
     * @type {Integer (UInt32)}
     */
    static DedicatedSystemMemory => 8

    /**
     * Specifies the <em>SharedSystemMemory</em> adapter property, which represents the number of bytes of shared system memory. This is the maximum value of system memory that may be consumed by the adapter during operation. Any incidental memory consumed by the driver as it manages and uses video memory is additional.
 * 
 * The <em>SharedSystemMemory</em> adapter property has type <b>uint64_t</b>.
     * @type {Integer (UInt32)}
     */
    static SharedSystemMemory => 9

    /**
     * Specifies the <em>AcgCompatible</em> adapter property, which indicates whether the adapter is compatible with processes that enforce Arbitrary Code Guard.
 * 
 * The <em>AcgCompatible</em> adapter property has type <b>bool</b>.
     * @type {Integer (UInt32)}
     */
    static AcgCompatible => 10

    /**
     * Specifies the <em>IsHardware</em> adapter property, which determines whether or not this is a hardware adapter. An adapter that's not a hardware adapter is a software adapter.
 * 
 * The <em>IsHardware</em> adapter property has type <b>bool</b>.
     * @type {Integer (UInt32)}
     */
    static IsHardware => 11

    /**
     * Specifies the <em>IsIntegrated</em> adapter property, which determines whether the adapter is reported to be an integrated graphics processor (iGPU).
 * 
 * The <em>IsIntegrated</em> adapter property has type <b>bool</b>.
     * @type {Integer (UInt32)}
     */
    static IsIntegrated => 12

    /**
     * Specifies the <em>IsDetachable</em> adapter property, which determines whether the adapter has been reported to be detachable, or removable.
 * 
 * The <em>IsDetachable</em> adapter property has type <b>bool</b>.
 * 
 * <b>Note</b>. Even if <a href="https://docs.microsoft.com/windows/win32/dxcore/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getproperty">IDXCoreAdapter::GetProperty</a> indicates `false` for this property, the adapter still has the ability to be reported as removed, such as in the case of malfunction, or driver update.
     * @type {Integer (UInt32)}
     */
    static IsDetachable => 13

    /**
     * @type {Integer (UInt32)}
     */
    static HardwareIDParts => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PhysicalAdapterCount => 15

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterEngineCount => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AdapterEngineName => 17
}

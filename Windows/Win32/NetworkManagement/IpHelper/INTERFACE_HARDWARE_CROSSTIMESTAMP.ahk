#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a cross timestamp retrieved from a network adapter.
 * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_crosstimestamp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct INTERFACE_HARDWARE_CROSSTIMESTAMP {
    #StructPack 8

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The network adapter driver fills this with a system timestamp whose value corresponds to a value returned by [**QueryPerformanceCounter**](/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) (QPC).
     * 
     * *SystemTimestamp1* is obtained before *HardwareClockTimestamp*; while *SystemTimestamp2* is taken after *HardwareClockTimestamp*. The timestamp values are obtained as closely as possible to each other.
     */
    SystemTimestamp1 : Int64

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The network adapter driver fills this with a value obtained from its network interface card (NIC) hardware clock.
     */
    HardwareClockTimestamp : Int64

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The network adapter driver fills this with a system timestamp whose value corresponds to a value returned by [**QueryPerformanceCounter**](/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) (QPC).
     * 
     * *SystemTimestamp1* is obtained before *HardwareClockTimestamp*; while *SystemTimestamp2* is taken after *HardwareClockTimestamp*. The timestamp values are obtained as closely as possible to each other.
     */
    SystemTimestamp2 : Int64

}

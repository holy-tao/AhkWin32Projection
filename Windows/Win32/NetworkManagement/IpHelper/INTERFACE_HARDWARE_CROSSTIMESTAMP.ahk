#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a cross timestamp retrieved from a network adapter.
 * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_crosstimestamp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class INTERFACE_HARDWARE_CROSSTIMESTAMP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The network adapter driver fills this with a system timestamp whose value corresponds to a value returned by [**QueryPerformanceCounter**](/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) (QPC).
     * 
     * *SystemTimestamp1* is obtained before *HardwareClockTimestamp*; while *SystemTimestamp2* is taken after *HardwareClockTimestamp*. The timestamp values are obtained as closely as possible to each other.
     * @type {Integer}
     */
    SystemTimestamp1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The network adapter driver fills this with a value obtained from its network interface card (NIC) hardware clock.
     * @type {Integer}
     */
    HardwareClockTimestamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * The network adapter driver fills this with a system timestamp whose value corresponds to a value returned by [**QueryPerformanceCounter**](/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) (QPC).
     * 
     * *SystemTimestamp1* is obtained before *HardwareClockTimestamp*; while *SystemTimestamp2* is taken after *HardwareClockTimestamp*. The timestamp values are obtained as closely as possible to each other.
     * @type {Integer}
     */
    SystemTimestamp2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

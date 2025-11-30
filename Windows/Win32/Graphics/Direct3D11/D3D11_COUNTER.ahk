#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Options for performance counters.
 * @remarks
 * 
 * Independent hardware vendors may define their own set of performance counters for their devices, by giving the enumeration value a number that is greater than the value for D3D11_COUNTER_DEVICE_DEPENDENT_0.
 * 
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_desc">D3D11_COUNTER_DESC</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_counter_info">D3D11_COUNTER_INFO</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_counter
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_COUNTER extends Win32Enum{

    /**
     * Define a performance counter that is dependent on the hardware device.
     * @type {Integer (Int32)}
     */
    static D3D11_COUNTER_DEVICE_DEPENDENT_0 => 1073741824
}

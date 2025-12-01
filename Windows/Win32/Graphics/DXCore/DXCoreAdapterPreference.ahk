#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify DXCore adapter preferences to be used as list-sorting criteria.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterpreference
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreAdapterPreference extends Win32Enum{

    /**
     * Specifies a preference for hardware adapters (as opposed to software adapters).
     * @type {Integer (UInt32)}
     */
    static Hardware => 0

    /**
     * Specifies a preference for the minimum-powered GPU (such as an integrated graphics processor, or iGPU).
     * @type {Integer (UInt32)}
     */
    static MinimumPower => 1

    /**
     * Specifies a preference for the highest-performance GPU, such as an external graphics processor (xGPU), if available, or discrete graphics processor (dGPU) if available.
     * @type {Integer (UInt32)}
     */
    static HighPerformance => 2
}

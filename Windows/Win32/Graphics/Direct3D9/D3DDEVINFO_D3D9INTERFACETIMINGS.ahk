#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9interfacetimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9INTERFACETIMINGS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Float}
     */
    WaitingForGPUToUseApplicationResourceTimePercent {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    WaitingForGPUToAcceptMoreCommandsTimePercent {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    WaitingForGPUToStayWithinLatencyTimePercent {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    WaitingForGPUExclusiveResourceTimePercent {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    WaitingForGPUOtherTimePercent {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}

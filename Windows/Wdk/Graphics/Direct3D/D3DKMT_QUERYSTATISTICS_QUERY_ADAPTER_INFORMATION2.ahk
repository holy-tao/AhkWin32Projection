#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_QUERY_ADAPTER_INFORMATION2 extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {Integer}
     */
    PhysicalAdapterIndex {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}

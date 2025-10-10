#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides detail about whether the adapter supports creating heaps from existing system memory.
 * @remarks
 * 
  * For a variety of performance and compatibility reasons, applications should not make use of this feature except for diagnostic purposes. In particular, heaps created using this feature only support system-memory heaps with cross-adapter properties, which precludes many optimization opportunities that typical application scenarios could otherwise take advantage of.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_existing_heaps
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_EXISTING_HEAPS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * <b>TRUE</b> if the adapter can create a heap from existing system memory. Otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    Supported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

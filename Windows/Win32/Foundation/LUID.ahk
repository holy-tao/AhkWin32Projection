#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a local identifier for an adapter.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getadapterluid">ID3D12Device::GetAdapterLuid</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-getsharedresourceadapterluid">GetSharedResourceAdapterLuid</a> methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-luid
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class LUID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies a DWORD that contains the unsigned lower numbers of the id.
     * @type {Integer}
     */
    LowPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a LONG that contains the signed high numbers of the id.
     * @type {Integer}
     */
    HighPart {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

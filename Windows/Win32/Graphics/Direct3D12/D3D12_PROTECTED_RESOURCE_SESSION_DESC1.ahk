#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes flags and protection type for a protected resource session, per adapter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_protected_resource_session_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PROTECTED_RESOURCE_SESSION_DESC1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The node mask. For single GPU operation, set this to zero. If there are multiple GPU nodes, then set a bit to identify the node (the device's physical adapter) to which the protected session applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[D3D12_PROTECTED_RESOURCE_SESSION_FLAGS](./ne-d3d12-d3d12_protected_resource_session_flags.md)**
     * 
     * Specifies the supported crypto sessions options.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * 
     * The GUID that represents the protection type. Microsoft defines **D3D12_PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED**.
     * 
     * Using the **D3D12_PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED** GUID is equivalent to calling [**ID3D12Device4::CreateProtectedResourceSession**](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @type {Pointer<Guid>}
     */
    ProtectionType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

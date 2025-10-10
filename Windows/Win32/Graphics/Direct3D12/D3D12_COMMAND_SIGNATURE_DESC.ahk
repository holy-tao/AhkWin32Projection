#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the arguments (parameters) of a command signature.
 * @remarks
 * 
  * Use this structure by <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandsignature">CreateCommandSignature</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_command_signature_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_SIGNATURE_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size of each argument of a command signature, in bytes.
     * @type {Integer}
     */
    ByteStride {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of arguments in the command signature.
     * @type {Integer}
     */
    NumArgumentDescs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc">D3D12_INDIRECT_ARGUMENT_DESC</a> structures,
     *             containing details of the arguments, including whether the argument is a vertex buffer, constant, constant buffer view, shader resource view, or unordered access view.
     * @type {Pointer<D3D12_INDIRECT_ARGUMENT_DESC>}
     */
    pArgumentDescs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) for which the command signature is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

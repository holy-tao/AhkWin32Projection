#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_INDIRECT_ARGUMENT_TYPE.ahk" { D3D12_INDIRECT_ARGUMENT_TYPE }

/**
 * Describes an indirect argument (an indirect parameter), for use with a command signature.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_signature_desc">D3D12_COMMAND_SIGNATURE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_INDIRECT_ARGUMENT_DESC {
    #StructPack 4


    struct _VertexBuffer {
        Slot : UInt32

    }

    struct _Constant {
        RootParameterIndex : UInt32

        DestOffsetIn32BitValues : UInt32

        Num32BitValuesToSet : UInt32

    }

    struct _ConstantBufferView {
        RootParameterIndex : UInt32

    }

    struct _ShaderResourceView {
        RootParameterIndex : UInt32

    }

    struct _UnorderedAccessView {
        RootParameterIndex : UInt32

    }

    struct _IncrementingConstant {
        RootParameterIndex : UInt32

        DestOffsetIn32BitValues : UInt32

    }

    /**
     * A single <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_indirect_argument_type">D3D12_INDIRECT_ARGUMENT_TYPE</a> enumeration constant.
     */
    Type : D3D12_INDIRECT_ARGUMENT_TYPE

    VertexBuffer : D3D12_INDIRECT_ARGUMENT_DESC._VertexBuffer

    static __New() {
        DefineProp(this.Prototype, 'Constant', { type: D3D12_INDIRECT_ARGUMENT_DESC._Constant, offset: 4 })
        DefineProp(this.Prototype, 'ConstantBufferView', { type: D3D12_INDIRECT_ARGUMENT_DESC._ConstantBufferView, offset: 4 })
        DefineProp(this.Prototype, 'ShaderResourceView', { type: D3D12_INDIRECT_ARGUMENT_DESC._ShaderResourceView, offset: 4 })
        DefineProp(this.Prototype, 'UnorderedAccessView', { type: D3D12_INDIRECT_ARGUMENT_DESC._UnorderedAccessView, offset: 4 })
        DefineProp(this.Prototype, 'IncrementingConstant', { type: D3D12_INDIRECT_ARGUMENT_DESC._IncrementingConstant, offset: 4 })
        this.DeleteProp("__New")
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an indirect argument (an indirect parameter), for use with a command signature.
 * @remarks
 * 
  * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_signature_desc">D3D12_COMMAND_SIGNATURE_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_indirect_argument_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INDIRECT_ARGUMENT_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A single <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_indirect_argument_type">D3D12_INDIRECT_ARGUMENT_TYPE</a> enumeration constant.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _VertexBuffer extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Slot {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _Constant extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RootParameterIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        DestOffsetIn32BitValues {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Num32BitValuesToSet {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _ConstantBufferView extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RootParameterIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _ShaderResourceView extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RootParameterIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _UnorderedAccessView extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RootParameterIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _IncrementingConstant extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RootParameterIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        DestOffsetIn32BitValues {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * @type {_VertexBuffer}
     */
    VertexBuffer{
        get {
            if(!this.HasProp("__VertexBuffer"))
                this.__VertexBuffer := %this.__Class%._VertexBuffer(this.ptr + 8)
            return this.__VertexBuffer
        }
    }

    /**
     * @type {_Constant}
     */
    Constant{
        get {
            if(!this.HasProp("__Constant"))
                this.__Constant := %this.__Class%._Constant(this.ptr + 8)
            return this.__Constant
        }
    }

    /**
     * @type {_ConstantBufferView}
     */
    ConstantBufferView{
        get {
            if(!this.HasProp("__ConstantBufferView"))
                this.__ConstantBufferView := %this.__Class%._ConstantBufferView(this.ptr + 8)
            return this.__ConstantBufferView
        }
    }

    /**
     * @type {_ShaderResourceView}
     */
    ShaderResourceView{
        get {
            if(!this.HasProp("__ShaderResourceView"))
                this.__ShaderResourceView := %this.__Class%._ShaderResourceView(this.ptr + 8)
            return this.__ShaderResourceView
        }
    }

    /**
     * @type {_UnorderedAccessView}
     */
    UnorderedAccessView{
        get {
            if(!this.HasProp("__UnorderedAccessView"))
                this.__UnorderedAccessView := %this.__Class%._UnorderedAccessView(this.ptr + 8)
            return this.__UnorderedAccessView
        }
    }

    /**
     * @type {_IncrementingConstant}
     */
    IncrementingConstant{
        get {
            if(!this.HasProp("__IncrementingConstant"))
                this.__IncrementingConstant := %this.__Class%._IncrementingConstant(this.ptr + 8)
            return this.__IncrementingConstant
        }
    }
}

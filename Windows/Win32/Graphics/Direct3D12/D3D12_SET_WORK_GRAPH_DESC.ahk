#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_PROGRAM_IDENTIFIER.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SET_WORK_GRAPH_DESC extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {D3D12_PROGRAM_IDENTIFIER}
     */
    ProgramIdentifier{
        get {
            if(!this.HasProp("__ProgramIdentifier"))
                this.__ProgramIdentifier := D3D12_PROGRAM_IDENTIFIER(0, this)
            return this.__ProgramIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_RANGE}
     */
    BackingMemory{
        get {
            if(!this.HasProp("__BackingMemory"))
                this.__BackingMemory := D3D12_GPU_VIRTUAL_ADDRESS_RANGE(40, this)
            return this.__BackingMemory
        }
    }

    /**
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE}
     */
    NodeLocalRootArgumentsTable{
        get {
            if(!this.HasProp("__NodeLocalRootArgumentsTable"))
                this.__NodeLocalRootArgumentsTable := D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE(56, this)
            return this.__NodeLocalRootArgumentsTable
        }
    }
}

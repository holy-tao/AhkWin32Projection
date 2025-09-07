#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_PROGRAM_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SET_RAYTRACING_PIPELINE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {D3D12_PROGRAM_IDENTIFIER}
     */
    ProgramIdentifier{
        get {
            if(!this.HasProp("__ProgramIdentifier"))
                this.__ProgramIdentifier := D3D12_PROGRAM_IDENTIFIER(this.ptr + 0)
            return this.__ProgramIdentifier
        }
    }
}

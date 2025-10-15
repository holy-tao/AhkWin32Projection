#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes a trace step, which is an instruction.
 * @remarks
 * 
  * This API requires the Windows Software Development Kit (SDK) for Windows 8.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_step
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TRACE_STEP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A number that identifies the instruction, as an offset into the executable instructions that are present in the shader. 
     * 
     * HLSL debugging information uses the same convention. Therefore, HLSL instructions are matched to a set of IDs. You can then map an ID to a disassembled string that can be displayed to the user.
     * @type {Integer}
     */
    ID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies whether the instruction is active. This value is TRUE if something happened; therefore, you should parse other data in this structure. Otherwise, nothing happened; for example, if an instruction is disabled due to flow control even though other pixels in the stamp execute it.
     * @type {BOOL}
     */
    InstructionActive{
        get {
            if(!this.HasProp("__InstructionActive"))
                this.__InstructionActive := BOOL(this.ptr + 4)
            return this.__InstructionActive
        }
    }

    /**
     * The number of registers for the instruction that are written to. The range of registers is [0...NumRegistersWritten-1]. You can pass a register number to the <i>writtenRegisterIndex</i> parameter of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getwrittenregister">ID3D11ShaderTrace::GetWrittenRegister</a> to retrieve individual write-register information.
     * @type {Integer}
     */
    NumRegistersWritten {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * The number of registers for the instruction that are read from. The range of registers is [0...NumRegistersRead-1]. You can pass a register number to the <i>readRegisterIndex</i> parameter of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getreadregister">ID3D11ShaderTrace::GetReadRegister</a> to retrieve individual read-register information.
     * @type {Integer}
     */
    NumRegistersRead {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * 
     * @type {Integer}
     */
    MiscOperations {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * A number that specifies the type of instruction (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/add---vs">add</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-mul">mul</a>, and so on). You can ignore this member if you do not know the number for the instruction type. This member offers a minor convenience at the cost of bloating the trace slightly.  You can use the <b>ID</b> member and map back to the original shader code to retrieve the full information about the instruction.
     * @type {Integer}
     */
    OpcodeType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The global cycle count for this step.  You can use this member to correlate parallel thread execution via multiple simultaneous traces, for example, for the compute shader.
     *          
     * 
     * <div class="alert"><b>Note</b>  Multiple threads at the same point in execution might log the same <b>CurrentGlobalCycle</b>.
     *          </div>
     * <div> </div>
     * @type {Integer}
     */
    CurrentGlobalCycle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

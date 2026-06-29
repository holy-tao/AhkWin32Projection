#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_TRACE_REGISTER_TYPE.ahk" { D3D11_TRACE_REGISTER_TYPE }

/**
 * Describes a trace register.
 * @remarks
 * The following register types do not require an index:
 * 
 * <ul>
 * <li>input PrimitiveID</li>
 * <li>output oDepth</li>
 * <li>immediate32</li>
 * <li>NULL register</li>
 * <li>output control point ID (this is actually an input; it defines the output that the thread controls)</li>
 * <li>input fork instance ID</li>
 * <li>input join instance ID</li>
 * <li>input domain point register</li>
 * <li>cycle counter</li>
 * </ul>
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_register
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TRACE_REGISTER {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type">D3D11_TRACE_REGISTER_TYPE</a>-typed value that identifies the type of register that the shader-trace object uses.
     */
    RegType : D3D11_TRACE_REGISTER_TYPE

    Index1D : UInt16

    /**
     * The index of the operand, which starts from 0.
     */
    OperandIndex : Int8

    /**
     * A combination of the following flags that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies more about the trace register.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3D11_TRACE_REGISTER_FLAGS_RELATIVE_INDEXING (0x1)</td>
     * <td>Access to the register is part of the relative indexing of a register.</td>
     * </tr>
     * </table>
     */
    Flags : Int8

    static __New() {
        DefineProp(this.Prototype, 'Index2D', { type: UInt16[2], offset: 4 })
        this.DeleteProp("__New")
    }
}

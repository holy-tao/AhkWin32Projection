#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class D3D11_TRACE_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type">D3D11_TRACE_REGISTER_TYPE</a>-typed value that identifies the type of register that the shader-trace object uses.
     * @type {Integer}
     */
    RegType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Index1D {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Array<UInt16>}
     */
    Index2D{
        get {
            if(!this.HasProp("__Index2DProxyArray"))
                this.__Index2DProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "ushort")
            return this.__Index2DProxyArray
        }
    }

    /**
     * The index of the operand, which starts from 0.
     * @type {Integer}
     */
    OperandIndex {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }
}

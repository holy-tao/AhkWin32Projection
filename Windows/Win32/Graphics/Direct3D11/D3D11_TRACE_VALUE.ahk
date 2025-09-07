#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a trace value.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TRACE_VALUE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * An array of bits that make up the trace value. The [0] element is X.
     *             
     * 
     * <div class="alert"><b>Note</b>  This member can hold <b>float</b>, <b>UINT</b>, or <b>INT</b> data.
     *               The elements are specified as <b>UINT</b> rather than using a union to minimize the risk of x86 SNaN-&gt;QNaN quashing during float assignment.
     *               If the bits are displayed, they can be interpreted as <b>float</b> at the last moment.
     *             </div>
     * <div> </div>
     * @type {Array<UInt32>}
     */
    Bits{
        get {
            if(!this.HasProp("__BitsProxyArray"))
                this.__BitsProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__BitsProxyArray
        }
    }

    /**
     * A combination of the following component values that are combined by using a bitwise <b>OR</b> operation.
     *             The resulting value specifies the component trace mask.
     *             
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3D11_TRACE_COMPONENT_X (0x1)</td>
     * <td>The x component of the trace mask.</td>
     * </tr>
     * <tr>
     * <td>D3D11_TRACE_COMPONENT_Y (0x2)</td>
     * <td>The y component of the trace mask.</td>
     * </tr>
     * <tr>
     * <td>D3D11_TRACE_COMPONENT_Z (0x4)</td>
     * <td>The depth z component of the trace mask.</td>
     * </tr>
     * <tr>
     * <td>D3D11_TRACE_COMPONENT_W (0x8)</td>
     * <td>The depth w component of the trace mask.</td>
     * </tr>
     * </table>
     *  
     * 
     * Ignore unmasked values, particularly if deltas are accumulated.
     * @type {Integer}
     */
    ValidMask {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}

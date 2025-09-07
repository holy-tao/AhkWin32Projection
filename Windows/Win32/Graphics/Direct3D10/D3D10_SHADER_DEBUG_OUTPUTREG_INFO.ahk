#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_SHADER_DEBUG_OUTPUTVAR.ahk

/**
 * Describes a shader output register.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputreg_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_OUTPUTREG_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_regtype">D3D10_SHADER_DEBUG_REGTYPE</a></b>
     * 
     * Must be D3D10_SHADER_DEBUG_REG_TEMP, D3D10_SHADER_DEBUG_REG_TEMPARRAY or D3D10_SHADER_DEBUG_REG_OUTPUT.
     * @type {Integer}
     */
    OutputRegisterSet {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value of -1 indicates no output.
     * @type {Integer}
     */
    OutputReg {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * If <b>OutputRegisterSet</b> is D3D10_SHADER_DEBUG_REG_TEMPARRAY this indicates which temp array.
     * @type {Integer}
     */
    TempArrayReg {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value of -1 means the component is masked out.
     * @type {Array<UInt32>}
     */
    OutputComponents{
        get {
            if(!this.HasProp("__OutputComponentsProxyArray"))
                this.__OutputComponentsProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "uint")
            return this.__OutputComponentsProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputvar">D3D10_SHADER_DEBUG_OUTPUTVAR</a></b>
     * 
     * Indicates which variable the instruction is writing per-component.
     * @type {Array<D3D10_SHADER_DEBUG_OUTPUTVAR>}
     */
    OutputVars{
        get {
            if(!this.HasProp("__OutputVarsProxyArray"))
                this.__OutputVarsProxyArray := Win32FixedArray(this.ptr + 32, 8, D3D10_SHADER_DEBUG_OUTPUTVAR, "")
            return this.__OutputVarsProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from OutputReg of the element being written to. Used when writing to an indexable temp array or an output.
     * @type {Integer}
     */
    IndexReg {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from OutputReg of the element being written to. Used when writing to an indexable temp array or an output.
     * @type {Integer}
     */
    IndexComp {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}

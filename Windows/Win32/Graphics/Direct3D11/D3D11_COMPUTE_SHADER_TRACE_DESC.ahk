#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an instance of a compute shader to trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_compute_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_COMPUTE_SHADER_TRACE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The invocation number of the instance of the compute shader.
     * @type {Integer}
     */
    Invocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-groupthreadid">SV_GroupThreadID</a> to trace. This value identifies indexes of individual threads within a thread group that a compute shader executes in.
     * @type {Array<UInt32>}
     */
    ThreadIDInGroup{
        get {
            if(!this.HasProp("__ThreadIDInGroupProxyArray"))
                this.__ThreadIDInGroupProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__ThreadIDInGroupProxyArray
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-groupid">SV_GroupID</a> to trace. This value identifies indexes of a thread group that the compute shader executes in.
     * @type {Array<UInt32>}
     */
    ThreadGroupID{
        get {
            if(!this.HasProp("__ThreadGroupIDProxyArray"))
                this.__ThreadGroupIDProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "uint")
            return this.__ThreadGroupIDProxyArray
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an instance of a compute shader to trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_compute_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_COMPUTE_SHADER_TRACE_DESC {
    #StructPack 8

    /**
     * The invocation number of the instance of the compute shader.
     */
    Invocation : Int64

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-groupthreadid">SV_GroupThreadID</a> to trace. This value identifies indexes of individual threads within a thread group that a compute shader executes in.
     */
    ThreadIDInGroup : UInt32[3]

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sv-groupid">SV_GroupID</a> to trace. This value identifies indexes of a thread group that the compute shader executes in.
     */
    ThreadGroupID : UInt32[3]

}

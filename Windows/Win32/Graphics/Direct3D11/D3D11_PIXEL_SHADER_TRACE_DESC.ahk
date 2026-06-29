#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an instance of a pixel shader to trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_pixel_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_PIXEL_SHADER_TRACE_DESC {
    #StructPack 8

    /**
     * The invocation number of the instance of the pixel shader.
     */
    Invocation : Int64

    /**
     * The x-coordinate of the pixel.
     */
    X : Int32

    /**
     * The y-coordinate of the pixel.
     */
    Y : Int32

    /**
     * A value that describes a mask of pixel samples to trace. If this value specifies any of the masked samples, the trace is activated.  The least significant bit (LSB) is sample 0.  The non-multisample antialiasing (MSAA) counts as a sample count of 1; therefore, the LSB of <b>SampleMask</b> should be set. If set to zero, the pixel is not traced. However, pixel traces can still be enabled on an invocation basis.
     */
    SampleMask : Int64

}

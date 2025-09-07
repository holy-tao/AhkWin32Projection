#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an instance of a pixel shader to trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_pixel_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_PIXEL_SHADER_TRACE_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The invocation number of the instance of the pixel shader.
     * @type {Integer}
     */
    Invocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The x-coordinate of the pixel.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The y-coordinate of the pixel.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A value that describes a mask of pixel samples to trace. If this value specifies any of the masked samples, the trace is activated.  The least significant bit (LSB) is sample 0.  The non-multisample antialiasing (MSAA) counts as a sample count of 1; therefore, the LSB of <b>SampleMask</b> should be set. If set to zero, the pixel is not traced. However, pixel traces can still be enabled on an invocation basis.
     * @type {Integer}
     */
    SampleMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

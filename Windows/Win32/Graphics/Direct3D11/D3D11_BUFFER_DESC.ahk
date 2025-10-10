#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a buffer resource.
 * @remarks
 * 
  * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a> to create buffer resources.
  * 
  * In addition to this structure, you can also use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-cd3d11_buffer_desc">CD3D11_BUFFER_DESC</a> derived structure, which is defined  in D3D11.h and behaves like an inherited class, to help create a buffer description.
  * 
  * If the bind flag is <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_CONSTANT_BUFFER</a>, you must set the <b>ByteWidth</b> value in multiples of 16, and less than or equal to <b>D3D11_REQ_CONSTANT_BUFFER_ELEMENT_COUNT</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BUFFER_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the buffer in bytes.
     * @type {Integer}
     */
    ByteWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a></b>
     * 
     * Identify how the buffer is expected to be read from and written to. Frequency of update is a key factor. The most common value is typically D3D11_USAGE_DEFAULT; see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a> for all possible values.
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identify how the buffer will be bound to the pipeline. Flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_FLAG</a>) can be combined with a logical OR.
     * @type {Integer}
     */
    BindFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * CPU access flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_cpu_access_flag">D3D11_CPU_ACCESS_FLAG</a>) or 0 if no CPU access is necessary. Flags can be combined with a logical OR.
     * @type {Integer}
     */
    CPUAccessFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Miscellaneous flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_FLAG</a>) or 0 if unused. Flags can be combined with a logical OR.
     * @type {Integer}
     */
    MiscFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of each element in the buffer structure (in bytes) when the buffer represents a structured buffer. For more info about structured buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-cs-resources">Structured Buffer</a>.
     * 
     * The size value in <b>StructureByteStride</b> must match the size of the format that you use for views of the buffer. For example, if you use a shader resource view (SRV) to read a buffer in a pixel shader, the SRV format size must match the size value in <b>StructureByteStride</b>.
     * @type {Integer}
     */
    StructureByteStride {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

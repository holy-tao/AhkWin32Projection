#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_USAGE.ahk" { D3D10_USAGE }

/**
 * Describes a buffer resource. (D3D10_BUFFER_DESC)
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createbuffer">ID3D10Device::CreateBuffer</a> to create buffer resources.
 * 
 * In addition to this structure, there is also a derived structure in D3D10.h (CD3D10_BUFFER_DESC) which behaves like an inherited class to help create a buffer description.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_BUFFER_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the buffer in bytes.
     */
    ByteWidth : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a></b>
     * 
     * Identify how the buffer is expected to be read from and written to. Frequency of update is a key factor. The most common value is typically D3D10_USAGE_DEFAULT; see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a> for all possible values.
     */
    Usage : D3D10_USAGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identify how the buffer will be bound to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">pipeline</a>. Applications can logically OR flags together (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_FLAG</a>) to indicate that the buffer can be accessed in different ways.
     */
    BindFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * CPU access flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_FLAG</a>) or 0 if no CPU access is necessary. Applications can logically OR flags together.
     */
    CPUAccessFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Miscellaneous flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_misc_flag">D3D10_RESOURCE_MISC_FLAG</a>) or 0 if unused. Applications can logically OR flags together.
     */
    MiscFlags : UInt32

}

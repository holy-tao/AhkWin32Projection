#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes files included by a shader.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_FILE_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_file_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_FILE_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to the LPCSTR for the file name.
     */
    FileName : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Length of the file name.
     */
    FileNameLen : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to the file data.
     */
    FileData : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Length of the file.
     */
    FileLen : UInt32

}

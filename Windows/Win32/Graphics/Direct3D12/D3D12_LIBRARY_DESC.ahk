#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a library. (D3D12_LIBRARY_DESC)
 * @remarks
 * This structure is returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getdesc">ID3D12LibraryReflection::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_library_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_LIBRARY_DESC {
    #StructPack 8

    /**
     * The name of the originator of the library.
     */
    Creator : PSTR

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">D3DCOMPILE Constants</a> that are combined by using a bitwise OR operation. The resulting value specifies how the compiler compiles.
     */
    Flags : UInt32

    /**
     * The number of functions exported from the library.
     */
    FunctionCount : UInt32

}

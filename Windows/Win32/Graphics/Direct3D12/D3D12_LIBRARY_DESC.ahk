#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a library. (D3D12_LIBRARY_DESC)
 * @remarks
 * This structure is returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getdesc">ID3D12LibraryReflection::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_library_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_LIBRARY_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The name of the originator of the library.
     * @type {Pointer<Ptr>}
     */
    Creator {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">D3DCOMPILE Constants</a> that are combined by using a bitwise OR operation. The resulting value specifies how the compiler compiles.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of functions exported from the library.
     * @type {Integer}
     */
    FunctionCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Describes a library. (D3D11_LIBRARY_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_library_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_LIBRARY_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the originator of the library.
     * @type {PSTR}
     */
    Creator{
        get {
            if(!this.HasProp("__Creator"))
                this.__Creator := PSTR(this.ptr + 0)
            return this.__Creator
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">D3DCOMPILE Constants</a> that are combined by using a bitwise OR operation. The resulting value specifies how the compiler compiles.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of functions exported from the library.
     * @type {Integer}
     */
    FunctionCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

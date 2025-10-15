#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Describes an effect variable.
 * @remarks
 * 
  * To get an effect-variable description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-getdesc">ID3D10EffectVariable::GetDesc</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/ns-d3d10effect-d3d10_effect_variable_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_EFFECT_VARIABLE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the variable name.
     * @type {PSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PSTR(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The semantic attached to the variable; otherwise <b>NULL</b>.
     * @type {PSTR}
     */
    Semantic{
        get {
            if(!this.HasProp("__Semantic"))
                this.__Semantic := PSTR(this.ptr + 8)
            return this.__Semantic
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">flags</a> for effect variables.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of annotations; otherwise 0.
     * @type {Integer}
     */
    Annotations {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset between the beginning of the constant buffer and this variable; otherwise 0.
     * @type {Integer}
     */
    BufferOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The register that this variable is bound to. To bind a variable explicitly use the D3D10_EFFECT_VARIABLE_EXPLICIT_BIND_POINT flag.
     * @type {Integer}
     */
    ExplicitBindPoint {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

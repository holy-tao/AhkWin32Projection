#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Describes an effect technique.
 * @remarks
 * 
  * To get a technique, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getdesc">ID3D10EffectTechnique::GetDesc</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/ns-d3d10effect-d3d10_technique_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TECHNIQUE_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the technique name; otherwise <b>NULL</b>.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of passes in the technique.
     * @type {Integer}
     */
    Passes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of annotations.
     * @type {Integer}
     */
    Annotations {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

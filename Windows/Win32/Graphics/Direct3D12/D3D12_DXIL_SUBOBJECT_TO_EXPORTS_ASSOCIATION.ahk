#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This subobject is unsupported in the current release.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_dxil_subobject_to_exports_association
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {PWSTR}
     */
    SubobjectToAssociate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the <i>pExports</i> array.  If 0, this is being explicitly defined as a default association.  Another way to define a default association is to omit this subobject association for that subobject completely.
     * @type {Integer}
     */
    NumExports {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The array of exports with which the subobject is associated.
     * @type {Pointer<PWSTR>}
     */
    pExports {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

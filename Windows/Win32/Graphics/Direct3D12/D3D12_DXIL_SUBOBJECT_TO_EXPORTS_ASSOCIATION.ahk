#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * This subobject is unsupported in the current release.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_subobject_to_exports_association
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION {
    #StructPack 8

    SubobjectToAssociate : PWSTR

    /**
     * Size of the <i>pExports</i> array.  If 0, this is being explicitly defined as a default association.  Another way to define a default association is to omit this subobject association for that subobject completely.
     */
    NumExports : UInt32

    /**
     * The array of exports with which the subobject is associated.
     */
    pExports : PWSTR.Ptr

}

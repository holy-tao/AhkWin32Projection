#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_EXPORT_FLAGS.ahk" { D3D12_EXPORT_FLAGS }

/**
 * Describes an export from a state subobject such as a DXIL library or a collection state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_export_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_EXPORT_DESC {
    #StructPack 8

    /**
     * The name to be exported.  If the name refers to a function that is overloaded, a modified version of the name (e.g. encoding function parameter information  in name string) can be provided to disambiguate which overload to use.  The modified name for a function can be retrieved using HLSL compiler reflection.
     * 
     * If the <i>ExportToRename</i> field is non-null, <i>Name</i> refers to the new name to use for it when exported.  In this case <i>Name</i> must be the unmodified name, whereas <i>ExportToRename</i> can be either a modified or unmodified name.  A given internal name may be exported multiple times with different renames (and/or not renamed).
     */
    Name : PWSTR

    /**
     * If non-null, this is the name of an export to use but then rename when exported.
     */
    ExportToRename : PWSTR

    Flags : D3D12_EXPORT_FLAGS

}

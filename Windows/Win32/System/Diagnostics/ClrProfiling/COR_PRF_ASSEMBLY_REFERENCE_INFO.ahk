#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\WinRT\Metadata\ASSEMBLYMETADATA.ahk" { ASSEMBLYMETADATA }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_ASSEMBLY_REFERENCE_INFO {
    #StructPack 8

    pbPublicKeyOrToken : IntPtr

    cbPublicKeyOrToken : UInt32

    szName : PWSTR

    pMetaData : ASSEMBLYMETADATA.Ptr

    pbHashValue : IntPtr

    cbHashValue : UInt32

    dwAssemblyRefFlags : UInt32

}

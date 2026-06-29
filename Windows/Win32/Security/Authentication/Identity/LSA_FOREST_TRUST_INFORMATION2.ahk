#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_FOREST_TRUST_RECORD2.ahk" { LSA_FOREST_TRUST_RECORD2 }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_INFORMATION2 {
    #StructPack 8

    RecordCount : UInt32

    Entries : IntPtr

}

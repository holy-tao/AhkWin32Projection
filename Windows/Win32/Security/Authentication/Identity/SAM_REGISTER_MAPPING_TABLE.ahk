#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAM_REGISTER_MAPPING_LIST.ahk" { SAM_REGISTER_MAPPING_LIST }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SAM_REGISTER_MAPPING_TABLE {
    #StructPack 8

    Count : UInt32

    Lists : SAM_REGISTER_MAPPING_LIST.Ptr

}

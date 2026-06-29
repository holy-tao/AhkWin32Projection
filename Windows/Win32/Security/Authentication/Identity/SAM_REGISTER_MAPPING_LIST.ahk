#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAM_REGISTER_MAPPING_ELEMENT.ahk" { SAM_REGISTER_MAPPING_ELEMENT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SAM_REGISTER_MAPPING_LIST {
    #StructPack 8

    Count : UInt32

    Elements : SAM_REGISTER_MAPPING_ELEMENT.Ptr

}

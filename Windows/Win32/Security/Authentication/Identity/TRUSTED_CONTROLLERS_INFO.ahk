#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_CONTROLLERS_INFO {
    #StructPack 8

    Entries : UInt32

    Names : LSA_UNICODE_STRING.Ptr

}

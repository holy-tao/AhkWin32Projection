#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SE_ADT_PARAMETER_TYPE.ahk" { SE_ADT_PARAMETER_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SE_ADT_PARAMETER_ARRAY_ENTRY {
    #StructPack 8

    Type : SE_ADT_PARAMETER_TYPE

    Length : UInt32

    Data : IntPtr[2]

    Address : IntPtr

}

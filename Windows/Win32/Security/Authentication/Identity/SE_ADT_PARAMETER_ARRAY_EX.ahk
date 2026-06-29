#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SE_ADT_PARAMETER_ARRAY_ENTRY.ahk" { SE_ADT_PARAMETER_ARRAY_ENTRY }
#Import ".\SE_ADT_PARAMETER_TYPE.ahk" { SE_ADT_PARAMETER_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SE_ADT_PARAMETER_ARRAY_EX {
    #StructPack 8

    CategoryId : UInt32

    AuditId : UInt32

    Version : UInt32

    ParameterCount : UInt32

    Length : UInt32

    FlatSubCategoryId : UInt16

    Type : UInt16

    Flags : UInt32

    Parameters : SE_ADT_PARAMETER_ARRAY_ENTRY[32]

}

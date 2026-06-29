#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_IDENTIFIER_CODE_SET.ahk" { STORAGE_IDENTIFIER_CODE_SET }
#Import ".\STORAGE_IDENTIFIER_TYPE.ahk" { STORAGE_IDENTIFIER_TYPE }
#Import ".\STORAGE_ASSOCIATION_TYPE.ahk" { STORAGE_ASSOCIATION_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_IDENTIFIER {
    #StructPack 4

    CodeSet : STORAGE_IDENTIFIER_CODE_SET

    Type : STORAGE_IDENTIFIER_TYPE

    IdentifierSize : UInt16

    NextOffset : UInt16

    Association : STORAGE_ASSOCIATION_TYPE

    Identifier : Int8[1]

}

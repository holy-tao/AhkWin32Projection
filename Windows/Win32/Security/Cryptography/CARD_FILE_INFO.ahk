#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_FILE_ACCESS_CONDITION.ahk" { CARD_FILE_ACCESS_CONDITION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_FILE_INFO {
    #StructPack 4

    dwVersion : UInt32

    cbFileSize : UInt32

    AccessCondition : CARD_FILE_ACCESS_CONDITION

}

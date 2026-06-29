#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ExtKeyDef.ahk" { ExtKeyDef }
#Import ".\ExtKeySubst.ahk" { ExtKeySubst }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct ExtKeyDefBuf {
    #StructPack 4

    dwVersion : UInt32

    dwCheckSum : UInt32

    table : ExtKeyDef[26]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ExtKeySubst.ahk" { ExtKeySubst }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct ExtKeyDef {
    #StructPack 2

    keys : ExtKeySubst[3]

}

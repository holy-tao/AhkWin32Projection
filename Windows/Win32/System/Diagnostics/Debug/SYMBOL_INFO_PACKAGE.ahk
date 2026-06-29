#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYMBOL_INFO_FLAGS.ahk" { SYMBOL_INFO_FLAGS }
#Import ".\SYMBOL_INFO.ahk" { SYMBOL_INFO }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct SYMBOL_INFO_PACKAGE {
    #StructPack 8

    si : SYMBOL_INFO

    name : CHAR[2001]

}

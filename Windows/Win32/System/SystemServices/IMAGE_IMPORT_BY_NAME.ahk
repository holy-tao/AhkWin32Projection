#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_IMPORT_BY_NAME {
    #StructPack 2

    Hint : UInt16

    Name : CHAR[1]

}

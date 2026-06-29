#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @architecture X64, Arm64
 */
export default struct FDISPILLFILE {
    #StructPack 4

    ach : CHAR[2]

    cbFile : Int32

}

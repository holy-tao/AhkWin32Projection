#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct IMAGE_NOTE {
    #StructPack 2

    Module : CHAR[10]

    FileName : CHAR[256]

    hModule : UInt16

    hTask : UInt16

}

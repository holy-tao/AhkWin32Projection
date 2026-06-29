#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDM_SEGINFO {
    #StructPack 4

    Selector : UInt16

    SegNumber : UInt16

    Length : UInt32

    Type : UInt16

    ModuleName : CHAR[9]

    FileName : CHAR[255]

}

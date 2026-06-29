#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct SYMSRV_EXTENDED_OUTPUT_DATA {
    #StructPack 4

    sizeOfStruct : UInt32

    version : UInt32

    filePtrMsg : WCHAR[261]

}

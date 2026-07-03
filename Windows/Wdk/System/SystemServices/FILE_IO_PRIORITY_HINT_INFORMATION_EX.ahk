#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IO_PRIORITY_HINT.ahk" { IO_PRIORITY_HINT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_IO_PRIORITY_HINT_INFORMATION_EX {
    #StructPack 4

    PriorityHint : IO_PRIORITY_HINT

    BoostOutstanding : BOOLEAN

}

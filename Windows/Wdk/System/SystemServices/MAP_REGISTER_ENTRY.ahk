#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MAP_REGISTER_ENTRY {
    #StructPack 8

    MapRegister : IntPtr

    WriteToDevice : BOOLEAN

}

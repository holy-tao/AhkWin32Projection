#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct MODULEENTRY {
    #StructPack 8

    dwSize : UInt32

    szModule : CHAR[10]

    hModule : HANDLE

    wcUsage : UInt16

    szExePath : CHAR[256]

    wNext : UInt16

}

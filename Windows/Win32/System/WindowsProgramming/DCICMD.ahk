#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DCICMD {
    #StructPack 4

    dwCommand : UInt32

    dwParam1 : UInt32

    dwParam2 : UInt32

    dwVersion : UInt32

    dwReserved : UInt32

}

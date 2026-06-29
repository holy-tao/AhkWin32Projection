#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WINSTATIONINFORMATIONW {
    #StructPack 4

    Reserved2 : Int8[70]

    LogonId : UInt32

    Reserved3 : Int8[1140]

}

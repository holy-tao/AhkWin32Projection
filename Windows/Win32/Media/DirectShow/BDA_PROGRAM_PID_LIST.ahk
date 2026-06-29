#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_PROGRAM_PID_LIST {
    #StructPack 4

    ulProgramNumber : UInt32

    ulcPIDs : UInt32

    ulPID : UInt32[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_PID_UNMAP {
    #StructPack 4

    ulcPIDs : UInt32

    aulPIDs : UInt32[1]

}

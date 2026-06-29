#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_REQUEST_TIMES {
    #StructPack 8

    cTimes : UInt32

    rgTimes : Int64[32]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ACMDRVSTREAMSIZE {
    #StructPack 4

    cbStruct : UInt32

    fdwSize : UInt32

    cbSrcLength : UInt32

    cbDstLength : UInt32

}

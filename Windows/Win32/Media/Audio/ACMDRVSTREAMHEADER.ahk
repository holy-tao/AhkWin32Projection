#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ACMDRVSTREAMHEADER {
    #StructPack 8

    cbStruct : UInt32

    fdwStatus : UInt32

    dwUser : IntPtr

    pbSrc : IntPtr

    cbSrcLength : UInt32

    cbSrcLengthUsed : UInt32

    dwSrcUser : IntPtr

    pbDst : IntPtr

    cbDstLength : UInt32

    cbDstLengthUsed : UInt32

    dwDstUser : IntPtr

    fdwConvert : UInt32

    padshNext : ACMDRVSTREAMHEADER.Ptr

    fdwDriver : UInt32

    dwDriver : IntPtr

    fdwPrepared : UInt32

    dwPrepared : IntPtr

    pbPreparedSrc : IntPtr

    cbPreparedSrcLength : UInt32

    pbPreparedDst : IntPtr

    cbPreparedDstLength : UInt32

}

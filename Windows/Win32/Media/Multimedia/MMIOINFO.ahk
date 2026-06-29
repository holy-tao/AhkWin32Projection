#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HMMIO.ahk" { HMMIO }
#Import "..\..\Foundation\HTASK.ahk" { HTASK }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MMIOINFO {
    #StructPack 8

    dwFlags : UInt32

    fccIOProc : UInt32

    pIOProc : IntPtr

    wErrorRet : UInt32

    htask : HTASK

    cchBuffer : Int32

    pchBuffer : IntPtr

    pchNext : IntPtr

    pchEndRead : IntPtr

    pchEndWrite : IntPtr

    lBufOffset : Int32

    lDiskOffset : Int32

    adwInfo : UInt32[3]

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    hmmio : HMMIO

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_TF_INFO {
    #StructPack 8

    pfnHseIO : IntPtr

    pContext : IntPtr

    hFile : HANDLE

    pszStatusCode : PSTR

    BytesToWrite : UInt32

    Offset : UInt32

    pHead : IntPtr

    HeadLength : UInt32

    pTail : IntPtr

    TailLength : UInt32

    dwFlags : UInt32

}

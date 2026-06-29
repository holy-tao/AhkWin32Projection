#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CAFILETIME {
    #StructPack 8

    cElems : UInt32

    pElems : FILETIME.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPDATA.ahk" { CLIPDATA }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CACLIPDATA {
    #StructPack 8

    cElems : UInt32

    pElems : CLIPDATA.Ptr

}

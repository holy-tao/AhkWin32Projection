#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CABOOL {
    #StructPack 8

    cElems : UInt32

    pElems : VARIANT_BOOL.Ptr

}

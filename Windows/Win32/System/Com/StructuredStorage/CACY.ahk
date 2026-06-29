#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CY.ahk" { CY }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CACY {
    #StructPack 8

    cElems : UInt32

    pElems : CY.Ptr

}

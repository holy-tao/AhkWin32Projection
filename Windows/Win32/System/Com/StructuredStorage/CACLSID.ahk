#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CACLSID {
    #StructPack 8

    cElems : UInt32

    pElems : Guid.Ptr

}
